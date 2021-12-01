#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int m,i,s;
	for(m=1;m<=1000;m++) //从1开始到1000循环结束
	{
		s=0;//初始化因子之和s为0
		for(i=1;i<m;i++) //寻找在1到m之间，有多少m的因子
			if(m%i==0) //如果m能整除i，则i为m的因子
				s=s+i;//将因子累加
		if(s==m) //如果因子之和等于这个数
	printf("%d\t",s);//输出
	}
	return 0;
}


