#include <stdio.h>

void dummy_test_entrypoint() {
}

void main() {
    char* video_memory = (char*) 0xb8000;
    char walk[] = "VOOM";

    int i=0;

    while (i<4){
        *video_memory = walk[i];
        i++;
        i%=4;
    }
}