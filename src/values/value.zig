const std = @import("std");

pub const ValueKind = @import("kind.zig").ValueKind;

pub const ValueNull = @import("null.zig").ValueNull;
pub const ValueI8 = @import("i8.zig").ValueI8;
pub const ValueI16 = @import("i16.zig").ValueI16;
pub const ValueI32 = @import("i32.zig").ValueI32;
pub const ValueI64 = @import("i64.zig").ValueI64;
pub const ValueU8 = @import("u8.zig").ValueU8;
pub const ValueU16 = @import("u16.zig").ValueU16;
pub const ValueU32 = @import("u32.zig").ValueU32;
pub const ValueU64 = @import("u64.zig").ValueU64;
pub const ValueF32 = @import("f32.zig").ValueF32;
pub const ValueF64 = @import("f64.zig").ValueF64;
pub const ValueBool = @import("bool.zig").ValueBool;
pub const ValueChar = @import("char.zig").ValueChar;
pub const ValueString = @import("string.zig").ValueString;
pub const ValueError = @import("error.zig").ValueError;
pub const ValueType = @import("type.zig").ValueType;

pub const Value = union(ValueKind) {
    Null: ValueNull,
    I8: ValueI8,
    I16: ValueI16,
    I32: ValueI32,
    I64: ValueI64,
    U8: ValueU8,
    U16: ValueU16,
    U32: ValueU32,
    U64: ValueU64,
    F32: ValueF32,
    F64: ValueF64,
    Bool: ValueBool,
    Char: ValueChar,
    String: ValueString,
    Error: ValueError,
    Type: ValueType,

    pub fn show(self: *const Value, writer: *std.io.Writer, end: u8) !void {
        switch (self.*) {
            .Null => |_null| try _null.show(writer, end),
            .I8 => |_i8| try _i8.show(writer, end),
            .I16 => |_i16| try _i16.show(writer, end),
            .I32 => |_i32| try _i32.show(writer, end),
            .I64 => |_i64| try _i64.show(writer, end),
            .U8 => |_u8| try _u8.show(writer, end),
            .U16 => |_u16| try _u16.show(writer, end),
            .U32 => |_u32| try _u32.show(writer, end),
            .U64 => |_u64| try _u64.show(writer, end),
            .F32 => |_f32| try _f32.show(writer, end),
            .F64 => |_f64| try _f64.show(writer, end),
            .Bool => |_bool| try _bool.show(writer, end),
            .Char => |char| try char.show(writer, end),
            .String => |string| try string.show(writer, end),
            .Error => |_error| try _error.show(writer, end),
            .Type => |_type| try _type.show(writer, end),
        }
    }

    pub fn isNull(self: *const Value) bool {
        switch (self.*) {
            .Null => |_null| return _null.isNull(),
            .I8 => |_i8| return _i8.isNull(),
            .I16 => |_i16| return _i16.isNull(),
            .I32 => |_i32| return _i32.isNull(),
            .I64 => |_i64| return _i64.isNull(),
            .U8 => |_u8| return _u8.isNull(),
            .U16 => |_u16| return _u16.isNull(),
            .U32 => |_u32| return _u32.isNull(),
            .U64 => |_u64| return _u64.isNull(),
            .F32 => |_f32| return _f32.isNull(),
            .F64 => |_f64| return _f64.isNull(),
            .Bool => |_bool| return _bool.isNull(),
            .Char => |char| return char.isNull(),
            .String => |string| return string.isNull(),
            .Error => |_error| return _error.isNull(),
            .Type => |_type| return _type.isNull(),
        }
    }

    pub fn getTypeRepresentation(self: *const Value) []const u8 {
        switch (self.*) {
            .Null => |_null| return _null.getTypeRepresentation(),
            .I8 => |_i8| return _i8.getTypeRepresentation(),
            .I16 => |_i16| return _i16.getTypeRepresentation(),
            .I32 => |_i32| return _i32.getTypeRepresentation(),
            .I64 => |_i64| return _i64.getTypeRepresentation(),
            .U8 => |_u8| return _u8.getTypeRepresentation(),
            .U16 => |_u16| return _u16.getTypeRepresentation(),
            .U32 => |_u32| return _u32.getTypeRepresentation(),
            .U64 => |_u64| return _u64.getTypeRepresentation(),
            .F32 => |_f32| return _f32.getTypeRepresentation(),
            .F64 => |_f64| return _f64.getTypeRepresentation(),
            .Bool => |_bool| return _bool.getTypeRepresentation(),
            .Char => |char| return char.getTypeRepresentation(),
            .String => |string| return string.getTypeRepresentation(),
            .Error => |_error| return _error.getTypeRepresentation(),
            .Type => |_type| return _type.getTypeRepresentation(),
        }
    }

    pub fn getKind(self: *const Value) ValueKind {
        switch (self.*) {
            .Null => |_null| return _null.getKind(),
            .I8 => |_i8| return _i8.getKind(),
            .I16 => |_i16| return _i16.getKind(),
            .I32 => |_i32| return _i32.getKind(),
            .I64 => |_i64| return _i64.getKind(),
            .U8 => |_u8| return _u8.getKind(),
            .U16 => |_u16| return _u16.getKind(),
            .U32 => |_u32| return _u32.getKind(),
            .U64 => |_u64| return _u64.getKind(),
            .F32 => |_f32| return _f32.getKind(),
            .F64 => |_f64| return _f64.getKind(),
            .Bool => |_bool| return _bool.getKind(),
            .Char => |char| return char.getKind(),
            .String => |string| return string.getKind(),
            .Error => |_error| return _error.getKind(),
            .Type => |_type| return _type.getKind(),
        }
    }
};
