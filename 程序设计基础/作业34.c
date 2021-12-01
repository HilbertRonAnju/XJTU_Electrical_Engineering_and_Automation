/*
将函数形参全部改为指针
将计算第二天的日期的程序中的自定义函数全部改成用指针做形参。

输入格式为

2002 2 6

输出格式为

2002-2-7
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
struct date
{
	int year,mouth,day;
}today,tomorrow;
int primeyear(struct date today);
struct date judge(struct date today);
int main()
{
	scanf("%d%d%d",&today.year,&today.mouth,&today.day);
	tomorrow=judge(today);
	printf("%d-%d-%d",tomorrow.year,tomorrow.mouth,tomorrow.day);
	return 0;
} 
int primeyear(struct date today)
{	
	int flag=0;
	if((today.year%4==0&&today.year%100!=0)||(today.year%400==0))
		flag=1;
	return flag;
}
struct date judge(struct date today)
{
	int mouthnumber[12]={31,28,31,30,31,30,31,31,30,31,30,31};
	if(primeyear(today)==1)
		mouthnumber[1]++;
	if(today.day==mouthnumber[today.mouth-1]&&today.mouth!=12)
	{
		today.mouth++;
		today.day=1;
	}
	else if(today.day==31&&today.mouth==12)
	{
		today.year++;
		today.mouth=1;
		today.day=1;
	}
	else if(today.day!=mouthnumber[today.mouth-1]&&today.mouth!=12)
	{
		today.day++;
	}
	tomorrow=today;
	return tomorrow;
}
