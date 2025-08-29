#include <stdio.h>
int main() {
    FILE *fptr;
    fptr = fopen("test.txt", "w");
    if(fptr == NULL) {
        printf("Error opening file!\n");
        return 1;
    }
    fprintf(fptr, "Hello, this is a File I/O example.\n");
    fclose(fptr);

    fptr = fopen("test.txt", "r");
    char ch;
    while((ch = fgetc(fptr)) != EOF) {
        putchar(ch);
    }
    fclose(fptr);
    return 0;
}

