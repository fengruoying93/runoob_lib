#include <stdio.h>
#include <unistd.h>
#include "runoob_extern.h"

int main()
{
	while(1)
	{
		runoob_main();
		sleep(1);
	}
	return 0;
}

