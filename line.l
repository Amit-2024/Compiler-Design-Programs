%{
    #include<stdio.h>
    int lineno=1;
%}
line .*\n
%%
{line}  {printf("%d %s",lineno++,yytext);}
%%
int yywrap(){
    return 1;
}

int main(){
    extern FILE *yyin;

    yyin  = fopen("input.txt","r");
    yylex();

    return 0;
}