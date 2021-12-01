#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int upperlimits=1,lowerlimits=0,sum=0,number;
	if(upperlimits>lowerlimits)
	{
		printf("Enter lower and upper integer limits:");
		scanf("%d%d",&lowerlimits,&upperlimits);
		for(number=lowerlimits;number<=upperlimits;number++)
		{
			sum=sum+number*number;
		}
		printf("The next sum of squares from %d to %d is %d\n",lowerlimits*lowerlimits,upperlimits*upperlimits,sum);
	}
	while(upperlimits>=lowerlimits)
	{
		sum=0;
		printf("Enter next set of limits:");
		scanf("%d%d",&lowerlimits,&upperlimits);
		for(number=lowerlimits;number<=upperlimits;number++)
		{
			sum=sum+number*number;
		}
		if(upperlimits>=lowerlimits)
			printf("The next set of limits:%d\n",sum);
		else
			printf("Done!");
	}
	return 0;
}
