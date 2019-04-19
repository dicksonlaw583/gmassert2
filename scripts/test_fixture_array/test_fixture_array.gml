/// @description test_fixture_array(...)
/// @param ...
{
  var arr;
  for (var i = 0; i < argument_count; i++) {
    arr[i] = argument[i];
  }
  return arr;
}
