        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LIK_PARAMETER_COMPUTATION_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE LIK_PARAMETER_COMPUTATION_VISCOELASTIC(KAPPA_X,  &
     &BETA_X,ALPHA_X,KAPPA_Z,BETA_Z,ALPHA_Z,CPML_REGION_LOCAL,INDEX_IK, &
     &A_0,A_1,A_2,A_ZENER,INV_TAU_TEMP,TAU_EPSILON_TEMP)
              REAL(KIND=8), INTENT(IN) :: KAPPA_X
              REAL(KIND=8), INTENT(IN) :: BETA_X
              REAL(KIND=8), INTENT(IN) :: ALPHA_X
              REAL(KIND=8), INTENT(IN) :: KAPPA_Z
              REAL(KIND=8), INTENT(IN) :: BETA_Z
              REAL(KIND=8), INTENT(IN) :: ALPHA_Z
              INTEGER(KIND=4), INTENT(IN) :: CPML_REGION_LOCAL
              INTEGER(KIND=4), INTENT(IN) :: INDEX_IK
              REAL(KIND=8), INTENT(OUT) :: A_0
              REAL(KIND=8), INTENT(OUT) :: A_1
              REAL(KIND=8), INTENT(OUT) :: A_2
              REAL(KIND=8), INTENT(OUT) :: A_ZENER
              REAL(KIND=8), INTENT(IN) :: INV_TAU_TEMP
              REAL(KIND=8), INTENT(IN) :: TAU_EPSILON_TEMP
            END SUBROUTINE LIK_PARAMETER_COMPUTATION_VISCOELASTIC
          END INTERFACE 
        END MODULE LIK_PARAMETER_COMPUTATION_VISCOELASTIC__genmod
