#include <stdio.h>
#include <string.h>

int main() {
    int chars = 0;
    int words = 0;
    int lines = 0;
    char buffer[1024]; // Adjust buffer size as needed

    while (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        char *ptr = buffer;
        while (*ptr != '\0') {
            if ((*ptr >= 'a' && *ptr <= 'z') || (*ptr >= 'A' && *ptr <= 'Z')) {
                // Increment word count if alphabetic character is found
                words++;

                // Increment char count for each character in the word
                while ((*ptr >= 'a' && *ptr <= 'z') || (*ptr >= 'A' && *ptr <= 'Z')) {
                    chars++;
                    ptr++;
                }
            } else if (*ptr == '\n') {
                // Increment line count and char count for newline character
                lines++;
                chars++;
                ptr++;
            } else {
                // Increment char count for non-alphabetic characters
                chars++;
                ptr++;
            }
        }
    }

    printf("%8d%8d%8d\n", lines, words, chars);

    return 0;
}
