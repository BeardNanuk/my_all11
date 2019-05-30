        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_PRESSURE_ONE_ELEMENT__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_PRESSURE_ONE_ELEMENT(ISPEC,              &
     &PRESSURE_ELEMENT,DISPL_ELASTIC,DISPLS_POROELASTIC,                &
     &DISPLW_POROELASTIC,POTENTIAL_DOT_DOT_ACOUSTIC,POTENTIAL_ACOUSTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          N_SLS,                                                  &
     &          NGLOB,                                                  &
     &          ISPEC_IS_ELASTIC,                                       &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          ISPEC_IS_ANISOTROPIC,                                   &
     &          KMATO,                                                  &
     &          POROELASTCOEF,                                          &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          VPEXT,                                                  &
     &          VSEXT,                                                  &
     &          RHOEXT,                                                 &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          ANISOTROPY,                                             &
     &          C11EXT,                                                 &
     &          C12EXT,                                                 &
     &          C13EXT,                                                 &
     &          C15EXT,                                                 &
     &          C23EXT,                                                 &
     &          C25EXT,                                                 &
     &          C33EXT,                                                 &
     &          C35EXT,                                                 &
     &          C55EXT,                                                 &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIME_XX,                                              &
     &          HPRIME_ZZ,                                              &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          IBOOL,                                                  &
     &          COORD,                                                  &
     &          E1,                                                     &
     &          E11,                                                    &
     &          USE_TRICK_FOR_BETTER_PRESSURE
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(OUT) :: PRESSURE_ELEMENT(5,5)
              REAL(KIND=4), INTENT(IN) :: DISPL_ELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: DISPLS_POROELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: DISPLW_POROELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_DOT_DOT_ACOUSTIC(   &
     &NGLOB)
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC(NGLOB)
            END SUBROUTINE COMPUTE_PRESSURE_ONE_ELEMENT
          END INTERFACE 
        END MODULE COMPUTE_PRESSURE_ONE_ELEMENT__genmod
