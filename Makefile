all: Example1_56_SimpleCalculator.l Example1_56_SimpleCalculator.y
	bison -d Example1_56_SimpleCalculator.y
	flex Example1_56_SimpleCalculator.l
	cc -o $@ Example1_56_SimpleCalculator.tab.c lex.yy.c -lfl
