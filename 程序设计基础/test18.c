#include<stdio.h>
int main()
{
	int x[]={12,3,2,34,234,12,3,12,3,12,34,234,1,4,34,234,1,3,40,98,7,28,97,89,12,23,142,32413,5124,43,32,4,123,12,34,235,66,768,44,47,3,4,6,563456,26,2345,23,45,6,56,457,45,562,35,262,345,2345,56,23};
	int i,j,len,middle;
	len=sizeof(x)/sizeof(x[0]);
	for(i=0;i<len;i++)
	{
		for(j=0;j<len-i;j++)
		{
			if(x[j]>x[j+1])
				{
					middle=x[j+1];
					x[j+1]=x[j];
					x[j]=middle;
				}
		}
	}
	for(i=0;i<=len;i++)
	{
		printf("%d\n",x[i]);
	}
	return 0;
}
