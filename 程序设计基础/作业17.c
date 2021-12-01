#include<stdio.h>
int main()
{
	double a,b;
	scanf("%lf,%lf",&a,&b);
	if(((a-2)*(a-2)+(b-2)*(b-2)<=1)||((a+2)*(a+2)+(b-2)*(b-2)<=1)||((a-2)*(a-2)+(b+2)*(b+2)<=1)||((a+2)*(a+2)+(b+2)*(b+2)<=1))
	{
	printf("10");
	} 
	else
	{ 
	printf("0");
	} 
	return 0;
}
