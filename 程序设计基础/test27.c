#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	int i=0;
	int n=0;//总人数 
	int m=0;//死亡人数 
	int count=0;
	int *gun;
	int p[100];
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		p[i]=i+1;
	}
	gun=&p[0];
	i=0;
	while(1)
	{
		if(m==n-1)
			break;//剩一个人，结束 
		if(*gun!=0)	
		{
			count++;
		}//如果枪所指的的人没有被pass，计数加一 
		if(count==3)//如果计数等于三 
		{
			//printf(".,,.,,.,.,\n");
			count=0;//计数归零 
			m++;//死亡个数加一 
			*gun=0;//枪所指的人死亡 
		}
		i++;//总计数 
		gun++;//枪口指向下一个人 
		if(i==n)//如果循环结束了，把枪口重新指向第一个人 
		{
			i=0;
			gun=&p[0];
		}
	}
	for(i=0;i<n;i++)
	{
		if(p[i]!=0)
			printf("%d\n",p[i]);
		//else
			//printf("hgksldfh\n");
	}
	return 0;
}
