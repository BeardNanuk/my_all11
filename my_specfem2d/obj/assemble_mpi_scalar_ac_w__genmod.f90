        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_SCALAR_AC_W__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_W(ARRAY_VAL1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NGLOB,                                                  &
     &          NINTERFACE_ACOUSTIC,                                    &
     &          INUM_INTERFACES_ACOUSTIC,                               &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          REQUEST_SEND_RECV_ACOUSTIC,                             &
     &          BUFFER_RECV_FACES_VECTOR_AC
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1(NGLOB)
            END SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_W
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_SCALAR_AC_W__genmod
