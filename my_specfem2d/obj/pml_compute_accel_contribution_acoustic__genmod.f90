        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_COMPUTE_ACCEL_CONTRIBUTION_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE PML_COMPUTE_ACCEL_CONTRIBUTION_ACOUSTIC(ISPEC,   &
     &NGLOB,POTENTIAL_ACOUSTIC,POTENTIAL_ACOUSTIC_OLD,                  &
     &POTENTIAL_DOT_ACOUSTIC,POTENTIAL_DOT_DOT_ACOUSTIC_PML,R_XIPLUS1)
              INTEGER(KIND=4), INTENT(IN) :: NGLOB
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC(NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC_OLD(NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_DOT_ACOUSTIC(NGLOB)
              REAL(KIND=4), INTENT(OUT) ::                              &
     &POTENTIAL_DOT_DOT_ACOUSTIC_PML(5,5)
              REAL(KIND=4), INTENT(IN) :: R_XIPLUS1(5,5)
            END SUBROUTINE PML_COMPUTE_ACCEL_CONTRIBUTION_ACOUSTIC
          END INTERFACE 
        END MODULE PML_COMPUTE_ACCEL_CONTRIBUTION_ACOUSTIC__genmod