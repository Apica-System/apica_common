const std = @import("std");

pub const ValueError = struct {
    name: ?[]const u8,
    details: ?[]const u8,

    pub fn initEmpty() ValueError {
        return ValueError{ .name = null, .details = null };
    }

    pub fn initWith(name: []const u8) ValueError {
        return ValueError{ .name = name, .details = null };
    }

    pub fn initComplete(name: []const u8, details: []const u8) ValueError {
        return ValueError{ .name = name, .details = details };
    }

    pub fn show(self: *const ValueError, end: u8) void {
        if (self.name) |name| {
            if (self.details) |details| {
                std.debug.print("error<{s}: {s}>{c}", .{ name, details, end });
            } else {
                std.debug.print("error<{s}>{c}", .{ name, end });
            }
        } else {
            std.debug.print("error<null>{c}", .{end});
        }
    }

    pub fn isNull(self: *const ValueError) bool {
        return self.name == null;
    }

    pub fn getTypeRepresentation(_: *const ValueError) []const u8 {
        return "error";
    }

    pub fn getName(self: *const ValueError) ?[]u8 {
        return self.name;
    }

    pub fn getDetails(self: *const ValueError) ?[]u8 {
        return self.details;
    }
};
