        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_PORO_AC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_PORO_AC(                        &
     &POTENTIAL_DOT_DOT_ACOUSTIC,ACCELS_POROELASTIC,ACCELW_POROELASTIC, &
     &FORWARD_OR_ADJOINT)
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
     &          POROSITY,                                               &
     &          TORTUOSITY,                                             &
     &          DENSITY,                                                &
     &          KMATO,                                                  &
     &          POTENTIAL_ACOUSTIC_ADJ_COUPLING,                        &
     &          NGLOB_ACOUSTIC,                                         &
     &          NGLOB_POROELASTIC,                                      &
     &          SIMULATION_TYPE
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_DOT_DOT_ACOUSTIC(   &
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELS_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELW_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              INTEGER(KIND=4), INTENT(IN) :: FORWARD_OR_ADJOINT
            END SUBROUTINE COMPUTE_COUPLING_PORO_AC
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_PORO_AC__genmod
