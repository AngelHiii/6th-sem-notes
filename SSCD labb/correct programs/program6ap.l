6 a) Write a LEX program to eliminate comment lines in a C program and copy the resulting program into a separate file


%x CMNT     //create a input file(abc.txt) and then type something with commentlines and 
%%          //compile and put ./a.out abc.txt bcd.txt so u wil get rest code without commentline in op file
"/*" {BEGIN CMNT;}
<CMNT>. ;
<CMNT>\n ;
<CMNT>"*/" {BEGIN 0; }
%%
void main(int argc, char *argv[])
{ 
    if(argc !=3)
    { 
        printf(" Usage: %s<src file><dst file>\n",argv[0]);
        return;
    } 
    yyin=fopen(argv[1],"r");
    yyout=fopen(argv[2],"w");
    yylex();
} 