        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:02 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ATTENUATION_MODEL__genmod
          INTERFACE 
            SUBROUTINE ATTENUATION_MODEL(QKAPPA_ATT,QMU_ATT,            &
     &ATTENUATION_F0_REFERENCE,N_SLS,TAU_EPSILON_NU1_SENT,              &
     &INV_TAU_SIGMA_NU1_SENT,PHI_NU1_SENT,MU_NU1_SENT,                  &
     &TAU_EPSILON_NU2_SENT,INV_TAU_SIGMA_NU2_SENT,PHI_NU2_SENT,         &
     &MU_NU2_SENT)
              INTEGER(KIND=4), INTENT(IN) :: N_SLS
              REAL(KIND=8), INTENT(IN) :: QKAPPA_ATT
              REAL(KIND=8), INTENT(IN) :: QMU_ATT
              REAL(KIND=8), INTENT(IN) :: ATTENUATION_F0_REFERENCE
              REAL(KIND=4), INTENT(OUT) :: TAU_EPSILON_NU1_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: INV_TAU_SIGMA_NU1_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: PHI_NU1_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: MU_NU1_SENT
              REAL(KIND=4), INTENT(OUT) :: TAU_EPSILON_NU2_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: INV_TAU_SIGMA_NU2_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: PHI_NU2_SENT(N_SLS)
              REAL(KIND=4), INTENT(OUT) :: MU_NU2_SENT
            END SUBROUTINE ATTENUATION_MODEL
          END INTERFACE 
        END MODULE ATTENUATION_MODEL__genmod
