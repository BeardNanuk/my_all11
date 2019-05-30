        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UPDATE_DISPLACEMENT_NEWMARK_ELASTIC__genmod
          INTERFACE 
            SUBROUTINE UPDATE_DISPLACEMENT_NEWMARK_ELASTIC(DELTAT,      &
     &DELTATOVER2,DELTATSQUAREOVER2,ACCEL_ELASTIC,VELOC_ELASTIC,        &
     &DISPL_ELASTIC,DISPL_ELASTIC_OLD,PML_BOUNDARY_CONDITIONS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ELASTIC,                                          &
     &          ATTENUATION_VISCOELASTIC,                               &
     &          IGLOB_IS_FORCED,                                        &
     &          ELASTIC_IGLOB_IS_FORCED,                                &
     &          IT
              REAL(KIND=8), INTENT(IN) :: DELTAT
              REAL(KIND=8), INTENT(IN) :: DELTATOVER2
              REAL(KIND=8), INTENT(IN) :: DELTATSQUAREOVER2
              REAL(KIND=4), INTENT(INOUT) :: ACCEL_ELASTIC(2,           &
     &NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: VELOC_ELASTIC(2,           &
     &NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: DISPL_ELASTIC(2,           &
     &NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: DISPL_ELASTIC_OLD(2,       &
     &NGLOB_ELASTIC)
              LOGICAL(KIND=4), INTENT(IN) :: PML_BOUNDARY_CONDITIONS
            END SUBROUTINE UPDATE_DISPLACEMENT_NEWMARK_ELASTIC
          END INTERFACE 
        END MODULE UPDATE_DISPLACEMENT_NEWMARK_ELASTIC__genmod
