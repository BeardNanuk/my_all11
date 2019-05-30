        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC(                    &
     &POTENTIAL_DOT_DOT_ACOUSTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          NGLOB_ACOUSTIC,                                         &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          SOURCEARRAYS,                                           &
     &          ISLICE_SELECTED_SOURCE,                                 &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          IBOOL,                                                  &
     &          KAPPASTORE,                                             &
     &          MYRANK
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB_ACOUSTIC)
              INTEGER(KIND=4), INTENT(IN) :: IT
              INTEGER(KIND=4), INTENT(IN) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_ACOUSTIC__genmod
