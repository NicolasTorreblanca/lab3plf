%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
extern int yylex();
void yyerror(char * s);
%}

%start s
%token ENTERO
%token EXPONENCIAL
%token DECIMAL
%token SUMA
%token RESTA
%token DIVISION
%token MULTIPLICACION
%token MODULO
%token POTENCIA
%token LOGARITMODECIMAL
%token ABREPAR
%token CIERRAPAR

%%

s: a {YYACCEPT;}|ABREPAR a CIERRAPAR {YYACCEPT;};
a: b SUMA b | b RESTA b | b MULTIPLICACION b | b DIVISION b | LOGARITMODECIMAL c | b MODULO b | b POTENCIA c;
b: ENTERO|EXPONENCIAL|DECIMAL|s;
c: ABREPAR a CIERRAPAR | ABREPAR b CIERRAPAR;

%%

void yyerror(char * s)
{
    printf("An%clisis Sint%cctico incorrecto \n",160,160);
    exit(1);
}

void main(int argc,char *argv[])
{
    if(argc == 1){
        printf("Ingrese texto a analizar:");
        int x = yyparse();
        printf("An%clisis Sint%cctico correcto \n",160,160);
    }
    else{
        printf("Ingreso de par%cmetros en l%cnea de comandos \n",160,161);
        printf("Uso: sintac.exe");
        exit(1);
    }
    
}

