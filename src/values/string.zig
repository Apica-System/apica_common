const std = @import("std");

pub const ValueString = struct {
    value: ?[]u8,

    pub fn initEmpty() ValueString {
        return ValueString{ .value = null };
    }

    pub fn initWith(value: []u8) ValueString {
        return ValueString{ .value = value };
    }

    pub fn show(self: *const ValueString, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            try writer.print("string<{s}>{c}", .{ val, end });
        } else {
            try writer.print("string<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueString) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueString) []const u8 {
        return "string";
    }

    pub fn getValue(self: *const ValueString) ?[]u8 {
        return self.value;
    }
};
