        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_GRADIENT_ATTENUATION_FLUID__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_GRADIENT_ATTENUATION_FLUID(              &
     &POTENTIAL_ACOUSTIC,DUX_DXL,DUZ_DXL,DUX_DZL,DUZ_DZL,XIX,XIZ,GAMMAX,&
     &GAMMAZ,IBOOL,ISPEC_IS_ACOUSTIC,HPRIME_XX,HPRIME_ZZ,NSPEC,NGLOB)
              INTEGER(KIND=4) :: NGLOB
              INTEGER(KIND=4) :: NSPEC
              REAL(KIND=4) :: POTENTIAL_ACOUSTIC(NGLOB)
              REAL(KIND=4) :: DUX_DXL(5,5,NSPEC)
              REAL(KIND=4) :: DUZ_DXL(5,5,NSPEC)
              REAL(KIND=4) :: DUX_DZL(5,5,NSPEC)
              REAL(KIND=4) :: DUZ_DZL(5,5,NSPEC)
              REAL(KIND=4) :: XIX(5,5,NSPEC)
              REAL(KIND=4) :: XIZ(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAX(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAZ(5,5,NSPEC)
              INTEGER(KIND=4) :: IBOOL(5,5,NSPEC)
              LOGICAL(KIND=4) :: ISPEC_IS_ACOUSTIC(NSPEC)
              REAL(KIND=4) :: HPRIME_XX(5,5)
              REAL(KIND=4) :: HPRIME_ZZ(5,5)
            END SUBROUTINE COMPUTE_GRADIENT_ATTENUATION_FLUID
          END INTERFACE 
        END MODULE COMPUTE_GRADIENT_ATTENUATION_FLUID__genmod
