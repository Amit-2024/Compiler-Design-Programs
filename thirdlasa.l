%{
    #include<stdio.h>
%}
%s A B C D E F G DEAD
%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<A>a BEGIN B;
<A>b BEGIN C;
<B>a BEGIN D;
<B>b BEGIN E;
<C>a BEGIN F;
<C>b BEGIN G;
<D>a BEGIN D;
<D>b BEGIN E;
<E>a BEGIN F;
<E>b BEGIN G;
<F>a BEGIN B;
<F>b BEGIN C;
<G>a BEGIN A;
<G>b BEGIN INITIAL;
<INITIAL>\n BEGIN INITIAL ; printf("NOT Accepted\n");
<A>\n BEGIN INITIAL ; printf("NOT Accepted\n");
<B>\n BEGIN INITIAL ; printf("NOT Accepted\n");
<C>\n BEGIN INITIAL ; printf("NOT Accepted\n");

<D>\n BEGIN INITIAL ; printf("Accepted\n");
<E>\n BEGIN INITIAL ; printf("Accepted\n");
<F>\n BEGIN INITIAL ; printf("Accepted\n");
<G>\n BEGIN INITIAL ; printf("Accepted\n");

<INITIAL>[^ab\n] BEGIN DEAD;
<A>[^ab\n] BEGIN DEAD;
<B>[^ab\n] BEGIN DEAD;
<C>[^ab\n] BEGIN DEAD;
<D>[^ab\n] BEGIN DEAD;
<E>[^ab\n] BEGIN DEAD;
<F>[^ab\n] BEGIN DEAD;
<G>[^ab\n] BEGIN DEAD;

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; printf("INVALID EXPRESSION\n");
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}