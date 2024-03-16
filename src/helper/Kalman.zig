const std = @import("std");

pub fn Kalman() type {
    return packed struct {
        pub fn Init() !void {}

        pub fn Predict() !void {}

        pub fn Update() !void {}

        pub fn BatchFilter() !void {}

        // Based on Rauch-Tung-Stribel smoother
        pub fn rts_smoother() !void {}
    };
}
