///@func test_fixture_map(...)
///@param ... The contents of the map, in key-value pairs
///@return {Id.DsMap<Any*>}
///@desc Test fixture: Quickly generate a DS map inline.
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
