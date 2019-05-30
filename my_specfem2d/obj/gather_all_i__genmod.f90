        !COMPILER-GENERATED INTERFACE MODULE: Sun May 26 20:43:53 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GATHER_ALL_I__genmod
          INTERFACE 
            SUBROUTINE GATHER_ALL_I(SENDBUF,SENDCNT,RECVBUF,RECVCOUNT,  &
     &NPROC)
              INTEGER(KIND=4) :: NPROC
              INTEGER(KIND=4) :: RECVCOUNT
              INTEGER(KIND=4) :: SENDCNT
              INTEGER(KIND=4) :: SENDBUF(SENDCNT)
              INTEGER(KIND=4) :: RECVBUF(RECVCOUNT,0:NPROC-1)
            END SUBROUTINE GATHER_ALL_I
          END INTERFACE 
        END MODULE GATHER_ALL_I__genmod
