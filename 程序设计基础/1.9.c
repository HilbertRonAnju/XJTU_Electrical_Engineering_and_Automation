#include<stdio.h>
int main()
{
    int n,time=1;
    int a=1,b=2,s=0;
    double A,B;
    double sum=2;
    scanf("%d",&n);
    while(time<=n-1)
    {
		s=a+b;
		a=b;
		b=s;
		B=b;
		A=a;
		sum=sum+(B/A);
		time++;
    }
    printf("%.3f",sum);
    return 0;
}

