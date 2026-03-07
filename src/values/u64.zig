const std = @import("std");

pub const ValueU64 = struct {
    value: ?u64,

    pub fn initEmpty() ValueU64 {
        return ValueU64{ .value = null };
    }

    pub fn initWith(value: u64) ValueU64 {
        return ValueU64{ .value = value };
    }

    pub fn show(self: *const ValueU64, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("u64<{}>{c}", .{ val, end });
        } else {
            try writer.print("u64<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueU64) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueU64) []const u8 {
        return "u64";
    }

    pub fn getValue(self: *const ValueU64) ?u64 {
        return self.value;
    }
};
