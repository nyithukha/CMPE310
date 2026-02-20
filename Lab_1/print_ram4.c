#include <stdio.h>
extern unsigned char ram[];
extern void fill_ram(void);
int main() {
    fill_ram();
    printf("Decimal values stored at addresses from 47H to 50H will be printed:\n");

    for(int i = 0x47; i <= 0x50; i++) {
        printf("%d ", ram[i]);
    }
    printf("\n");
    printf("The decimal value stored in Ram at 50H is %d.", ram[0x50]);
    printf("\n");
    return 0;
}