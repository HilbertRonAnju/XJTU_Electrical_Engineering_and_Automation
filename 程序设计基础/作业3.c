#include <stdio.h>
int main()
{
	int hour1,hour2,minute1,minute2,hour3,minute3;
	scanf("%d",&hour1);
	scanf("%d",&minute1);
	scanf("%d",&hour2);
	scanf("%d",&minute2);
	minute3=((hour2*60+minute2)-(hour1*60+minute1))%60;
	hour3=((hour2*60+minute2)-(hour1*60+minute1))/60;
	printf("%d点%d分和%d点%d分相差%d小时%d分钟",hour1,minute1,hour2,minute2,hour3,minute3);
	return 0;
}
