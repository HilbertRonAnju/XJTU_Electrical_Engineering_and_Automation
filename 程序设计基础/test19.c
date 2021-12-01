#include<stdio.h>
int main()
{
	int x[10][10]={{1},{1,1}};
	int i,j;
	printf("%d\n%d\t%d\n",x[0][0],x[1][0],x[1][1]);
	for(i=2;i<10;i++)
	{
		x[i][i]=1;
		x[i][0]=1;
		printf("%d\t",x[i][0]);
		for(j=1;j<i;j++)
		{
			x[i][j]=x[i-1][j-1]+x[i-1][j];	
			printf("%d\t",x[i][j]);
		}
		printf("%d",x[i][i]);
		printf("\n");
	}
	return 0;
}
