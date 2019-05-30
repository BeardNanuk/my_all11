        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ADD_SURFACE_MOVIE_NOISE__genmod
          INTERFACE 
            SUBROUTINE ADD_SURFACE_MOVIE_NOISE(ACCEL_ELASTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          P_SV,                                                   &
     &          IT,                                                     &
     &          NSTEP,                                                  &
     &          NSPEC,                                                  &
     &          NGLOB,                                                  &
     &          IBOOL,                                                  &
     &          JACOBIAN,                                               &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          MYRANK
              REAL(KIND=4) :: ACCEL_ELASTIC(2,NGLOB)
            END SUBROUTINE ADD_SURFACE_MOVIE_NOISE
          END INTERFACE 
        END MODULE ADD_SURFACE_MOVIE_NOISE__genmod
