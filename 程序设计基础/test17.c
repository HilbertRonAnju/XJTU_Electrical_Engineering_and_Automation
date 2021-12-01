#include<stdio.h>
int main()
{
	char x[3]={'A','B','C'},y[3]={'X','Y','Z'};
	int i,j;
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			if(i==0&&j==0)
				continue;
			else if(i==2&&(j==0||j==2))
				continue;
			else
				printf("%cÓë%c±ÈÈü\n",x[i],y[j]);
		}
	}
	return 0;
}
