%{
    #include<stdio.h>  
    #include<string.h>
    #include<math.h>
    void check(char *ch);
%}

%%
[0-9]+ {check(yytext);}
%%
int yywrap(){
    return 1;
}
void check(char *s){
    int len = strlen(s);
    int num = atoi(s);
    int temp = num;
    int x = 0;

    while(temp!=0){
        int n = (temp%10);
        x = x + pow(n,len);
        temp=temp/10;
    }
    if(x==num){
        printf("It is ArmStrong!!");
    }else printf("Not a ArmStrong");
}

int main(){
    printf("Enter a number: ");
    yylex();
}