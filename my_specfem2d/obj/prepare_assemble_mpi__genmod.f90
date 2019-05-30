        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PREPARE_ASSEMBLE_MPI__genmod
          INTERFACE 
            SUBROUTINE PREPARE_ASSEMBLE_MPI
              USE SPECFEM_PAR, ONLY :                                   &
     &          IBOOL,                                                  &
     &          KNODS,                                                  &
     &          NGNOD,                                                  &
     &          NGLOB,                                                  &
     &          ISPEC_IS_ELASTIC,                                       &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          NINTERFACE,                                             &
     &          MY_NELMNTS_NEIGHBORS,                                   &
     &          MY_INTERFACES,                                          &
     &          NIBOOL_INTERFACES_EXT_MESH,                             &
     &          IBOOL_INTERFACES_EXT_MESH_INIT,                         &
     &          NPROC,                                                  &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          IBOOL_INTERFACES_ELASTIC,                               &
     &          IBOOL_INTERFACES_POROELASTIC,                           &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          NIBOOL_INTERFACES_ELASTIC,                              &
     &          NIBOOL_INTERFACES_POROELASTIC,                          &
     &          INUM_INTERFACES_ACOUSTIC,                               &
     &          INUM_INTERFACES_ELASTIC,                                &
     &          INUM_INTERFACES_POROELASTIC,                            &
     &          NINTERFACE_ACOUSTIC,                                    &
     &          NINTERFACE_ELASTIC,                                     &
     &          NINTERFACE_POROELASTIC
            END SUBROUTINE PREPARE_ASSEMBLE_MPI
          END INTERFACE 
        END MODULE PREPARE_ASSEMBLE_MPI__genmod
