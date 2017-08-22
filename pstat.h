#ifndef _PSTAT_H_
#define _PSTAT_H_

#include "param.h"

struct pstat{

int inuse[NPROC]; // whether this slot of the process process table is in use (1 or 0)
	int pid[NPROC]; // the PID of each process
	char name[NPROC][16];
	int hticks[NPROC]; // the number of ticks each process has accumulated at HIGH priority
	int lticks[NPROC]; 
  // int chosen[NPROC]; // the number of times the process was chosen to run
   // int time[NPROC]; // the number of ms the process has run
  
  // int n;
};


#endif // _PSTAT_H_

