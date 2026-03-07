const std = @import("std");

pub const values = @import("values/value.zig");
pub const element = @import("element.zig");
pub const bytecodes = @import("bytecodes.zig");

test "value" {
    const stdout_file = std.fs.File.stdout();
    var buffer: [1024]u8 = undefined;
    var writer = stdout_file.writer(&buffer);

    const val = values.Value{ .Type = values.ValueType.initWith(values.ValueKind.Null) };

    try std.testing.expectEqual("type", val.getTypeRepresentation());
    try std.testing.expectEqual(true, val.isNull());
    try val.show(&writer.interface, '\n');
}
