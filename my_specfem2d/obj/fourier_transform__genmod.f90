        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FOURIER_TRANSFORM__genmod
          INTERFACE 
            SUBROUTINE FOURIER_TRANSFORM(LX,CX,SIGNI)
              INTEGER(KIND=4), INTENT(IN) :: LX
              COMPLEX(KIND=8), INTENT(INOUT) :: CX(LX)
              REAL(KIND=8), INTENT(IN) :: SIGNI
            END SUBROUTINE FOURIER_TRANSFORM
          END INTERFACE 
        END MODULE FOURIER_TRANSFORM__genmod
