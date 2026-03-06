#include <stdio.h>
extern int sum_array(int* arr, int count);

int main() {
    FILE *fptr;

    fptr = fopen("data.txt", "r");

    if (fptr == NULL) {
        return 1;
    }

    // Read the number of data points (1st entry of data.txt)
    int data_points = 0;
    fscanf(fptr, "%d", &data_points);
    // Create an array of appropriate size
    int data[data_points];
    int count = 0;

    // Read data and increment count
    while (fscanf(fptr, "%d", &data[count]) == 1) {
        count++;
    }

    // Use sum_array function to get total sum of all data
    int sum = sum_array(data, count);
    printf("The sum of data from file is %d\n", sum);
    fclose(fptr);
    
    return 0;
}
