        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_PORO_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_PORO_VISCOELASTIC(DISPL_ELASTIC,&
     &DISPLS_POROELASTIC,DISPLW_POROELASTIC,ACCELS_POROELASTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NUM_SOLID_PORO_EDGES,                                   &
     &          IBOOL,                                                  &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          IVALUE,                                                 &
     &          JVALUE,                                                 &
     &          IVALUE_INVERSE,                                         &
     &          JVALUE_INVERSE,                                         &
     &          HPRIME_XX,                                              &
     &          HPRIME_ZZ,                                              &
     &          SOLID_PORO_ELASTIC_ISPEC,                               &
     &          SOLID_PORO_ELASTIC_IEDGE,                               &
     &          SOLID_PORO_POROELASTIC_ISPEC,                           &
     &          SOLID_PORO_POROELASTIC_IEDGE,                           &
     &          KMATO,                                                  &
     &          POROELASTCOEF,                                          &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          C11EXT,                                                 &
     &          C13EXT,                                                 &
     &          C15EXT,                                                 &
     &          C33EXT,                                                 &
     &          C35EXT,                                                 &
     &          C55EXT,                                                 &
     &          C12EXT,                                                 &
     &          C23EXT,                                                 &
     &          C25EXT,                                                 &
     &          ANISOTROPY,                                             &
     &          NGLOB_ELASTIC,                                          &
     &          NGLOB_POROELASTIC
              REAL(KIND=4), INTENT(IN) :: DISPL_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4), INTENT(IN) :: DISPLS_POROELASTIC(2,         &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(IN) :: DISPLW_POROELASTIC(2,         &
     &NGLOB_POROELASTIC)
              REAL(KIND=4), INTENT(INOUT) :: ACCELS_POROELASTIC(2,      &
     &NGLOB_POROELASTIC)
            END SUBROUTINE COMPUTE_COUPLING_PORO_VISCOELASTIC
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_PORO_VISCOELASTIC__genmod
