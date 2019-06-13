#!/bin/bash
bison -d lab5.y
flex lab5.lxi
gcc -o comp lex.yy.c lab5.tab.c
