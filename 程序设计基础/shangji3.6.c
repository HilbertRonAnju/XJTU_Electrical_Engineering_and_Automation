#include<stdio.h>
int main()
{
    int a,b,c,i,k=0,j,p,m,l[200]={0};
    scanf("%d%d",&b,&a);
    for(i=0;i<200;i++)
    {
        l[i]=b*10/a;
        b=b*10%a;
    }
    for(i=0;i<199;i++)
    {
        //k=i;
        for(j=i+1;j<200;j++)
        {
            while(l[j]==l[i])
            {
                i++;
                j++;
                m=j-i;
            }
        }
        if(i==200-m)//
        break;
    }
    printf("0.");
    if(m!=0)//循环小数 
    {
        p=k;
        for(i=0;i<p;i++)
        	printf("%d",l[i]);
        printf("T");
        for(i=p;i<p+m;i++)
        	printf("%d",l[i]);
        printf("T");
         
    }
    else//非循环小数 
    	for(i=0;i<200;i++)
    		printf("%d",l[i]);
    return 0;
}
