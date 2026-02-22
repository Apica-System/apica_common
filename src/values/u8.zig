const std = @import("std");

pub const ValueU8 = struct {
    value: ?u8,

    pub fn initEmpty() ValueU8 {
        return ValueU8{ .value = null };
    }

    pub fn initWith(value: u8) ValueU8 {
        return ValueU8{ .value = value };
    }

    pub fn show(self: *const ValueU8, end: u8) void {
        if (self.value) |val| {
            std.debug.print("u8<{}>{c}", .{ val, end });
        } else {
            std.debug.print("u8<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueU8) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueU8) []const u8 {
        return "u8";
    }

    pub fn getValue(self: *const ValueU8) ?u8 {
        return self.value;
    }
};
