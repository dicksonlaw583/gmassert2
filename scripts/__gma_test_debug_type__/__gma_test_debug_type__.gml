///@func __gma_test_debug_type__()
///@desc Test the functionality of typeof.
function __gma_test_debug_type__() {
	#region undefined
	test_case(typeof(undefined), "undefined", "__gma_test_debug_type__: undefined");
	#endregion

	#region real
	test_case(typeof(7), "number", "__gma_test_debug_type__: 7");
	test_case(typeof(-pi), "number", "__gma_test_debug_type__: -pi");
	#endregion

	#region string
	test_case(typeof(""), "string", "__gma_test_debug_type__: empty string");
	test_case(typeof("waahoo"), "string", "__gma_test_debug_type__: waahoo string");
	#endregion
  
	#region 1D array
	var arrayA = [5, 6, 7];
	test_case(typeof(arrayA), "array", "__gma_test_debug_type__: 1D array");
	#endregion

	#region 2D array
	var arrayB = [[5, "a"], ["b", 7]];
	test_case(typeof(arrayB), "array", "__gma_test_debug_type__: 2D array");
	#endregion
}
