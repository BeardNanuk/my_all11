        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:44:11 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_INIT__genmod
          INTERFACE 
            SUBROUTINE PML_INIT
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          NSPEC,                                                  &
     &          NGLOB,                                                  &
     &          IBOOL,                                                  &
     &          ANYABS,                                                 &
     &          NELEMABS,                                               &
     &          CODEABS,                                                &
     &          NUMABS,                                                 &
     &          NGLOB_INTERFACE,                                        &
     &          READ_EXTERNAL_MESH,                                     &
     &          NSPEC_PML,                                              &
     &          ISPEC_IS_PML,                                           &
     &          SPEC_TO_PML,                                            &
     &          REGION_CPML,                                            &
     &          WHICH_PML_ELEM,                                         &
     &          MASK_IBOOL_PML,                                         &
     &          NELEM_PML_THICKNESS,                                    &
     &          PML_INTERIOR_INTERFACE
            END SUBROUTINE PML_INIT
          END INTERFACE 
        END MODULE PML_INIT__genmod
