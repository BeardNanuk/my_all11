#include <omp.h>
#include <stdio.h>

int main() {
  
  int i;
  const int N = 1000;

  int a = 50;
  int b = 0;
  
#pragma omp parallel for default(shared)
  for (i=0; i<N; i++) {
    b = a + i;
  }
  
  printf("shared a=%d b=%d (expected a=50 b=1049)\n", a, b);


//-------------------------------------------
  a = 50;
  b = 0;
  
#pragma omp parallel for default(none) private(i) private(a) private(b)
  for (i=0; i<N; i++) {
    b = a + i;
  }

  printf("p,p: a=%d b=%d (expected a=50 b=1049)\n", a, b);

//-------------------------------------------

  a = 50;
  b = 0;
  
#pragma omp parallel for default(none) private(i) firstprivate(a) private(b) 
  for (i=0; i<N; i++) {
    b = a + i;
  }

  printf("fp,p: a=%d b=%d (expected a=50 b=1049)\n", a, b);

//-------------------------------------------

  a = 50;
  b = 0;
  
#pragma omp parallel for default(none) private(i) private(a) lastprivate(b)
  for (i=0; i<N; i++) {
    b = a + i;
  }

  printf("p,lp: a=%d b=%d (expected a=50 b=1049)\n", a, b);

//-------------------------------------------

  a = 50;
  b = 0;
  
#pragma omp parallel for default(none) private(i) firstprivate(a) lastprivate(b)
  for (i=0; i<N; i++) {
    b = a + i;
  }

  printf("fp,lp: a=%d b=%d (expected a=50 b=1049)\n", a, b);



  return 0;
  
}
