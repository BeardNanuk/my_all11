        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LAGRANGE_ANY__genmod
          INTERFACE 
            SUBROUTINE LAGRANGE_ANY(XI,NGLL,XIGLL,H,HPRIME)
              INTEGER(KIND=4), INTENT(IN) :: NGLL
              REAL(KIND=8), INTENT(IN) :: XI
              REAL(KIND=8), INTENT(IN) :: XIGLL(NGLL)
              REAL(KIND=8), INTENT(OUT) :: H(NGLL)
              REAL(KIND=8), INTENT(OUT) :: HPRIME(NGLL)
            END SUBROUTINE LAGRANGE_ANY
          END INTERFACE 
        END MODULE LAGRANGE_ANY__genmod
