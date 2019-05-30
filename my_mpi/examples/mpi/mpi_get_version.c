#include "mpi.h"
#include <stdio.h>
#include <string.h>


int main (int argc, char *argv[]) {

  int me;
  int version, subversion;

  MPI_Init (&argc, &argv);  

  MPI_Comm_rank(MPI_COMM_WORLD, &me); 
  MPI_Get_version(&version, &subversion);


  if (me == 0) printf("Using MPI Standard %d.%d\n", version, subversion);

  MPI_Finalize();

  return 0;
}
