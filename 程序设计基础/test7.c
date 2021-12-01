#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	char chara;
	int i,j;
	for(i=1;i<=5;i++)
	{
		chara='A';
		for(j=0;j<5-i;j++)
		{
			printf(" ");
		}
		for(j=5-i;j<5;j++)
		{
			printf("%c",chara);
			chara++;
		}
		chara=chara-1;
		for(j=0;j<i-1;j++)
		{
			chara--;
			printf("%c",chara);
		}
		printf("\n");
	}
	return 0;
}
