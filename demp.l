%{
%}

%%
^[0-9]* printf("digit");
^[^0-9]|[0-9]*[a-zA-Z] printf("Not digit");
. ;
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}