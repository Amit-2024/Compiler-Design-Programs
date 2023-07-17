%{
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid Identifier\n");}
^[^a-zA-Z_]  {printf("Invalid\n");}
.;
%%

int yywrap(){return 1;}

int main(){
    yylex();
    return 0;
}