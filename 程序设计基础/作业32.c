#include<stdio.h>
#include<string.h>
#include<math.h>
int main()
{
    char c[200];
    int a[200]={0};
	int i=0,j=0;
	gets(c);
	for(i=0;c[i]!='\0';i++)
	{
		int m=c[i];
		int n=c[i+1];
		if(m>47&&m<58)
		{
			a[j]=c[i];
			printf("%c",a[j]);
			j++;
			if(n<=47||n>58)
			{
				printf(" ");
			}
		}
	}
    return 0;
}

