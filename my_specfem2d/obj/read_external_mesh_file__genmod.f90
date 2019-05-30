        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READ_EXTERNAL_MESH_FILE__genmod
          INTERFACE 
            SUBROUTINE READ_EXTERNAL_MESH_FILE(FILENAME,                &
     &REMOVE_MIN_TO_START_AT_ZERO,NGNOD)
              CHARACTER(LEN=512), INTENT(IN) :: FILENAME
              INTEGER(KIND=4), INTENT(OUT) ::                           &
     &REMOVE_MIN_TO_START_AT_ZERO
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
            END SUBROUTINE READ_EXTERNAL_MESH_FILE
          END INTERFACE 
        END MODULE READ_EXTERNAL_MESH_FILE__genmod
