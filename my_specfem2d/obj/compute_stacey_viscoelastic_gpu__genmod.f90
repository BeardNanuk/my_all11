        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_STACEY_VISCOELASTIC_GPU__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_STACEY_VISCOELASTIC_GPU(IPHASE,          &
     &B_ABSORB_ELASTIC_BOTTOM_SLICE,B_ABSORB_ELASTIC_LEFT_SLICE,        &
     &B_ABSORB_ELASTIC_RIGHT_SLICE,B_ABSORB_ELASTIC_TOP_SLICE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSPEC_BOTTOM,                                           &
     &          NSPEC_LEFT,                                             &
     &          NSPEC_TOP,                                              &
     &          NSPEC_RIGHT,                                            &
     &          B_ABSORB_ELASTIC_LEFT,                                  &
     &          B_ABSORB_ELASTIC_RIGHT,                                 &
     &          B_ABSORB_ELASTIC_BOTTOM,                                &
     &          B_ABSORB_ELASTIC_TOP,                                   &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          NSTEP,                                                  &
     &          IT,                                                     &
     &          NELEMABS
              INTEGER(KIND=4) :: IPHASE
              REAL(KIND=4) :: B_ABSORB_ELASTIC_BOTTOM_SLICE(2,5,        &
     &NSPEC_BOTTOM)
              REAL(KIND=4) :: B_ABSORB_ELASTIC_LEFT_SLICE(2,5,NSPEC_LEFT&
     &)
              REAL(KIND=4) :: B_ABSORB_ELASTIC_RIGHT_SLICE(2,5,         &
     &NSPEC_RIGHT)
              REAL(KIND=4) :: B_ABSORB_ELASTIC_TOP_SLICE(2,5,NSPEC_TOP)
            END SUBROUTINE COMPUTE_STACEY_VISCOELASTIC_GPU
          END INTERFACE 
        END MODULE COMPUTE_STACEY_VISCOELASTIC_GPU__genmod
