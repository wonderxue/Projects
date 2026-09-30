#include "assert.h"

int main()
{
	int a=0;
	ASSERT(a>1,12,"failed",{printf("hh\n");});
	return 0;
}