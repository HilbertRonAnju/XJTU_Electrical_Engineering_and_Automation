#include<stdio.h>
int main()
{
	double a,b,t;
	scanf("a = %lf, b = %lf",&a,&b);
	printf("Before: a = %lf, b = %lf\n",a,b);
	t=a;
	a=b;
	b=t;
	printf("After: a = %lf, b = %lf",a,b);
	return 0;
}
