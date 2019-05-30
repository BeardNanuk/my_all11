        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:52 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SEND_I__genmod
          INTERFACE 
            SUBROUTINE SEND_I(SENDBUF,SENDCOUNT,DEST,SENDTAG)
              INTEGER(KIND=4) :: SENDCOUNT
              INTEGER(KIND=4) :: SENDBUF(SENDCOUNT)
              INTEGER(KIND=4) :: DEST
              INTEGER(KIND=4) :: SENDTAG
            END SUBROUTINE SEND_I
          END INTERFACE 
        END MODULE SEND_I__genmod
