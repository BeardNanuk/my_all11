        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PACO_BEYOND_CRITICAL__genmod
          INTERFACE 
            SUBROUTINE PACO_BEYOND_CRITICAL(ANGLESOURCE,F0,QD,          &
     &SOURCE_TYPE,LEFT_BOUND,RIGHT_BOUND,BOT_BOUND,NLEFT,NRIGHT,NBOT,   &
     &X_SOURCE,CPLOC,CSLOC)
              INTEGER(KIND=4), INTENT(IN) :: NBOT
              INTEGER(KIND=4), INTENT(IN) :: NRIGHT
              INTEGER(KIND=4), INTENT(IN) :: NLEFT
              REAL(KIND=8), INTENT(IN) :: ANGLESOURCE
              REAL(KIND=8), INTENT(IN) :: F0
              REAL(KIND=8), INTENT(IN) :: QD
              INTEGER(KIND=4), INTENT(IN) :: SOURCE_TYPE
              INTEGER(KIND=4), INTENT(IN) :: LEFT_BOUND(NLEFT)
              INTEGER(KIND=4), INTENT(IN) :: RIGHT_BOUND(NRIGHT)
              INTEGER(KIND=4), INTENT(IN) :: BOT_BOUND(NBOT)
              REAL(KIND=8), INTENT(IN) :: X_SOURCE
              REAL(KIND=8), INTENT(IN) :: CPLOC
              REAL(KIND=8), INTENT(IN) :: CSLOC
            END SUBROUTINE PACO_BEYOND_CRITICAL
          END INTERFACE 
        END MODULE PACO_BEYOND_CRITICAL__genmod
