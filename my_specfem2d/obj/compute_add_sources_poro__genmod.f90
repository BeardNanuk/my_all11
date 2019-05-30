        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:04 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_PORO__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_PORO(ACCELS_POROELASTIC,     &
     &ACCELW_POROELASTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          ISPEC_IS_POROELASTIC,                                   &
     &          NGLOB_POROELASTIC,                                      &
     &          NSOURCES,                                               &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          SOURCEARRAYS,                                           &
     &          ISLICE_SELECTED_SOURCE,                                 &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          IBOOL,                                                  &
     &          POROSITY,                                               &
     &          TORTUOSITY,                                             &
     &          DENSITY,                                                &
     &          KMATO
              REAL(KIND=4) :: ACCELS_POROELASTIC(2,NGLOB_POROELASTIC)
              REAL(KIND=4) :: ACCELW_POROELASTIC(2,NGLOB_POROELASTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_PORO
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_PORO__genmod
