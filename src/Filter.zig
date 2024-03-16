const Kalman = @import("helper/Kalman.zig");

pub fn Filter(comptime FilterType: type) type {
    return packed struct {
        pub fn Init() !void {
            return FilterType.Init();
        }

        pub fn Predict() !void {
            return FilterType.Predict();
        }

        pub fn Update() !void {
            return FilterType.Update();
        }

        pub fn BatchFilter() !void {
            return FilterType.BatchFilter();
        }

        pub fn rts_smoother() !void {
            return FilterType.rts_smoother();
        }
    };
}
