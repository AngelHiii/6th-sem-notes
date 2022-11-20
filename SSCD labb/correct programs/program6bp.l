6 b) Write YACC program to recognize valid identifier, operators and keywords in thegiven text (C program) file.

%{
#include<stdio.h>
int idc=0,keyc=0,opc=0;
%}
op [\+\-\*\/\=]
nop [\,\;\""]
letter [a-zA-Z]
digitt [0-9]
id {letter}+|({letter}{digitt})+
notid ({digitt}{letter})+
%%
[ \t\n]+ ;
("int")|("float")|("char")|("case")|("default")|("if")|("for")|("printf")|("scanf") {printf("%s is a keyword\n", yytext);keyc++;}
{id} {printf("%s is an identifier\n", yytext); idc++;}
"+"|"-"|"*"|"/"|"=" {printf( "An operator: %s\n", yytext); opc++;}
{notid} {printf("%s is not an identifier\n", yytext);}
","|";" {;}
%%
int main()
{   
    FILE *fp;
    char file[10];
    printf("\nEnter the filename: ");
    scanf("%s", file);
    fp=fopen(file,"r");
    yyin=fp;
    yylex();
    printf("Total identifiers are: %d\n", idc);
    printf("Total Operators are: %d\n", opc);
    printf("Total Keywords are: %d\n", keyc);
    return 0;
}
