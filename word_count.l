%{
#include<stdio.h>
int countword=0;
%}

%%
[a-zA-Z0-9]+ {countword++;}
. ;
%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter a string: ");
    yylex();
    printf("total word: %d",countword);
}
