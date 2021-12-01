#include<stdio.h>
int main()
{
    int a_number,sum=0,time=1,number;
    double average,SUM;
    scanf("%d",&a_number);
    while(time<=a_number)
    {
        printf("请输入第%d个数：",time);
        scanf("%d",&number);
        if(number>=0)
        {
            sum=sum+number;
            time++;
        }
        else
        {
            while(number<=0)
            {
                printf("请重新输入第%d个数：",time);
                scanf("%d",&number);
            }
            sum=sum+number;
            time++;
        }
    }
    SUM=sum;
    average=SUM/a_number;
    printf("这%d个数的和是%d，平均值是%.2f。",a_number,sum,average);
    return 0;
}

