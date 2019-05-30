        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READ_EXTERNAL_ACOUSTIC_SURFACE__genmod
          INTERFACE 
            SUBROUTINE READ_EXTERNAL_ACOUSTIC_SURFACE(FILENAME,         &
     &NUM_MATERIAL,NBMODELS,ICODEMAT,PHI_MATERIAL,                      &
     &REMOVE_MIN_TO_START_AT_ZERO)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NBMODELS
              CHARACTER(LEN=512), INTENT(IN) :: FILENAME
              INTEGER(KIND=4) :: NUM_MATERIAL(0:NELMNTS-1)
              INTEGER(KIND=4), INTENT(IN) :: ICODEMAT(1:NBMODELS)
              REAL(KIND=8), INTENT(IN) :: PHI_MATERIAL(1:NBMODELS)
              INTEGER(KIND=4), INTENT(IN) :: REMOVE_MIN_TO_START_AT_ZERO
            END SUBROUTINE READ_EXTERNAL_ACOUSTIC_SURFACE
          END INTERFACE 
        END MODULE READ_EXTERNAL_ACOUSTIC_SURFACE__genmod
