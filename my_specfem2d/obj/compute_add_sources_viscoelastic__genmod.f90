        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_VISCOELASTIC(ACCEL_ELASTIC,IT&
     &,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          P_SV,                                                   &
     &          ISPEC_IS_ELASTIC,                                       &
     &          NGLOB_ELASTIC,                                          &
     &          NSOURCES,                                               &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          ISLICE_SELECTED_SOURCE,                                 &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          SOURCEARRAYS,                                           &
     &          IBOOL
              REAL(KIND=4) :: ACCEL_ELASTIC(2,NGLOB_ELASTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_VISCOELASTIC
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_VISCOELASTIC__genmod
