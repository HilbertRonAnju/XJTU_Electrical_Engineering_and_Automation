#include<stdio.h>

#include<string.h>

#define out 0

#define in 1

int main()

{

	int change(int *q,int n);

	char a[50],*p=a;

	gets(a);

	int i,j,k,m,b[50],c[50],x=0,u=0,n,f=out;

	for(i=0;i<50;i++)

	{

		if(*(p+i)<'0'||*(p+i)>'9')

			f=out;

		else if(f==out)

		{

			f=in;

			for(j=i;*(p+j)>='0'&&*(p+j)<='9';j++)

			{

			 b[j-i]=(*(p+j)-'0');

			m=j-i+1;

			}

			c[x]=change(b,m);

			x++;

		}

	}

	for(i=0;i<x-1;i++)

		printf("%d ",c[i]);

	return 0;

}

int change(int *q,int n)

{

	int sum=0,l=1,i,j,p;

	for(i=n-1;i>=0;i--)

	{

		q[i]=q[i]*l;

		sum+=q[i];

		l=l*10;

	}

		return sum;

}

