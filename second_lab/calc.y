%{
  #include<stdio.h>
  int flag=0;
%}

%token NUM

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

%%
  AExp: E{
    printf("\nResult: %d\n", $$);
    return 0;
    };
E:E'+'E {$$=$1+$3;}

 |E'-'E {$$=$1-$3;}

 |E'*'E {$$=$1*$3;}

 |E'/'E {$$=$1/$3;}

 |E'%'E {$$=$1%$3;}
 
 |'('E')' {$$=$2;}
 
 | NUM {$$=$1;}

 ;

%%

void main() 
{ 
   printf("\nEnter an arithmetic expression: "); 
  
   yyparse(); 
   if(flag==0) 
   printf("\nValid\n"); 
} 
  
void yyerror() 
{ 
   printf("\nInvalid\n"); 
   flag=1; 
} 
 
