        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REPARTITION_COUPLED_EDGES__genmod
          INTERFACE 
            SUBROUTINE REPARTITION_COUPLED_EDGES(NPROC,NEDGES_COUPLED,  &
     &EDGES_COUPLED,NUM_MATERIAL,NBMODELS,IS_DOMAIN_A,IS_DOMAIN_B,XADJ_L&
     &,ADJNCY_L)
              USE SHARED_PARAMETERS
              INTEGER(KIND=4), INTENT(IN) :: NBMODELS
              INTEGER(KIND=4), INTENT(IN) :: NEDGES_COUPLED
              INTEGER(KIND=4), INTENT(IN) :: NPROC
              INTEGER(KIND=4), INTENT(INOUT) :: EDGES_COUPLED(2,        &
     &NEDGES_COUPLED)
              INTEGER(KIND=4), INTENT(IN) :: NUM_MATERIAL(1:NELMNTS)
              LOGICAL(KIND=4), INTENT(IN) :: IS_DOMAIN_A(NBMODELS)
              LOGICAL(KIND=4), INTENT(IN) :: IS_DOMAIN_B(NBMODELS)
              INTEGER(KIND=4), INTENT(IN) :: XADJ_L(0:NELMNTS)
              INTEGER(KIND=4), INTENT(IN) :: ADJNCY_L(0:40*NELMNTS-1)
            END SUBROUTINE REPARTITION_COUPLED_EDGES
          END INTERFACE 
        END MODULE REPARTITION_COUPLED_EDGES__genmod
