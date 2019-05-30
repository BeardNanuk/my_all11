        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MERGE_ABS_BOUNDARIES__genmod
          INTERFACE 
            SUBROUTINE MERGE_ABS_BOUNDARIES(NBMODELS,PHI_MATERIAL,      &
     &NUM_MATERIAL,NGNOD)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4) :: NBMODELS
              REAL(KIND=8), INTENT(IN) :: PHI_MATERIAL(NBMODELS)
              INTEGER(KIND=4), INTENT(IN) :: NUM_MATERIAL(1:NELMNTS)
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
            END SUBROUTINE MERGE_ABS_BOUNDARIES
          END INTERFACE 
        END MODULE MERGE_ABS_BOUNDARIES__genmod
