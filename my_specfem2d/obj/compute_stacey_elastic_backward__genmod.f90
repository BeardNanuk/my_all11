        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_STACEY_ELASTIC_BACKWARD__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_STACEY_ELASTIC_BACKWARD(B_ACCEL_ELASTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          ANY_ELASTIC,                                            &
     &          IBOOL,                                                  &
     &          ISPEC_IS_ELASTIC,                                       &
     &          NSTEP,                                                  &
     &          IT,                                                     &
     &          NELEMABS,                                               &
     &          NUMABS,                                                 &
     &          CODEABS,                                                &
     &          B_ABSORB_ELASTIC_LEFT,                                  &
     &          B_ABSORB_ELASTIC_RIGHT,                                 &
     &          B_ABSORB_ELASTIC_BOTTOM,                                &
     &          B_ABSORB_ELASTIC_TOP,                                   &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          STACEY_ABSORBING_CONDITIONS,                            &
     &          P_SV
              REAL(KIND=4), INTENT(INOUT) :: B_ACCEL_ELASTIC(2,NGLOB)
            END SUBROUTINE COMPUTE_STACEY_ELASTIC_BACKWARD
          END INTERFACE 
        END MODULE COMPUTE_STACEY_ELASTIC_BACKWARD__genmod
