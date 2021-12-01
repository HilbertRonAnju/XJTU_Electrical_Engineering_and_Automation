/*
输入两个多项式格式如下，系数都是浮点数：

2 1.362 1 8.8 2 -5.02 0 30.3

3 6.6 0 0

表示多项式1是 1.362X2+8.8X-5.02X2+30.3 多项式2是6.6X3
最后一组数字必须输入并且表示0次幂，最高幂为16，
输入并不需要按照幂次高低顺序,
同一幂次可多次输入（但是0次幂仅在每个多项式最后一组数字输入），
每个多项式总共不超过30项输入，输入系数为负数时，负号后没有空格。
乘法结果不为零。0次幂的系数为0时也必须出现在输入数据中。 
输出格式：从最高幂开始依次降到0幂，系数为0不输出，输出保留两位小数：

-200X8+300X2-1X1+30
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	int i,j;
	int mi;
	int max1=0,max2=0;
	double xs;
	double xishu1[200]={0};
	double xishu2[200]={0};
	double res[400]={0};
	while(1)
	{
		scanf("%d%lf",&mi,&xs);
		xishu1[mi]=xishu1[mi]+xs;
		if(mi>max1)	max1=mi;
		if(mi==0)
			break;
	}
	while(1)
	{
		scanf("%d%lf",&mi,&xs);
		xishu2[mi]=xishu2[mi]+xs;
		if(mi>max2)	max2=mi;
		if(mi==0)
			break;
	}
	for(i=0;i<200;i++)
	{
		for(j=0;j<200;j++)
		{
			if(xishu1[i]!=0&&xishu2[j]!=0)
				res[i+j]=xishu1[i]*xishu2[j]; 
		}
	}
	for(i=400;i>=0;i--)
	{
		if(res[i]>0&&i!=max1+max2)
			printf("+");
		if(i!=0&&res[i]!=0)
			printf("%.3fX%d",res[i],i);
		else if(i==0&&res[i]!=0)
			printf("+%.3f",res[i]);
		
	}
	return 0;
}
