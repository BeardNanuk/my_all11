        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMBINE_SEM_ARRAY__genmod
          INTERFACE 
            SUBROUTINE COMBINE_SEM_ARRAY(KERNEL_NAME,KERNEL_PATHS,      &
     &OUTPUT_DIR,NPATH,NSPEC,MYRANK)
              CHARACTER(LEN=512) :: KERNEL_NAME
              CHARACTER(LEN=512) :: KERNEL_PATHS(65535)
              CHARACTER(LEN=512) :: OUTPUT_DIR
              INTEGER(KIND=4) :: NPATH
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: MYRANK
            END SUBROUTINE COMBINE_SEM_ARRAY
          END INTERFACE 
        END MODULE COMBINE_SEM_ARRAY__genmod
