
import sys

from seisflows.config import ParameterError, save 

PAR = sys.modules['seisflows_parameters']
PATH = sys.modules['seisflows_paths']

system = sys.modules['seisflows_system']
solver = sys.modules['seisflows_solver']


class test_forwardmt(object):
    """ Tests solver by running forward simulation
    """

    def check(self):
        """ Checks parameters and paths
        """

        # check paths
        if 'SCRATCH' not in PATH:
            raise Exception

        if 'LOCAL' not in PATH:
            setattr(PATH, 'LOCAL', None)

        if 'MODEL_INIT' not in PATH:
            raise Exception

        if 'MODEL_TRUE' not in PATH:
            raise Exception

        if 'OUTPUT' not in PATH:
            raise Exception


    def main(self):
        """ Generates seismic data
        """

        print 'Running solver...'

        system.run('solver', 'generate_data',
                   model_path=PATH.MODEL_TRUE,
                   model_type='gll',
                   model_name='model')

        #system.run('solver', 'generate_data2',
        #           model_path=PATH.MODEL_INIT,
        #           model_type='gll',
        #           model_name='model')

        print "Finished\n"

    def checkpoint(self):
        """ Writes information to disk so workflow can be resumed following a
          break
        """
        save()

