#include "spvm_native.h"

#include "sha.h"


int32_t SPVM__TestCase__Resource__SHA__V6_02__test(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  int32_t sha256 = SHA256;
  
  if (sha256 != 256) {
    stack[0].ival = 0;
    return 0;
  }
  
  stack[0].ival = 1;
  
  return 0;
}
