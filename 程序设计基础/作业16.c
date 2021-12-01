#include<stdio.h>
int main()
{
	char a;
	scanf("%c",&a);
	if((a>=65&&a<=90)||(a>=97&&a<=122))
	{
		printf("×ÖÄ¸±í\n");
		if(a>=65&&a<=90)
		a=a+32;
		else
		a=a;
		while(a>=97&&a<=122)
		{
			printf("%c\t%c\n",a,a-32);
			a++;
		}
	}
	else
	printf("Error!");	
	return 0;
}
