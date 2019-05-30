        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC(IT,      &
     &B_POTENTIAL_ACOUSTIC,B_POTENTIAL_DOT_ACOUSTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSPEC,                                                  &
     &          NGLOB,                                                  &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          ANY_ACOUSTIC,                                           &
     &          IBOOL,                                                  &
     &          NGLOB_INTERFACE,                                        &
     &          POINT_INTERFACE,                                        &
     &          ISPEC_IS_PML,                                           &
     &          PML_INTERFACE_HISTORY_POTENTIAL_DOT,                    &
     &          PML_INTERFACE_HISTORY_POTENTIAL
              INTEGER(KIND=4), INTENT(IN) :: IT
              REAL(KIND=4), INTENT(OUT) :: B_POTENTIAL_ACOUSTIC(NGLOB)
              REAL(KIND=4), INTENT(OUT) :: B_POTENTIAL_DOT_ACOUSTIC(    &
     &NGLOB)
            END SUBROUTINE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC
          END INTERFACE 
        END MODULE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC__genmod
