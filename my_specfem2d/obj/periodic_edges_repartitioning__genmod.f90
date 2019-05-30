        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PERIODIC_EDGES_REPARTITIONING__genmod
          INTERFACE 
            SUBROUTINE PERIODIC_EDGES_REPARTITIONING(ELMNTS_L,NNODES,   &
     &NODES_COORDS,PERIODIC_HORIZ_DIST)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4) :: NNODES
              INTEGER(KIND=4), INTENT(IN) :: ELMNTS_L(0:4*NELMNTS-1)
              REAL(KIND=8) :: NODES_COORDS(2,NNODES)
              REAL(KIND=8) :: PERIODIC_HORIZ_DIST
            END SUBROUTINE PERIODIC_EDGES_REPARTITIONING
          END INTERFACE 
        END MODULE PERIODIC_EDGES_REPARTITIONING__genmod
