        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_VECTOR_EL_S__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_VECTOR_EL_S(ARRAY_VAL)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NGLOB,                                                  &
     &          NINTERFACE_ELASTIC,                                     &
     &          INUM_INTERFACES_ELASTIC,                                &
     &          IBOOL_INTERFACES_ELASTIC,                               &
     &          NIBOOL_INTERFACES_ELASTIC,                              &
     &          REQUEST_SEND_RECV_ELASTIC,                              &
     &          BUFFER_SEND_FACES_VECTOR_EL,                            &
     &          BUFFER_RECV_FACES_VECTOR_EL,                            &
     &          MY_NEIGHBORS
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL(2,NGLOB)
            END SUBROUTINE ASSEMBLE_MPI_VECTOR_EL_S
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_VECTOR_EL_S__genmod
