        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_ACOUSTIC_PO__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_PO(DOT_E1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NUM_FLUID_PORO_EDGES,                                   &
     &          IBOOL,                                                  &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          IVALUE,                                                 &
     &          JVALUE,                                                 &
     &          IVALUE_INVERSE,                                         &
     &          JVALUE_INVERSE,                                         &
     &          FLUID_PORO_ACOUSTIC_ISPEC,                              &
     &          FLUID_PORO_ACOUSTIC_IEDGE,                              &
     &          FLUID_PORO_POROELASTIC_ISPEC,                           &
     &          FLUID_PORO_POROELASTIC_IEDGE,                           &
     &          DISPLS_POROELASTIC,                                     &
     &          DISPLW_POROELASTIC,                                     &
     &          ACCELS_POROELASTIC_ADJ_COUPLING,                        &
     &          ACCELW_POROELASTIC_ADJ_COUPLING,                        &
     &          POTENTIAL_DOT_DOT_ACOUSTIC,                             &
     &          SIMULATION_TYPE,                                        &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          N_SLS,                                                  &
     &          NGLOB_ATT
              REAL(KIND=4) :: DOT_E1(NGLOB_ATT,N_SLS)
            END SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_PO
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_ACOUSTIC_PO__genmod
