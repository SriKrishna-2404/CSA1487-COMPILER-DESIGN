%{
#include <stdio.h>
#include <string.h>

int word_count = 0;
char target_word[100];

%}

%%

[ \t\n]+               { /* Ignore whitespace */ }
{target_word}          { word_count++; }
.                      { /* Ignore other characters */ }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s saveetha\n", argv[0]);
        return 1;
    }

    strcpy(target_word, argv[1]);

    yylex();

    printf("The word '%s' appears %d times.\n", target_word, word_count);
    return 0;
}
