#include<stdio.h>
int main()
{
//1.0初始化结果变量n,m
	int n,m,result=0;
	int j;
	scanf("%d %d",&n,&m);
	//printf("m:%d\n",m);
	int prime=2;
	int num=1;
//2.0获得第ｎ个素数的值
	while(num<n)
	{
		prime++;
		for(j=2;j<prime;j++)
		{
			if(prime%j==0)
				break;
			if (j==prime-1)
			{
			num++;
			break;
			}
		}
	}
//3.0获第ｎ到ｍ个素数值的和
	int sum_prime = prime;
	while(n<m)
	{
		prime++;
		for(j=2;j<prime;j++)
		{
			if(prime%j==0)
				break;
			if (j==prime-1)
			{
				n++;
				sum_prime+=prime;
				break;
			}
		}
	}
//4.0输出结果
	printf("%d",sum_prime);
	return 0;
}
