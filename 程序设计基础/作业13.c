#include<stdio.h>
int main()
{
	int a,b,c;
	scanf("%d",&a);
	b=a%10;
	c=(a%1000)/100;
	printf("%d的个位数是%d，百位数是%d。",a,b,c);
	return 0;
}
