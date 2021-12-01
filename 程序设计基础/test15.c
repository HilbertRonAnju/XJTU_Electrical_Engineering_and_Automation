#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	double x[20]={1,2};
	double sum=0;
	int i;
	for(i=2;i<20;i++)
	{
		x[i]=x[i-1]+x[i-2];
	}
	for(i=0;i<20;i++)
	{
		sum=sum+x[i+1]/x[i];
	}
	printf("%lf",sum);
	return 0;
}
