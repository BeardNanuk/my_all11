        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SET_SOURCE_PARAMETERS__genmod
          INTERFACE 
            SUBROUTINE SET_SOURCE_PARAMETERS
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          TIME_FUNCTION_TYPE,                                     &
     &          X_SOURCE,                                               &
     &          Z_SOURCE,                                               &
     &          MXX,                                                    &
     &          MZZ,                                                    &
     &          MXZ,                                                    &
     &          F0_SOURCE,                                              &
     &          TSHIFT_SRC,                                             &
     &          FACTOR,                                                 &
     &          ANGLESOURCE,                                            &
     &          T0,                                                     &
     &          INITIALFIELD,                                           &
     &          USER_T0
            END SUBROUTINE SET_SOURCE_PARAMETERS
          END INTERFACE 
        END MODULE SET_SOURCE_PARAMETERS__genmod
