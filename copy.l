%{
    #include<stdio.h>
    #include<string.h>
    char ch[100];
%}

%%
[\n] {fprintf(yyout,"%s\n",ch);}
.* {strcpy(ch,yytext);}
<<EOF>> {fprintf(yyout,"%s",ch);return 0;}
%%

int yywrap(){
    return 1;
}

int main(){
    extern FILE *yyin,*yyout;

    yyin  = fopen("input.txt","r");
    yyout = fopen("output.txt","w");
    yylex();

    return 0;
}