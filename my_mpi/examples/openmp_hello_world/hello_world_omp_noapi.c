#include <stdio.h>

int main(){

  printf("Hello World!\n");
  
#pragma omp parallel 
  {
    printf("Hello OpenMP World!\n");
  }

  return 0;
}
