#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	char c;
	int x,kongge=0,num=0,rest=0,chara=0;
	while((c=getchar())!='\n')
	{
		if(c==' ')
			kongge++;
		else if((c<='Z'&&c>='A')||(c<='z'&&c>='a'))
			chara++;
		else if(c<='9'&&c>='0')
			num++;
		else 
			rest++;
	}
	printf("%d\t%d\t%d\t%d",kongge,chara,num,rest);
	return 0;
}
