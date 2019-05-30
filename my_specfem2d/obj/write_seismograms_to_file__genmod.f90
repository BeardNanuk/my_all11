        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_SEISMOGRAMS_TO_FILE__genmod
          INTERFACE 
            SUBROUTINE WRITE_SEISMOGRAMS_TO_FILE(SISUX,SISUZ,SISCURL)
              USE SPECFEM_PAR, ONLY :                                   &
     &          STATION_NAME,                                           &
     &          NETWORK_NAME,                                           &
     &          NSTEP,                                                  &
     &          ISLICE_SELECTED_REC,                                    &
     &          NREC,                                                   &
     &          MYRANK,                                                 &
     &          DELTAT,                                                 &
     &          SEISMOTYPE,                                             &
     &          T0,                                                     &
     &          NSTEP_BETWEEN_OUTPUT_SEISMOS,                           &
     &          SUBSAMP_SEISMOS,                                        &
     &          NRECLOC,                                                &
     &          SEISMO_OFFSET,                                          &
     &          SEISMO_CURRENT,                                         &
     &          P_SV,                                                   &
     &          SU_FORMAT,                                              &
     &          SAVE_ASCII_SEISMOGRAMS,                                 &
     &          SAVE_BINARY_SEISMOGRAMS_SINGLE,                         &
     &          SAVE_BINARY_SEISMOGRAMS_DOUBLE,                         &
     &          X_SOURCE,                                               &
     &          Z_SOURCE
              REAL(KIND=8), INTENT(IN) :: SISUX(                        &
     &NSTEP_BETWEEN_OUTPUT_SEISMOS/SUBSAMP_SEISMOS,NRECLOC)
              REAL(KIND=8), INTENT(IN) :: SISUZ(                        &
     &NSTEP_BETWEEN_OUTPUT_SEISMOS/SUBSAMP_SEISMOS,NRECLOC)
              REAL(KIND=8), INTENT(IN) :: SISCURL(                      &
     &NSTEP_BETWEEN_OUTPUT_SEISMOS/SUBSAMP_SEISMOS,NRECLOC)
            END SUBROUTINE WRITE_SEISMOGRAMS_TO_FILE
          END INTERFACE 
        END MODULE WRITE_SEISMOGRAMS_TO_FILE__genmod
