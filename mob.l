%{
    //check for frequency
    #include<stdio.h>
    #include<string.h>
    char s[] = "amit";
    int cnt=0;
%}

%%
[a-zA-Z]+ {if(strcmp(yytext,s)==0) cnt++;}
. ;
%%
int yywrap(){
    return 1;
}

int main(){
    extern FILE *yyin;
    yyin = fopen("input.txt","r");
    yylex();
    printf("No of Occurance : %d",cnt);
}