%{
    #include<stdio.h>
%}

%s A B C D

%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN B;
<INITIAL>[^01\n] BEGIN D;
<INITIAL>\n INITIAL; printf("Accepted\n");
<A>1 BEGIN INITIAL;
<A>0 BEGIN C;
<A>[^01\n] BEGIN D;
<A>\n BEGIN INITIAL; printf("Not Accepted\n");
<C>1 BEGIN B;
<C>0 BEGIN A;
<C>[^01\n] BEGIN D;
<C>\n BEGIN INITIAL; printf("Not Accepted\n");
<B>1 BEGIN C;
<B>0 BEGIN INITIAL;
<B>[^01\n] BEGIN D;
<B>\n BEGIN INITIAL; printf("Not Accepted\n");
<D>[^\n] BEGIN D;
<D>\n BEGIN INITIAL ; printf("Invalid String\n");
%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter a Grammer: ");
    yylex();
}