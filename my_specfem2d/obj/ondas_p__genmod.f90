        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ONDAS_P__genmod
          INTERFACE 
            SUBROUTINE ONDAS_P(GP,AQB,A1,B1,A2,B2,AL,AK,AM,ANU,BEALF)
              REAL(KIND=8), INTENT(IN) :: GP
              REAL(KIND=8), INTENT(IN) :: AQB
              REAL(KIND=8), INTENT(OUT) :: A1
              REAL(KIND=8), INTENT(OUT) :: B1
              COMPLEX(KIND=8), INTENT(OUT) :: A2
              COMPLEX(KIND=8), INTENT(OUT) :: B2
              COMPLEX(KIND=8), INTENT(OUT) :: AL
              COMPLEX(KIND=8), INTENT(OUT) :: AK
              COMPLEX(KIND=8), INTENT(OUT) :: AM
              REAL(KIND=8), INTENT(IN) :: ANU
              REAL(KIND=8), INTENT(OUT) :: BEALF
            END SUBROUTINE ONDAS_P
          END INTERFACE 
        END MODULE ONDAS_P__genmod
