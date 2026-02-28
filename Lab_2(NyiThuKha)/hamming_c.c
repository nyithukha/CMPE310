#include <stdio.h>
#include <string.h>

extern int hamming_distance(char *s1, char *s2);

int main() {
    char str1[256], str2[256];

    fgets(str1, 256, stdin);
    str1[strcspn(str1, "\n")] = '\0';       // swap newline and null to strip
    fgets(str2, 256, stdin);
    str2[strcspn(str2, "\n")] = '\0';       // swap newline and null to strip
    int result = hamming_distance(str1, str2);
    printf("Hamming distance: %d\n", result);
}