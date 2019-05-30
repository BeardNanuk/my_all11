        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ATTENUATION_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ATTENUATION_VISCOELASTIC(E1,E11,E13,     &
     &DUX_DXL,DUX_DZL,DUZ_DXL,DUZ_DZL,DUX_DXL_OLD,DUZ_DZL_OLD,          &
     &DUX_DZL_PLUS_DUZ_DXL_OLD,PML_BOUNDARY_CONDITIONS,I,J,ISPEC,E1_SUM,&
     &E11_SUM,E13_SUM)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSPEC_ATT_EL,                                           &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          N_SLS,                                                  &
     &          ISPEC_IS_PML,                                           &
     &          INV_TAU_SIGMA_NU1,                                      &
     &          PHI_NU1,                                                &
     &          INV_TAU_SIGMA_NU2,                                      &
     &          PHI_NU2,                                                &
     &          TIME_STEPPING_SCHEME,                                   &
     &          I_STAGE,                                                &
     &          DELTAT,                                                 &
     &          E1_LDDRK,                                               &
     &          E11_LDDRK,                                              &
     &          E13_LDDRK,                                              &
     &          E1_INITIAL_RK,                                          &
     &          E11_INITIAL_RK,                                         &
     &          E13_INITIAL_RK,                                         &
     &          E1_FORCE_RK,                                            &
     &          E11_FORCE_RK,                                           &
     &          E13_FORCE_RK,                                           &
     &          A_NEWMARK_NU1,                                          &
     &          B_NEWMARK_NU1,                                          &
     &          A_NEWMARK_NU2,                                          &
     &          B_NEWMARK_NU2
              REAL(KIND=4), INTENT(INOUT) :: E1(N_SLS,5,5,NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: E11(N_SLS,5,5,NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: E13(N_SLS,5,5,NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(IN) :: DUX_DXL
              REAL(KIND=4), INTENT(IN) :: DUX_DZL
              REAL(KIND=4), INTENT(IN) :: DUZ_DXL
              REAL(KIND=4), INTENT(IN) :: DUZ_DZL
              REAL(KIND=4), INTENT(INOUT) :: DUX_DXL_OLD(5,5,           &
     &NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: DUZ_DZL_OLD(5,5,           &
     &NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: DUX_DZL_PLUS_DUZ_DXL_OLD(5,&
     &5,NSPEC_ATT_EL)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
              INTEGER(KIND=4), INTENT(IN) :: I
              INTEGER(KIND=4), INTENT(IN) :: J
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(OUT) :: E1_SUM
              REAL(KIND=4), INTENT(OUT) :: E11_SUM
              REAL(KIND=4), INTENT(OUT) :: E13_SUM
            END SUBROUTINE COMPUTE_ATTENUATION_VISCOELASTIC
          END INTERFACE 
        END MODULE COMPUTE_ATTENUATION_VISCOELASTIC__genmod
