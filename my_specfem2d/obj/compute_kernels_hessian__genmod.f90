        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_KERNELS_HESSIAN__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_KERNELS_HESSIAN
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          IBOOL,                                                  &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          ISPEC_IS_ELASTIC,                                       &
     &          ANY_ELASTIC,                                            &
     &          ANY_ACOUSTIC,                                           &
     &          ACCEL_ELASTIC,                                          &
     &          B_ACCEL_ELASTIC,                                        &
     &          ACCEL_AC,                                               &
     &          B_ACCEL_AC,                                             &
     &          RHORHO_EL_HESSIAN_FINAL1,                               &
     &          RHORHO_EL_HESSIAN_FINAL2,                               &
     &          RHORHO_AC_HESSIAN_FINAL1,                               &
     &          RHORHO_AC_HESSIAN_FINAL2,                               &
     &          DELTAT,                                                 &
     &          GPU_MODE,                                               &
     &          NSTEP_BETWEEN_COMPUTE_KERNELS
            END SUBROUTINE COMPUTE_KERNELS_HESSIAN
          END INTERFACE 
        END MODULE COMPUTE_KERNELS_HESSIAN__genmod
