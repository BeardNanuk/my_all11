        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_GRADIENT_FIELD_ELEMENT__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_GRADIENT_FIELD_ELEMENT(ISPEC,FIELD,      &
     &DUX_DXL,DUX_DZL,DUZ_DXL,DUZ_DZL)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          IBOOL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          HPRIME_XX,                                              &
     &          HPRIME_ZZ,                                              &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          HPRIMEBAR_XX,                                           &
     &          NGLJ
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(IN) :: FIELD(2,NGLOB)
              REAL(KIND=4), INTENT(OUT) :: DUX_DXL(5,5)
              REAL(KIND=4), INTENT(OUT) :: DUX_DZL(5,5)
              REAL(KIND=4), INTENT(OUT) :: DUZ_DXL(5,5)
              REAL(KIND=4), INTENT(OUT) :: DUZ_DZL(5,5)
            END SUBROUTINE COMPUTE_GRADIENT_FIELD_ELEMENT
          END INTERFACE 
        END MODULE COMPUTE_GRADIENT_FIELD_ELEMENT__genmod
