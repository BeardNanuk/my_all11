        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:03 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHECK_GRID_CREATE_POSTSCRIPT__genmod
          INTERFACE 
            SUBROUTINE CHECK_GRID_CREATE_POSTSCRIPT(                    &
     &COURANT_STABILITY_NUMBER_MAX,LAMBDAPIMIN,LAMBDAPIMAX,LAMBDASMIN,  &
     &LAMBDASMAX)
              USE SPECFEM_PAR
              REAL(KIND=8), INTENT(IN) :: COURANT_STABILITY_NUMBER_MAX
              REAL(KIND=8), INTENT(IN) :: LAMBDAPIMIN
              REAL(KIND=8), INTENT(IN) :: LAMBDAPIMAX
              REAL(KIND=8), INTENT(IN) :: LAMBDASMIN
              REAL(KIND=8), INTENT(IN) :: LAMBDASMAX
            END SUBROUTINE CHECK_GRID_CREATE_POSTSCRIPT
          END INTERFACE 
        END MODULE CHECK_GRID_CREATE_POSTSCRIPT__genmod
