#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#define MAX_LEN 200
int nume; //numerator分子
int deno; //denominator分母
int quot[MAX_LEN]={-1}; //quotient商
int rem[MAX_LEN]={-1}; //remainder余数
//存取商和余数
void save_quot_rem() 
{
	int i;
	for(i=0; i<MAX_LEN; i++)
	{
		quot[i] = nume/deno;
		rem[i] = nume%deno;
		nume = 10*rem[i];
		if(!rem[i])
			break;
	} //for
}
//判断是否是循环小数,若是则保存循环节起始和结束位置
int is_circu(int *start, int *end)
{
	int i,j;
	for(i=0; i<MAX_LEN; i++)
	{
		if(rem[i]==-1)
		return 0;
	}
	for(i=0;i<MAX_LEN;i++)
	{
		for(j=i+1;j<MAX_LEN;j++)
		{
			if(rem[i] == rem[j])
			{
				*start = i;
				*end = j;
				return 1;
			} //if
		} //for
	} //for
	return 0;
}
void show_circu(int start, int end) //显示循环小数
{
	int i;
	printf("%d.", quot[0]); //整数部分
	for(i=1;i<=start; i++) //小数非循环节部分
	{
		printf("%d",quot[i]);
	}
	printf("T");
	for(i=start+1; i<=end; i++) //小数循环节部分
	{
		printf("%d",quot[i]);
	}
	printf("T");
	}
void show_not_circu() //显示非循环小数
{
	int i;
	if(quot[1]==-1) //无小数部分
	{
		printf("%d",quot[0]);
		return;
	}
	printf("%d.", quot[0]);
	for(i=1; (i < MAX_LEN) && (-1 != quot[i]); i++) //小数部分
	{
		printf("%d",quot[i]);
	}
}
int main()
{
	int start, end;
	while(1)
	{
		scanf("%d%d", &nume, &deno);
		if(!nume && !deno)
			return 0;
		memset(quot,-1,sizeof(quot));
		memset(rem,-1,sizeof(rem));
		save_quot_rem();
		is_circu(&start, &end) ? show_circu(start,end):show_not_circu();
	}	
	return 0;
}
