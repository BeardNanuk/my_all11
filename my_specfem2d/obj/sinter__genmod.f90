        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SINTER__genmod
          INTERFACE 
            SUBROUTINE SINTER(V,OUTPUT_FIELD,NSTEP,CR,RAIZ,NFREC,LABEL, &
     &DT)
              INTEGER(KIND=4), INTENT(IN) :: NFREC
              INTEGER(KIND=4), INTENT(IN) :: NSTEP
              COMPLEX(KIND=8), INTENT(IN) :: V(NFREC+1)
              REAL(KIND=8), INTENT(OUT) :: OUTPUT_FIELD(NSTEP)
              COMPLEX(KIND=8), INTENT(IN) :: CR(2*NFREC)
              REAL(KIND=8), INTENT(IN) :: RAIZ
              INTEGER(KIND=4), INTENT(IN) :: LABEL
              REAL(KIND=8), INTENT(IN) :: DT
            END SUBROUTINE SINTER
          END INTERFACE 
        END MODULE SINTER__genmod
