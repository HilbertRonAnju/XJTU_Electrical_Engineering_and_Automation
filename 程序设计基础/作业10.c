#include<stdio.h>
int main()
{
	int a_number;
	scanf("%d",&a_number);
	if(a_number>0)
		printf("这是一个正数。\n");
	else if(a_number<0)
		printf("这是一个负数。\n");
	else if(a_number==0)
		printf("这个数是0。");
	return 0;
}
