        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_SCALAR__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_SCALAR(ARRAY_VAL1,NPOIN_VAL1,       &
     &ARRAY_E1,N_SLS_LOC,ARRAY_VAL2,NPOIN_VAL2,ARRAY_VAL3,ARRAY_VAL4,   &
     &NPOIN_VAL3)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NINTERFACE,                                             &
     &          MY_NEIGHBORS,                                           &
     &          N_SLS,                                                  &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          MAX_IBOOL_INTERFACES_SIZE_AC,                           &
     &          MAX_IBOOL_INTERFACES_SIZE_EL,                           &
     &          MAX_IBOOL_INTERFACES_SIZE_PO,                           &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          IBOOL_INTERFACES_ELASTIC,                               &
     &          IBOOL_INTERFACES_POROELASTIC,                           &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          NIBOOL_INTERFACES_ELASTIC,                              &
     &          NIBOOL_INTERFACES_POROELASTIC
              INTEGER(KIND=4) :: NPOIN_VAL3
              INTEGER(KIND=4) :: NPOIN_VAL2
              INTEGER(KIND=4) :: N_SLS_LOC
              INTEGER(KIND=4) :: NPOIN_VAL1
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1(NPOIN_VAL1)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_E1(NPOIN_VAL1,N_SLS)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL2(2,NPOIN_VAL2)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL3(NPOIN_VAL3)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL4(NPOIN_VAL3)
            END SUBROUTINE ASSEMBLE_MPI_SCALAR
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_SCALAR__genmod
