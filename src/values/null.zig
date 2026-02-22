const std = @import("std");

pub const ValueNull = struct {
    pub fn initEmpty() ValueNull {
        return ValueNull{};
    }

    pub fn show(_: *const ValueNull, end: u8) void {
        std.debug.print("null<>{c}", .{end});
    }

    pub fn isNull(_: *const ValueNull) bool {
        return true;
    }

    pub fn getTypeRepresentation(_: *const ValueNull) []const u8 {
        return "null";
    }
};
