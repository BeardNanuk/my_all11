//  Master-Slave MPI example
//  Master has an array of "work" to do (work=sleep)
//  Each piece of work is slighly different (sleep*iteration)
//  Pieces of work are sent one at a time; first come first served


#include <mpi.h>
#include <stdlib.h>
#include <vector>
#include <iostream>
#include <unistd.h>

using namespace std;


int main(int argc, char **argv) {

  int rank, nprocs;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

  MPI_Status status;

  cout.setf(ios::unitbuf);

  if(nprocs<2) {
    cout<<"Must run with 2 or more processes!"<<endl;
    cout<<"Exiting..."<<endl;
    MPI_Finalize();
    exit(1);
  }


  if (rank==0) {
    //master!!!!!
    vector<int> master_array;

    int pieces_of_work = 12;
    int offset = 10;
    int total_work = 0;

    for(int i=0; i<pieces_of_work; i++){
      master_array.push_back(offset+i);
      total_work+=offset+1;
    }


    int result;
    int slave_id;

    int index_to_send=0;
    int value_to_send;

    double t0 = MPI_Wtime();

    //intial work assingment
    for (int proc=1; proc<nprocs; proc++) {
      value_to_send = master_array[index_to_send];
      MPI_Send(&value_to_send, 1, MPI_INT, proc, 1, MPI_COMM_WORLD);
      index_to_send++;

    }

    while(1) {

      if(index_to_send < (master_array.size()-1)) {
        //receive finshed proc statement
        MPI_Recv(&result, 1, MPI_INT, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);        
        slave_id = status.MPI_SOURCE;

        cout<<"Master "<<rank<<" received "<<result<<" from "<<slave_id<<endl;

        //send new work
        value_to_send =  master_array[index_to_send];
        MPI_Send(&value_to_send, 1, MPI_INT, slave_id, 1, MPI_COMM_WORLD);

        index_to_send++;
      }
      else {
        break;
      }

    }
 
    //final collection
    for (int proc=1; proc<nprocs; proc++) {
      MPI_Recv(&result, 1, MPI_INT, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
      slave_id = status.MPI_SOURCE;

      cout<<"Master "<<rank<<" received "<<result<<" from "<< slave_id<<endl;
      
      //tell the slaves the work is over with tag=0
      value_to_send = 0;
      MPI_Send(&value_to_send, 1, MPI_INT, slave_id, 0, MPI_COMM_WORLD); 
    }

    double t1 = MPI_Wtime();
    double total_time = t1-t0;
    double speedup = total_work/total_time;
    cout<<endl<<endl<<"Total runtime: "<<total_time<<"s"<<endl;
    cout<<"Speedup of "<<speedup<<endl;
  }

  else {
    //slaves!!!!!!
    int my_result;
    int my_value;

    while(1) {
      MPI_Recv(&my_value, 1, MPI_INT, 0, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
      
      if(status.MPI_TAG==0) {
	//work is done
        break;
      }

      cout<<"Slave "<<rank<<" received "<<my_value<<" from master"<<endl;

      for(int i=0; i<my_value; i++) {
        //do work
	sleep(1);
      }
      my_result=2.0*my_value;  
      MPI_Send(&my_result, 1, MPI_INT, 0, 1, MPI_COMM_WORLD);
    }



  }


  MPI_Finalize();
  return 0;
}
