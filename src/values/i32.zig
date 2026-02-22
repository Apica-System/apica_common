const std = @import("std");

pub const ValueI32 = struct {
    value: ?i32,

    pub fn initEmpty() ValueI32 {
        return ValueI32{};
    }

    pub fn initWith(value: i32) ValueI32 {
        return ValueI32{ .value = value };
    }

    pub fn show(self: *const ValueI32, end: u8) void {
        if (self.value) |val| {
            std.debug.print("i32<{}>{c}", .{ val, end });
        } else {
            std.debug.print("i32<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueI32) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueI32) []const u8 {
        return "i32";
    }

    pub fn getValue(self: *const ValueI32) ?i32 {
        return self.value;
    }
};
