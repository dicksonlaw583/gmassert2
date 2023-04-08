///@func test_fixture_grid(width, height, [...])
///@param {Real} width
///@param {Real} height
///@return {Id.DsGrid<Any*>}
///@desc Test fixture: Quickly generate a DS Grid inline.
function test_fixture_grid(width, height) {
  if (argument_count < 2 || argument_count != 2+width*height) {
    show_error("Wrong number of arguments for grid fixture.", true);
  }
  var grid = ds_grid_create(width, height);
  var i = 0;
  for (var ii = 2; ii < argument_count; ++ii) {
    grid[# i mod width, i div width] = argument[ii];
    ++i;
  }
  return grid;
}