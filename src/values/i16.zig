const std = @import("std");

pub const ValueI16 = struct {
    value: ?i16,

    pub fn initEmpty() ValueI16 {
        return ValueI16{};
    }

    pub fn initWith(value: i16) ValueI16 {
        return ValueI16{ .value = value };
    }

    pub fn show(self: *const ValueI16, end: u8) void {
        if (self.value) |val| {
            std.debug.print("i16<{}>{c}", .{ val, end });
        } else {
            std.debug.print("i16<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueI16) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueI16) []const u8 {
        return "i16";
    }

    pub fn getValue(self: *const ValueI16) ?i16 {
        return self.value;
    }
};
