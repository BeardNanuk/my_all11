        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SET_COLOR_PALETTE__genmod
          INTERFACE 
            SUBROUTINE SET_COLOR_PALETTE(RED,GREEN,BLUE,NUM_COLORS)
              INTEGER(KIND=4), INTENT(IN) :: NUM_COLORS
              REAL(KIND=8), INTENT(OUT) :: RED(NUM_COLORS)
              REAL(KIND=8), INTENT(OUT) :: GREEN(NUM_COLORS)
              REAL(KIND=8), INTENT(OUT) :: BLUE(NUM_COLORS)
            END SUBROUTINE SET_COLOR_PALETTE
          END INTERFACE 
        END MODULE SET_COLOR_PALETTE__genmod
