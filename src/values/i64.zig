const std = @import("std");

pub const ValueI64 = struct {
    value: ?i64,

    pub fn initEmpty() ValueI64 {
        return ValueI64{};
    }

    pub fn initWith(value: i64) ValueI64 {
        return ValueI64{ .value = value };
    }

    pub fn show(self: *const ValueI64, end: u8) void {
        if (self.value) |val| {
            std.debug.print("i64<{}>{c}", .{ val, end });
        } else {
            std.debug.print("i64<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueI64) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueI64) []const u8 {
        return "i64";
    }

    pub fn getValue(self: *const ValueI64) ?i64 {
        return self.value;
    }
};
