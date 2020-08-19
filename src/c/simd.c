#include "simd.h"

// https://stackoverflow.com/a/47445367
double dot(__m256d x, __m256d y) {
    __m256d xy = _mm256_mul_pd(x, y);

    __m128d xylow  = _mm256_castpd256_pd128(xy);   // (__m128d)cast isn't portable
    __m128d xyhigh = _mm256_extractf128_pd(xy, 1);
    __m128d sum1 =   _mm_add_pd(xylow, xyhigh);

    __m128d swapped = _mm_shuffle_pd(sum1, sum1, 0b01);   // or unpackhi
    __m128d dotproduct = _mm_add_pd(sum1, swapped);
    return dotproduct[0];
}
