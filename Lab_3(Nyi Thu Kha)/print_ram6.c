#include <stdio.h>
extern int sum_array(int* arr, int count);

int main() {
    FILE *fptr;

    fptr = fopen("data.txt", "r");

    if (fptr == NULL) {
        return 1;
    }

    int data_points = 0;
    fscanf(fptr, "%d", &data_points);
    int data[data_points];
    int count = 0;

    while (fscanf(fptr, "%d", &data[count]) == 1) {
        count++;
    }

    int sum = sum_array(data, count);
    printf("The sum of data from file is %d\n", sum);
    fclose(fptr);
    
    return 0;
}
