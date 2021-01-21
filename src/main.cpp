#include <stdio.h>
#include <array>

#define BUFSZ 10000

int main() {
    int i;
    std::array<int, BUFSZ> int_arr { 1 };
    std::array<float, BUFSZ> fp_arr { 1.0f };

    printf("Hello, world!\n");

    for (i = 0; i < BUFSZ; i++) {
        int_arr[i] += 2;
    }

    for (i = 0; i < BUFSZ; i++) {
        fp_arr[i] *= 1.3f;
    }

    return 0;
}