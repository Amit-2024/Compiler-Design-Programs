%{
    #include<stdio.h>
%}

%s A B D

%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n] BEGIN D;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted\n");

<A>0 BEGIN INITIAL;
<A>1 BEGIN B;
<A>[^01\n] BEGIN D;
<A>\n BEGIN INITIAL; printf("Not Accepted\n");

<B>0 BEGIN INITIAL;
<B>1 BEGIN B;
<B>[^01\n] BEGIN D;
<B>\n BEGIN INITIAL ; printf("Accepted\n");

<D>0 BEGIN D;
<D>1 BEGIN D;
<D>\n BEGIN INITIAL; printf("Invalid String");
%%
int yywrap(){
    return 1;
}

int main(){
    printf("Enter a Grammer: ");
    yylex();
}
