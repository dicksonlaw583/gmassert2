function __gma_test_debug_type__() {
	//undefined
	test_case(typeof(undefined), "undefined");

	//real
	test_case(typeof(7), "number");
	test_case(typeof(-pi), "number");

	//string
	test_case(typeof(""), "string");
	test_case(typeof("waahoo"), "string");
  
	//1D array
	var arrayA = [5, 6, 7];
	test_case(typeof(arrayA), "array");

	//2D array
	var arrayB = [[5, "a"], ["b", 7]];
	test_case(typeof(arrayB), "array");
}
