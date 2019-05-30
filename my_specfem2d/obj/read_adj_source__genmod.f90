        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READ_ADJ_SOURCE__genmod
          INTERFACE 
            SUBROUTINE READ_ADJ_SOURCE(IREC_LOCAL,ADJ_SOURCE_FILE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          NSTEP,                                                  &
     &          P_SV,                                                   &
     &          SEISMOTYPE,                                             &
     &          SOURCE_ADJOINT
              INTEGER(KIND=4), INTENT(IN) :: IREC_LOCAL
              CHARACTER(LEN=512), INTENT(IN) :: ADJ_SOURCE_FILE
            END SUBROUTINE READ_ADJ_SOURCE
          END INTERFACE 
        END MODULE READ_ADJ_SOURCE__genmod
