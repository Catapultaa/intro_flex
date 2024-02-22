%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char* s);
%}

/* declare tokens */
%token NUMBER
%token OP CP
%token ADD SUB MUL DIV ABS AND
%token EOL

%%

calclist: /* nothing: matches at beginning of input */ 
	| calclist exp EOL { printf("= %d (decimal) = 0x%x (hexadecimal)\n", $2, $2); } 
	/*| calclist exp EOL { printf("= %d (decimal) = %x (hexadecimal)\n", $2, $2); }*/
	| calclist EOL { /* Do nothing */ }
;

exp: factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	| exp ABS factor { $$ = $1 | $3; }
	| exp AND factor { $$ = $1 & $3; }
;

factor: term
	| factor MUL term { $$ = $1 * $3; }
	| factor DIV term { $$ = $1 / $3; }
;

term: NUMBER
	| ABS term ABS { $$ = $2 >= 0? $2 : - $2; }
	| OP exp CP { $$ = $2; }
;


%%
int main(int argc, char **argv)
{
	yyparse();
}

int yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}
