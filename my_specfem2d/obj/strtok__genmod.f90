        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:45 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRTOK__genmod
          INTERFACE 
            SUBROUTINE STRTOK(SOURCE_STRING,DELIMITER,TOKEN)
              CHARACTER(LEN=512), INTENT(IN) :: SOURCE_STRING
              CHARACTER(LEN=1), INTENT(IN) :: DELIMITER
              CHARACTER(LEN=512), INTENT(OUT) :: TOKEN
            END SUBROUTINE STRTOK
          END INTERFACE 
        END MODULE STRTOK__genmod
