/// @description test_fixture_list(...)
/// @param ...
function test_fixture_list() {
	{
	  var list = ds_list_create();
	  for (var i = 0; i < argument_count; i++) {
	    ds_list_add(list, argument[i]);
	  }
	  return list;
	}



}
