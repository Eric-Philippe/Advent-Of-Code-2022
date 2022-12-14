#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char slice[700][700]={0};

int runPartTwo (int argc, char * argv[])
{
    char *filename = "input";
    long result=0;
    char buf[300];
    char *p;
    int xSand,xe,ySand,ye,i;
    int max=0;
    FILE * fp;
    if(argc > 2)
        filename=argv[2];
    if((fp = fopen (filename, "r"))==NULL)
    {
        printf("error opening file %s\n", filename);
        return 1;
    }
    while(fgets(buf, 300, fp) != NULL)
    {
        p=strtok(buf,",>");
        xSand=atoi(p);
        p=strtok(NULL,",>");
        ySand=atoi(p);
        for(p=strtok(NULL,",>");p!=NULL;p=strtok(NULL,",>"))
        {
            xe=atoi(p);
            p=strtok(NULL,",>");
            ye=atoi(p);
            if(ye>max)
                max=ye;
            while((xSand!=xe)||(ySand!=ye))
            {
                slice[xSand][ySand]=5;
                if(xSand<xe)
                    xSand++;
                else if(xSand>xe)
                    xSand--;
                else if(ySand<ye)
                    ySand++;
                else if(ySand>ye)
                    ySand--;
            }
                slice[xSand][ySand]=5;

        }
   }
       for(int x=0;x<700;x++)
           slice[x][max+2]=5;

        for(i=0;;i++)
        {
            xSand=500;
            ySand=0;
            while(1)
            {
                if(ySand>max+3)
                    break;
                if(slice[xSand][ySand+1]==0)
                {
                    ySand++;
                    continue;
                }
                if(slice[xSand-1][ySand+1]==0)
                {
                    xSand--;
                    ySand++;
                    continue;
                }
                if(slice[xSand+1][ySand+1]==0)
                {
                    xSand++;
                    ySand++;
                    continue;
                }
                slice[xSand][ySand]=1;
                break;
            }
            if(((xSand==500)&&(!ySand))||(ySand>max+3))
                break;
        }
        i++;
    result=i;
    printf("%ld\n",result);
    return 0;
}