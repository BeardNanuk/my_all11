        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RIC__genmod
          INTERFACE 
            FUNCTION RIC(J,TP,TS,DT)
              INTEGER(KIND=4), INTENT(IN) :: J
              REAL(KIND=8), INTENT(IN) :: TP
              REAL(KIND=8), INTENT(IN) :: TS
              REAL(KIND=8), INTENT(IN) :: DT
              REAL(KIND=8) :: RIC
            END FUNCTION RIC
          END INTERFACE 
        END MODULE RIC__genmod
