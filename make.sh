cd src 

lex lexer.l

yacc -d parser.y

g++ lex.yy.c y.tab.c -ll -o parser;
