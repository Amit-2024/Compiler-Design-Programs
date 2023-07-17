%{
#include<stdio.h>
int wc=0,sc=0,tc=0,ch=0,lc=0;
%}

%%
[\n] {lc++;ch++}
[\t ] {sc++;ch++;}
[\t] {tc++;ch++;}
[^\n\t ]{wc++;ch+=yyleng;}
%%

int yywrap(){
    return 1;
}
int main(){
    printf("Enter a string: ");
    yylex();

    printf("wc: %d\nsc:%d\ntc:%d\nch:%d\nlc:%d\n",wc,sc,tc,ch,lc);
}
