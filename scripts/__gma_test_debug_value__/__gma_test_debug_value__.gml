{
  var nl = chr(13)+chr(10);
  
  //undefined
  test_case(__gma_debug_value__(undefined), "(undefined)" + nl);
  
  //real
  test_case(__gma_debug_value__(7), "(number)" + nl + "7");
  test_case(__gma_debug_value__(-3.52), "(number)" + nl + "-3.52");
  
  //strings
  test_case(__gma_debug_value__(""), "(string)" + nl + "\"\"");
  test_case(__gma_debug_value__("waahoo"), "(string)" + nl + "\"waahoo\"");
  test_case(__gma_debug_value__("this is \"waahoo\""), "(string)" + nl + "\"this is \"\"waahoo\"\"\"");
  
  //1d array
  var arrayA = test_fixture_array(5, 6, 7);
  test_case(__gma_debug_value__(arrayA), "(array)" + nl + "[5, 6, 7]");
  
  //2d array
  var arrayB = test_fixture_array2(2, 5, "a", "b", 7);
  test_case(__gma_debug_value__(arrayB), "(array)" + nl + "[5, \"a\"; \"b\", 7]");
  
  //list
  var listEmpty = test_fixture_list(),
      listFilled = test_fixture_list(3, "waahoo", test_fixture_array(5, 6, 7)),
      listDNE = listFilled+1;
  while (ds_exists(listDNE, ds_type_list)) listDNE++;
  test_case(__gma_debug_list_value__(listDNE), "list(<INVALID>)");
  test_case(__gma_debug_list_value__(listEmpty), "list()");
  test_case(__gma_debug_list_value__(listFilled), "list(3, \"waahoo\", [5, 6, 7])");
  ds_list_destroy(listEmpty);
  ds_list_destroy(listFilled);
}
