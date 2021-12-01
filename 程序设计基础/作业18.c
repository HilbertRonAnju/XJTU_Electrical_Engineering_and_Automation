#include<stdio.h>
int main()
{
	double number_1=1,number_2=1,number_3=1,sum=0;
	while(number_1<=100)
	{
		sum=sum+number_1;
		number_1++;
	}
	while(number_2<=50)
	{
		sum=sum+number_2*number_2;
		number_2++;
	}
	while(number_3<=10)
	{
		sum=sum+(1/number_3);
		number_3++;
	}
	printf("%8.5f",sum);
	return 0;
}
