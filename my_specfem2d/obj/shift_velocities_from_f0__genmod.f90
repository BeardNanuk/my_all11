        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHIFT_VELOCITIES_FROM_F0__genmod
          INTERFACE 
            SUBROUTINE SHIFT_VELOCITIES_FROM_F0(VP,VS,RHO,              &
     &ATTENUATION_F0_REFERENCE,N_SLS,TAU_EPSILON_NU1,TAU_EPSILON_NU2,   &
     &INV_TAU_SIGMA_NU1,INV_TAU_SIGMA_NU2)
              INTEGER(KIND=4), INTENT(IN) :: N_SLS
              REAL(KIND=8), INTENT(INOUT) :: VP
              REAL(KIND=8), INTENT(INOUT) :: VS
              REAL(KIND=8), INTENT(IN) :: RHO
              REAL(KIND=8), INTENT(IN) :: ATTENUATION_F0_REFERENCE
              REAL(KIND=4), INTENT(IN) :: TAU_EPSILON_NU1(N_SLS)
              REAL(KIND=4), INTENT(IN) :: TAU_EPSILON_NU2(N_SLS)
              REAL(KIND=4), INTENT(IN) :: INV_TAU_SIGMA_NU1(N_SLS)
              REAL(KIND=4), INTENT(IN) :: INV_TAU_SIGMA_NU2(N_SLS)
            END SUBROUTINE SHIFT_VELOCITIES_FROM_F0
          END INTERFACE 
        END MODULE SHIFT_VELOCITIES_FROM_F0__genmod
