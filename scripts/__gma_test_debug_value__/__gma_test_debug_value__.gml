function __gma_test_debug_value__() {  
	//undefined
	test_case(__gma_debug_value__(undefined), "(undefined)\r\nundefined");
  
	//real
	test_case(__gma_debug_value__(7), "(number)\r\n7");
	test_case(__gma_debug_value__(-3.52), "(number)\r\n-3.52");
  test_case(__gma_debug_value__(infinity), "(number)\r\ninfinity");
	test_case(__gma_debug_value__(-infinity), "(number)\r\n-infinity");
  test_case(__gma_debug_value__(NaN), "(number)\r\nNaN");
  
  //int64
  test_case(__gma_debug_value__(int64(12)), "(int64)\r\nint64(12)");
  test_case(__gma_debug_value__(int64(-9)), "(int64)\r\nint64(-9)");
  
  //ptr
  test_case(__gma_debug_value__(ptr($3A6B)), "(ptr)\r\nptr($3A6B)");
	
	//strings
	test_case(__gma_debug_value__(""), "(string)\r\n" + @'""');
	test_case(__gma_debug_value__("waahoo"), "(string)\r\n" + @'"waahoo"');
	test_case(__gma_debug_value__("this is \"waahoo\""), "(string)\r\n" + @'"this is \"waahoo\""');
  test_case(__gma_debug_value__("\n\r\b\f\t\v\a\\\""), "(string)\r\n" + @'"\n\r\b\f\t\v\a\\\""');
  
	//bool
	test_case(__gma_debug_value__(bool(true)), "(bool)\r\nbool(true)");
	test_case(__gma_debug_value__(bool(false)), "(bool)\r\nbool(false)");
	
	//1d array
	var arrayA = [5, 6, 7];
	test_case(__gma_debug_value__(arrayA), "(array)\r\n[5, 6, 7]");
  
	//2d array
	var arrayB = [[5, "a"], ["b", 7]];
	test_case(__gma_debug_value__(arrayB), "(array)\r\n[[5, \"a\"], [\"b\", 7]]");

	//list
	var listEmpty = test_fixture_list(),
			listFilled = test_fixture_list(3, "waahoo", [5, 6, 7]);
	test_case(__gma_debug_list_value__(listEmpty), "list()");
	test_case(__gma_debug_list_value__(listFilled), "list(3, \"waahoo\", [5, 6, 7])");
	//invalid list
	var listDNE = listFilled+1;
	while (ds_exists(listDNE, ds_type_list)) listDNE++;
	test_case(__gma_debug_list_value__(listDNE), "list(<INVALID>)");
	//list cleanup
	ds_list_destroy(listEmpty);
	ds_list_destroy(listFilled);
  
  //map
  var mapEmpty = test_fixture_map(),
      mapFilled = test_fixture_map("foo", "bar", "baz", 907);
  test_case(__gma_debug_map_value__(mapEmpty), "map()");
  test_case(string_pos("map(", __gma_debug_map_value__(mapFilled)));
  test_case(string_pos(@'"foo": "bar"', __gma_debug_map_value__(mapFilled)));
  test_case(string_pos(@'"baz": 907', __gma_debug_map_value__(mapFilled)));
  test_case(string_pos(")", __gma_debug_map_value__(mapFilled)));
  //invalid map
  var mapDNE = mapFilled+1;
  while (ds_exists(mapDNE, ds_type_map)) mapDNE++;
  test_case(__gma_debug_map_value__(mapDNE), "map(<INVALID>)");
  //map cleanup
  ds_map_destroy(mapEmpty);
  ds_map_destroy(mapFilled);
  
  //grid
  var gridEmpty = test_fixture_grid(0, 0),
      gridFilled = test_fixture_grid(3, 2, "foo", "bar", "baz", 123, 456, 789);
  test_case(__gma_debug_grid_value__(gridEmpty), "grid()");
  test_case(__gma_debug_grid_value__(gridFilled), @'grid("foo", "bar", "baz"; 123, 456, 789)');
  //invalid grid
  var gridDNE = gridFilled+1;
  while (ds_exists(gridDNE, ds_type_grid)) gridDNE++;
  test_case(__gma_debug_grid_value__(gridDNE), "grid(<INVALID>)");
  //grid cleanup
  ds_grid_destroy(gridEmpty);
  ds_grid_destroy(gridFilled);
}
