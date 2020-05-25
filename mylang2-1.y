%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
#define PI 3.14
#define CONST 1.33
#define CONST1 0.33
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token give me conversion of to  byte kilobyte megabyte gigabyte
%type <real> S E U F X Q

%%
//ResultExpression:S{printf("Your Answer is %f",$$);};
S: give me conversion of E{$$=$5;};
E: byte to  X {$$=$3;}
   |kilobyte to U            {$$=$3;}
   |megabyte to F           {$$=$3;}
   |gigabyte to Q           {$$=$3;}
   ;
X: kilobyte of NUMBER      {$$=$3/pow(2 , 10); printf("Kilobyte of %d  Byte is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3/pow(2 , 20); printf("Megabyte of %d  Byte is %f\n",$3,$$);};
  |gigabyte of NUMBER	   {$$=$3/pow(2 , 30); printf("Gigabyte of %d  Byte is %f\n",$3,$$);};
  
U: byte of NUMBER          {$$=$3*pow(2 , 10); printf("Byte of %d Kilobyte is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3/pow(2 , 10); printf("Megabyte of %d Kilobyte is %f\n",$3,$$);};
  |gigabyte of NUMBER      {$$=$3/pow(2 , 20); printf("Gigabyte of %d Kilobyte is %f\n",$3,$$);};
  
F: byte of NUMBER          {$$=$3*pow(2 , 20); printf("Byte of %d Megabyte is %f\n",$3,$$);};
  |kilobyte of NUMBER      {$$=$3*pow(2 , 10); printf("Kilobyte of %d Megabyte is %f\n",$3,$$);};
  |gigabyte of NUMBER      {$$=$3/pow(2 , 10); printf("Gigabyte of %d Megabyte is %f\n",$3,$$);};
  

Q: byte of NUMBER          {$$=$3*pow(2 , 30); printf("Byte of %d Gigabyte is %f\n",$3,$$);};
  |kilobyte of NUMBER      {$$=$3*pow(2 , 20); printf("Kilobyte of %d Gigabyte is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3*pow(2 , 10); printf("Megabyte of %d  Gigabyte is %f\n",$3,$$);};
  

%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=6;i++){
yyparse();
}
fclose(yyin);
return 0;
}
