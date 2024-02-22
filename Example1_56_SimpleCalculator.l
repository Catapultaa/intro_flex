%option noyywrap nodefault yylineno
%{
#include "Example1_56_SimpleCalculator.tab.h"
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP; }
")" { return CP; }
"&" { return AND; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+ { yylval = strtol(yytext, NULL, 0); return NUMBER; }
\n { return EOL; }
[ \t]   { /* ignore white space */ }
"//".* {  }
. { printf("Mystery character %c\n", *yytext); }
%%
