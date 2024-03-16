const std = @import("std");

pub fn InitMatrix(comptime DataType: type, comptime rowsNum: u32, comptime colsNum: u32, comptime data: []@Vector(DataType, rowsNum)) type {
    return packed struct {
        var matrix: @Vector(DataType, rowsNum) = data;
        const rows: DataType = rowsNum;
        const cols: DataType = colsNum;

        pub fn add(self: *Self, other: *const Self) !void {
            if (other.rows != self.rows or other.cols != self.cols)
                return error.OutOfRange;
            for (0..cols) |i|
                self.data[i] += other.data[i];
        }

        pub fn subtract(self: *const Self, other: *const Self) !void {
            if (other.rows != self.rows or other.cols != self.cols)
                return error.OutOfRange;
            for (0..cols) |i|
                self.data[i] -= other.data[i];
        }

        pub fn mul(self: *const Self, other: *const Self) Self {
            if (other.rows != self.rows or other.cols != self.cols)
                return error.OutOfRange;
            if (self.cols != other.rows)
                return error.OutOfRange;
            if (self.rows < 100) { // GO with default

            } else { // Go with Strassens
                var result: Self = undefined;
                return result; 
            }
        }

        pub fn eql(self: *const Self, other: *const Self) bool {
            if (other.rows != self.rows or other.cols != self.cols)
                return error.OutOfRange;
            for (0..cols) |i|
                if (self.data[i] != other.data[i]) return false;
            return true;
        }
    };
}

test "TestBasicOperations" {

}
