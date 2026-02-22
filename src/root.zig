const std = @import("std");

pub const values = @import("values/value.zig");
pub const element = @import("element.zig");
pub const bytecodes = @import("bytecodes.zig");

test "value" {
    const val = values.Value{ .Type = values.ValueType.initWith(values.ValueKind.Null) };

    try std.testing.expectEqual("type", val.getTypeRepresentation());
    try std.testing.expectEqual(true, val.isNull());
    val.show('\n');
}
