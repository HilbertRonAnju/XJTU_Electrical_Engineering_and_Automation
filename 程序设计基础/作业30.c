/*
第七章第五题 
请注意不光是是倒序输出，先倒序，然后再输出。

输入格式

This is！

输出格式

！si sihT*/
#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int i=0,m=0,n=0;
	char x[100],y[100];
	gets(x);
	n=strlen(x);
	i=n;
	while(m<n)
	{
		y[m]=x[i-1];
		printf("%c",y[m]);
		i--;
		m++;
	}
	return 0;
}
