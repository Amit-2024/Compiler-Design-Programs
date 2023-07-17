%{
    #include<stdio.h>
    int neg=0,pos=0;
    int negfrac=0,posfrac=0;
%}

%%
[0-9]+ {pos++;}
[-][0-9]+ {neg++;}
[+]?[0-9]*"."[0-9]+ {posfrac++;}
[-][0-9]*"."[0-9]+ {negfrac++;}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    printf("Neg: %d\n",neg);
    printf("pos: %d,negfrac: %d,posfrac: %d\n",pos,negfrac,posfrac);  
}