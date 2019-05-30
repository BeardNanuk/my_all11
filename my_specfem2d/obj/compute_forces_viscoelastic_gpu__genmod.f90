        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_VISCOELASTIC_GPU__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_VISCOELASTIC_GPU
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          NPROC,                                                  &
     &          NINTERFACE,                                             &
     &          MAX_NIBOOL_INTERFACES_EXT_MESH,                         &
     &          NIBOOL_INTERFACES_EXT_MESH,                             &
     &          MY_NEIGHBORS,                                           &
     &          NINTERFACE_ELASTIC,                                     &
     &          INUM_INTERFACES_ELASTIC,                                &
     &          IBOOL_INTERFACES_EXT_MESH,                              &
     &          NUM_FLUID_SOLID_EDGES,                                  &
     &          NSPEC_BOTTOM,                                           &
     &          NSPEC_LEFT,                                             &
     &          NSPEC_RIGHT,                                            &
     &          NSPEC_TOP,                                              &
     &          STACEY_ABSORBING_CONDITIONS,                            &
     &          PML_BOUNDARY_CONDITIONS,                                &
     &          ANY_POROELASTIC,                                        &
     &          ANY_ACOUSTIC,                                           &
     &          SIMULATION_TYPE,                                        &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          NSPEC_OUTER_ELASTIC,                                    &
     &          NSPEC_INNER_ELASTIC
            END SUBROUTINE COMPUTE_FORCES_VISCOELASTIC_GPU
          END INTERFACE 
        END MODULE COMPUTE_FORCES_VISCOELASTIC_GPU__genmod
