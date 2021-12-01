#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int i,j;
	char chara='E';
	for(i=1;i<6;i++)
	{
		chara='E'; 
		for(j=0;j<i;j++)
		{
			printf("%c",chara);
			chara--;
		}
		printf("\n");
	}
	return 0;
}
