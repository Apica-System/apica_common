const std = @import("std");

pub const ValueF64 = struct {
    value: ?f64,

    pub fn initEmpty() ValueF64 {
        return ValueF64{ .value = null };
    }

    pub fn initWith(value: f64) ValueF64 {
        return ValueF64{ .value = value };
    }

    pub fn show(self: *const ValueF64, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("f64<{}>{c}", .{ val, end });
        } else {
            try writer.print("f64<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueF64) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueF64) []const u8 {
        return "f64";
    }

    pub fn getValue(self: *const ValueF64) ?f64 {
        return self.value;
    }
};
