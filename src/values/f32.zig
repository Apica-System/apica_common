const std = @import("std");

pub const ValueF32 = struct {
    value: ?f32,

    pub fn initEmpty() ValueF32 {
        return ValueF32{ .value = null };
    }

    pub fn initWith(value: f32) ValueF32 {
        return ValueF32{ .value = value };
    }

    pub fn show(self: *const ValueF32, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("f32<{}>{c}", .{ val, end });
        } else {
            try writer.print("f32<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueF32) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueF32) []const u8 {
        return "f32";
    }

    pub fn getValue(self: *const ValueF32) ?f32 {
        return self.value;
    }
};
