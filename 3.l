%{
#include<stdio.h>
int flag=0;
%}

%%
[a-zA-Z0-9._]+@[a-z]+".com"|".in"|".gov" 
. {flag=1;}
%%

int yywrap(){
    return 1;
}
int main(){
    printf("Enter a string: ");
    yylex();
    if(flag == 1){
        printf("Invalid Email: ");
    }
    else 
    printf("Valid Email ;-)");
}