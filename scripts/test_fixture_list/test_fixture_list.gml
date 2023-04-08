///@func test_fixture_list(...)
///@param ... The contents of the list
///@return {Id.DsList<Any*>}
///@desc Test fixture: Quickly generate a DS list inline.
function test_fixture_list() {
	var list = ds_list_create();
	for (var i = 0; i < argument_count; i++) {
		ds_list_add(list, argument[i]);
	}
	return list;
}
