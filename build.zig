const std = @import("std");

pub fn build(b: *std.Build) void {
    const mode = b.standardReleaseOptions();

    // Setting up the target based on the system
    var target = b.standardTargetOptions(.{});
    const windows = b.isWindows();

    if (windows) {
        target = target.override(.{ .os_tag = .windows, .abi = .msvc });
    }

    // Create shared library
    const lib = b.addSharedLibrary("ZiPyFilter", "src/lib.zig", .{});
    lib.setBuildMode(mode);
    lib.setTarget(target);
    lib.linkLibC();
    if (windows) {
        lib.addLibPath(sysconfig.get_config_var("installed_base") ++ "\\Libs");
        lib.linkSystemLibrary("python3");
    }

    b.installArtifact(lib);
}
