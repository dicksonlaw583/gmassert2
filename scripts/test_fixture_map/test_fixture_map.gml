/// @description test_fixture_map(...)
/// @param ...
function test_fixture_map() {
  if (argument_count mod 2 != 0) {
    show_error("Expected an even number of arguments, got " + string(argument_count) + ".", true);
  }
  var m = ds_map_create();
  for (var i = 0; i < argument_count; i += 2) {
    ds_map_add(m, argument[i], argument[i+1]);
  }
  return m;
}
