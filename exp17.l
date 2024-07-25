%{
#include <stdio.h>
int words = 0, newlines = 0, characters = 0;
%}

%option noyywrap

%%

[ \t]+       { words++; }               // Spaces and tabs increment word count
\n           { newlines++; words++; }   // Newlines increment both line and word count
[^ \t\n]+    { characters += yyleng; }  // Any sequence of characters except spaces, tabs, and newlines

%%

int main() {
    yylex();  // Start the lexical analysis

    // Adjust word and line count if characters are present
    if (characters > 0) {
        if (words == 0) words = 1; // If there's at least one character, there's at least one word
        if (newlines == 0) newlines = 1; // If no newlines are found, there's at least one line
    }

    printf("Total number of words : %d\n", words);
    printf("Total number of lines : %d\n", newlines);
    printf("Total number of characters : %d\n", characters);

    return 0;
}
