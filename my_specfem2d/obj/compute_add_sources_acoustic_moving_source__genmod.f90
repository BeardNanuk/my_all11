        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:08 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_ACOUSTIC_MOVING_SOURCE__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC_MOVING_SOURCE(      &
     &POTENTIAL_DOT_DOT_ACOUSTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          NGLOB_ACOUSTIC,                                         &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          ISLICE_SELECTED_SOURCE,                                 &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          HXIS_STORE,                                             &
     &          HGAMMAS_STORE,                                          &
     &          IBOOL,                                                  &
     &          KAPPASTORE,                                             &
     &          MYRANK,                                                 &
     &          DELTAT,                                                 &
     &          T0,                                                     &
     &          TSHIFT_SRC,                                             &
     &          COORD,                                                  &
     &          NSPEC,                                                  &
     &          NGLOB,                                                  &
     &          XIGLL,                                                  &
     &          ZIGLL,                                                  &
     &          Z_SOURCE,                                               &
     &          NPROC,                                                  &
     &          XI_SOURCE,                                              &
     &          GAMMA_SOURCE,                                           &
     &          COORG,                                                  &
     &          KNODS,                                                  &
     &          NGNOD,                                                  &
     &          NPGEO,                                                  &
     &          IGLOB_SOURCE,                                           &
     &          X_SOURCE,                                               &
     &          TIME_STEPPING_SCHEME,                                   &
     &          HXIS,                                                   &
     &          HPXIS,                                                  &
     &          HGAMMAS,                                                &
     &          HPGAMMAS
              REAL(KIND=4), INTENT(INOUT) :: POTENTIAL_DOT_DOT_ACOUSTIC(&
     &NGLOB_ACOUSTIC)
              INTEGER(KIND=4), INTENT(IN) :: IT
              INTEGER(KIND=4), INTENT(IN) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC_MOVING_SOURCE
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_ACOUSTIC_MOVING_SOURCE__genmod
