const std = @import("std");
const ValueKind = @import("kind.zig").ValueKind;

pub const ValueType = struct {
    kind: ValueKind,

    pub fn initEmpty() ValueType {
        return ValueType{ .kind = ValueKind.Null };
    }

    pub fn initWith(kind: ValueKind) ValueType {
        return ValueType{ .kind = kind };
    }

    pub fn show(self: *const ValueType, writer: *std.io.Writer, end: u8) !void {
        try writer.print("type<{s}>{c}", .{ self.kind.getRepresentation(), end });
    }

    pub fn isNull(self: *const ValueType) bool {
        return self.kind == ValueKind.Null;
    }

    pub fn getTypeRepresentation(_: *const ValueType) []const u8 {
        return "type";
    }

    pub fn getKind(_: *const ValueType) ValueKind {
        return ValueKind.Type;
    }

    pub fn getTypeKind(self: *const ValueType) ValueKind {
        return self.kind;
    }
};
