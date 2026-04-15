const std = @import("std");
const ValueKind = @import("kind.zig").ValueKind;

pub const ValueBool = struct {
    value: ?bool,

    pub fn initEmpty() ValueBool {
        return ValueBool{ .value = null };
    }

    pub fn initWith(value: bool) ValueBool {
        return ValueBool{ .value = value };
    }

    pub fn show(self: *const ValueBool, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("bool<{}>{c}", .{ val, end });
        } else {
            try writer.print("bool<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueBool) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueBool) []const u8 {
        return "bool";
    }

    pub fn getKind(_: *const ValueBool) ValueKind {
        return ValueKind.Bool;
    }

    pub fn getValue(self: *const ValueBool) ?bool {
        return self.value;
    }
};
