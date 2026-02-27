#include <stdio.h>
extern int hamming_distance(char *s1, char *s2);

int main() {
    char str1[256], str2[256];
    fgets(str1, 256, stdin);
    fgets(str2, 256, stdin);
    int result = hamming_distance(str1, str2);
    printf("Hamming distance: %d\n", result);
}