%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token A B
%%
str: s'\n' {printf("Valid String\n");}
;
s : x B
;
x : x A
| A
;
%%
int main()
{   
    printf(" Type the String ?\n");
    if(!yyparse())
    printf(" Valid String\n ");
    return 0;
}
int yyerror()
{ 
    printf(" Invalid String.\n");   
    exit(0);
}