#include<stdlib.h>
#include<stdio.h>
int main()
{
	void input(double *v1,int n);
	void sortdata(double *v1,int n);
	void plussort(double *v1,double *v2,double *v3,int n);
	int n=0,i=0;
	scanf("%d",&n);
	double *x,*y,*z;
	x=(double *)malloc(n*sizeof(double));
	y=(double *)malloc(n*sizeof(double));
	z=(double *)malloc(n*sizeof(double));
	input(x,n);
	input(y,n);
	sortdata(x,n);
	sortdata(y,n);
	plussort(x,y,z,n);
	printf("%.2f",*z);
	for(i=1;i<n;i++)
		printf(" %.2f",*(z+i));
	free(x);
	free(y);
	free(z);
    return 0;
}
void input(double *v1,int n)
{
	int i,j;
	for(i=0;i<n;i++)
		scanf("%lf",v1+i);	
}
void sortdata(double *v1,int n)
{
	int i,j;
	double t;
	for(i=0;i<n-1;i++)
	{
		for(j=0;j<n-1-i;j++)
		if(*(v1+j)<*(v1+j+1))
		{
			t=*(v1+j);
			*(v1+j)=*(v1+j+1);
			*(v1+j+1)=t;
		}
	}
}
void plussort(double *v1,double *v2,double *v3,int n)
{
	int i;
	for(i=0;i<n;i++)
		*(v3+i)=*(v2+i)+*(v1+i);
}
