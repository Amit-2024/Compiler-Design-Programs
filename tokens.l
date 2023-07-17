%{
    #include<stdio.h>
    int tokens=0;
%}

%%
"if"|"while"|"else"|"for"|"int"|"float" {tokens++; printf("Keyword: %s\n",yytext);}
"+"|"-"|"++"|"--"|"/"|"*" {tokens++; printf("Operator: %s\n",yytext);}
[{}() \t;] {tokens++; printf("Separator: %s\n",yytext);}
[a-zA-Z_]+[a-zA-Z]+ {printf("Identifier: %s\n",yytext);}
[0-9]+ {printf("Integer: %s\n",yytext);}
[0-9]*"."[0-9]+ {printf("Float : %s\n",yytext);}
. ;
%%

int yywrap(){
    return 1;
}

int main(){
    extern FILE *yyin;
    yyin = fopen("armstrong.l","r");
    yylex();
    printf("Total tokens: %d",tokens);

    return 0;
}