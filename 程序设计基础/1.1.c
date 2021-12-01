#include<stdio.h>
int main()
{
    int a_number=0,time=0;
    scanf("%d",&a_number);
    while(time<a_number)
    {
        if(time%2==0)
        {
            printf("+");
            time++;
        }
        else
        {
            printf("-");
            time++;
        }
        if(time%15==0)
        {
            printf("\n");
        }
    }
    return 0;
}

