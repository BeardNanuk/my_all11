        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ADD_ACOUSTIC_FORCING_AT_RIGID_BOUNDARY__genmod
          INTERFACE 
            SUBROUTINE ADD_ACOUSTIC_FORCING_AT_RIGID_BOUNDARY(          &
     &POTENTIAL_DOT_DOT_ACOUSTIC,DOT_E1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ACOUSTIC,                                         &
     &          NELEM_ACFORCING,                                        &
     &          CODEACFORCING,                                          &
     &          NUMACFORCING,                                           &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          IBOOL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          JACOBIAN,                                               &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          N_SLS,                                                  &
     &          NGLOB_ATT,                                              &
     &          PML_BOUNDARY_CONDITIONS,                                &
     &          ISPEC_IS_PML
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB_ACOUSTIC)
              REAL(KIND=4) :: DOT_E1(NGLOB_ATT,N_SLS)
            END SUBROUTINE ADD_ACOUSTIC_FORCING_AT_RIGID_BOUNDARY
          END INTERFACE 
        END MODULE ADD_ACOUSTIC_FORCING_AT_RIGID_BOUNDARY__genmod
