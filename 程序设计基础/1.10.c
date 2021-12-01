#include<stdio.h>
int main()
{
    int a_number,a,b,c,t=0,number;
    scanf("%d",&number);
    a_number=number;
    while((a_number<=999)&&(a_number>=number))
    {
    	a=a_number/100;
    	b=(a_number-a*100)/10;
    	c=a_number-a*100-b*10;
        if(a_number==a*a*a+b*b*b+c*c*c)
        {
            printf("%d ",a_number);
            t++;
        }
        a_number++;
    }
    return 0;
}
