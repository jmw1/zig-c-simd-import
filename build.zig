const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("simd-c-import", "src/main.zig");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    main_tests.addIncludeDir("src/c");

    // Also tried commenting out line (1) and uncommenting line (2)
    // to compile C source code directly from Zig, but the error was the same.
    main_tests.addObjectFile("src/c/simd.o"); // (1)
    //main_tests.addCSourceFile("src/c/simd.c", &[_][]const u8{ "-std=c11", "-mavx2" }); // (2)

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
