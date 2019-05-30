        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UPDATE_MEMORY_VAR_ACOUS_WEAK_FORM__genmod
          INTERFACE 
            SUBROUTINE UPDATE_MEMORY_VAR_ACOUS_WEAK_FORM(DOT_E1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          N_SLS,                                                  &
     &          TIME_STEPPING_SCHEME,                                   &
     &          I_STAGE,                                                &
     &          DELTAT,                                                 &
     &          E1_LDDRK_ACOUS,                                         &
     &          E1_INITIAL_RK_ACOUS,                                    &
     &          E1_FORCE_RK_ACOUS,                                      &
     &          E1_ACOUS,                                               &
     &          E1_ACOUS_TEMP,                                          &
     &          INITIALFIELD,                                           &
     &          IT,                                                     &
     &          A_NEWMARK_E1,                                           &
     &          B_NEWMARK_E1,                                           &
     &          PHI_NU1,                                                &
     &          INV_TAU_SIGMA_NU1,                                      &
     &          NSPEC,                                                  &
     &          PML_BOUNDARY_CONDITIONS,                                &
     &          ISPEC_IS_PML,                                           &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          IBOOL,                                                  &
     &          DOT_E1_OLD,                                             &
     &          NGLOB_ACOUSTIC
              REAL(KIND=4), INTENT(INOUT) :: DOT_E1(NGLOB_ACOUSTIC,N_SLS&
     &)
            END SUBROUTINE UPDATE_MEMORY_VAR_ACOUS_WEAK_FORM
          END INTERFACE 
        END MODULE UPDATE_MEMORY_VAR_ACOUS_WEAK_FORM__genmod
