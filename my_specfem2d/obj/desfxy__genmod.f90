        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DESFXY__genmod
          INTERFACE 
            SUBROUTINE DESFXY(X,Z,ICAS,UX,UZ,SX,SZ,SXZ,A1,B1,A2,B2,AL,AK&
     &,AM,RLM)
              REAL(KIND=8), INTENT(IN) :: X
              REAL(KIND=8), INTENT(IN) :: Z
              INTEGER(KIND=4), INTENT(IN) :: ICAS
              COMPLEX(KIND=8) :: UX
              COMPLEX(KIND=8) :: UZ
              COMPLEX(KIND=8) :: SX
              COMPLEX(KIND=8) :: SZ
              COMPLEX(KIND=8) :: SXZ
              REAL(KIND=8), INTENT(IN) :: A1
              REAL(KIND=8), INTENT(IN) :: B1
              COMPLEX(KIND=8) :: A2
              COMPLEX(KIND=8) :: B2
              COMPLEX(KIND=8) :: AL
              COMPLEX(KIND=8) :: AK
              COMPLEX(KIND=8) :: AM
              REAL(KIND=8), INTENT(IN) :: RLM
            END SUBROUTINE DESFXY
          END INTERFACE 
        END MODULE DESFXY__genmod
