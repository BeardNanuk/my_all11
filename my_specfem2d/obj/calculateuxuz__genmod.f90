        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CALCULATEUXUZ__genmod
          INTERFACE 
            SUBROUTINE CALCULATEUXUZ(UX,UZ,ZI,CP,CS,D,OMEGAJ,CPHASE,    &
     &ANTISYM)
              COMPLEX(KIND=4), INTENT(OUT) :: UX
              COMPLEX(KIND=4), INTENT(OUT) :: UZ
              REAL(KIND=4), INTENT(IN) :: ZI
              REAL(KIND=4), INTENT(IN) :: CP
              REAL(KIND=4), INTENT(IN) :: CS
              REAL(KIND=4), INTENT(IN) :: D
              REAL(KIND=4), INTENT(IN) :: OMEGAJ
              REAL(KIND=4), INTENT(IN) :: CPHASE
              LOGICAL(KIND=4), INTENT(IN) :: ANTISYM
            END SUBROUTINE CALCULATEUXUZ
          END INTERFACE 
        END MODULE CALCULATEUXUZ__genmod
