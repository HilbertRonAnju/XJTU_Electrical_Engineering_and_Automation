/*
请注意在本机的换行是\n一个字符，在服务器是\r\n两个字符。

可以用

while( ( getcharegg ) != '\n )

;

试一下

有10个学生，每个学生的数据包括学号、姓名、三门课的成绩，从键盘输入学生数据，姓名可能有空格。

1、用结构体数组实现

2、编写input函数，输入一个学生的数据

3、编写output函数，输出一个学生的数据

4、输出三门课总平均成绩（所有学生所有成绩的平均值）

5、输出三门课总成绩最高的学生的信息

6、用重定向和键盘输入都尝试实现

输入格式为

2019001
Xue Sheng 1
88.5 88.0 88.5
2019002
Xue Sheng 2
88.0 92.0 86.0
2019003
Xue Sheng 3
86.5 91.5 93.5
2019004
Xue Sheng 4
90.5 95.0 87.0
2019005
Xue Sheng 5
93.5 89.0 94.0
2019006
Xue Sheng 6
83.0 91.5 92.5
2019007
Xue Sheng 7
88.0 84.5 92.0
2019008
Xue Sheng 8
81.5 92.5 87.5
2019009
Xue Sheng 9
86.5 93.5 82.0
2019010
Xue Sheng 10
92.5 90.0 88.0
输出格式保留两位小数为

The average score of all of the courses is 89.233333
The information of the sutdent with the highest score is:
2019005,Xue Sheng 5,93.50,89.00,94.00
*/
#include<stdio.h>
#include<math.h>
#include<string.h>
struct student
{
	char name[20];
	double num;
	double sub[3];
};
void input(struct student stu[]);
void print(struct student stu[]);
double average(struct student stu[]);
struct student max(struct student stu[]);
int main()
{
	struct student stu[10],*p=stu;
	input(p);
	print(p);
	return 0;
}
void input(struct student stu[])
{
	int i,j=0;
	for(i=0;i<10;i++)
	{
		scanf("%lf",&stu[i].num);
		while((stu[i].name[j]=getchar())!='\n'&&(stu[i].name[j]=getchar())!='\r')
		{
			j++;
		}
		for(j=0;j<3;j++)
		{
			scanf("%lf",&stu[i].sub[j]);
		}
	}
}
void print(struct student stu[])
{
	struct student *p;
	p=stu;
	printf("The average score of all of the courses is %lf\n",average(p));
	printf("The information of the sutdent with the highest score is:\n%.0f,%s,%.2f,%.2f,%.2f",max(p).num,max(p).name,max(p).sub[0],max(p).sub[1],max(p).sub[2]);
}
double average(struct student stu[])
{
	double sum=0,aver;
	int i;
	for(i=0;i<10;i++)
	{
		sum=sum+stu[i].sub[0]+stu[i].sub[1]+stu[i].sub[2];
	}
	aver=sum/30;
	return aver;
}
struct student max(struct student stu[])
{
	int i,m=0;
	double sum[10];
	for(i=0;i<10;i++)
	{
		sum[i]=stu[i].sub[0]+stu[i].sub[1]+stu[i].sub[2];
	}
	for(i=0;i<10;i++)
	{
		if(sum[i]>sum[m])
			m=i;
	}
	return stu[m];
}
