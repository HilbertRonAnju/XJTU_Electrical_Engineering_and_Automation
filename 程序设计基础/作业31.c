/*
第七章第十题
单词只由字母组成

输入格式

This is                          another             tree!

输出格式

another*/
#include<stdio.h>
#include<string.h>
int main()
{ 
    int tonji(char s[]);
    char str[100];
    gets(str);
    tonji(str);
    return 0;
}
 
int tonji(char s[])
{
    int i,flag=1,point,place=0,length=0,len=0;
    strcat(s, " ");
    for(i=0;s[i]!='\0';i++)
    {
        if(s[i]!=' ')
        { 
            if(flag)
            {
                point=i;
				flag=0;  
            }
            else
                len++;       
        }
        else
        {
            flag=1;
            if(len>length)        
            {
                length=len;
                place=point;     
                len=0;    
            }
        }
    }
    for(i=place;s[i]!=' ';i++)
        printf("%c",s[i]);
    return 0;
}
