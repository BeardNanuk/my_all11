        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_POROELASTIC_BIOT_COEFF__genmod
          INTERFACE 
            SUBROUTINE GET_POROELASTIC_BIOT_COEFF(PHI,KAPPA_S,KAPPA_F,  &
     &KAPPA_FR,MU_FR,D_BIOT,H_BIOT,C_BIOT,M_BIOT)
              REAL(KIND=8), INTENT(IN) :: PHI
              REAL(KIND=8), INTENT(IN) :: KAPPA_S
              REAL(KIND=8), INTENT(IN) :: KAPPA_F
              REAL(KIND=8), INTENT(IN) :: KAPPA_FR
              REAL(KIND=8), INTENT(IN) :: MU_FR
              REAL(KIND=8), INTENT(OUT) :: D_BIOT
              REAL(KIND=8), INTENT(OUT) :: H_BIOT
              REAL(KIND=8), INTENT(OUT) :: C_BIOT
              REAL(KIND=8), INTENT(OUT) :: M_BIOT
            END SUBROUTINE GET_POROELASTIC_BIOT_COEFF
          END INTERFACE 
        END MODULE GET_POROELASTIC_BIOT_COEFF__genmod
