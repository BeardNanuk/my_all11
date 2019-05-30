        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_VISCOACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_VISCOACOUSTIC(                    &
     &POTENTIAL_DOT_DOT_ACOUSTIC,POTENTIAL_DOT_ACOUSTIC,                &
     &POTENTIAL_ACOUSTIC,PML_BOUNDARY_CONDITIONS,POTENTIAL_ACOUSTIC_OLD,&
     &IPHASE,E1_ACOUS_SF,SUM_FORCES_OLD)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NSPEC_ATT_AC,                                           &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          DENSITY,                                                &
     &          RHOEXT,                                                 &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          COORD,                                                  &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIMEBARWGLJ_XX,                                       &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          N_SLS,                                                  &
     &          IGLOB_IS_FORCED,                                        &
     &          TIME_STEPPING_SCHEME,                                   &
     &          PHI_NU1,                                                &
     &          INV_TAU_SIGMA_NU1,                                      &
     &          E1_ACOUS,                                               &
     &          DOT_E1,                                                 &
     &          NSPEC_INNER_ACOUSTIC,                                   &
     &          NSPEC_OUTER_ACOUSTIC,                                   &
     &          PHASE_ISPEC_INNER_ACOUSTIC,                             &
     &          ISPEC_IS_PML
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_DOT_ACOUSTIC(NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC(NGLOB)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
              REAL(KIND=4) :: POTENTIAL_ACOUSTIC_OLD(NGLOB)
              INTEGER(KIND=4), INTENT(IN) :: IPHASE
              REAL(KIND=4) :: E1_ACOUS_SF(N_SLS,5,5,NSPEC_ATT_AC)
              REAL(KIND=4) :: SUM_FORCES_OLD(5,5,NSPEC_ATT_AC)
            END SUBROUTINE COMPUTE_FORCES_VISCOACOUSTIC
          END INTERFACE 
        END MODULE COMPUTE_FORCES_VISCOACOUSTIC__genmod
