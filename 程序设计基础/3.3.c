/*

给定两个整数n和m，计算第n个素数到第m个素数之间所有的素数的和，包括第n个素数和第m个素数。

编写函数判定某个数是不是素数。

注：2是第一个素数，3是第二个素数，5是第三个素数

输入格式：2 60

输出格式：123456
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	int i=1,j=2;
	int prime=2,sum;
	int end,begin;
	scanf("%d%d",&begin,&end);//注意输入顺序 
	while(i<begin)
	{
		prime++;
		for(j=2;j<prime;j++)
		{
			if(prime%j==0)
				break;
			if(j==prime-1)
			{
				i++;
			}
		}
	}
	sum=prime;
	printf("%d\n",prime);
	while(begin<end)
	{
		prime++;
		for(j=2;j<prime;j++)
		{
			if(prime%j==0)
				break;
			if(j==prime-1)
			{
				//printf("%d\n",prime);
				sum=sum+prime;
				begin++;
				break;
			}
		}
	}
	printf("%d",sum);
	return 0;
} 

