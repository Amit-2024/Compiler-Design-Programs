%{
%}
%s A B D
%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n] BEGIN D;
<INITIAL>\n BEGIN INITIAL; printf("Divisible\n");
<A>0 BEGIN B;
<A>1 BEGIN INITIAL;
<A>[^01\n] BEGIN D;
<A>\n BEGIN INITIAL; printf("Not Divisible\n");
<B>0 BEGIN A;
<B>1 BEGIN B;
<B>[^01\n] BEGIN D;
<B>\n BEGIN INITIAL; printf("Not Divisible\n");
<D>[^\n] BEGIN D;
<D>\n BEGIN INITIAL ; printf("INVALID\n");
%%

int yywrap()
{
    return 1;
}

int main(){
    yylex();
    return 0;
}