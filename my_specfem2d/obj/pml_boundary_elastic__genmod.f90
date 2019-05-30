        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_BOUNDARY_ELASTIC__genmod
          INTERFACE 
            SUBROUTINE PML_BOUNDARY_ELASTIC(ACCEL_ELASTIC,VELOC_ELASTIC,&
     &DISPL_ELASTIC,DISPL_ELASTIC_OLD)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ELASTIC,                                          &
     &          IBOOL,                                                  &
     &          NELEMABS,                                               &
     &          CODEABS,                                                &
     &          ANYABS,                                                 &
     &          NUMABS,                                                 &
     &          ISPEC_IS_PML,                                           &
     &          NSPEC_PML,                                              &
     &          ISPEC_IS_ELASTIC
              REAL(KIND=4) :: ACCEL_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: VELOC_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC(2,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC_OLD(2,NGLOB_ELASTIC)
            END SUBROUTINE PML_BOUNDARY_ELASTIC
          END INTERFACE 
        END MODULE PML_BOUNDARY_ELASTIC__genmod
