        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_POROELASTIC_VELOCITIES__genmod
          INTERFACE 
            SUBROUTINE GET_POROELASTIC_VELOCITIES(CPISQUARE,CPIISQUARE, &
     &CSSQUARE,H_BIOT,C_BIOT,M_BIOT,MU_FR,PHI,TORT,RHO_S,RHO_F,ETA_F,   &
     &PERM_XX,FI,F0,Q0_POROELASTIC,W_C,ATTENUATION_PORO_FLUID_PART)
              REAL(KIND=8), INTENT(OUT) :: CPISQUARE
              REAL(KIND=8), INTENT(OUT) :: CPIISQUARE
              REAL(KIND=8), INTENT(OUT) :: CSSQUARE
              REAL(KIND=8), INTENT(IN) :: H_BIOT
              REAL(KIND=8), INTENT(IN) :: C_BIOT
              REAL(KIND=8), INTENT(IN) :: M_BIOT
              REAL(KIND=8), INTENT(IN) :: MU_FR
              REAL(KIND=8), INTENT(IN) :: PHI
              REAL(KIND=8), INTENT(IN) :: TORT
              REAL(KIND=8), INTENT(IN) :: RHO_S
              REAL(KIND=8), INTENT(IN) :: RHO_F
              REAL(KIND=8), INTENT(IN) :: ETA_F
              REAL(KIND=8), INTENT(IN) :: PERM_XX
              REAL(KIND=8), INTENT(IN) :: FI
              REAL(KIND=8), INTENT(IN) :: F0
              REAL(KIND=8), INTENT(IN) :: Q0_POROELASTIC
              REAL(KIND=8), INTENT(OUT) :: W_C
              LOGICAL(KIND=4), INTENT(IN) :: ATTENUATION_PORO_FLUID_PART
            END SUBROUTINE GET_POROELASTIC_VELOCITIES
          END INTERFACE 
        END MODULE GET_POROELASTIC_VELOCITIES__genmod
