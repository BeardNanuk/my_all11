        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RECV_DP__genmod
          INTERFACE 
            SUBROUTINE RECV_DP(RECVBUF,RECVCOUNT,DEST,RECVTAG)
              INTEGER(KIND=4) :: RECVCOUNT
              REAL(KIND=8) :: RECVBUF(RECVCOUNT)
              INTEGER(KIND=4) :: DEST
              INTEGER(KIND=4) :: RECVTAG
            END SUBROUTINE RECV_DP
          END INTERFACE 
        END MODULE RECV_DP__genmod
