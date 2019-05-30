        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_BOUNDARY_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE PML_BOUNDARY_ACOUSTIC(POTENTIAL_DOT_DOT_ACOUSTIC,&
     &POTENTIAL_DOT_ACOUSTIC,POTENTIAL_ACOUSTIC,POTENTIAL_ACOUSTIC_OLD)
              USE SPECFEM_PAR, ONLY :                                   &
     &          IBOOL,                                                  &
     &          NELEMABS,                                               &
     &          CODEABS,                                                &
     &          ANYABS,                                                 &
     &          NUMABS,                                                 &
     &          ISPEC_IS_PML,                                           &
     &          NGLOB_ACOUSTIC,                                         &
     &          ISPEC_IS_ACOUSTIC
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_ACOUSTIC(    &
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_ACOUSTIC(        &
     &NGLOB_ACOUSTIC)
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_ACOUSTIC_OLD(    &
     &NGLOB_ACOUSTIC)
            END SUBROUTINE PML_BOUNDARY_ACOUSTIC
          END INTERFACE 
        END MODULE PML_BOUNDARY_ACOUSTIC__genmod
