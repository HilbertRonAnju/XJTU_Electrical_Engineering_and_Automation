/*键盘输入一个字符串，长度不超过100

删除给定的字符，例如对于字符数组"This is a tree!"（不包含双引号）

输入格式

i

输出

Ths s a tree!*/ 
#include<stdio.h>
#include<string.h>
int main()
{
    char x[100];
    int i=0;
    char t;
    for(i=0;i<100;i++)
	{
		scanf("%c",&x[i]);
		if(x[i]=='\n')
			break;
	}
	t=getchar();
    for(i=0;i<100;i++)
    {   
		if(x[i]=='\0')
        	break;
		if(x[i]!=t)
        {
			printf("%c",x[i]);
        }
    }
    return 0;
}
