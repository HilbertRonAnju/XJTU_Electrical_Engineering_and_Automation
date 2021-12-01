#include<stdio.h>
#include<math.h>
int main()
{
	int j,i;
	for(i=0;i<4;i++)
	{
		for(j=0;j<3-i;j++)
		{
			printf(" ");
		}
		for(j=0;j<2*i+1;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	for(i=3;i>0;i--)
	{
		for(j=0;j<4-i;j++)
		{
			printf(" ");
		}
		for(j=0;j<2*i-1;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	return 0;
}
