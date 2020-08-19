const std = @import("std");
const c = @import("c.zig");
const testing = std.testing;

// Can't use the exported function from my simd.c library.
// fails with error: unable to resolve typedef child type pub const __m256d = @compileError("unable to resolve typedef child type"); // zig/lib/zig/include/avxintrin.h:35:16
test "imported C SIMD dot product function" {
    const dot = c.dot;
}

// Can't use the __m256d type from immintrin.h header.
// fails with error: unable to resolve typedef child type pub const __m256d = @compileError("unable to resolve typedef child type"); // zig/lib/zig/include/avxintrin.h:35:16
test "" {
    const x = c.__m256d{ 1.0, 2.0, 3.0, 0.0 };
    const y = c.__m256d{ 2.0, 3.0, 4.0, 0.0 };

    testing.expect(c.dot(x, y) == 20);
}
