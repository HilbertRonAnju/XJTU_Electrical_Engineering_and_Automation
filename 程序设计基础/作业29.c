/*
第七章第一题 
输入格式为

12 30

输出格式为

6 60*/
#include<stdio.h>
int main()
{
	int number1,number2;
	int gys(int number1,int number2);
	int gbs(int number1,int number2);
	scanf("%d %d",&number1,&number2);
	printf("%d %d",gys(number1,number2),gbs(number1,number2));
	return 0;
}
int gys(int number1,int number2)
{
	int middle1,middle2,end;
	if(number2>number1)
	{
		middle1=number1;
		number1=number2;
		number2=middle1;
	}
	while(number1%number2!=0)
	{
		middle2=number1;
		number1=number2;
		number2=middle2%number2;
	}
	end=number2;
	return (end);
}
int gbs(int number1,int number2)
{
	int middle1,middle2,numberone,numbertwo,end;
	numberone=number1;
	numbertwo=number2;
	if(number2>number1)
	{
		middle1=number1;
		number1=number2;
		number2=middle1;
	}
	while(number1%number2!=0)
	{
		middle2=number1;
		number1=number2;
		number2=middle2%number2;
	}
	end=numberone*(numbertwo/number2);
	return (end);
}
