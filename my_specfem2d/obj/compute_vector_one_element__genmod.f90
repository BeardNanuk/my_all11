        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_VECTOR_ONE_ELEMENT__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_VECTOR_ONE_ELEMENT(FIELD_ACOUSTIC,       &
     &FIELD_ELASTIC,FIELDS_POROELASTIC,ISPEC,VECTOR_FIELD_ELEMENT)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ACOUSTIC,                                         &
     &          NGLOB_ELASTIC,                                          &
     &          NGLOB_POROELASTIC,                                      &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          DENSITY,                                                &
     &          KMATO,                                                  &
     &          RHOEXT,                                                 &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIME_XX,                                              &
     &          HPRIME_ZZ,                                              &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          IBOOL,                                                  &
     &          ISPEC_IS_ELASTIC,                                       &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          P_SV
              REAL(KIND=4) :: FIELD_ACOUSTIC(NGLOB_ACOUSTIC)
              REAL(KIND=4) :: FIELD_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: FIELDS_POROELASTIC(2,NGLOB_POROELASTIC)
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(OUT) :: VECTOR_FIELD_ELEMENT(2,5,5)
            END SUBROUTINE COMPUTE_VECTOR_ONE_ELEMENT
          END INTERFACE 
        END MODULE COMPUTE_VECTOR_ONE_ELEMENT__genmod
