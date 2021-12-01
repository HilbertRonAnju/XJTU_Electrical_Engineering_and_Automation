#include<stdio.h>
int ppp;// 一个小数中非循环部分的个数 
int *whex(int a[400],int tmp[100])//为什么函数类型要定义成指针类型？因为若不是循环小数需要输出循环节 
{
    int i,j;
    int ti,tj;//循环节判定中用作循环的中间量，有两个变量是因为要同时对比两个循环节 
    int N=0;//循环节计数器 
    tmp[0]=-1;//该数组代表循环小数的循环节，同时作为判断是否是循环小数的标志 
    for(i=1;i<400;i++)//遍历小数部分的每一个数字，将其作为循环的开头 
    {
        for(j=0;j<i&&a[i]!=a[j];j++);//寻找第一个与循环开头相等的数字 
        	if(j!=i)
        	{
        		ppp=j;//记下j的大小 
				ti=i;tj=j;//定义循环节的开头部分，结束部分 
            	tmp[N]=a[i];//假定本次循环的数字是循环节的开头 
            	N++;ti++;tj++;
            	for(;tj<i;tj++,ti++)
            	{
                	if(a[ti]!=a[tj])
                	{
                    	tmp[0]=-1;
                    	N=0;//清空已经录入的循环节 
                    	break;//结束循环， 
                	}
                	else
                	{
                    	tmp[N]=a[tj];
                    	N++;
                	}
            	}//第三个循环的for 
            	if(tj==i)//循环结束，没有找到循环节 
            	{
                	tmp[N]=-999;//表示没有找到循环节 
                	return tmp;
            	}
        	}//第二个循环只包含一个很大的if 
    }
    return tmp;
}
int main()
{
    int i, bc, ch;
    int a[400], tmp[100], *t;
    scanf("%d%d",&bc,&ch);//输入被除数与除数 
    bc*=10;//被除数乘10 
    for(i=0;i<400;i++)
    {
        a[i]=bc/ch;//储存余数 
        bc=bc%ch*10;//余数乘10 
    }
    t=whex(a,tmp);//判断是否为循环小数 
    if(*t==-1)//参数T就是函数中的形参tmp 
	//为什么这里要用指针？ 
	//在这里，指针不只是用来判定小数是否循环，函数所属出的数中还包含循环小数的循环节 
    {
        printf("0.");
        for(i=0;i<200;i++)
            printf("%d",a[i]);
    }
    else
    {
        printf("0.");
        for(i=0;i<ppp;i++)
            printf("%d",a[i]);//输出循环小数中起始的非循环部分 
        printf("T");
        for(i=0;t[i]!=-999;i++)//输出循环部分 
            printf("%d",t[i]);
        printf("T");
    }
    return 0;
}
/*for(i=0;i<400;i++)
    {
        printf("%d",a[i]);
    }*/
          /*ti++;
            tj++;
            while (a[ti]==a[tj] && a[ti]!=a[i])
            {
                tmp[N]=a[ti];
                N++;
                ti++;
                tj++;
            }   
            if(a[ti]==a[i])
            {
                tmp[N]=-999;
                ppp=j;
                return tmp;
            }
            else
            {
                tmp[0]=-1;
                N=0;
            }
        }*/
