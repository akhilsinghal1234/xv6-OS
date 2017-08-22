#include "types.h"
#include "user.h"
#include "stat.h"


int main()
{
	printf(1,"GetPid Prog");
	printf(2,"%d\n",getpid());
	
	printf(1, "Process scheduling statistics:\n");
  printf(1, "Slot\tPID\tHigh\tLow\n");
  struct pstat st;
  getAllPids(&st);
  int i;
  for(i = 0; i < NPROC; i++)
  		if(st.inuse[i])
  			printf(1, "%d\t%d\t%d\t%d\t%s\n", i, st.pid[i], st.hticks[i], st.lticks[i],st.name[i]);
/*	getAllPids();
	for(i=0;i<64;i++)
	{
	
	//printf(1,"Name = %s\n" ,pstat.pid[i]);
printf(1,"PID = %d\n" ,pstat.pid[i] );
		}*/
		shutdown();
	exit();
}
