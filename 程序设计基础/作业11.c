#include<stdio.h>
int main()
{
	int a_number;
	scanf("%d",&a_number);
	if(a_number>0)
	{
		if(a_number%2==0)
			printf("%d是偶数。",a_number);
		else
			printf("%d是奇数。",a_number);
	}
	else
		printf("这不是正数。");
	return 0;
}
