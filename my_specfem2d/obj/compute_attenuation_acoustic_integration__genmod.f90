        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ATTENUATION_ACOUSTIC_INTEGRATION__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ATTENUATION_ACOUSTIC_INTEGRATION(        &
     &POTENTIAL_ACOUSTIC,ISPEC_IS_ACOUSTIC,PML_BOUNDARY_CONDITIONS,     &
     &IPHASE,DOT_E1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          N_SLS,                                                  &
     &          IBOOL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          HPRIME_XX,                                              &
     &          HPRIME_ZZ,                                              &
     &          ISPEC_IS_PML,                                           &
     &          NGLJ,                                                   &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          AXISYM,                                                 &
     &          NSPEC_INNER_ACOUSTIC,                                   &
     &          NSPEC_OUTER_ACOUSTIC,                                   &
     &          KMATO,                                                  &
     &          PHASE_ISPEC_INNER_ACOUSTIC,                             &
     &          JACOBIAN,                                               &
     &          RHOEXT,                                                 &
     &          DENSITY,                                                &
     &          IS_ON_THE_AXIS,                                         &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIMEBARWGLJ_XX,                                       &
     &          HPRIMEWGLL_ZZ,                                          &
     &          HPRIMEWGLL_XX,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          WXGLJ,                                                  &
     &          XIGLJ,                                                  &
     &          COORD,                                                  &
     &          IGLOB_IS_FORCED,                                        &
     &          NGLOB_ATT
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC(NGLOB)
              LOGICAL(KIND=4), INTENT(IN) :: ISPEC_IS_ACOUSTIC(NSPEC)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
              INTEGER(KIND=4) :: IPHASE
              REAL(KIND=4) :: DOT_E1(NGLOB_ATT,N_SLS)
            END SUBROUTINE COMPUTE_ATTENUATION_ACOUSTIC_INTEGRATION
          END INTERFACE 
        END MODULE COMPUTE_ATTENUATION_ACOUSTIC_INTEGRATION__genmod
