        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_ATTENUATION_FORCES_STRONG_FORM__genmod
          INTERFACE 
            SUBROUTINE GET_ATTENUATION_FORCES_STRONG_FORM(SUM_FORCES,   &
     &SUM_FORCES_OLD,FORCES_ATTENUATION,I,J,ISPEC,IGLOB,E1_ACOUS_SF)
              USE SPECFEM_PAR, ONLY :                                   &
     &          PML_BOUNDARY_CONDITIONS,                                &
     &          N_SLS,                                                  &
     &          NSPEC_ATT_AC,                                           &
     &          ISPEC_IS_PML,                                           &
     &          PHI_NU1,                                                &
     &          INV_TAU_SIGMA_NU1,                                      &
     &          TIME_STEPPING_SCHEME,                                   &
     &          I_STAGE,                                                &
     &          DELTAT,                                                 &
     &          E1_ACOUS,                                               &
     &          E1_LDDRK_ACOUS,                                         &
     &          E1_INITIAL_RK_ACOUS,                                    &
     &          E1_FORCE_RK_ACOUS,                                      &
     &          A_NEWMARK_E1_SF,                                        &
     &          B_NEWMARK_E1_SF
              REAL(KIND=4), INTENT(IN) :: SUM_FORCES
              REAL(KIND=4), INTENT(INOUT) :: SUM_FORCES_OLD
              REAL(KIND=4), INTENT(OUT) :: FORCES_ATTENUATION
              INTEGER(KIND=4) :: I
              INTEGER(KIND=4) :: J
              INTEGER(KIND=4) :: ISPEC
              INTEGER(KIND=4) :: IGLOB
              REAL(KIND=4), INTENT(INOUT) :: E1_ACOUS_SF(N_SLS,5,5,     &
     &NSPEC_ATT_AC)
            END SUBROUTINE GET_ATTENUATION_FORCES_STRONG_FORM
          END INTERFACE 
        END MODULE GET_ATTENUATION_FORCES_STRONG_FORM__genmod
