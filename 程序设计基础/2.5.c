/*
请按字典顺序罗列前六个大写字母ABCDEF能构成的所有组合。
每个组合中每个字母出现且仅出现一次。
输出格式为每个组合单列一行。
*/
#include<stdio.h>
#include<string.h>
void dfs(int t);
int queue_number[10];
int tag[9]={0};
int n=6;
int main()
{
	dfs(n);
    return 0;
}
void dfs(int t)
{
	int i;
    if(t==0)//可选中的数字个数为0 
    {
        for(i=0;i<n;++i)
		{
            printf("%c",queue_number[i]);
            if(i==n-1)	printf("\n");
        }
    }
    for(i=1;i<=n;++i)
	{
        if(tag[i]==0)
		{
            queue_number[n-t]=i+64;
            tag[i]=1;
            dfs(t-1);//递归,表示的是还可以选中的数的个数
            tag[i]=0;//递归结束之后的结束信号 
        }
    }
}

