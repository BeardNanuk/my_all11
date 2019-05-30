        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_VISCOELASTIC(ACCEL_ELASTIC,       &
     &VELOC_ELASTIC,DISPL_ELASTIC,DISPL_ELASTIC_OLD,DUX_DXL_OLD,        &
     &DUZ_DZL_OLD,DUX_DZL_PLUS_DUZ_DXL_OLD,PML_BOUNDARY_CONDITIONS,E1,  &
     &E11,E13,IPHASE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          P_SV,                                                   &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          NSPEC_ATT_EL,                                           &
     &          N_SLS,                                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          ISPEC_IS_ELASTIC,                                       &
     &          POROELASTCOEF,                                          &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          VPEXT,                                                  &
     &          VSEXT,                                                  &
     &          RHOEXT,                                                 &
     &          QKAPPA_ATTENUATION,                                     &
     &          QMU_ATTENUATION,                                        &
     &          QKAPPA_ATTENUATIONEXT,                                  &
     &          QMU_ATTENUATIONEXT,                                     &
     &          C11EXT,                                                 &
     &          C13EXT,                                                 &
     &          C15EXT,                                                 &
     &          C33EXT,                                                 &
     &          C35EXT,                                                 &
     &          C55EXT,                                                 &
     &          C12EXT,                                                 &
     &          C23EXT,                                                 &
     &          C25EXT,                                                 &
     &          C22EXT,                                                 &
     &          ISPEC_IS_ANISOTROPIC,                                   &
     &          ANISOTROPY,                                             &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          IT,                                                     &
     &          COORD,                                                  &
     &          IGLOB_IS_FORCED,                                        &
     &          NSPEC_INNER_ELASTIC,                                    &
     &          NSPEC_OUTER_ELASTIC,                                    &
     &          PHASE_ISPEC_INNER_ELASTIC,                              &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIMEBARWGLJ_XX,                                       &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          NSPEC_PML,                                              &
     &          ISPEC_IS_PML,                                           &
     &          ROTATE_PML_ACTIVATE,                                    &
     &          ROTATE_PML_ANGLE
              REAL(KIND=4), INTENT(INOUT) :: ACCEL_ELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: VELOC_ELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: DISPL_ELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: DISPL_ELASTIC_OLD(2,NGLOB)
              REAL(KIND=4), INTENT(INOUT) :: DUX_DXL_OLD(5,5,           &
     &NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: DUZ_DZL_OLD(5,5,           &
     &NSPEC_ATT_EL)
              REAL(KIND=4), INTENT(INOUT) :: DUX_DZL_PLUS_DUZ_DXL_OLD(5,&
     &5,NSPEC_ATT_EL)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
              REAL(KIND=4), INTENT(INOUT) :: E1(5,5,NSPEC_ATT_EL,N_SLS)
              REAL(KIND=4), INTENT(INOUT) :: E11(5,5,NSPEC_ATT_EL,N_SLS)
              REAL(KIND=4), INTENT(INOUT) :: E13(5,5,NSPEC_ATT_EL,N_SLS)
              INTEGER(KIND=4), INTENT(IN) :: IPHASE
            END SUBROUTINE COMPUTE_FORCES_VISCOELASTIC
          END INTERFACE 
        END MODULE COMPUTE_FORCES_VISCOELASTIC__genmod
