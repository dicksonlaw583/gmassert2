{
  //undefined
  test_case(typeof(undefined), "undefined");

  //real
  test_case(typeof(7), "number");
  test_case(typeof(-pi), "number");

  //string
  test_case(typeof(""), "string");
  test_case(typeof("waahoo"), "string");
  
  //1D array
  var arrayA = test_fixture_array(5, 6, 7);
  test_case(typeof(arrayA), "array");

  //2D array
  var arrayB = test_fixture_array2(2, 5, "a", "b", 7);
  test_case(typeof(arrayB), "array");
}
