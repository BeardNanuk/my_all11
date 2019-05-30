        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_PARTITION_DATABASE__genmod
          INTERFACE 
            SUBROUTINE WRITE_PARTITION_DATABASE(IIN_DATABASE,IPROC,NSPEC&
     &,NUM_MODELE,NUM_PML,NGNOD,NUM_PHASE)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
              INTEGER(KIND=4), INTENT(IN) :: IIN_DATABASE
              INTEGER(KIND=4), INTENT(IN) :: IPROC
              INTEGER(KIND=4), INTENT(INOUT) :: NSPEC
              INTEGER(KIND=4) :: NUM_MODELE(1:NELMNTS)
              INTEGER(KIND=4) :: NUM_PML(1:NELMNTS)
              INTEGER(KIND=4), INTENT(IN) :: NUM_PHASE
            END SUBROUTINE WRITE_PARTITION_DATABASE
          END INTERFACE 
        END MODULE WRITE_PARTITION_DATABASE__genmod
