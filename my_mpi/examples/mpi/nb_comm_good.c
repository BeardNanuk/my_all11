#include <mpi.h>
#include <math.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
  int rank;
  int size; 


  //intialize MPI & MPI variables
  MPI_Init(&argc,&argv);                
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);  
  MPI_Comm_size(MPI_COMM_WORLD, &size);  

  
  int my_result = -1;  //initial result for everyone
  int source = 0;      //rank of source of message
  
  if (rank==source)    
    my_result = 15;    //change the result on source
  
  int dest = size-1;   //send my_result to this rank
  int tag = 1;
  MPI_Request request;
  MPI_Status  status;


  // safe
  int flag = 0;
  
  if (rank==source) {
    sleep(10);  // source is held up doing something
    MPI_Isend(&my_result, 1, MPI_INT, dest, tag, MPI_COMM_WORLD, &request);
  }
  if (rank==dest) {    
    MPI_Irecv(&my_result, 1, MPI_INT, source, tag, MPI_COMM_WORLD, &request);
    while(1) {
      MPI_Test(&request, &flag, &status); //test if finished: flag=1
      if(flag==1) break;
      printf("%d is waiting, my_result=%d ...\n", dest, my_result);
      sleep(1); // give dest a little work to do before checking back
    }    
  }

  printf("my result on %d is set to %d\n", rank, my_result);


  //MPI cleanup
  MPI_Finalize();                       

  return 0;
}



