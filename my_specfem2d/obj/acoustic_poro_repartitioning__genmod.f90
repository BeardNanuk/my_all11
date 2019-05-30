        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ACOUSTIC_PORO_REPARTITIONING__genmod
          INTERFACE 
            SUBROUTINE ACOUSTIC_PORO_REPARTITIONING(ELMNTS_L,NBMODELS,  &
     &PHI_MATERIAL,NUM_MATERIAL,NPROC)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NBMODELS
              INTEGER(KIND=4), INTENT(IN) :: ELMNTS_L(0:4*NELMNTS-1)
              REAL(KIND=8), INTENT(IN) :: PHI_MATERIAL(NBMODELS)
              INTEGER(KIND=4), INTENT(IN) :: NUM_MATERIAL(1:NELMNTS)
              INTEGER(KIND=4), INTENT(IN) :: NPROC
            END SUBROUTINE ACOUSTIC_PORO_REPARTITIONING
          END INTERFACE 
        END MODULE ACOUSTIC_PORO_REPARTITIONING__genmod
