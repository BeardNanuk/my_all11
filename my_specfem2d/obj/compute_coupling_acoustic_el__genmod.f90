        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_ACOUSTIC_EL__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL(DISPL_ELASTIC,      &
     &DISPL_ELASTIC_OLD,POTENTIAL_DOT_DOT_ACOUSTIC,DOT_E1)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NUM_FLUID_SOLID_EDGES,                                  &
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
     &          FLUID_SOLID_ACOUSTIC_ISPEC,                             &
     &          FLUID_SOLID_ACOUSTIC_IEDGE,                             &
     &          FLUID_SOLID_ELASTIC_ISPEC,                              &
     &          FLUID_SOLID_ELASTIC_IEDGE,                              &
     &          AXISYM,                                                 &
     &          COORD,                                                  &
     &          IS_ON_THE_AXIS,                                         &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          RMEMORY_FSB_DISPL_ELASTIC,                              &
     &          DELTAT,                                                 &
     &          RMEMORY_FSB_DISPL_ELASTIC_LDDRK,                        &
     &          I_STAGE,                                                &
     &          TIME_STEPPING_SCHEME,                                   &
     &          NGLOB_ACOUSTIC,                                         &
     &          NGLOB_ELASTIC,                                          &
     &          IGLOB_IS_FORCED,                                        &
     &          ATTENUATION_VISCOACOUSTIC,                              &
     &          N_SLS,                                                  &
     &          NGLOB_ATT,                                              &
     &          PML_BOUNDARY_CONDITIONS,                                &
     &          ISPEC_IS_PML,                                           &
     &          NSPEC_PML,                                              &
     &          SPEC_TO_PML,                                            &
     &          REGION_CPML,                                            &
     &          K_X_STORE,                                              &
     &          K_Z_STORE,                                              &
     &          D_X_STORE,                                              &
     &          D_Z_STORE,                                              &
     &          ALPHA_X_STORE,                                          &
     &          ALPHA_Z_STORE
              REAL(KIND=4) :: DISPL_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC_OLD(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB_ACOUSTIC)
              REAL(KIND=4) :: DOT_E1(NGLOB_ATT,N_SLS)
            END SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_ACOUSTIC_EL__genmod
