#include<stdio.h>
int main()
{
	double a,n,i=1,sum=0,SUM=0;
	scanf("%lf%lf",&a,&n);
	while(i<=n)
	{
		sum=sum*10+a;
		SUM=SUM+sum;
		i++;
	}
	printf("%.0f",SUM);
	return 0;
}
