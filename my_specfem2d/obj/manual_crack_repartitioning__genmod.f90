        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MANUAL_CRACK_REPARTITIONING__genmod
          INTERFACE 
            SUBROUTINE MANUAL_CRACK_REPARTITIONING(NUM_MATERIAL,NPROC)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NUM_MATERIAL(1:NELMNTS)
              INTEGER(KIND=4), INTENT(IN) :: NPROC
            END SUBROUTINE MANUAL_CRACK_REPARTITIONING
          END INTERFACE 
        END MODULE MANUAL_CRACK_REPARTITIONING__genmod
