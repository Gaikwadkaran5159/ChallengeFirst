#include<stdio.h>
#include<string.h>

#define max 10

int roll[max];
char name[max][50];
int rear=0;
int front=0;
int count=0;

void enque()
{
    if(count==max)
        printf("\n Queue Is Full / Can Not Add More Students ");
    else
    {
        printf("\n Enter Roll No >> ");
        scanf("%d",&roll[rear]);
        printf(" Enter Name Of Student >> ");
        scanf("%s",name[rear]);
        rear=(rear+1)%max;
        count++;
        printf(" Student Added Successfully ... ");
    }
}

void deque()
{
    if(count==0)
        printf("\n Queue Is Empty ");
    else
    {
        printf("\n Bus Pass Distrebuted To >> ");
        printf("\n\t\t\t\tRoll No >> %d",roll[front]);
        printf("\n\t\t\t\tName Of Student >> %s",name[front]);
        front=(front+1)%max;
        count--;
    }
}

void display()
{
    int i;

    if(count==0)
        printf("\n No Student Waiting ");
    else
    {
        printf("\n Waiting Students List >> ");
        for(i=0;i<count;i++)
        {
            printf("\n\n\t\t\tRoll >> %d",roll[(front+i)%max]);
            printf("\n\t\t\tName >> %s",name[(front+i)%max]);
        }
    }
}

void main()
{
    int choice;

    do
    {
         printf("\n\nBus Pass Distribution System ");
        printf("\n 1 >> Add Students \n 2 >> Distribute  Bus Pass \n 3 >> Show Waiting Students \n 4 >> Exit...\n\n ");
        printf("\n Enter Your Choice >> ");
        scanf("%d",&choice);
        switch(choice)
        {
            case 1: enque(); break;
            case 2: deque(); break;
            case 3: display(); break;
            case 4: printf("\n System Exiting..."); break;
            default: printf("\n Invalid Choice ");
        }
    }
    while(choice!=11);

}
