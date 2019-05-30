        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_SCALAR_AC_S__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_S(ARRAY_VAL1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NGLOB,                                                  &
     &          MY_NEIGHBORS,                                           &
     &          NINTERFACE_ACOUSTIC,                                    &
     &          INUM_INTERFACES_ACOUSTIC,                               &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          REQUEST_SEND_RECV_ACOUSTIC,                             &
     &          BUFFER_SEND_FACES_VECTOR_AC,                            &
     &          BUFFER_RECV_FACES_VECTOR_AC
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1(NGLOB)
            END SUBROUTINE ASSEMBLE_MPI_SCALAR_AC_S
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_SCALAR_AC_S__genmod
