        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INVTIME__genmod
          INTERFACE 
            SUBROUTINE INVTIME(TIMESTAMP,YR,MON,DAY,HR,MINVALUE)
              INTEGER(KIND=4), INTENT(IN) :: TIMESTAMP
              INTEGER(KIND=4), INTENT(OUT) :: YR
              INTEGER(KIND=4), INTENT(OUT) :: MON
              INTEGER(KIND=4), INTENT(OUT) :: DAY
              INTEGER(KIND=4), INTENT(OUT) :: HR
              INTEGER(KIND=4), INTENT(OUT) :: MINVALUE
            END SUBROUTINE INVTIME
          END INTERFACE 
        END MODULE INVTIME__genmod
