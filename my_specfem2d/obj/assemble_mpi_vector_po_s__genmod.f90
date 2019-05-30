        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_VECTOR_PO_S__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_VECTOR_PO_S(ARRAY_VAL3,ARRAY_VAL4)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NPROC,                                                  &
     &          NGLOB,                                                  &
     &          NINTERFACE_POROELASTIC,                                 &
     &          INUM_INTERFACES_POROELASTIC,                            &
     &          IBOOL_INTERFACES_POROELASTIC,                           &
     &          NIBOOL_INTERFACES_POROELASTIC,                          &
     &          REQUEST_SEND_RECV_PORO,                                 &
     &          BUFFER_SEND_FACES_VECTOR_POS,                           &
     &          BUFFER_SEND_FACES_VECTOR_POW,                           &
     &          BUFFER_RECV_FACES_VECTOR_POS,                           &
     &          BUFFER_RECV_FACES_VECTOR_POW,                           &
     &          MY_NEIGHBORS
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL3(2,NGLOB)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL4(2,NGLOB)
            END SUBROUTINE ASSEMBLE_MPI_VECTOR_PO_S
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_VECTOR_PO_S__genmod
