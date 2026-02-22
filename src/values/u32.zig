const std = @import("std");

pub const ValueU32 = struct {
    value: ?u32,

    pub fn initEmpty() ValueU32 {
        return ValueU32{ .value = null };
    }

    pub fn initWith(value: u32) ValueU32 {
        return ValueU32{ .value = value };
    }

    pub fn show(self: *const ValueU32, end: u8) void {
        if (self.value) |val| {
            std.debug.print("u32<{}>{c}", .{ val, end });
        } else {
            std.debug.print("u32<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueU32) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueU32) []const u8 {
        return "u32";
    }

    pub fn getValue(self: *const ValueU32) ?u32 {
        return self.value;
    }
};
