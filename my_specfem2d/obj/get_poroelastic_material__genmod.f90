        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_POROELASTIC_MATERIAL__genmod
          INTERFACE 
            SUBROUTINE GET_POROELASTIC_MATERIAL(ISPEC,PHI,TORT,MU_S,    &
     &KAPPA_S,RHO_S,KAPPA_F,RHO_F,ETA_F,MU_FR,KAPPA_FR,RHO_BAR)
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=8), INTENT(OUT) :: PHI
              REAL(KIND=8), INTENT(OUT) :: TORT
              REAL(KIND=8), INTENT(OUT) :: MU_S
              REAL(KIND=8), INTENT(OUT) :: KAPPA_S
              REAL(KIND=8), INTENT(OUT) :: RHO_S
              REAL(KIND=8), INTENT(OUT) :: KAPPA_F
              REAL(KIND=8), INTENT(OUT) :: RHO_F
              REAL(KIND=8), INTENT(OUT) :: ETA_F
              REAL(KIND=8), INTENT(OUT) :: MU_FR
              REAL(KIND=8), INTENT(OUT) :: KAPPA_FR
              REAL(KIND=8), INTENT(OUT) :: RHO_BAR
            END SUBROUTINE GET_POROELASTIC_MATERIAL
          END INTERFACE 
        END MODULE GET_POROELASTIC_MATERIAL__genmod
