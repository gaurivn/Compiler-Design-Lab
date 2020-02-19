
%{ 
   #include<stdio.h> 
   #include<stdlib.h> 
%} 
  
%token A B NL 
  
%% 
stmt: S B M  { printf("valid string\n"); 
              exit(0); } 
; 
S: A A S
|
; 

M: B B M
|
;
%% 
  
int yyerror(char *msg) 
 { 
  printf("invalid string\n"); 
  exit(0); 
 } 
  
main() 
 { 
  printf("enter the string\n"); 
  yyparse(); 
 } 

