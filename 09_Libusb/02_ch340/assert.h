#pragma once
#include "stdio.h"

#define ASSERT(cdn,err,msg,...) 							\
do															\
{															\
	if(!(cdn))												\
	{														\
		fprintf(stderr,"\033[31m[Assert Failed]: %s [ErrId]: %d [Msg]: %s [Loc]: %s:%d\n\033[0m"\
				,#cdn,err,msg,__FILE__,__LINE__);			\
		__VA_ARGS__;										\
		return -1;											\
	}														\
}															\
while(0)

