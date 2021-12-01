/*
要求：

1、功能一：给定某月某日，输出这是一年的第几天。

2、功能二：给定某年的第几天，输出这是几月几日。

3、分别针对上述功能编写两个函数及判断是否闰年的函数。

输入格式为：

2015 5 10

输出格式为

2015 is a leap year.

100

紧接着输入

2000 200

输出格式为

2001 is not a leap year.

11-08
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
struct date
{
	int year,mouth,day;
};
void primeyear(int year);
int datenum(int year1,int mouth,int day);
struct date daynum(int year,int daynumber);
int main()
{
	struct date k;
	int datan=0;
	int year1,year2,day,mouth,daynumber;
	//功能一 
	scanf("%d%d%d",&year1,&mouth,&day);
	primeyear(year1);
	datan=datenum(year1,mouth,day);
	printf("%d\n",datan);
	//功能二 
	scanf("%d%d",&year2,&daynumber);
	primeyear(year2);
	k=daynum(year2,daynumber);
	printf("%d-%d",k.mouth,k.day);
	return 0;
} 
void primeyear(int year)
{
	int flag=0;
	if((year%4==0&&year%100==0)||(year%400==0))
		flag=1;
	if(flag==1)
		printf("%d is a leap year.\n",year);
	else
		printf("%d is not a leap year.\n",year);
}
int datenum(int year1,int mouth,int day)
{
	int mouthnumber[13]={0,31,28,31,30,31,30,31,31,30,31,30,31};
	int sum=0,i;
	struct date a;
	if((year1%4==0&&year1%100==0)||(year1%400==0))
		mouthnumber[2]++;
	for(i=1;i<mouth;i++)
	{
		sum=sum+mouthnumber[i];
	}
	sum=sum+day;
	return sum;
}
struct date daynum(int year,int daynumber)
{
	int mouthnumber[13]={0,31,28,31,30,31,30,31,31,30,31,30,31};
	int sum=0,i;
	struct date a;
	if((year%4==0&&year%100!=0)||(year%400==0))
		mouthnumber[2]++;
	for(i=1;i<13;i++)
	{
		sum=sum+mouthnumber[i];
		if(sum>daynumber)
		{
			a.mouth=i;
			a.day=daynumber-(sum-mouthnumber[i]);
			break;
		}
	}
	return a;
}
