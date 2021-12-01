/*进行两个字符串比较，找到两个字符串第一个不相等的字符并将其ASCII码相减，输出差值。

输入格式为

ONE　ＴＷＯ　Ｔｈｒｅｅ

ＨＡ　ＨＡ

则第一个字符数组和第二个字符数组分别存储的是字符串ONE　ＴＷＯ　Ｔｈｒｅｅ和ＨＡ　ＨＡ

输出格式为

-8*/ 
#include<stdio.h>
int main()
{
	int x[100]={},y[100]={};
	int i,len;
	for(i=0;i<100;i++)
	{
		scanf("%c",&x[i]);
		if(x[i]=='\n')
			break;
	}
	for(i=0;i<100;i++)
	{	
		scanf("%c",&y[i]);
		if(y[i]=='\n')
			break;
	}
	for(i=0;i<100;i++)
	{
		if((x[i]!=y[i])&&(x[i]!='\0')&&(y[i]!='\0'))
		{
			len=x[i]-y[i];
			printf("%d",len);
			break;
		}
	}
	return 0;
} 
