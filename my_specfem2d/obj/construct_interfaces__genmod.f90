        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CONSTRUCT_INTERFACES__genmod
          INTERFACE 
            SUBROUTINE CONSTRUCT_INTERFACES(NPARTS,ELMNTS_L,NBMODELS,   &
     &PHI_MATERIAL,NUM_MATERIAL)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NBMODELS
              INTEGER(KIND=4), INTENT(IN) :: NPARTS
              INTEGER(KIND=4), INTENT(IN) :: ELMNTS_L(0:4*NELMNTS-1)
              REAL(KIND=8), INTENT(IN) :: PHI_MATERIAL(1:NBMODELS)
              INTEGER(KIND=4), INTENT(IN) :: NUM_MATERIAL(1:NELMNTS)
            END SUBROUTINE CONSTRUCT_INTERFACES
          END INTERFACE 
        END MODULE CONSTRUCT_INTERFACES__genmod
