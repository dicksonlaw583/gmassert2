///@func __gma_test_debug_value_23__()
function __gma_test_debug_value_23__() {
  var fixture = new Vector2(6, 8);
  var got;
  //__gma_debug_value__() with structs
  got = __gma_debug_value__({a: 1, b: "foo", c: ["bar", 4, 5]});
  test_case(string_pos("(struct)\r\n{", got) && string_pos("a: 1", got) && string_pos("b: \"foo\"", got) && string_pos("c: [\"bar\", 4, 5]", got));
  got = __gma_debug_value__(fixture);
  test_case(string_pos("(struct)\r\nVector2({", got) && string_pos("x: 6", got) && string_pos("y: 8", got) && string_pos("})", got) && !string_pos("norm", got) && !string_pos("mag", got) && !string_pos("add", got));
  //__gma_debug_struct_value__()
  got = __gma_debug_struct_value__({a: 1, b: "foo", c: ["bar", 4, 5]});
  test_case(string_pos("{", got) && string_pos("a: 1", got) && string_pos("b: \"foo\"", got) && string_pos("c: [\"bar\", 4, 5]", got));
  got = __gma_debug_struct_value__(fixture);
  test_case(string_pos("Vector2({", got) && string_pos("x: 6", got) && string_pos("y: 8", got) && string_pos("})", got));
  //test_case(string_pos("norm: function(){...}", got) && string_pos("mag: function(){...}", got) && string_pos("add: function(){...}", got));
}