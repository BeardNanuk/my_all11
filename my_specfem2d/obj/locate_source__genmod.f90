        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LOCATE_SOURCE__genmod
          INTERFACE 
            SUBROUTINE LOCATE_SOURCE(IBOOL,COORD,NSPEC,NGLOB,XIGLL,ZIGLL&
     &,X_SOURCE,Z_SOURCE,ISPEC_SELECTED_SOURCE,ISLICE_SELECTED_SOURCE,  &
     &NPROC,MYRANK,XI_SOURCE,GAMMA_SOURCE,COORG,KNODS,NGNOD,NPGEO,      &
     &IGLOB_SOURCE,IS_FORCE_SOURCE)
              INTEGER(KIND=4), INTENT(IN) :: NPGEO
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
              INTEGER(KIND=4), INTENT(IN) :: NPROC
              INTEGER(KIND=4), INTENT(IN) :: NGLOB
              INTEGER(KIND=4), INTENT(IN) :: NSPEC
              INTEGER(KIND=4), INTENT(IN) :: IBOOL(5,5,NSPEC)
              REAL(KIND=8), INTENT(IN) :: COORD(2,NGLOB)
              REAL(KIND=8), INTENT(IN) :: XIGLL(5)
              REAL(KIND=8), INTENT(IN) :: ZIGLL(5)
              REAL(KIND=8), INTENT(IN) :: X_SOURCE
              REAL(KIND=8), INTENT(IN) :: Z_SOURCE
              INTEGER(KIND=4), INTENT(OUT) :: ISPEC_SELECTED_SOURCE
              INTEGER(KIND=4), INTENT(OUT) :: ISLICE_SELECTED_SOURCE
              INTEGER(KIND=4), INTENT(IN) :: MYRANK
              REAL(KIND=8), INTENT(OUT) :: XI_SOURCE
              REAL(KIND=8), INTENT(OUT) :: GAMMA_SOURCE
              REAL(KIND=8), INTENT(IN) :: COORG(2,NPGEO)
              INTEGER(KIND=4), INTENT(IN) :: KNODS(NGNOD,NSPEC)
              INTEGER(KIND=4), INTENT(OUT) :: IGLOB_SOURCE
              LOGICAL(KIND=4), INTENT(IN) :: IS_FORCE_SOURCE
            END SUBROUTINE LOCATE_SOURCE
          END INTERFACE 
        END MODULE LOCATE_SOURCE__genmod