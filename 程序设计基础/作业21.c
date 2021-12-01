#include<stdio.h>
int main()
{
	int n,i,j,s;
	scanf("%d",&n); 
	for(i=1;i<=n;i++)
	{
		for(j=1;j<=(i-1);j++)
		{
			printf(" ");
		}
		for(j=1;j<=(n-i+1);j++)
		{
			printf("*");
		}
		if(i<=(n-1))
		{
			printf("\n");
		}
	}
	return 0;
}
