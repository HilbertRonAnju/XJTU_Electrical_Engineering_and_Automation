#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	char x[100]={0},y[100]={0};
	int i,j=0,len;
	gets(x);
	len=strlen(x);
	i=1;
	while(j<len)
	{
		y[len-i]=x[j];
		i++;
		j++;
	}
	printf("%s",y);
	return 0;
}
