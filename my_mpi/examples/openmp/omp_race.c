#include <omp.h>
#include <stdio.h>

int main() {
  
  int i;
  const int N = 1000;
  int sum = 0;
  
#pragma omp parallel for private(i) shared(sum)
  for (i=0; i<N; i++) {
    sum += i;
  }
  
  printf("dangerous sum=%d (expected %d)\n", sum, ((N-1)*N)/2);



  return 0;
  
}
