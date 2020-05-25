%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		yylval.integer=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]+ {
		yylval.real=(float)atof(yytext); 
		return FLOAT;
		}
give   {return give;}
me   {return me;}
conversion   {return conversion;}
of   {return of;}
to   {return to;}
megabyte    {return megabyte;} 
gigabyte		{return gigabyte;}
byte		{return byte;}
kilobyte		{return kilobyte;}
[\n]	{return yytext;}
[/t]	;
%%
int yywrap(){return 1;}
