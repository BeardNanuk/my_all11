        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_INTERFACES_DATABASE__genmod
          INTERFACE 
            SUBROUTINE WRITE_INTERFACES_DATABASE(IIN_DATABASE,NPARTS,   &
     &IPROC,MY_NINTERFACE,MY_INTERFACES,MY_NB_INTERFACES,NUM_PHASE)
              USE PART_UNSTRUCT_PAR, ONLY :                             &
     &          NINTERFACES,                                            &
     &          TAB_SIZE_INTERFACES,                                    &
     &          TAB_INTERFACES,                                         &
     &          GLOB2LOC_ELMNTS,                                        &
     &          GLOB2LOC_NODES_NPARTS,                                  &
     &          GLOB2LOC_NODES_PARTS,                                   &
     &          GLOB2LOC_NODES
              INTEGER(KIND=4), INTENT(IN) :: IIN_DATABASE
              INTEGER(KIND=4), INTENT(IN) :: NPARTS
              INTEGER(KIND=4), INTENT(IN) :: IPROC
              INTEGER(KIND=4), INTENT(INOUT) :: MY_NINTERFACE
              INTEGER(KIND=4), INTENT(INOUT) :: MY_INTERFACES(0:        &
     &NINTERFACES-1)
              INTEGER(KIND=4), INTENT(INOUT) :: MY_NB_INTERFACES(0:     &
     &NINTERFACES-1)
              INTEGER(KIND=4) :: NUM_PHASE
            END SUBROUTINE WRITE_INTERFACES_DATABASE
          END INTERFACE 
        END MODULE WRITE_INTERFACES_DATABASE__genmod
