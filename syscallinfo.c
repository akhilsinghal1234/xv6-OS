#include "types.h"
#include "user.h"
#include "stat.h"


int main()
{
	
	printf(1, "Getting Number Of system calls:\n");
  printf(2, "%d\n",getsyscallinfo());
  
	exit();
}
