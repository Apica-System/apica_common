const std = @import("std");
const ValueKind = @import("kind.zig").ValueKind;

pub const ValueChar = struct {
    value: ?u32,

    pub fn initEmpty() ValueChar {
        return ValueChar{ .value = null };
    }

    pub fn initWith(value: u32) ValueChar {
        return ValueChar{ .value = value };
    }

    pub fn show(self: *const ValueChar, writer: *std.io.Writer, end: u8) !void {
        if (self.value) |val| {
            var buffer: [4]u8 = .{ 0, 0, 0, 0 };
            _ = std.unicode.utf8Encode(@intCast(val), &buffer) catch {
                try writer.print("char<>{c}", .{end});
                return;
            };

            try writer.print("char<{s}>{c}", .{ buffer, end });
        } else {
            try writer.print("char<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueChar) bool {
        return self.value == null;
    }

    pub fn getTypeRepresentation(_: *const ValueChar) []const u8 {
        return "char";
    }

    pub fn getKind(_: *const ValueChar) ValueKind {
        return ValueKind.Char;
    }

    pub fn getValue(self: *const ValueChar) ?u32 {
        return self.value;
    }
};
