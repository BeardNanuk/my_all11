        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UPDATE_DISPLACEMENT_NEWMARK_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE UPDATE_DISPLACEMENT_NEWMARK_ACOUSTIC(DELTAT,     &
     &DELTATOVER2,DELTATSQUAREOVER2,POTENTIAL_DOT_DOT_ACOUSTIC,         &
     &POTENTIAL_DOT_ACOUSTIC,POTENTIAL_ACOUSTIC,PML_BOUNDARY_CONDITIONS,&
     &POTENTIAL_ACOUSTIC_OLD)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ACOUSTIC,                                         &
     &          CUSTOM_REAL,                                            &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          IGLOB_IS_FORCED,                                        &
     &          ACOUSTIC_IGLOB_IS_FORCED,                               &
     &          IT
              REAL(KIND=8), INTENT(IN) :: DELTAT
              REAL(KIND=8), INTENT(IN) :: DELTATOVER2
              REAL(KIND=8), INTENT(IN) :: DELTATSQUAREOVER2
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_ACOUSTIC(    &
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_ACOUSTIC(        &
     &NGLOB_ACOUSTIC)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_ACOUSTIC_OLD(    &
     &NGLOB_ACOUSTIC)
            END SUBROUTINE UPDATE_DISPLACEMENT_NEWMARK_ACOUSTIC
          END INTERFACE 
        END MODULE UPDATE_DISPLACEMENT_NEWMARK_ACOUSTIC__genmod
