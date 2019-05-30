        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_STACEY_ACOUSTIC_GPU__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_STACEY_ACOUSTIC_GPU(IPHASE,              &
     &COMPUTE_WAVEFIELD_1,COMPUTE_WAVEFIELD_2)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSPEC_BOTTOM,                                           &
     &          NSPEC_LEFT,                                             &
     &          NSPEC_TOP,                                              &
     &          NSPEC_RIGHT,                                            &
     &          B_ABSORB_ACOUSTIC_LEFT,                                 &
     &          B_ABSORB_ACOUSTIC_RIGHT,                                &
     &          B_ABSORB_ACOUSTIC_BOTTOM,                               &
     &          B_ABSORB_ACOUSTIC_TOP,                                  &
     &          IT,                                                     &
     &          NSTEP,                                                  &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          NELEMABS,                                               &
     &          UNDO_ATTENUATION_AND_OR_PML,                            &
     &          NO_BACKWARD_RECONSTRUCTION
              INTEGER(KIND=4), INTENT(IN) :: IPHASE
              LOGICAL(KIND=4), INTENT(IN) :: COMPUTE_WAVEFIELD_1
              LOGICAL(KIND=4), INTENT(IN) :: COMPUTE_WAVEFIELD_2
            END SUBROUTINE COMPUTE_STACEY_ACOUSTIC_GPU
          END INTERFACE 
        END MODULE COMPUTE_STACEY_ACOUSTIC_GPU__genmod
