/*
请回忆小学学习的手算整数除法的步骤。

先输入除数，再输入被除数，本题所得的商小于1，两者都是整数。

先将被除数乘以10，得到一位商以后，将余数乘以10作为下一轮计算的被除数，可得任意精度的商。

输入的整数得到的商一定除不尽。

输入示例：123 567

输出示例：0.1234567891011213141516161718192020122

最多显示小数点后200位。

如果是循环小数，则输出

0.6T123456T

T之间为循环周期

如果超过200位还未找到循环节，则输出前200位。

提示：如果余数重复，则循环节出现。
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
#define MAX 200
int xunhuan(int *s,int *e);
void showxh(int start,int end);
void showbxh();
int res1[MAX]={-1};
int res2[MAX]={-1};
int number1,number2;
int start,end;
int main()
{
	int i;
    scanf("%d%d",&number1,&number2);
    for(i=0;i<MAX;i++)
    {
    	res1[i]=number1/number2;
    	res2[i]=number1%number2;
    	number1=10*res2[i];
    	if(!res2[i])	break;
	}
	xunhuan(start,end);
	printf("0.");
	if(xunhuan)
		showxh(start,end);
	else
		showbxh();
    return 0;
} 
int xunhuan(int *s,int *e)
{
	int i,j;
	for(i=0;i<MAX;i++)
	{
		for(j=i+1;j<MAX;j++)
		{
			if(res2[i]==res2[j])
			{
				*s=i;
				*e=j;
				return 1;
			}
		}
	}
	return 0;
}
void showxh(int start,int end)
{
	int i;
	printf("0.");
	for(i=1;i<MAX;i++)
	{
		printf("%d",res1[i]);	
	} 
	printf("T");
	for(i=start+1;i<=end;i++)
	{
		printf("%d",res1[i]);
	}
	printf("T");
} 
void showbxh()
{
	int i;
	for(i=0;i<MAX&&res1[i]!=-1;i++)
	{
		printf("%d",res1[i]);
	}
}
