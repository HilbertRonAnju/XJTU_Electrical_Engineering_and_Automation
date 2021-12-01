#include<stdio.h>
void input(char a[])
{
	int t;
	int i = 0;
	t=getchar();
	while ( t!='\n' )
	{
		a[i] = (char) t;
		i++;
		t = getchar();
	}
	a[i] = '\0';
}
int mystrcmp(char a[], char b[])
{
	int i;
	for(i = 0; (a[i] == b[i]) && (a[i] != '\0') && (b[i] != '\0'); i++);
	return (int)(a[i]-b[i]);
}
int main()
{
		char a[100], b[100];
		int result;
		char t;
		input(a);
		input(b);
		result = mystrcmp(a,b);
		printf("%d", result);
		return 0;
}
