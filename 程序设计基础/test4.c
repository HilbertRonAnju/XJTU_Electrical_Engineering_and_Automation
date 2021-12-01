#include<stdio.h>
#include<math.h>
#include<string.h> 
#define GAS 3.785
#define KILO 1.609
int main()
{
	float gaspayc,gaspaye;
	printf("请输入每加仑英里数：");
	scanf("%f",&gaspaye);
	gaspayc=gaspaye*(KILO/GAS);
	printf("每公里升数：%.1f",gaspayc);
	return 0;
}
