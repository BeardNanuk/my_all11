        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:10 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_STACEY_ACOUSTIC_BACKWARD__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_STACEY_ACOUSTIC_BACKWARD(                &
     &B_POTENTIAL_DOT_DOT_ACOUSTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NELEMABS,                                               &
     &          IT,                                                     &
     &          NSTEP,                                                  &
     &          ANY_ACOUSTIC,                                           &
     &          IBOOL,                                                  &
     &          NUMABS,                                                 &
     &          ISPEC_IS_ACOUSTIC,                                      &
     &          CODEABS,                                                &
     &          CODEABS_CORNER,                                         &
     &          IBEGIN_EDGE1,                                           &
     &          IEND_EDGE1,                                             &
     &          IBEGIN_EDGE3,                                           &
     &          IEND_EDGE3,                                             &
     &          IBEGIN_EDGE4,                                           &
     &          IEND_EDGE4,                                             &
     &          IBEGIN_EDGE2,                                           &
     &          IEND_EDGE2,                                             &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          B_ABSORB_ACOUSTIC_LEFT,                                 &
     &          B_ABSORB_ACOUSTIC_RIGHT,                                &
     &          B_ABSORB_ACOUSTIC_BOTTOM,                               &
     &          B_ABSORB_ACOUSTIC_TOP,                                  &
     &          STACEY_ABSORBING_CONDITIONS
              REAL(KIND=4), INTENT(INOUT) ::                            &
     &B_POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB)
            END SUBROUTINE COMPUTE_STACEY_ACOUSTIC_BACKWARD
          END INTERFACE 
        END MODULE COMPUTE_STACEY_ACOUSTIC_BACKWARD__genmod
