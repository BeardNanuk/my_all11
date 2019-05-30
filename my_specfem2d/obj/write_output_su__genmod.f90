        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_OUTPUT_SU__genmod
          INTERFACE 
            SUBROUTINE WRITE_OUTPUT_SU(X_SOURCE,Z_SOURCE,IREC,          &
     &BUFFER_BINARY,NUMBER_OF_COMPONENTS,SEISMO_OFFSET,SEISMO_CURRENT)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSTEP,                                                  &
     &          NREC,                                                   &
     &          DELTAT,                                                 &
     &          SEISMOTYPE,                                             &
     &          ST_XVAL,                                                &
     &          P_SV,                                                   &
     &          ST_ZVAL,                                                &
     &          SUBSAMP_SEISMOS
              INTEGER(KIND=4), INTENT(IN) :: SEISMO_CURRENT
              INTEGER(KIND=4), INTENT(IN) :: NUMBER_OF_COMPONENTS
              REAL(KIND=8), INTENT(IN) :: X_SOURCE
              REAL(KIND=8), INTENT(IN) :: Z_SOURCE
              INTEGER(KIND=4), INTENT(IN) :: IREC
              REAL(KIND=8), INTENT(IN) :: BUFFER_BINARY(SEISMO_CURRENT, &
     &NREC,NUMBER_OF_COMPONENTS)
              INTEGER(KIND=4), INTENT(IN) :: SEISMO_OFFSET
            END SUBROUTINE WRITE_OUTPUT_SU
          END INTERFACE 
        END MODULE WRITE_OUTPUT_SU__genmod
