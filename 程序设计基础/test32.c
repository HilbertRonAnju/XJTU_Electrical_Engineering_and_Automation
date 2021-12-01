/*假定已经有三个学生信息，现在需要补充第四个学生的信息。
要求：
（1） 用数组存储学生信息，包括学号、班级、三门课程的成绩、三门课程的总成绩；
（2） 补充输入第四个学生信息后，按照班级从小到大的先后排序输出学生信息，
同一班级内按照总成绩从低到高输出。成绩保留1位小数。
（3） 已有的三个学生信息可以在数组初始化时静态赋值，已有的三个学生的信息是：
1001，11，92.5，82.5，96，271
1002，12，82.5，87.5，93.5，263.5
1003，13，97，84.5，88.5，270

第四个学生信息输入示例：
1004
12
95.8
85.6
74.9

输出示例：
1001，11，92.5，82.5，96.0，271.0
1004，12，95.8，85.6，74.9，256.3
1002，12，82.5，87.5，93.5，263.5
1003，13，97.0，84.5，88.5，270.0*/
#include<stdio.h>
int main()
{
	int i;
	int num[4]={1001,1002,1003},classnum[4]={11,12,13};
	double subject1[4]={92.5,82.5,97},subject2[4]={82.5,85.6,87.5},subject3[4]={96,74.9,93.5};
	double sum[4];
	scanf("%d%d%lf%lf%lf",&num[3],&classnum[3],&subject1[3],&subject2[3],&subject3[3]);
	for(i=0;i<4;i++)
	{
		sum[i]=subject1[i]+subject2[i]+subject3[i];
	}
	for(i=0;i<4;i++)
	{
		if(classnum[i]<classnum[4])
			printf("%d,%d,%.3f,%.3f,%.3f,%.3f\n",num[i],classnum[i],subject1[i],subject2[i],subject3[i],sum[i]);	
		else if(classnum[i]==classnum[4])
			{
				if(sum[i]<=sum[4])
					printf("%d,%d,%.3f,%.3f,%.3f,%.3f\n",num[i],classnum[i],subject1[i],subject2[i],subject3[i],sum[i]);
			}
		else if(classnum[i]==classnum[4])
			printf("%d,%d,%.3f,%.3f,%.3f,%.3f\n",num[i],classnum[i],subject1[i],subject2[i],subject3[i],sum[i]);
	}
	return 0;
}
