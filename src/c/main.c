#include <assert.h>
#include "simd.h"

// This example shows that the simd.o library works when called from C code
// even though it does not work when the library is called from Zig code.

int main(int argc, char **argv) {
    __m256d x = {1, 2, 3, 0};
    __m256d y = {2, 3, 4, 0};

    double d = dot(x, y);

    assert(d == 20);

    return 0;
}
