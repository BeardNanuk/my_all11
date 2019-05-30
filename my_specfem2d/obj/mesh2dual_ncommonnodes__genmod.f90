        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MESH2DUAL_NCOMMONNODES__genmod
          INTERFACE 
            SUBROUTINE MESH2DUAL_NCOMMONNODES(ELMNTS_L,NCOMMONNODES,XADJ&
     &,ADJNCY)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: ELMNTS_L(0:4*NELMNTS-1)
              INTEGER(KIND=4), INTENT(IN) :: NCOMMONNODES
              INTEGER(KIND=4), INTENT(OUT) :: XADJ(0:NELMNTS)
              INTEGER(KIND=4), INTENT(OUT) :: ADJNCY(0:40*NELMNTS-1)
            END SUBROUTINE MESH2DUAL_NCOMMONNODES
          END INTERFACE 
        END MODULE MESH2DUAL_NCOMMONNODES__genmod
