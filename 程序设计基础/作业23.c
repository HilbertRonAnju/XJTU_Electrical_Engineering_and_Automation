#include <stdio.h>
int main()
{
	double x1,x2,a;
	scanf("%lf",&a);
	x1=1;
	x2=(x1+a/x1)/2;
	do 
	{
		x1=x2;
		x2=(x1+a/x1)/2;
	} while ((x1-x2>=1e-6)||(x1-x2<=-(1e-6)));
	printf("%.3f",x1);
	return 0;
}
