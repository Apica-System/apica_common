const std = @import("std");

pub const ValueU16 = struct {
    value: ?u16,

    pub fn initEmpty() ValueU16 {
        return ValueU16{ .value = null };
    }

    pub fn initWith(value: u16) ValueU16 {
        return ValueU16{ .value = value };
    }

    pub fn show(self: *const ValueU16, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("u16<{}>{c}", .{ val, end });
        } else {
            try writer.print("u16<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueU16) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueU16) []const u8 {
        return "u16";
    }

    pub fn getValue(self: *const ValueU16) ?u16 {
        return self.value;
    }
};
