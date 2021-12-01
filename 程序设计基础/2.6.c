/*输入两个多项式格式如下，系数都是浮点数：
2 1.362 1 8.8 2 -5.02 0 30.3
3 6.6 0 0
表示多项式1是 1.362X2+8.8X-5.02X2+30.3 
多项式2是6.6X3 
最后一组数字必须输入并且表示0次幂，
最高幂为16，
输入并不需要按照幂次高低顺序,
同一幂次可多次输入（但是0次幂仅在每个多项式最后一组数字输入），
每个多项式总共不超过30项输入，
输入系数为负数时，
负号后没有空格。
乘法结果不为零。
0次幂的系数为0时也必须出现在输入数据中。 
输出格式：从最高幂开始依次降到0幂，系数为0不输出，输出保留两位小数：
-200X8+300X2-1X1+30
*/
#include<stdio.h>
#include<math.h>
int main()
{
    int cnt=0,sum=0,mi,maxn1=0,maxn2=0,maxans=0,i,j;
    double di;
    double marknum1[20]={0};
    double marknum2[20]={0};
    double ans[40]={0};
    while(1)
	{ 
        scanf("%d%lf",&mi,&di);   
        marknum1[mi]+=di;
        if(mi>maxn1) maxn1=mi;
        if(!mi) break;
    }
    while(1)
	{    
        scanf("%d%lf",&mi,&di);    
        marknum2[mi]+=di;
        if(mi>maxn2) maxn2=mi;
        if(!mi) break;
    }
    for(i=maxn1;i>=0;i--)    
    {
        if(marknum1[i])        
        {
            for(j=maxn2;j>=0;j--)     
            {
                if(marknum2[j])    
                {
                    ans[j+i]+=marknum1[i]*marknum2[j];
                    if(maxans<i+j) maxans=i+j;     
            	}
            }         
        }      
    }
    for(i=39;i>=0;i--)
         
        if(ans[i])
		{   
            if(i!=maxans&&ans[i]>=0) printf("+");
            printf("%.2lf",ans[i]); 
            if(i>0) printf("X");
            if(i>0) printf("%d",i);        
        }
    return 0; 
}
