        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WEIGHTED_SUM_LAMB_DISP__genmod
          INTERFACE 
            SUBROUTINE WEIGHTED_SUM_LAMB_DISP(SUM_UX,SUM_UZ,Z,F0,D,CP,CS&
     &,ANTISYM,NC,NWEIGHT)
              COMPLEX(KIND=4), INTENT(OUT) :: SUM_UX
              COMPLEX(KIND=4), INTENT(OUT) :: SUM_UZ
              REAL(KIND=4), INTENT(IN) :: Z
              REAL(KIND=4), INTENT(IN) :: F0
              REAL(KIND=4), INTENT(IN) :: D
              REAL(KIND=4), INTENT(IN) :: CP
              REAL(KIND=4), INTENT(IN) :: CS
              LOGICAL(KIND=4), INTENT(IN) :: ANTISYM
              INTEGER(KIND=4), INTENT(IN) :: NC
              INTEGER(KIND=4), INTENT(IN) :: NWEIGHT
            END SUBROUTINE WEIGHTED_SUM_LAMB_DISP
          END INTERFACE 
        END MODULE WEIGHTED_SUM_LAMB_DISP__genmod
