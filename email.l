%{
    int flag=0;
%}

%%
((http|ftp))s?:\/\/(www)"."[a-zA-Z0-9]+"."[a-zA-Z]{2,3}("."[a-zA-Z]{2})* 
.+ {flag=1;}
%%

int yywrap(){return 1;}

int main(){
    printf("Enter a mail addres: ");
    yylex();
    if(flag==1) printf("InValid\n");
    else printf("Valid");
}