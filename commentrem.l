%{
    #include<stdio.h>
    int count=0;
%}

%%
"/*"[a-zA-Z0-9 \t\n]+"*/" {count++;}
"//"[a-zA-Z0-9\t ]+ {count++;}
. {fprintf(yyout,"%s",yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    extern FILE *yyin,*yyout;

    yyin  = fopen("demo.c","r");
    yyout = fopen("output1.c","w");
    yylex();
    printf("Total comments : %d",count);
    return 0;
}