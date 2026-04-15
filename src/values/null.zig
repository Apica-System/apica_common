const std = @import("std");
const ValueKind = @import("kind.zig").ValueKind;

pub const ValueNull = struct {
    pub fn initEmpty() ValueNull {
        return ValueNull{};
    }

    pub fn show(_: *const ValueNull, writer: *std.io.Writer, end: u8) !void {
        try writer.print("null<>{c}", .{end});
    }

    pub fn isNull(_: *const ValueNull) bool {
        return true;
    }

    pub fn getTypeRepresentation(_: *const ValueNull) []const u8 {
        return "null";
    }

    pub fn getKind(_: *const ValueNull) ValueKind {
        return ValueKind.Null;
    }
};
