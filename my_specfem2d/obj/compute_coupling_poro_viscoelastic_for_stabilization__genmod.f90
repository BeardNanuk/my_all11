        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE                                                          &
     &COMPUTE_COUPLING_PORO_VISCOELASTIC_FOR_STABILIZATION__genmod
          INTERFACE 
            SUBROUTINE                                                  &
     &COMPUTE_COUPLING_PORO_VISCOELASTIC_FOR_STABILIZATION(VELOC_ELASTIC&
     &,ACCEL_ELASTIC,VELOCS_POROELASTIC,ACCELS_POROELASTIC,             &
     &VELOCW_POROELASTIC,ACCELW_POROELASTIC,DELTATOVER2)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NUM_SOLID_PORO_EDGES,                                   &
     &          IBOOL,                                                  &
     &          IVALUE,                                                 &
     &          JVALUE,                                                 &
     &          SOLID_PORO_ELASTIC_ISPEC,                               &
     &          SOLID_PORO_ELASTIC_IEDGE,                               &
     &          SOLID_PORO_POROELASTIC_ISPEC,                           &
     &          SOLID_PORO_POROELASTIC_IEDGE,                           &
     &          RMASS_INVERSE_ELASTIC,                                  &
     &          RMASS_S_INVERSE_POROELASTIC,                            &
     &          TIME_STEPPING_SCHEME,                                   &
     &          NGLOB,                                                  &
     &          NGLOB_ELASTIC,                                          &
     &          NGLOB_POROELASTIC
              REAL(KIND=4), INTENT(INOUT) :: VELOC_ELASTIC(2,           &
     &NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCEL_ELASTIC(2,           &
     &NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: VELOCS_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELS_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: VELOCW_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELW_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
              REAL(KIND=8) :: DELTATOVER2
            END SUBROUTINE                                              &
     &COMPUTE_COUPLING_PORO_VISCOELASTIC_FOR_STABILIZATION
          END INTERFACE 
        END MODULE                                                      &
     &COMPUTE_COUPLING_PORO_VISCOELASTIC_FOR_STABILIZATION__genmod
