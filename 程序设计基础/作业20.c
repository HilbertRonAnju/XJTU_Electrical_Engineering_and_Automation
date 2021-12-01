#include<stdio.h>
#define INWARD 0
#define OUTWARD 1
int main()
{
	int nline=0,nword=0,nchar=0,state=0;
	char c;
	while((c=getchar())!='*')
	{
		++nchar;
		if(c=='\n')
		{
			nline++;	
		}
		if((c==' ')||(c=='\n')||(c=='\t')||(c=='\r'))
		{
			state=OUTWARD;
		}
		else
		{
			if((c>='A'&&c<='Z')||(c>='a'&&c<='z'))
			{
				if(state==OUTWARD)
				{
					nword++;
					state=INWARD;
				}
				state=INWARD;
			}
		}
	}
	printf("%d %d %d",nline,nword+1,nchar);
	return 0; 
}


