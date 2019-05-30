        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_COMPUTE_MEMORY_VARIABLES_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE PML_COMPUTE_MEMORY_VARIABLES_ACOUSTIC(ISPEC,NGLOB&
     &,POTENTIAL_ACOUSTIC_OLD,DUX_DXL,DUX_DZL)
              INTEGER(KIND=4), INTENT(IN) :: NGLOB
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(IN) :: POTENTIAL_ACOUSTIC_OLD(NGLOB)
              REAL(KIND=4), INTENT(INOUT) :: DUX_DXL(5,5)
              REAL(KIND=4), INTENT(INOUT) :: DUX_DZL(5,5)
            END SUBROUTINE PML_COMPUTE_MEMORY_VARIABLES_ACOUSTIC
          END INTERFACE 
        END MODULE PML_COMPUTE_MEMORY_VARIABLES_ACOUSTIC__genmod
