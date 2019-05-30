        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_VISCOELASTIC_MOVING_SOURCE__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_VISCOELASTIC_MOVING_SOURCE(  &
     &ACCEL_ELASTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          P_SV,                                                   &
     &          ISPEC_IS_ELASTIC,                                       &
     &          NGLOB_ELASTIC,                                          &
     &          NSOURCES,                                               &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          ISLICE_SELECTED_SOURCE,                                 &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          SOURCEARRAYS,                                           &
     &          IBOOL,                                                  &
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
     &          DELTAT,                                                 &
     &          T0,                                                     &
     &          MYRANK,                                                 &
     &          TIME_STEPPING_SCHEME,                                   &
     &          HXIS_STORE,                                             &
     &          HGAMMAS_STORE,                                          &
     &          TSHIFT_SRC,                                             &
     &          SOURCE_TYPE,                                            &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          HXIS,                                                   &
     &          HPXIS,                                                  &
     &          HGAMMAS,                                                &
     &          HPGAMMAS,                                               &
     &          ANGLESOURCE,                                            &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          MXX,                                                    &
     &          MXZ,                                                    &
     &          MZZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          AXISYM,                                                 &
     &          XIGLJ,                                                  &
     &          IS_ON_THE_AXIS,                                         &
     &          INITIALFIELD
              REAL(KIND=4) :: ACCEL_ELASTIC(2,NGLOB_ELASTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE                                              &
     &COMPUTE_ADD_SOURCES_VISCOELASTIC_MOVING_SOURCE
          END INTERFACE 
        END MODULE                                                      &
     &COMPUTE_ADD_SOURCES_VISCOELASTIC_MOVING_SOURCE__genmod
