#include<stdio.h>
#include<math.h>
#include<string.h>
int main()
{
	int number1,number2,gys,gbs;
	int gongyueshu(int,int);
	int gongbeishu(int,int);
	scanf("%d%d",&number1,&number2);
	gys=gongyueshu(number1,number2);
	gbs=gongbeishu(number1,number2);
	printf("%d\n%d",gys,gbs);
	return 0;
}
int gongyueshu(int number1,int number2)
{
	int middle,end,num1,num2;
	num1=number1;
	num2=number2;
	if(num2>num1)
	{
		middle=num2;
		num2=num1;
		num1=middle;
	}
	while(num1%num2!=0)
	{
		middle=num1;
		num1=num2;
		num2=middle%num2;	
	}
	return num2;
}
int gongbeishu(int number1,int number2)
{
	int gongyueshu(int number1,int number2);
	int num,end;
	num=gongyueshu(number1,number2);
	end=number1*number2/num;
	return end;
}
