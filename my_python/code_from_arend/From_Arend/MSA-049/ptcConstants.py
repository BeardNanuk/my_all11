
#ControllerCaps
ControllerCaps_None = 0
ControllerCaps_PowerUP = 1
ControllerCaps_SensorHead = 2
ControllerCaps_ServiceMode = 4
ControllerCaps_DigitalDemodulation = 8
ControllerCaps_MultipleOverrange = 16
ControllerCaps_SignalEnhancement = 32
ControllerCaps_MeasurementMode = 64
ControllerCaps_MultipleSensorHeads = 128
ControllerCaps_Overrange = 256
ControllerCaps_PSV500Behaviour = 512

ControllerCaps = {1: '... has power up',
                  2: '... has a sensor head',
                  4: '... has a a service mode',
                  8: '... has digital demodulation',
                  16: '... has multiple overrange indicators',
                  32: '... has signal enhancement',
                  64: '... supports different measurement modes',
                  128: '... has multiple sensor heads',
                  256: '... has at least one overrange indicator',
                  512: '... behaves like a controller of the PSV-500'}



#PTCAcqMode
ptcAcqModeTime = 0
ptcAcqModeFft = 1
ptcAcqModeZoomFft = 2
ptcAcqModeMultiFrame = 3
ptcAcqModeFastScan = 4
ptcAcqModeOrderTracking = 5
ptcAcqModeIQ = 6
ptcAcqModeInplane = 7

PTCAcqMode = {0: 'Time',
              1: 'FFT',
              2: 'Zoom-FFT',
              3: 'MultiFrame',
              4: 'FastScan',
              5: 'OrderTracking',
              6: 'IQ for digital demodulation (VDD)',
              7: 'Acquisition mode for the PMA software'}


#PTCAcqPropertiesType
PTCAcqPropertiesType = {0: 'ptcAcqPropertiesTypeGeneral',
                        1: 'ptcAcqPropertiesTypeAverage',
                        2: 'ptcAcqPropertiesTypeChannels',
                        3: 'ptcAcqPropertiesTypeFastScans',
                        4: 'ptcAcqPropertiesTypeFft',
                        5: 'ptcAcqPropertiesTypeGenerators',
                        6: 'ptcAcqPropertiesTypeMultiFrame',
                        8: 'ptcAcqPropertiesTypeSignalEnhancement',
                        9: 'ptcAcqPropertiesTypeTime',
                        10: 'ptcAcqPropertiesTypeTrigger',
                        11: 'ptcAcqPropertiesTypeVibrometers',
                        12: 'ptcAcqPropertiesTypeZoomFft',
                        14: 'ptcAcqPropertiesTypeFrontEnd'
                        }

ptcAcqPropertiesTypeGeneral = 0 
ptcAcqPropertiesTypeAverage = 1
ptcAcqPropertiesTypeChannels = 2
ptcAcqPropertiesTypeFastScans = 3
ptcAcqPropertiesTypeFft = 4 
ptcAcqPropertiesTypeGenerators = 5
ptcAcqPropertiesTypeMultiFrame = 6
ptcAcqPropertiesTypeSignalEnhancement = 8
ptcAcqPropertiesTypeTime = 9
ptcAcqPropertiesTypeTrigger = 10
ptcAcqPropertiesTypeVibrometers = 11
ptcAcqPropertiesTypeZoomFft = 12
ptcAcqPropertiesTypeFrontEnd = 14


#PTCAcqStartMode
ptcAcqStartSingle = 0       # Single measurement
ptcAcqStartContinuous = 1   # Continuous measurement

PTCAcqStartMode = {0: 'Single measurement',
                   1: 'Continuous measurement'}


#PTCAcqState
ptcAcqStateStopped = 0          # Measurement is stopped. 
ptcAcqStateSingle = 1           # Single shot measurement is in progress. 
ptcAcqStateContinuous = 2       # Continuous measurement is in progress. 
ptcAcqStateScanAll = 3          # A scanning measurement of all points is in progress. 
ptcAcqStateScanContinue = 4     # A scanning measurement is being continued. 
ptcAcqStateScanRemeasure = 5    # A scanning re-measurement is in progress. 

PTCAcqState = {0: 'ptcAcqStateStopped',
               1: 'ptcAcqStateSingle',
               2: 'ptcAcqStateContinuous',
               3: 'ptcAcqStateScanAll',
               4: 'ptcAcqStateScanContinue',
               5: 'ptcAcqStateScanRemeasure'}

#PTCAverageType
ptcAverageOff = 0
ptcAverageMagnitude = 1
ptcAverageComplex = 2
ptcAverageTime = 3
ptcAveragePeakhold = 4

PTCAverageType = {0: 'off',
                  1: 'Magnitude averaging',
                  2: 'Complex averaging',
                  3: 'Time mode averaging',
                  4: 'Peak Hold averaging'}


#PTCChannelType
ptcChannelTypeAnalog = 0
ptcChannelTypeAnalogFixed = 1
ptcChannelTypeFringeCounter = 2
ptcChannelTypeLogical = 3
ptcChannelTypeModulated = 4
ptcChannelTypeDigitalVib = 5

PTCChannelType = {0: 'Analog',
                  1: 'Analog, settings cannot be changed',
                  2: 'Fringe Counter',
                  3: 'Logical',
                  4: 'Modulated (I/Q)',
                  5: 'Digital (S/P-DIF)'}


#PTCCreateFlags
ptcCreateNone = 0       # No create flags. 
ptcCreateAlways = 1     # The file will be always created. An existing file will be overwritten. 

PTCCreateFlags = {0: 'ptcCreateNone',
                  1: 'ptcCreateAlways'                  
                  }


#PTCDataType
ptcDataUnknown = 0
ptcDataPoint = 1
ptcDataAverage = 2
ptcDataBand = 3

PTCDataType = {0:   'The data type is unknown',
               1:	'Point domain data',
               2:	'Point average data',
               3:	'Band data'}


#PTCDisplayType
ptcDisplayNotAvail = 0  # The display is not available.
ptcDisplayMag = 1       # The magnitude.
ptcDisplayMagPhase = 2  # The magnitude and the phase in degree.
ptcDisplayMagDb = 3	    # The magnitude in dB.
ptcDisplayMagDbPhase = 4    # The magnitude in dB and the phase in degree.
ptcDisplayMagDbA = 5    # The magnitude in dBA.
ptcDisplayPhase = 6     # The phase.
ptcDisplayReal = 7      # The real part.
ptcDisplayImag = 8	    # The imaginary part.
ptcDisplayRealImag = 9  # The real and the imaginary part.
ptcDisplayNyquist = 10  # Nyquist.
ptcDisplayInstVal = 11  # The instantaneous value for a given phase.
ptcDisplaySamples = 12  # The samples (for the time domain only).
ptcDisplayIQFitted = 13 # The IQ display (digital demodulation, VDD only).
ptcDisplayMagPhaseRad = 14  # The magnitude and the phase in radian.
ptcDisplayMagDbPhaseRad = 15    # The magnitude in dB and the phase in radian.

PTCDisplayType  = {0: 'ptcDisplayNotAvail',
                   1: 'ptcDisplayMag',
                   2: 'ptcDisplayMagPhase',
                   3: 'ptcDisplayMagDb',
                   4: 'ptcDisplayMagDbPhase',
                   5: 'ptcDisplayMagDbA',
                   6: 'ptcDisplayPhase',
                   7: 'ptcDisplayReal',
                   8: 'ptcDisplayImag',
                   9: 'ptcDisplayRealImag',
                   10: 'ptcDisplayNyquist',
                   11: 'ptcDisplayInstVal',
                   12: 'ptcDisplaySamples',
                   13: 'ptcDisplayIQFitted',
                   14: 'ptcDisplayMagPhaseRad',
                   15: 'ptcDisplayMagDbPhaseRad' 
                   }


#PTCDomainType
ptcDomainNotAvail = 0   # Domain is not available
ptcDomainTime = 1       # Domain Time.
ptcDomainAngleSync = 2  # Domain synchronized angle (for order analysis, not supported any more).
ptcDomainSpectrum = 3   # Domain Spectrum.
ptcDomain3rdOctave = 4  # Domain 3rdOctave.
ptcDomainOrderSpectrum = 5  # Domain order spectrum (for order analysis, not supported any more).
ptcDomainRMS = 6        # Domain RMS. 

PTCDomainType  = {0: 'ptcDomainNotAvail',
                  1: 'ptcDomainTime',
                  2: 'ptcDomainAngleSync',
                  3: 'ptcDomainSpectrum',
                  4: 'ptcDomain3rdOctave',
                  5: 'ptcDomainOrderSpectrum',
                  6: 'ptcDomainRMS'}

#PTCFileFormat
ptcFileFormatAnalyzer = 0   # Analyzer file format (.pvd). 
ptcFileFormatText = 1       # ASCII format. 
ptcFileFormatGraphic = 2    # Graphic format. 

PTCFileFormat = {0: 'Analyzer format (.pvd)',
                 1: 'ASCII format',
                 2: 'Graphic format'}


#PTCFileID
ptcFileIDUnknown = 0
ptcFileIDVibSoftSettings = 1
ptcFileIDVibSoftFile = 2
ptcFileIDPSVSettings = 3
ptcFileIDPSVFile = 4
ptcFileIDSigProFile = 6
ptcFileIDCombinedFile = 7

PTCFileID = {   0:  'Unknown File Type',
                1:  'VibSoft settings file',
                2:  'VibSoft measurement file',
                3:  'PSV settings file',
                4:  'PSV measurement file',
                6:  'Signal Processor file',
                7:  'PSV combined measurement file'}


#PTCFunctionAtNodeDirection 
ptcMinusZRotation = -6
ptcMinusYRotation = -5
ptcMinusXRotation = -4
ptcMinusZTranslation = -3
ptcMinusYTranslation = -2
ptcMinusXTranslation = -1
ptcScalarDir = 0
ptcPlusXTranslation	= 1
ptcPlusYTranslation = 2
ptcPlusZTranslation = 3
ptcPlusXRotation = 4
ptcPlusYRotation = 5
ptcPlusZRotation = 6
ptcVector = 7

PTCFunctionAtNodeDirection  = {-6:  'Negative rotation Z direction',
                               -5:	'Negative rotation Y direction',
                               -4:	'Negative rotation X direction',
                               -3:	'Negative translation Z direction',
                               -2:	'Negative translation Y direction',
                               -1:	'Negative translation X direction',
                               0:	'Signal is scalar, no direction',
                               1:	'Positive translation X direction',
                               2:	'Positive translation Y direction',
                               3:	'Positive translation Z direction',
                               4:	'Positive rotation X direction',
                               5:	'Positive rotation Y direction',
                               6:	'Positive rotation Z direction',
                               7:	'Signal is vector (3D)'}


#PTCFunctionType
ptcFunctionUnknownType = 0
ptcFunctionTimeResponseType = 1
ptcFunctionAutoSpectrumType	= 2
ptcFunctionCrossSpectrumType = 3
ptcFunctionFrequencyResponseFunctionType = 4
ptcFunctionTransmissibilityType = 5
ptcFunctionCoherenceType = 6
ptcFunctionAutoCorrelationType = 7
ptcFunctionCrossCorrelationType = 8
ptcFunctionPowerSpectralDensityType = 9
ptcFunctionEnergySpectralDensityType = 10
ptcFunctionProbabilityDensityFunctionType = 11
ptcFunctionSpectrumType = 12
ptcFunctionCumulativeFrequencyDistributionType = 13
ptcFunctionPeaksValleyType = 14
ptcFunctionStressCyclesType = 15
ptcFunctionStrainCyclesType = 16
ptcFunctionOrbitType = 17
ptcFunctionModeIndicatorFunctionType = 18
ptcFunctionForcePatternType = 19
ptcFunctionPartialPowerType = 20
ptcFunctionPartialCoherenceType = 21
ptcFunctionEigenvalueType = 22
ptcFunctionEigenvectorType = 23
ptcFunctionShockResponseSpectrumType = 24
ptcFunctionFiniteImpulseResponseFilterType = 25
ptcFunctionMultipleCoherenceType = 26
ptcFunctionOrderFunctionType = 27
ptcFunctionImpulseResponseType = 100
ptcFunctionIntensityType = 101
ptcFunctionPIIndexType = 102
ptcFunctionSoundPressureLevelType = 103
ptcFunctionSoundPowerType = 104
ptcFunctionRealValuedDataType = 105
ptcFunctionComplexValuedDataType = 106
ptcFunctionParticleVelocityType = 107
ptcFunctionTemperatureType = 108
ptcFunctionFrequencyResponseFunctionH1Type = 300
ptcFunctionFrequencyResponseFunctionH2Type = 301
ptcFunctionFrequencyResponseFunctionPCAH1Type = 302
ptcFunctionPCAPrincipalInputsType = 303
ptcFunctionPCAVirtualCoherencesType = 304
ptcFunctionVddIQType = 305
ptcFunctionBand = 306

PTCFunctionType = { 0:  'Unknown',
                    1:	'Time Signal',
                    2:	'Auto power',
                    3:	'Cross power',
                    4:	'FRF',
                    5:	'Transmissibility',
                    6:	'Coherence',
                    7:	'Auto correlation',
                    8:	'Cross correlation',
                    9:	'PSD',
                    10:	'ESD',
                    10: 'Probability density',
                    12:	'Spectrum',
                    13:	'Cumulative Frequency Distribution',
                    14:	'Peaks Valley',
                    15:	'Stress Cycles',
                    16:	'Strain Cycles',
                    17:	'Orbit',
                    18:	'Mode Indicator Function',
                    19:	'Force Pattern',
                    20:	'Partial Power',
                    21:	'Partial Coherence',
                    22:	'Eigenvalue',
                    23:	'Eigenvector',
                    24:	'Shock Response',
                    25:	'FIR Filter',
                    26:	'Multiple Coherence',
                    27:	'Order',
                    100:	'Impulse Response',
                    101:	'Intensity',
                    102:	'PI Index',
                    103:	'Sound Pressure Level',
                    104:	'Sound Power',
                    105:	'Real Valued Data',
                    106:	'Complex Valued Data',
                    107:	'Particle Velocity',
                    108:	'Temperature',
                    300:	'H1',
                    301:	'H2',
                    302:	'H1 for principal component analysis (MIMO)',
                    303:	'Principal Inputs for PCA (MIMO)',
                    304:	'Virtual Coherences for PCA (MIMO)',
                    305:	'IQ signal for digital demodulation',
                    306:	'Band'}

#PTCInfoType
ptcInfoAcquisition = 0
ptcInfoHardware = 1
ptcInfoElements = 2
ptcInfoVideo = 3                    # deprecated, use ptcInfoVideoBitmap (9) instead
ptcInfoAPS = 4                      # not yet implemeted
ptcInfoMeasPoints = 5
ptcInfoProfiles = 6
ptcInfoCameraSettings = 7
ptcInfoScanHead = 8                 # deprecated, use ptcInfoScanHeadDevices (12) instead
ptcInfoVideoBitmap = 9
ptcInfoDbReferences = 11
ptcInfoScanHeadDevices = 12
ptcInfoAlignments = 13
ptcInfoVideoMapping = 14            # lens calibration
ptcInfoPositioningStage = 15        # Positioning stage for MSA systems, only available in the InfosAcq collection of PSV
ptcInfoVibrometers = 16             # Vibrometers, only available in the InfosAcq collection of PSV and VibSoft
ptcInfoPositionDevice = 17          # Positioning device for MSA-100-3D and other systems, only available in the InfosAcq collection
ptcInfoMeasurementLocations = 18

PTCInfoType = {0: 'ptcInfoAcquisition',
               13: 'ptcInfoAlignments',
               4: 'ptcInfoAPS',
               7: 'ptcInfoCameraSettings',
               11: 'ptcInfoDbReferences',
               2: 'ptcInfoElements',
               1: 'ptcInfoHardware',
               5: 'ptcInfoMeasPoints',
               17: 'ptcInfoPositionDevice',
               15: 'ptcInfoPositioningStage',
               6: 'ptcInfoProfiles',
               8: 'ptcInfoScanHead',
               12: 'ptcInfoScanHeadDevices',
               16: 'ptcInfoVibrometers',
               3: 'ptcInfoVideo',
               9: 'ptcInfoVideoBitmap',
               14: 'ptcInfoVideoMapping',
               18: 'ptcInfoMeasurementLocations'
               }


#PTCInputCoupling
ptcInputCouplingAC = 0
ptcInputCouplingDC = 1
ptcInputCouplingUnknown = 2

PTCInputCoupling = {0: 'AC',
                    1: 'DC',
                    2: 'unknown'}




#PTCPhysicalQuantity
ptcPhysicalQuantityAcceleration = 0
ptcPhysicalQuantityAngle = 1
ptcPhysicalQuantityAngularAcceleration = 2
ptcPhysicalQuantityAngularVelocity = 3
ptcPhysicalQuantityDisplacement = 4
ptcPhysicalQuantityElectricalCurrent = 5
ptcPhysicalQuantityForce = 6
ptcPhysicalQuantityPower = 7
ptcPhysicalQuantityPressure = 8
ptcPhysicalQuantityRevolution= 9
ptcPhysicalQuantityRPM = 10
ptcPhysicalQuantitySoundPressure = 11
ptcPhysicalQuantityTorque = 12
ptcPhysicalQuantityVelocity = 13
ptcPhysicalQuantityVoltage = 14
ptcPhysicalQuantityCounts = 15
ptcPhysicalQuantityVolume = 16
ptcPhysicalQuantityVolumeVelocity = 17
ptcPhysicalQuantityVolumeAcceleration = 18
ptcPhysicalQuantityStrain = 19
ptcPhysicalQuantityGravitationalAcceleration = 20
ptcPhysicalQuantityStress = 21
ptcPhysicalQuantityTime = 22
ptcPhysicalQuantityFrequency = 23
ptcPhysicalQuantityAngleDegree = 24
ptcPhysicalQuantityAngularAccelerationDegree = 25
ptcPhysicalQuantityAngularVelocityDegree = 26

PTCPhysicalQuantity = {0: 'Acceleration',
                       1: 'Angle',
                       2: 'Angular Acceleration',
                       3: 'Angular Velocity',
                       4: 'Displacement',
                       5: 'Electrical Current',
                       6: 'Force',
                       7: 'Power',
                       8: 'Pressure',
                       9: 'Revolution',
                       10: 'RPM',
                       11: 'Sound Pressure',
                       12: 'Torque',
                       13: 'Velocity',
                       14: 'Voltage',
                       15: 'Counts',
                       16: 'Volume',
                       17: 'Volume Velocity',
                       18: 'Volume Acceleration',
                       19: 'Strain',
                       20: 'Gravitational Acceleration',
                       21: 'Stress',
                       22: 'Time',
                       23: 'Frequency',
                       24: 'Angle',
                       25: 'Angular Acceleration',
                       26: 'Angular Velocity'}


#PTCProgramID
ptcProgramIDUnknown = 0         # The application is unknown. 
ptcProgramIDVibSoft= 1          # The application is VibSoft. 
ptcProgramIDPSV = 2             # The application is PSV. 
ptcProgramIDScannerControl = 3  # The application is ScannerControl. 
ptcProgramIDMSVInplane = 4      # The application is PMA. 
ptcProgramIDTMS = 5             # The application is TMS. 
ptcProgramIDPolyFile = 6        # The application is Polytec File Access. 
ptcProgramIDMPV = 7             # The application is MPV. 
ptcProgramIDMask = 7            # A combined mask value for all identified applications. 

PTCProgramID = {0: 'The application is unknown',
                1: 'The application is VibSoft',
                2: 'The application is PSV',
                3: 'The application is ScannerControl',
                4: 'The application is PMA',
                5: 'The application is TMS',
                6: 'The application is Polytec File Access',
                7: 'The application is MPV'}


#PTCScanMode
ptcScanAll = 0                  # Starts a complete scan of all measurement points. 
ptcScanContinue = 1             # Continues a previously started scan. 
ptcScanRemeasure = 2            # Starts a re-measurement of a previously started scan. 
ptcScanRemeasureAutoRange = 3   # Starts a re-measurement of a previously started scan with automatic adjustment of the vibrometer range for scan points with scan status overrange. 
ptcScanRemeasureFile = 4        # Starts a re-measurement of the scan file specified in the ScanFileName Property. 

PTCScanMode = {0: 'ptcScanAll',
               1: 'ptcScanContinue',
               2: 'ptcScanRemeasure',
               3: 'ptcScanRemeasureAutoRange',
               4: 'ptcScanRemeasureFile'}


# PTCScanStatus
ptcScanStatusNone = 0
ptcScanStatusValid = 1
ptcScanStatusOptimal = 2
ptcScanStatusOverrange = 4
ptcScanStatusInvalidated = 8
ptcScanStatusDisabled = 16
ptcScanStatusInvalidFrames = 32
ptcScanStatusNotReachable = 64
ptcScanStatusHidden = 128
ptcScanStatusVideoTriangulationFailed =256
ptcScanStatusInterpolate = 512
ptcScanStatusInterpolationFailed = 1024                  

PTCScanStatus = {0:     'Not measured',
                 1:     'Valid',
                 2:     'Optimal',
                 4:     'Overrange',
                 8:     'Invalidated',
                 16:    'Disabled',
                 32:    'Invalid Frames',
                 64:    'Not Reachable',
                 128:   'Hidden by 3D geometry',
                 256:   'Video Triangulation failed',
                 512:   'Interpolated',
                 1024:  'Interpolation failed'}                  


#PTCSettings
ptcSettingsAcquisition = 2      # Acquisition settings. 
ptcSettingsAll = 65535          # All settings. 
ptcSettingsAPS = 312            # Scan point definition. 
ptcSettingsCamera = 68          # Camera settings and alignments. 
ptcSettingsNone = 0             # No settings. 
ptcSettingsWindows = 128        # Window layout. 

PTCSettings = {2: 'ptcSettingsAcquisition',
               65535: 'ptcSettingsAll',
               312: 'ptcSettingsAPS',
               68: 'ptcSettingsCamera',
               0: 'ptcSettingsNone',
               128: 'ptcSettingsWindows'
               }

#PTCSignalBuildFlags
ptcBuildNothing = 0
ptcBuildDomainTime = 1
ptcBuildDomainSpectrum = 2
ptcBuildDomainRms = 4
ptcBuildDomainAngleSync = 8
ptcBuildDomainOrderSpectrum = 16
ptcBuildDomain3rdOctave = 32
ptcBuildDomainAll = 63
ptcBuildChannelOriginal = 256
ptcBuildChannelUser = 512
ptcBuildChannel3d = 1024
ptcBuildChannelXYZ = 2048
ptcBuildDisplayComplex = 65536
ptcBuildDisplayNyquist = 131072
ptcBuildDisplayInstVal = 262144
ptcBuildDisplayPhase = 524288
ptcBuildBandData3d = 591679
ptcBuildBandDataXYZ = 592703
ptcBuildPointData3d	= 722751
ptcBuildPointDataXYZ = 723775

PTCSignalBuildFlags = {0:	'No build flags set',
                       1:	'Build domain Time',
                       2:	'Build domain Spectrum',
                       4:	'Build domain RMS',
                       8:	'Build domain Angle Sync',
                       16:	'Build domain Order Spectrum',
                       32:	'Build domain 3rd Octave',
                       63:	'Build all domains',
                       256:	'Build the channels with the original signals',
                       512:	'Build the channel Usr',
                       1024:	'Build the 3d channels (Usr 3D and/or Vib 3D)',
                       2048:	'Build the x,y,z channels (Usr X, Usr Y, Usr Z and/or Vib X, Vib Y, Vib Z)',
                       65536:	'Build complex displays (e.g. Real & Imag., Mag. & Phase)',
                       131072:	'Build display Nyquist',
                       262144:	'Build display Inst. Val',
                       524288:	'Build display phase',
                       591679:	'Combination of build flags for band data and 3d channels: ptcBuildDomainAll Or ptcBuildChannelOriginal Or ptcBuildChannelUser Or ptcBuildChannel3d Or ptcBuildDisplayComplex Or ptcBuildDisplayPhase',
                       592703:	'Combination of build flags for band data and x,y,z channels: ptcBuildDomainAll Or ptcBuildChannelOriginal Or ptcBuildChannelUser Or ptcBuildChannelXYZ Or ptcBuildDisplayComplex Or ptcBuildDisplayPhase',
                       722751:	'Combination of build flags for point data or point average data and 3d channels: ptcBuildDomainAll Or ptcBuildChannelOriginal Or ptcBuildChannelUser Or ptcBuildChannel3d Or ptcBuildDisplayComplex Or ptcBuildDisplayNyquist Or ptcBuildDisplayPhase',
                       723775:	'Combination of build flags for point data or point average data and x,y,z channels: ptcBuildDomainAll Or ptcBuildChannelOriginal Or ptcBuildChannelUser Or ptcBuildChannelXYZ Or ptcBuildDisplayComplex Or ptcBuildDisplayNyquist Or ptcBuildDisplayPhase'}

#PTCTriggerEdge
ptcTriggerEdgeRising = 0
ptcTriggerEdgeFalling = 1

PTCTriggerEdge = {0: 'Rising',
                  1: 'Falling'}


#PTCTriggerSource
ptcTriggerSourceOff = 0
ptcTriggerSourceExternal = 1
ptcTriggerSourceAnalog = 2
ptcTriggerSourceInternal = 3

PTCTriggerSource = {0: 'Off',
                    1: 'External',
                    2: 'Analog',
                    3: 'Internal'}



#PTCVibrationDirection
ptcZPos = 0
ptcZNeg = 1
ptcXPos = 2
ptcXNeg = 3
ptcYPos = 4
ptcYNeg = 5
ptc3DVector = 6

PTCVibrationDirection = {0: '+z',
                         1: '-z',
                         2: '+x',
                         3: '-x',
                         4: '+y',
                         5: '-y',
                         6: '3D'}


#PTCWindowFunction
ptcWindowFctRectangle = 0
ptcWindowFctBartlett = 1
ptcWindowFctBlackmanHarris = 2 
ptcWindowFctExponential = 3
ptcWindowFctFlatTop = 4
ptcWindowFctForce = 5
ptcWindowFctHamming = 6
ptcWindowFctHanning = 7
ptcWindowFctTaperedHanning = 8

PTCWindowFunction = {0: 'Rectangle',
                     1: 'Bartlett',
                     2: 'Blackmann Harris',
                     3: 'Exponential',
                     4: 'Flat Top',
                     5: 'Force',
                     6: 'Hamming',
                     7: 'Hanning',
                     8: 'Tapered Hanning'}


#PTCWindowType
ptcWindowTypeAnalyzer = 0   # The window is an analyzer window. 
ptcWindowTypeArea = 1       # The window is an area window. 
ptcWindowTypeSigPro = 2     # The window is a signal processor window. 

PTCWindowType  = {0: 'analyzer window',
                  1: 'area window',
                  2: 'SigPro window'}