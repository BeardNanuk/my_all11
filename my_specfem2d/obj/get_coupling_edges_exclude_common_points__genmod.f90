        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_COUPLING_EDGES_EXCLUDE_COMMON_POINTS__genmod
          INTERFACE 
            SUBROUTINE GET_COUPLING_EDGES_EXCLUDE_COMMON_POINTS(NELEMABS&
     &,NUMABS,NUM_DOMAIN_EDGES,DOMAIN_ISPEC,DOMAIN_IEDGE,IBEGIN_EDGE1,  &
     &IBEGIN_EDGE2,IBEGIN_EDGE3,IBEGIN_EDGE4,IEND_EDGE1,IEND_EDGE2,     &
     &IEND_EDGE3,IEND_EDGE4)
              INTEGER(KIND=4), INTENT(IN) :: NUM_DOMAIN_EDGES
              INTEGER(KIND=4), INTENT(IN) :: NELEMABS
              INTEGER(KIND=4), INTENT(IN) :: NUMABS(NELEMABS)
              INTEGER(KIND=4), INTENT(IN) :: DOMAIN_ISPEC(              &
     &NUM_DOMAIN_EDGES)
              INTEGER(KIND=4), INTENT(IN) :: DOMAIN_IEDGE(              &
     &NUM_DOMAIN_EDGES)
              INTEGER(KIND=4), INTENT(INOUT) :: IBEGIN_EDGE1(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IBEGIN_EDGE2(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IBEGIN_EDGE3(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IBEGIN_EDGE4(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IEND_EDGE1(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IEND_EDGE2(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IEND_EDGE3(NELEMABS)
              INTEGER(KIND=4), INTENT(INOUT) :: IEND_EDGE4(NELEMABS)
            END SUBROUTINE GET_COUPLING_EDGES_EXCLUDE_COMMON_POINTS
          END INTERFACE 
        END MODULE GET_COUPLING_EDGES_EXCLUDE_COMMON_POINTS__genmod