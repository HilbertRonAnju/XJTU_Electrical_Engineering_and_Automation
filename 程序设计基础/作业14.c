#include<stdio.h>
int main()
{
	char a,b,c,d,e;
	a=getchar();
	b=getchar();
	c=getchar();
	d=getchar();
	e=getchar();
	if(a!=0)
	printf("%c%c%c%c%c是5位数。\n",a,b,c,d,e);
	else if(a==0&&b!=0)
	printf("%c%c%c%c%c是4位数。\n",a,b,c,d,e);
	else if(a==0&&b==0&&c!=0)
	printf("%c%c%c%c%c是3位数。\n",a,b,c,d,e);
	else if(a==0&&b==0&&c==0&&d!=0)
	printf("%c%c%c%c%c是2位数。\n",a,b,c,d,e);
	else
	printf("%c%c%c%c%c是1位数。\n",a,b,c,d,e);
	printf("%c*%c*%c*%c*%c\n",a,b,c,d,e);
	printf("%c*%c*%c*%c*%c\n",e,d,c,b,a);
	return 0;
} 
