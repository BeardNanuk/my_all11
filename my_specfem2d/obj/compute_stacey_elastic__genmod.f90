        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_STACEY_ELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_STACEY_ELASTIC(ACCEL_ELASTIC,            &
     &VELOC_ELASTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          AXISYM,                                                 &
     &          NGLOB,                                                  &
     &          NELEMABS,                                               &
     &          IT,                                                     &
     &          ANY_ELASTIC,                                            &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          NUMABS,                                                 &
     &          ISPEC_IS_ELASTIC,                                       &
     &          CODEABS,                                                &
     &          CODEABS_CORNER,                                         &
     &          DENSITY,                                                &
     &          POROELASTCOEF,                                          &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          VPEXT,                                                  &
     &          VSEXT,                                                  &
     &          RHOEXT,                                                 &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          P_SV,                                                   &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          B_ABSORB_ELASTIC_LEFT,                                  &
     &          B_ABSORB_ELASTIC_RIGHT,                                 &
     &          B_ABSORB_ELASTIC_BOTTOM,                                &
     &          B_ABSORB_ELASTIC_TOP,                                   &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          STACEY_ABSORBING_CONDITIONS,                            &
     &          DELTAT,                                                 &
     &          V0X_LEFT,                                               &
     &          V0Z_LEFT,                                               &
     &          V0X_RIGHT,                                              &
     &          V0Z_RIGHT,                                              &
     &          V0X_BOT,                                                &
     &          V0Z_BOT,                                                &
     &          T0X_LEFT,                                               &
     &          T0Z_LEFT,                                               &
     &          T0X_RIGHT,                                              &
     &          T0Z_RIGHT,                                              &
     &          T0X_BOT,                                                &
     &          T0Z_BOT,                                                &
     &          ADD_BIELAK_CONDITIONS_BOTTOM,                           &
     &          ADD_BIELAK_CONDITIONS_RIGHT,                            &
     &          ADD_BIELAK_CONDITIONS_TOP,                              &
     &          ADD_BIELAK_CONDITIONS_LEFT,                             &
     &          INITIALFIELD,                                           &
     &          OVER_CRITICAL_ANGLE,                                    &
     &          ANGLESOURCE,                                            &
     &          ANGLESOURCE_REFL,                                       &
     &          A_PLANE,                                                &
     &          B_PLANE,                                                &
     &          C_PLANE,                                                &
     &          C_INC,                                                  &
     &          C_REFL,                                                 &
     &          TIME_OFFSET,                                            &
     &          X_SOURCE,                                               &
     &          Z_SOURCE,                                               &
     &          F0_SOURCE,                                              &
     &          COORD
              REAL(KIND=4), INTENT(INOUT) :: ACCEL_ELASTIC(2,NGLOB)
              REAL(KIND=4), INTENT(IN) :: VELOC_ELASTIC(2,NGLOB)
            END SUBROUTINE COMPUTE_STACEY_ELASTIC
          END INTERFACE 
        END MODULE COMPUTE_STACEY_ELASTIC__genmod
