        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:09 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_INTERPOLATED_DVA__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_INTERPOLATED_DVA(IRECLOC,ISPEC,          &
     &VECTOR_FIELD_ELEMENT,PRESSURE_ELEMENT,CURL_ELEMENT,VX,VZ,VCURL)
              INTEGER(KIND=4), INTENT(IN) :: IRECLOC
              INTEGER(KIND=4), INTENT(IN) :: ISPEC
              REAL(KIND=4), INTENT(IN) :: VECTOR_FIELD_ELEMENT(2,5,5)
              REAL(KIND=4), INTENT(IN) :: PRESSURE_ELEMENT(5,5)
              REAL(KIND=4), INTENT(IN) :: CURL_ELEMENT(5,5)
              REAL(KIND=8), INTENT(OUT) :: VX
              REAL(KIND=8), INTENT(OUT) :: VZ
              REAL(KIND=8), INTENT(OUT) :: VCURL
            END SUBROUTINE COMPUTE_INTERPOLATED_DVA
          END INTERFACE 
        END MODULE COMPUTE_INTERPOLATED_DVA__genmod
