        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READ_EXTERNAL_PML_ELEMENT__genmod
          INTERFACE 
            SUBROUTINE READ_EXTERNAL_PML_ELEMENT(FILENAME,              &
     &REGION_PML_EXTERNAL_MESH,NSPEC_CPML)
              USE SHARED_PARAMETERS
              CHARACTER(LEN=512), INTENT(IN) :: FILENAME
              INTEGER(KIND=4), INTENT(OUT) :: REGION_PML_EXTERNAL_MESH(1&
     &:NELMNTS)
              INTEGER(KIND=4), INTENT(OUT) :: NSPEC_CPML
            END SUBROUTINE READ_EXTERNAL_PML_ELEMENT
          END INTERFACE 
        END MODULE READ_EXTERNAL_PML_ELEMENT__genmod
