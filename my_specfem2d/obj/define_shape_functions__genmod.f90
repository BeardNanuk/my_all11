        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DEFINE_SHAPE_FUNCTIONS__genmod
          INTERFACE 
            SUBROUTINE DEFINE_SHAPE_FUNCTIONS(SHAPE2D,DERSHAPE2D,XI,    &
     &GAMMA,NGNOD)
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
              REAL(KIND=8), INTENT(OUT) :: SHAPE2D(NGNOD)
              REAL(KIND=8), INTENT(OUT) :: DERSHAPE2D(2,NGNOD)
              REAL(KIND=8), INTENT(IN) :: XI
              REAL(KIND=8), INTENT(IN) :: GAMMA
            END SUBROUTINE DEFINE_SHAPE_FUNCTIONS
          END INTERFACE 
        END MODULE DEFINE_SHAPE_FUNCTIONS__genmod
