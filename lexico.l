%{

#include <stdio.h>
#include "y.tab.h"

%}

NUMEROS [0-9] 

%option noyywrap

%%
\n {;}/* Reconocimiento de los Simbolos de la Gramatica */
{NUMEROS}+ {return ENTERO;}
{NUMEROS}+"."{NUMEROS}+ {return DECIMAL;}
{NUMEROS}+"^"{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"^"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"."{NUMEROS}+"^"{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"."{NUMEROS}+"^"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+ {return ENTERO;}
"-"{NUMEROS}+"."{NUMEROS}+ {return DECIMAL;}
"-"{NUMEROS}+"^"{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"^"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"."{NUMEROS}+"^"{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"."{NUMEROS}+"^"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"^""-"{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"^""-"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"."{NUMEROS}+"^""-"{NUMEROS}+ {return EXPONENCIAL;}
{NUMEROS}+"."{NUMEROS}+"^""-"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"^""-"{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"^"{NUMEROS}+".""-"{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"."{NUMEROS}+"^""-"{NUMEROS}+ {return EXPONENCIAL;}
"-"{NUMEROS}+"."{NUMEROS}+"^""-"{NUMEROS}+"."{NUMEROS}+ {return EXPONENCIAL;}
"logdec" {return LOGARITMODECIMAL;}
"+" {return SUMA;}
"-" {return RESTA;}
"*" {return MULTIPLICACION;}
"/" {return DIVISION;}
"(" {return ABREPAR;}
")" {return CIERRAPAR;}
"%" {return MODULO;}
"^" {return POTENCIA;}
. {;}

%%