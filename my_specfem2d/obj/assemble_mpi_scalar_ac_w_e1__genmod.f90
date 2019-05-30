        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_SCALAR_AC_W_E1__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_W_E1(ARRAY_VAL1,          &
     &ARRAY_VAL1_E1,N_SLS_LOCAL)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NGLOB,                                                  &
     &          NINTERFACE_ACOUSTIC,                                    &
     &          INUM_INTERFACES_ACOUSTIC,                               &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          REQUEST_SEND_RECV_ACOUSTIC,                             &
     &          BUFFER_RECV_FACES_VECTOR_AC,                            &
     &          N_SLS,                                                  &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          NGLOB_ATT
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1(NGLOB)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1_E1(NGLOB_ATT,   &
     &N_SLS)
              INTEGER(KIND=4) :: N_SLS_LOCAL
            END SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_W_E1
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_SCALAR_AC_W_E1__genmod
