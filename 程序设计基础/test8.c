#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int number;
	int max,min;
	scanf("%d%d",&min,&max);
	for(number=min;number<=max;number++)
	{
		printf("%d\t%d\t%d\n",number,number*number,number*number*number);
	}
	return 0;
}
