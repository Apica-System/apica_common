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

    pub fn show(self: *const ValueType, end: u8) void {
        std.debug.print("type<{s}>{c}", .{ self.kind.getRepresentation(), end });
    }

    pub fn isNull(self: *const ValueType) bool {
        return self.kind == ValueKind.Null;
    }

    pub fn getTypeRepresentation(_: *const ValueType) []const u8 {
        return "type";
    }

    pub fn getKind(self: *const ValueType) ValueKind {
        return self.kind;
    }
};
