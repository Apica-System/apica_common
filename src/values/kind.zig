pub const ValueKind = enum(u8) {
    // Specials
    Null,

    // Numerics
    I8,
    I16,
    I32,
    I64,
    U8,
    U16,
    U32,
    U64,
    F32,
    F64,
    Bool,

    // Characters
    Char,
    String,

    // Control
    Error,
    Type,

    pub fn getRepresentation(self: ValueKind) []const u8 {
        switch (self) {
            .Null => return "null",
            .I8 => return "i8",
            .I16 => return "i16",
            .I32 => return "i32",
            .I64 => return "i64",
            .U8 => return "u8",
            .U16 => return "u16",
            .U32 => return "u32",
            .U64 => return "u64",
            .F32 => return "f32",
            .F64 => return "f64",
            .Bool => return "bool",
            .Char => return "char",
            .String => return "string",
            .Error => return "error",
            .Type => return "type",
        }
    }
};
