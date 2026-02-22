const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_module = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addLibrary(.{
        .name = "apica_common",
        .root_module = lib_module,
        .linkage = .static,
        .version = .{ .major = 0, .minor = 1, .patch = 0 },
    });

    b.installArtifact(lib);

    const tests = b.addTest(.{
        .root_module = lib_module,
    });

    const run_tests = b.addRunArtifact(tests);
    const tests_step = b.step("test", "Run apica_common tests");
    tests_step.dependOn(&run_tests.step);
}
