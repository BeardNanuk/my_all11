        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PACO_CONVOLVE_FFT__genmod
          INTERFACE 
            SUBROUTINE PACO_CONVOLVE_FFT(FIELD,LABEL,NSTEP,DT,NFREC,    &
     &OUTPUT_FIELD,TP,TS)
              INTEGER(KIND=4), INTENT(IN) :: NFREC
              INTEGER(KIND=4), INTENT(IN) :: NSTEP
              COMPLEX(KIND=8), INTENT(IN) :: FIELD(NFREC+1)
              INTEGER(KIND=4), INTENT(IN) :: LABEL
              REAL(KIND=8), INTENT(IN) :: DT
              REAL(KIND=8), INTENT(OUT) :: OUTPUT_FIELD(NSTEP)
              REAL(KIND=8), INTENT(IN) :: TP
              REAL(KIND=8), INTENT(IN) :: TS
            END SUBROUTINE PACO_CONVOLVE_FFT
          END INTERFACE 
        END MODULE PACO_CONVOLVE_FFT__genmod
