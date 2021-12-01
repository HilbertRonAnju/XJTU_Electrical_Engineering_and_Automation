#include <stdio.h>
int main()
{
    unsigned int number,i,b=10,part;
	scanf("%d",&number);
	while(number/10!=0)
	{
		for(i=1;number/b!=0;i++)
		{
			b=b*10;
		}
		part=number/(b/10);
		printf("%d",part);
		putchar('*');
		number=number%(b/10);
		b=10;
	}
	printf("%d",number);
    return 0;
}
