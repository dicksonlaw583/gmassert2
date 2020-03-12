///@func test_fixture_grid(width, height, ...)
///@param width
///@param height
///@param ...
function test_fixture_grid() {
  if (argument_count < 2 || argument_count != 2+argument[0]*argument[1]) {
    show_error("Wrong number of arguments for grid fixture.", true);
  }
  var grid = ds_grid_create(argument[0], argument[1]);
  var i = 0;
  for (var ii = 2; ii < argument_count; ++ii) {
    grid[# i mod argument[0], i div argument[0]] = argument[ii];
    ++i;
  }
  return grid;
}