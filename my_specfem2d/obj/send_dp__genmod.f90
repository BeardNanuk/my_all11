        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SEND_DP__genmod
          INTERFACE 
            SUBROUTINE SEND_DP(SENDBUF,SENDCOUNT,DEST,SENDTAG)
              INTEGER(KIND=4) :: SENDCOUNT
              REAL(KIND=8) :: SENDBUF(SENDCOUNT)
              INTEGER(KIND=4) :: DEST
              INTEGER(KIND=4) :: SENDTAG
            END SUBROUTINE SEND_DP
          END INTERFACE 
        END MODULE SEND_DP__genmod
