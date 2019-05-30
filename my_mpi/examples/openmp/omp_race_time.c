//
//  Simple example to demo the differnce in cost of different "reduction" type
//  operators.  Notice that the #pragma parallel directives are inside a loop.
//  This should typically be avoided to eliminate the cost of thread creation.
//

#include <omp.h>
#include <stdio.h>

int main() {
  
  int i, j;
  const int N = 1000;
  const int loop = 1e4;
  int sum = 0;
  
  double t1, t2;
  
  //dangerous -------------------------------
  t1=omp_get_wtime();

  for (j=0; j<loop; j++) {
    sum=0; 
#pragma omp parallel for private(i) shared(sum)
    for (i=0; i<N; i++) {
      sum += i;
    }
  }
  t2=omp_get_wtime();
  printf("dangerous sum=%d (expected %d) in %g\n", sum, ((N-1)*N)/2, t2-t1);
  //-------------------------------------------


  sum=0;

  //reduction ---------------------------------
  t1=omp_get_wtime();
  
  for (j=0; j<loop; j++) {
    
    sum=0; 

#pragma omp parallel for private(i) reduction(+: sum)
    for (i=0; i<N; i++) {
      sum += i;
    }
  }
  t2=omp_get_wtime();
  printf("reduction sum=%d (expected %d) in %g\n", sum, ((N-1)*N)/2, t2-t1);
  //-------------------------------------------
  
  sum=0;

  //critical-----------------------------------
  t1=omp_get_wtime();

  for (j=0; j<loop; j++) {
    sum=0; 
    
#pragma omp parallel for private(i) shared(sum)
    for ( i=0; i<N; i++) {
   #pragma omp critical
      {
	sum += i;
      }
    }
  }
  t2=omp_get_wtime();
  printf("critical sum=%d (expected %d) in %g\n", sum, ((N-1)*N)/2, t2-t1);
  //-------------------------------------------

  sum=0;
 
  //atomic-------------------------------------
  t1=omp_get_wtime();

  for (j=0; j<loop; j++) {
    sum=0; 
    
#pragma omp parallel for private(i) shared(sum)
    for ( i=0; i<N; i++) {
#pragma omp atomic
      sum += i;
    }
  }
  t2=omp_get_wtime();
    
  printf("atomic sum=%d (expected %d) in %g\n", sum, ((N-1)*N)/2, t2-t1);
  //-------------------------------------------

  sum=0;
 
  //atomic private-------------------------------------
  t1=omp_get_wtime();

  for (j=0; j<loop; j++) {
    sum=0; 
    
#pragma omp parallel private(i) shared(sum)
    {
      int sum_threads = 0;
#pragma omp for
      for ( i=0; i<N; i++) {
	sum_threads += i;
      }
#pragma omp atomic
      sum += sum_threads;
    }
  }
    t2=omp_get_wtime();
    
  printf("atomic priv sum=%d (expected %d) in %g\n", sum, ((N-1)*N)/2, t2-t1);
  //-------------------------------------------


  return 0;
  
}
