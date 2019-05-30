        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_SURFACE_DATABASE__genmod
          INTERFACE 
            SUBROUTINE WRITE_SURFACE_DATABASE(IIN_DATABASE,NSURFACE,    &
     &SURFACE,NSURFACE_LOC,IPROC,NUM_PHASE)
              INTEGER(KIND=4) :: NSURFACE
              INTEGER(KIND=4), INTENT(IN) :: IIN_DATABASE
              INTEGER(KIND=4) :: SURFACE(4,NSURFACE)
              INTEGER(KIND=4) :: NSURFACE_LOC
              INTEGER(KIND=4), INTENT(IN) :: IPROC
              INTEGER(KIND=4) :: NUM_PHASE
            END SUBROUTINE WRITE_SURFACE_DATABASE
          END INTERFACE 
        END MODULE WRITE_SURFACE_DATABASE__genmod
