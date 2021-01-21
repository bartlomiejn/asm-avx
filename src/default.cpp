#include <stdio.h>
#include <stdint.h>
#include <array>

#define BUFSZ 10000

int main() {
    uint64_t i;

    std::array<uint64_t, BUFSZ> int_arr = { 1 };
    for (i = 0; i < BUFSZ; i++) {
        int_arr[i] += 2;
    }

    return 0;
}