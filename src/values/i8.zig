const std = @import("std");

pub const ValueI8 = struct {
    value: ?i8,

    pub fn initEmpty() ValueI8 {
        return ValueI8{ .value = null };
    }

    pub fn initWith(value: i8) ValueI8 {
        return ValueI8{ .value = value };
    }

    pub fn show(self: *const ValueI8, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("i8<{}>{c}", .{ val, end });
        } else {
            try writer.print("i8<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueI8) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueI8) []const u8 {
        return "i8";
    }

    pub fn getValue(self: *const ValueI8) ?i8 {
        return self.value;
    }
};
