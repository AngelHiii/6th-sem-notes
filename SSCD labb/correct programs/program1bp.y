1b yacc

%{
#include <stdio.h>
#include <stdlib.h>
/* Yacc Program to evaluate a valid arithmetic Expression (cc lex.yy.c y.tab.c -ll)*/
int yylex();
int yyerror();
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
expr : e { printf(" Result : %d\n",$1); return 0;}
e : e '+' e {$$=$1+$3;}
| e '-' e {$$=$1-$3;}
| e '*' e {$$=$1*$3;}
| e '/' e {$$=$1/$3;}
| '('e')' {$$=$2;}
| NUM {$$=$1;}
; 
%%
void main()
{ 
    printf(" Type the Expression & Press Enter key\n");
    yyparse();
    printf(" Valid Expression \n");
} 
int yyerror()
{ 
    printf(" Invalid Expresion!!!!\n");
    exit(0); 
}