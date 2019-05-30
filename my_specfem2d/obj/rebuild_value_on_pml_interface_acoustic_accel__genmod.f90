        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC_ACCEL__genmod
          INTERFACE 
            SUBROUTINE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC_ACCEL(IT,&
     &B_POTENTIAL_DOT_DOT_ACOUSTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          ANY_ACOUSTIC,                                           &
     &          NGLOB,                                                  &
     &          NGLOB_INTERFACE,                                        &
     &          POINT_INTERFACE,                                        &
     &          PML_INTERFACE_HISTORY_POTENTIAL_DOT_DOT
              INTEGER(KIND=4), INTENT(IN) :: IT
              REAL(KIND=4), INTENT(OUT) :: B_POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB)
            END SUBROUTINE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC_ACCEL
          END INTERFACE 
        END MODULE REBUILD_VALUE_ON_PML_INTERFACE_ACOUSTIC_ACCEL__genmod
