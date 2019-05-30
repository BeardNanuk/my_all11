        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_PORO_SOLID__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_PORO_SOLID(DISPLS_POROELASTIC,    &
     &DISPLW_POROELASTIC,ACCELS_POROELASTIC,EPSILONDEV_S,IPHASE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          NGLOB_POROELASTIC,                                      &
     &          NSPEC_POROELASTIC_B,                                    &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          DELTAT,                                                 &
     &          IBOOL,                                                  &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          E11,                                                    &
     &          E13,                                                    &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          INV_TAU_SIGMA_NU2,                                      &
     &          PHI_NU2,                                                &
     &          MU_NU2,                                                 &
     &          N_SLS,                                                  &
     &          SIMULATION_TYPE,                                        &
     &          E11_LDDRK,                                              &
     &          E13_LDDRK,                                              &
     &          E11_INITIAL_RK,                                         &
     &          E13_INITIAL_RK,                                         &
     &          E11_FORCE_RK,                                           &
     &          E13_FORCE_RK,                                           &
     &          TIME_STEPPING_SCHEME,                                   &
     &          I_STAGE,                                                &
     &          DISPLS_POROELASTIC_OLD,                                 &
     &          NSPEC_INNER_POROELASTIC,                                &
     &          NSPEC_OUTER_POROELASTIC,                                &
     &          PHASE_ISPEC_INNER_POROELASTIC
              REAL(KIND=4), INTENT(IN) :: DISPLS_POROELASTIC(2,         &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(IN) :: DISPLW_POROELASTIC(2,         &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELS_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(OUT) :: EPSILONDEV_S(4,5,5,          &
     &NSPEC_POROELASTIC_B)
              INTEGER(KIND=4), INTENT(IN) :: IPHASE
            END SUBROUTINE COMPUTE_FORCES_PORO_SOLID
          END INTERFACE 
        END MODULE COMPUTE_FORCES_PORO_SOLID__genmod
