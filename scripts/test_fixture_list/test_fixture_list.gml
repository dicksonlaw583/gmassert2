/// @description test_fixture_list(...)
/// @param ...
{
  var list = ds_list_create();
  for (var i = 0; i < argument_count; i++) {
    ds_list_add(list, argument[i]);
  }
  return list;
}
