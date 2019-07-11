#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""This macro moves a Polytec Vib-A-XY stage to different positions and performs a single point measurement at each"""

__version__ = '0.9' 
__copyright__ = "Copyright 2019, Polytec Inc."
__credits__ = []
__license__ = "LGPL"
__author__ = ['Arend von der Lieth']
__email__ = 'a.vonderlieth@polytec.com'
__maintainer__ = 'Arend von der Lieth'
__status__ = 'production'


import win32com.client
import pythoncom
from ptcConstants import *
import wx
import wx.grid as gridlib
from wx.lib import sized_controls
from wx.lib import scrolledpanel
import os
import copy
import program_icons
import time
import threading
import serial


#bool = {True: 'True', False: 'False'}
requiredVibSoft = [[5,3], [5,4]]

# the class PositioningDevice implements the functions of the Polytec BasicEngine PositionigDevice for devices that are not recognized by the official software
# it is currently implemented for a PI Corvus eco controller but can be modified for other devices by adjusting the query strings
class PositioningDevice():
    def __init__(self, comport='COM4', baudrate=57600):
        self.HasXYAxes, self.HasZAxis = False, False
        self.IsMovingXY, self.IsMovingZ = False, False
        # need to change to get actual limitations of the hardware, currently receiving bogus numbers
        self.PositionXMinHardware, self.PositionXMaxHardware = -50.0, 50.0
        self.PositionYMinHardware, self.PositionYMaxHardware = -50.0, 50.0
        self.PositionZMinHardware, self.PositionZMaxHardware = 0.0, 0.0
        try:
            self.ser = serial.Serial(comport, baudrate, timeout=0.1)
        except serial.SerialException as exc:
            print(exc)
            return None
        else:
            self.ser.flushInput()
            self.ser.flushOutput()
            self.serno = self.sendCmd("getserialno").strip().decode()
            if self.serno:
                self.enableJoystick()
                axisStringList = self.sendCmd("-1 getaxis").strip().decode().split()
                if axisStringList[0] == '1' and axisStringList[1] == '1':
                    self.HasXYAxes = True
                if axisStringList[2] == '1':
                    self.HasZAxis = True

    def enableJoystick(self):
        self.sendCmd("1 j") # Enable Joystick 
                
    def sendCmd(self, command):
        if type(command) == type(""):
            # if the command is of type string, convert it to bytes
            command = str.encode(command)
        if command[-1] != 10:
            # make sure the command is terminated with a line feed
            command += b"\n"
        self.ser.write(command)
        return self.ser.readall()

    def GetPositionXY(self):
        pos = self.sendCmd("pos").strip().split()
        if len(pos) >=2:
            return float(pos[0]), float(pos[1])

    def GetPositionZ(self):
        pos = self.sendCmd("pos").strip().split()
        if len(pos) >=3:
            return float(pos[2])
        else:
            return 0.0

    def StartMoveXY(self, x, y):
        self.IsMovingXY = True
        self.sendCmd("%f %f m" %(x,y))
        while self.GetPositionXY() != (x,y):
            time.sleep(0.1)
        self.IsMovingXY = False
    
    def StartMoveZ(self, z):
        # not yet implemented - should be similar to StartMoveXY
        pass
    

class StartupWindow(sized_controls.SizedDialog):
    def __init__(self, *args, **kwargs):
        super(StartupWindow, self).__init__(*args, **kwargs)
        self.parent = args[0]
        self.canRun = args[1]
        self.response = args[2]

        pane = self.GetContentsPane()
        pane_form = sized_controls.SizedPanel(pane)
        pane_form.SetSizerType('horizontal')
        
        pane_btns = sized_controls.SizedPanel(pane)
        pane_btns.SetSizerType('horizontal')
        pane_btns.SetSizerProps(halign='right')

        label = wx.StaticText(pane_form, label=self.response)
        label.SetSizerProps(halign='right', valign='center')

        if self.canRun:
            ok_btn = wx.Button(pane_btns, label='OK')
            ok_btn.SetDefault()
        cancel_btn = wx.Button(pane_btns, label='Cancel')
        self.Fit()
        self.SetTitle('Compatibility Check')
        self.CenterOnParent()
        self.parent.Disable()

        if self.canRun:
            ok_btn.Bind(wx.EVT_BUTTON, self.on_btn_ok)
        cancel_btn.Bind(wx.EVT_BUTTON, self.on_btn_cancel)
        self.Bind(wx.EVT_CLOSE, self.on_close)

    def on_btn_ok(self, event):
        self.Close()

    def on_btn_cancel(self, event):
        self.parent.Close()
        self.Close()


    def on_close(self, event):
        if not self.canRun:
            self.parent.Close()
        self.parent.Enable()
        event.Skip()



class MainWindow(wx.Frame):
    def __init__(self, parent, title):
        pythoncom.CoInitialize()
        self.oPFA = win32com.client.Dispatch("PolyFile.PolyFile")
        self.oVibSoft = win32com.client.Dispatch("VibSoft.Application")

        self.coords = []
        self.nRows = 10
        self.xRange, self.yRange, self.zRange = [-200,200], [0,0], [0,0]
        
        try:
            self.oAcq = self.oVibSoft.Acquisition
        except:
            # cannot access acquisition mode (Desktop dongle only) - allow modifying positions file but not moving the stage
            self.oAcq = None
            self.oPosDev = None
            #self.oPosDev = "Dummy"
            self.nAxes = 3
        else:
            self.oInfos = self.oAcq.Infos
            if self.oInfos.HasPositionDevice:
                self.oPosDev = oInfos.PositionDevice
            else:
                self.oPosDev = PositioningDevice()
            self.nAxes = 0
            if self.oPosDev.HasXYAxes:
                self.nAxes += 2
                self.xRange = [self.oPosDev.PositionXMinHardware, self.oPosDev.PositionXMaxHardware]
                self.yRange = [self.oPosDev.PositionYMinHardware, self.oPosDev.PositionYMaxHardware]
            if self.oPosDev.HasZAxis:
                self.nAxes += 1
                self.zRange = [self.oPosDev.PositionZMinHardware, self.oPosDev.PositionZMaxHardware]

        self.dirname = ""
        self.importCoordsFilename = ""
        
        wx.Frame.__init__(self, parent, -1, title, wx.DefaultPosition, wx.Size(360,400))
        self.CreateStatusBar()
        self.AboutText = """Polytec Single Point Scanner version %s by %s, \u00a9 2018""" %(__version__, __author__)
        self.AboutTextLong = """Polytec Single Point Scanner moves a Polytec VIB-A-XY stage to a list of positions and starts a single point measurement at each location.\nVersion %s by %s, \u00a9 2018""" %(__version__, __author__)
        
        # Set up the menu:
        self.filemenu = wx.Menu()
        self.openMenuItem = self.filemenu.Append(wx.ID_OPEN, "&Open\tCtrl+O", "Open a positions text file")
        self.Bind(wx.EVT_MENU, self.OnOpen, self.openMenuItem)
        self.saveMenuItem = self.filemenu.Append(wx.ID_SAVE, "&Save\tCtrl+S", "Save the positions text file")
        self.saveMenuItem.Enable(False)
        self.Bind(wx.EVT_MENU, self.OnSave, self.saveMenuItem)
##        self.saveAsMenuItem = self.filemenu.Append(wx.ID_SAVEAS, "&Save As...", "Save the positions to a new text file")
##        self.saveAsMenuItem.Enable(False)
##        self.Bind(wx.EVT_MENU, self.OnSaveAs, self.saveAsMenuItem)
        self.exitMenuItem = self.filemenu.Append(wx.ID_EXIT, "E&xit\tAlt+F4", "Exit the program")
        self.Bind(wx.EVT_MENU, self.OnExit, self.exitMenuItem)

        self.helpmenu = wx.Menu()
        self.filemenu.AppendSeparator()
        self.aboutMenuItem = self.helpmenu.Append(wx.ID_ABOUT, "&About", self.AboutText)
        self.Bind(wx.EVT_MENU, self.OnAbout, self.aboutMenuItem)

        self.menuBar = wx.MenuBar()
        self.menuBar.Append(self.filemenu, "&File")
        self.menuBar.Append(self.helpmenu, "&Help")

        # Set up the toolbar
        self.toolbar = self.CreateToolBar()
        self.openIcon = program_icons.PyEmbeddedImage(program_icons.openIcon).data.GetBitmap()
        self.saveIcon = program_icons.PyEmbeddedImage(program_icons.exportUFFIcon).data.GetBitmap()
        self.saveIcon_disabled = program_icons.PyEmbeddedImage(program_icons.exportUFFIcon_disabled).data.GetBitmap()
        self.runIcon = program_icons.PyEmbeddedImage(program_icons.exportVibSoftIcon).data.GetBitmap()
        self.runIcon_disabled = program_icons.PyEmbeddedImage(program_icons.exportVibSoftIcon_disabled).data.GetBitmap()
        self.setPointIcon = program_icons.PyEmbeddedImage(program_icons.setPointIcon).data.GetBitmap()
        self.setPointIcon_disabled = program_icons.PyEmbeddedImage(program_icons.setPointIcon_disabled).data.GetBitmap()
        self.exitIcon = program_icons.PyEmbeddedImage(program_icons.exitIcon).data.GetBitmap()
        
        self.oTool = self.toolbar.AddTool(wx.ID_ANY, 'Open File', wx.Bitmap(self.openIcon))
        self.sTool = self.toolbar.AddTool(wx.ID_ANY, 'Save File', wx.Bitmap(self.saveIcon_disabled))
        self.rTool = self.toolbar.AddTool(wx.ID_ANY, 'Run Measurement', wx.Bitmap(self.runIcon_disabled))
        self.toolbar.AddSeparator()
        if self.oPosDev:
            self.spTool = self.toolbar.AddTool(wx.ID_ANY, 'Set Point', wx.Bitmap(self.setPointIcon))
        else:
            self.spTool = self.toolbar.AddTool(wx.ID_ANY, 'Set Point', wx.Bitmap(self.setPointIcon_disabled))
        self.toolbar.AddSeparator()
        self.exitTool = self.toolbar.AddTool(wx.ID_ANY, 'Exit', wx.Bitmap(self.exitIcon))

        self.toolbar.EnableTool(self.sTool.GetId(), False)
        self.toolbar.EnableTool(self.rTool.GetId(), False)
        if self.oPosDev:
            self.toolbar.EnableTool(self.spTool.GetId(), True)
        else:
            self.toolbar.EnableTool(self.spTool.GetId(), False)
            

        self.toolbar.Realize()
        self.Bind(wx.EVT_TOOL, self.OnOpen, self.oTool)
        self.Bind(wx.EVT_TOOL, self.OnSave, self.sTool)
        self.Bind(wx.EVT_TOOL, self.OnRun, self.rTool)
        self.Bind(wx.EVT_TOOL, self.OnSetPoint, self.spTool)
        self.Bind(wx.EVT_TOOL, self.OnExit, self.exitTool)

        # window layout here:
        self.gridPanel = scrolledpanel.ScrolledPanel(self, -1, size=(340, 340), pos=(0,28), style=wx.SIMPLE_BORDER)
        self.gridPanel.SetupScrolling()
        self.grid = gridlib.Grid(self.gridPanel)
        self.grid.CreateGrid(self.nRows,3)
        self.grid.SetColLabelValue(0, "X [mm]")
        self.grid.SetColLabelValue(1, "Y [mm]")
        self.grid.SetColLabelValue(2, "Z [mm]")
        self.grid.SetColFormatFloat(0, width=6, precision=3)
        self.grid.SetColFormatFloat(1, width=6, precision=3)
        self.grid.SetColFormatFloat(2, width=6, precision=3)
        self.grid.SetTabBehaviour(1)    # 1 = move to next row if cell in last column of row is selected
        self.gridSizer = wx.BoxSizer(wx.VERTICAL)
        self.gridSizer.Add(self.grid, 1, wx.EXPAND)
        self.gridPanel.SetSizer(self.gridSizer)

        self.Bind(gridlib.EVT_GRID_CELL_CHANGED, self.OnCellChange)
        self.checkColumns()
        
        self.SetMenuBar(self.menuBar)
        self.Show(True)


    def checkVibSoftVersion(self):
        version = self.oVibSoft.Version.split('.')
        self.canRun = 0
        for v in requiredVibSoft:
            if int(version[0]) < v[0] or int(version[0]) == v[0] and int(version[1]) < v[1]:
                self.canRun = 0
            elif int(version[0]) > v[0] or int(version[0]) == v[0] and int(version[1]) > v[1]:
                self.canRun = -1
            else:
                self.canRun = 1
                break
        if self.canRun == 0:
            self.response = """This program requires at least VibSoft Version %i.%i\nPlease upgrade before using this tool!""" %(requiredVibSoft[0][0], requiredVibSoft[0][1])
        elif self.canRun == -1:
            self.response = """This program was tested with VibSoft Version %i.%i\nWhile the tool will probably work, there is a possibility that problems can occur!""" %(requiredVibSoft[-1][0], requiredVibSoft[1][1])
        else:
            self.response = """Compatible VibSoft version (%s) found""" %(self.oVibSoft.Version)
        return self.canRun, self.response
        

    def OnOpen(self, event):
        if self.oPFA.IsOpen:
            self.oPFA.Close()
        if not self.dirname:
            self.dirname = os.path.expanduser("~")
        wildcard = "Stage Position files (*.txt, *.dat)|*.txt;*.dat;"
        dlg = wx.FileDialog(self, "Choose a file", self.dirname, "", wildcard, wx.FD_OPEN)
        if dlg.ShowModal() == wx.ID_OK:
            self.filename = dlg.GetFilename()
            self.dirname = dlg.GetDirectory()
            self.importCoordsFilename = os.path.join(self.dirname, self.filename)
            self.grid.ClearGrid()
            positionsFile = open(self.importCoordsFilename)
            self.positionsLines = positionsFile.readlines()
            positionsFile.close()
            self.positionList = []
            if self.positionsLines:
                for line_row in range(len(self.positionsLines)):
                    line_cols = self.positionsLines[line_row].strip().split("\t")
                    if len(line_cols) < 2:
                        # not enough coordinates
                        print("need at least 2 values - in row %i" %(line_row + 1))
                    elif len(line_cols) > 3:
                        # too many columns
                        print("too many columns (%i) in row %i" %(len(line_cols), line_row + 1))
                    else:
                        # 2 or 3 columns can work with this
                        line_coordinates = []
                        for col_index in range(3):
                            try:
                                line_coordinates.append(float(line_cols[col_index].strip()))
                            except ValueError:
                                print("Error converting coordinate to float in row %i, column %i, defaulting to 0.0" %(line_row + 1, col_index + 1) )
                                line_coordinates.append(0.0)
                            except IndexError:
                                print("Not enough columns to convert row %i into XYZ coordinates, defaulting to 0.0 for Z coordinate" %(line_row + 1) )
                                line_coordinates.append(0.0)                           
                        self.positionList.append(line_coordinates)
            for row_index in range(len(self.positionList)):
                self.checkRowNumbers(row_index)
                for col_index in range(3):
                    self.grid.SetCellValue(row_index, col_index, "%.3f" %self.positionList[row_index][col_index])
        self.getPointPositionsFromGrid()
        self.checkColumns()
        dlg.Destroy()

    def OnCellChange(self, event):
        self.checkRowNumbers(event.GetRow())
        self.checkCellInputValue(event)
        self.checkColumns()
        self.getPointPositionsFromGrid()

    def OnSetPoint(self, event):
        self.getPointPositionsFromGrid()
        if self.oPosDev:
            x,y,z = 0.0, 0.0, 0.0
            if self.oPosDev.HasXYAxes:
                x,y = self.oPosDev.GetPositionXY()
            if self.oPosDev.HasZAxis:
                z = self.oPosDev.GetPositionZ()
            if self.oInfos.HasPositionDevice:
                # now multiply x,y,z with 1000 to get mm if using the VibSoft object:
                x,y,z = 1000*x, 1000*y, 1000*z
        else:    
            x,y,z = 34.4, 56.23, 56.23  # need to change with function to get coordinates from stage device
        newLine = len(self.coords)
        self.checkRowNumbers(newLine)
        self.grid.SetCellValue(newLine, 0, "%9.3f" %x)
        self.grid.SetCellValue(newLine, 1, "%9.3f" %y)
        self.grid.SetCellValue(newLine, 2, "%9.3f" %z)
        self.checkColumns()
        self.getPointPositionsFromGrid()
        
    def OnSave(self, event):
        if self.importCoordsFilename:
            self.saveCoordinatesFile(filename = self.importCoordsFilename)
        else:
            self.saveCoordinatesAs()

    def saveCoordinatesFile(self, filename):
        positionsFile = open(filename, 'w')
        for row in self.coords:
            if len(row) == 2:
                writeString = "%9.3f\t%9.3f\n" %(row[0], row[1])
            elif len(row) == 3:
                writeString = "%9.3f\t%9.3f\t%9.3f\n" %(row[0], row[1], row[2])
            else:
                # this should not happen
                writeString = ""
            if writeString:
                positionsFile.write(writeString)
        positionsFile.close()

    def OnSaveAs(self, event):
        self.saveCoordinatesAs()

    def saveCoordinatesAs(self):
        if not self.dirname:
            self.dirname = os.path.expanduser("~")
        wildcard = "Text Files (*.txt)|*.txt|" \
                   "Text Files (*.dat)|*.dat|" \
                    "All files (*.*)|*.*"
        dlg = wx.FileDialog(self, "Save Coordinates as", self.dirname, "", wildcard, wx.FD_SAVE | wx.FD_OVERWRITE_PROMPT | wx.FD_CHANGE_DIR)
        if dlg.ShowModal() == wx.ID_OK:
            self.exportCoordsFilename = dlg.GetFilename()
            self.exportDirname = dlg.GetDirectory()
            self.exportpathandname = os.path.join(self.exportDirname, self.exportCoordsFilename)
            self.saveCoordinatesFile(self.exportpathandname)

            message = "The coordinates were saved successfully as %s\n" %self.exportpathandname
            dlg2 = wx.MessageDialog(self, message, "Success", style=wx.OK|wx.CENTRE, pos=wx.DefaultPosition)
            if dlg2.ShowModal() == wx.ID_OK:
                pass
            dlg2.Destroy()
        dlg.Destroy()
    


    def OnRun(self, event):
        evt = event.GetEventObject()
        if not self.dirname:
            self.dirname = os.path.expanduser("~")
        wildcard = "Basename (*.*)|*.*"
        dlg = wx.DirDialog(self, "Select a folder to save the data", "", wx.DD_DEFAULT_STYLE | wx.DD_CHANGE_DIR)
        if dlg.ShowModal() == wx.ID_OK:
            self.exportPath = dlg.GetPath()
            if os.listdir(self.exportPath):
                # there are files in the folder. Ask the user to verify that we can continue
                dlg2 = wx.MessageDialog(self, "Error - the selected directory contains files.\nPlease select another one!", "Error", style=wx.OK|wx.CENTRE, pos=wx.DefaultPosition)
                if dlg2.ShowModal() == wx.ID_OK:
                    pass
                dlg2.Destroy()
            else:
                self.oVibSoft_id = pythoncom.CoMarshalInterThreadInterfaceInStream(pythoncom.IID_IDispatch, self.oVibSoft)
                self.exportBasename = self.exportPath.split("\\")[-1]
                #self.exportDirname = dlg.GetDirectory()
                self.exportpathandname = os.path.join(self.exportPath, self.exportBasename)

                self.runThread = threading.Thread(target=self.runSequence, args=(self.oVibSoft_id,))
                self.runThread.start()

                self.progress_dialog = wx.ProgressDialog(title="Progress of measurement sequence", message="Performing measurement...", maximum=len(self.coords),
                                                     parent=None, style=wx.PD_SMOOTH | wx.PD_CAN_ABORT | wx.PD_ELAPSED_TIME |wx.PD_ESTIMATED_TIME | wx.PD_REMAINING_TIME | wx.PD_AUTO_HIDE)
        dlg.Destroy()


    def OnExit(self, event):
        self.oPFA.Close()
        self.Close(True)

    def OnAbout(self, event):
        dlg = wx.MessageDialog(self, self.AboutTextLong, "About Polytec Single Point Scanner", wx.OK)
        dlg.ShowModal()
        dlg.Destroy()


    def runSequence(self, oVibSoft_id):
        pythoncom.CoInitialize()
        oVibSoft = win32com.client.Dispatch(
            pythoncom.CoGetInterfaceAndReleaseStream(oVibSoft_id, pythoncom.IID_IDispatch)
            )
        oAcq = oVibSoft.Acquisition
        coordinatesSaveFile = self.exportpathandname + "_coordinates.txt"
        self.saveCoordinatesFile(filename=coordinatesSaveFile)
        for index in range(len(self.coords)):
            if len(self.coords[index]) == 1:
                # only z coordinate
                x,y,z = 0.0, 0.0, self.coords[index][2]
            elif len(self.coords[index]) == 2:
                # only x,y coordinates
                x,y,z = self.coords[index][0], self.coords[index][1], 0.0
            elif len(self.coords[index]) == 3:
                # x,y and z coordinates
                x,y,z = self.coords[index][0], self.coords[index][1], self.coords[index][2]
            else:
                # this should not happen
                break                
            self.grid.SelectRow(index)
            measurementFileName = self.exportpathandname + "_measurement_" + str(index).zfill(3) + ".pvd"
            if self.oPosDev:
                if oAcq and self.moveTo(x,y,z):
                    oAcq.Start(ptcAcqStartSingle)
                    while not oAcq.State == ptcAcqStateStopped:
                        time.sleep(0.1)
                    oAcq.Document.SaveAs(measurementFileName)
                    oVibSoft.Windows.CloseAll()
            self.progress_dialog.Update(index + 1)
            time.sleep(1)
        self.progress_dialog.Destroy()
        oVibSoft.Windows.CloseAll()
        self.oPosDev.enableJoystick()

    def moveTo(self, x,y,z):
        if self.oPosDev.HasXYAxes:
            self.oPosDev.StartMoveXY(x,y)
        if self.oPosDev.HasZAxis:
            self.oPosDev.StartMoveZ(z)
        while self.oPosDev.IsMovingXY or self.oPosDev.IsMovingZ:
            time.sleep(0.1)
        curPosXY = self.oPosDev.GetPositionXY()
        curPosZ = self.oPosDev.GetPositionZ()
        if curPosXY == (x,y) and curPosZ == z:
            return True
        else:
            print("Could not move axes to specified position")
            return False


    def checkRowNumbers(self, row_index):
        if row_index >= self.grid.GetNumberRows()-1:
            self.grid.AppendRows(1)
        
    def checkColumns(self):
        for i in range(self.grid.GetNumberRows()):
            if self.nAxes == 1:
                self.grid.SetCellBackgroundColour(i,0,wx.Colour(240, 240, 240, 255))
                self.grid.SetCellBackgroundColour(i,1,wx.Colour(240, 240, 240, 255))
                self.grid.SetReadOnly(i,0,True)
                self.grid.SetReadOnly(i,1,True)
            elif self.nAxes == 2:
                self.grid.SetCellBackgroundColour(i,2,wx.Colour(240, 240, 240, 255))
                self.grid.SetReadOnly(i,2, True)


    def checkCellInputValue(self, event):
        row, col = event.GetRow(), event.GetCol()
        try:
            newValue = float(self.grid.GetCellValue(row, col))
        except ValueError:
            print("Value contains invalid numbers")
        else:
            if col == 0:
                # check x value
                if newValue < self.xRange[0] or newValue > self.xRange[1]:
                    dlg = wx.MessageDialog(event.GetEventObject(), "X value is outside of the stage's limits\nValue needs to be between %f and %f" %(self.xRange[0], self.xRange[1]), "Input Value Error", style=wx.OK|wx.CENTRE)
                    if dlg.ShowModal() == wx.ID_OK:
                        self.grid.GoToCell(row,col)
                

    def getPointPositionsFromGrid(self):
        self.coords = []
        for lineIndex in range(self.grid.GetNumberRows()):
            x, y, z = self.grid.GetCellValue(lineIndex, 0), self.grid.GetCellValue(lineIndex, 1), self.grid.GetCellValue(lineIndex, 2)
            if self.nAxes == 2:
                if x and y:
                    self.coords.append([float(x), float(y)])
            elif self.nAxes == 3:
                if x and y and z:
                    self.coords.append([float(x), float(y), float(z)])
            elif self.nAxes == 1:
                # only z-axis
                if z:
                    self.coords.append([float(z)])
            else:
                # should not happeen - make sure the software does not hang:
                break
        self.toggleIconsAndMenus()

        
    def toggleIconsAndMenus(self):
        if self.coords:
            self.saveMenuItem.Enable(True)
            self.toolbar.EnableTool(self.sTool.GetId(), True)
            self.toolbar.SetToolNormalBitmap(self.sTool.GetId(), wx.Bitmap(self.saveIcon))
            if self.oPosDev:
                self.toolbar.EnableTool(self.rTool.GetId(), True)
                self.toolbar.SetToolNormalBitmap(self.rTool.GetId(), wx.Bitmap(self.runIcon))
            self.toolbar.Realize()
        else:
            self.saveMenuItem.Enable(False)
            self.toolbar.EnableTool(self.sTool.GetId(), False)
            self.toolbar.SetToolNormalBitmap(self.sTool.GetId(), wx.Bitmap(self.saveIcon_disabled))
            self.toolbar.EnableTool(self.rTool.GetId(), False)
            self.toolbar.SetToolNormalBitmap(self.rTool.GetId(), wx.Bitmap(self.runIcon_disabled))
            self.toolbar.Realize()
            

class MyApp(wx.App):
    def OnInit(self):
        self.locale = wx.Locale(wx.LANGUAGE_ENGLISH)
        mainFrame = MainWindow(None, "Polytec Single Point Scanner")
        mainFrame.Show(True)
        canRun, response = mainFrame.checkVibSoftVersion()
        if canRun in [-1, 0]:
            startupFrame = StartupWindow(mainFrame, canRun, response)
            startupFrame.Show()
        self.SetTopWindow(mainFrame)
        return(True)

if __name__ == '__main__':
    myApp = MyApp(0)
    #myMainFrame = MainWindow(None, "Polytec Settings Analyzer")
    myApp.MainLoop()
    