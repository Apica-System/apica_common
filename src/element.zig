const values = @import("values/value.zig");

pub const ElementModifier = @import("element_modifier.zig").ElementModifier;

pub const Element = struct {
    modifier: ElementModifier,
    value: values.Value,

    pub fn init(modifier: ElementModifier, value: values.Value) Element {
        return Element{ .modifier = modifier, .value = value };
    }

    pub fn getValue(self: *const Element) values.Value {
        return self.value;
    }

    pub fn getModifier(self: *const Element) ElementModifier {
        return self.modifier;
    }

    pub fn createNull() Element {
        return Element.init(ElementModifier{}, values.Value{ .Null = values.ValueNull.initEmpty() });
    }

    pub fn createError(value: values.ValueError) Element {
        return Element.init(ElementModifier{ .isError = true }, values.Value{ .Error = value });
    }

    pub fn isErrorOrController(self: *const Element) bool {
        return self.modifier.isError or self.modifier.isController;
    }
};
