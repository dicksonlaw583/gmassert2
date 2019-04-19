{
  var arrayA = test_fixture_array(1, 2, 3),
      arrayB = test_fixture_array2(2, "a", "b", "c", "d"),
      list = ds_list_create();
  ds_list_add(list, "a", "b", 1, 2);
  
  //assert(got)
  test_case_no_trigger(assert(5 > 3));
  test_case_trigger(assert("waahoo" == "woohah"));
  test_case_trigger(assert(undefined));
  
  //assert_fail(got)
  test_case_no_trigger(assert_fail("waahoo" == "woohah"));
  test_case_no_trigger(assert_fail(undefined));
  test_case_trigger(assert_fail(5 > 3));
  
  //assert_operation(got, expected, op, invert, [msg], [debug_got], [debug_expected])
  test_case_no_trigger(assert_operation(584, 583, test_fixture_greater_than, false));
  test_case_trigger(assert_operation(582, 583, test_fixture_greater_than, false));
  test_case_trigger(assert_operation(584, 583, test_fixture_greater_than, true));
  test_case_no_trigger(assert_operation(582, 583, test_fixture_greater_than, true));
  
  //assert_equal(got, expected)
  test_case_no_trigger(assert_equal(-4, -4));
  test_case_no_trigger(assert_equal("abc", "abc"));
  test_case_no_trigger(assert_equal(undefined, undefined));
  test_case_no_trigger(assert_equal(arrayA, arrayA));
  test_case_no_trigger(assert_equal(arrayB, arrayB));
  test_case_trigger(assert_equal(-4, 7));
  test_case_trigger(assert_equal("abc", ""));
  test_case_trigger(assert_equal(undefined, 72));
  test_case_trigger(assert_equal(arrayA, arrayB));
  test_case_no_trigger(assert_equal(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  test_case_no_trigger(assert_equal(arrayA, test_fixture_array(1, 2, 3)));
  
  //assert_not_equal(got, expected)
  test_case_no_trigger(assert_not_equal(-4, 7));
  test_case_no_trigger(assert_not_equal("abc", ""));
  test_case_no_trigger(assert_not_equal(undefined, 72));
  test_case_no_trigger(assert_not_equal(arrayA, arrayB));
  test_case_trigger(assert_not_equal(arrayA, test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_not_equal(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_not_equal(-4, -4));
  test_case_trigger(assert_not_equal("abc", "abc"));
  test_case_trigger(assert_not_equal(undefined, undefined));
  test_case_trigger(assert_not_equal(arrayA, arrayA));
  test_case_trigger(assert_not_equal(arrayB, arrayB));
  
  //assert_is(got, expected)
  test_case_no_trigger(assert_is(-4, -4));
  test_case_no_trigger(assert_is("abc", "abc"));
  test_case_no_trigger(assert_is(undefined, undefined));
  test_case_no_trigger(assert_is(arrayA, arrayA));
  test_case_no_trigger(assert_is(arrayB, arrayB));
  test_case_trigger(assert_is(-4, 7));
  test_case_trigger(assert_is("abc", ""));
  test_case_trigger(assert_is(undefined, 72));
  test_case_trigger(assert_is(arrayA, arrayB));
  test_case_trigger(assert_is(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  
  //assert_isnt(got, expected)
  test_case_no_trigger(assert_isnt(-4, 7));
  test_case_no_trigger(assert_isnt("abc", ""));
  test_case_no_trigger(assert_isnt(undefined, 72));
  test_case_no_trigger(assert_isnt(arrayA, arrayB));
  test_case_no_trigger(assert_isnt(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_isnt(-4, -4));
  test_case_trigger(assert_isnt("abc", "abc"));
  test_case_trigger(assert_isnt(undefined, undefined));
  test_case_trigger(assert_isnt(arrayA, arrayA));
  test_case_trigger(assert_isnt(arrayB, arrayB));
  
  //assert_equalish(got, expected)
  test_case_no_trigger(assert_equalish(-4, -4));
  test_case_no_trigger(assert_equalish("abc", "abc"));
  test_case_no_trigger(assert_equalish(undefined, undefined));
  test_case_no_trigger(assert_equalish(arrayA, arrayA));
  test_case_no_trigger(assert_equalish(arrayB, arrayB));
  test_case_trigger(assert_equalish(-4, 7));
  test_case_trigger(assert_equalish("abc", ""));
  test_case_trigger(assert_equalish(undefined, 72));
  test_case_trigger(assert_equalish(arrayA, arrayB));
  test_case_no_trigger(assert_equalish(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  test_case_no_trigger(assert_equalish(arrayA, test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_equalish(5, 5.001));
  test_case_no_trigger(assert_equalish(5, 5+GMASSERT_TOLERANCE/2));
  test_case_trigger(assert_equalish(test_fixture_array(6, 5), test_fixture_array(6, 5.001)));
  test_case_no_trigger(assert_equalish(test_fixture_array(6, 5), test_fixture_array(6, 5+GMASSERT_TOLERANCE/2)));
  
  //assert_not_equalish(got, expected)
  test_case_no_trigger(assert_not_equalish(-4, 7));
  test_case_no_trigger(assert_not_equalish("abc", ""));
  test_case_no_trigger(assert_not_equalish(undefined, 72));
  test_case_no_trigger(assert_not_equalish(arrayA, arrayB));
  test_case_trigger(assert_not_equalish(arrayA, test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_not_equalish(test_fixture_array(1, 2, 3), test_fixture_array(1, 2, 3)));
  test_case_trigger(assert_not_equalish(-4, -4));
  test_case_trigger(assert_not_equalish("abc", "abc"));
  test_case_trigger(assert_not_equalish(undefined, undefined));
  test_case_trigger(assert_not_equalish(arrayA, arrayA));
  test_case_trigger(assert_not_equalish(arrayB, arrayB));
  test_case_no_trigger(assert_not_equalish(5, 5.001));
  test_case_trigger(assert_not_equalish(5, 5+GMASSERT_TOLERANCE/2));
  test_case_no_trigger(assert_not_equalish(test_fixture_array(6, 5), test_fixture_array(6, 5.001)));
  test_case_trigger(assert_not_equalish(test_fixture_array(6, 5), test_fixture_array(6, 5+GMASSERT_TOLERANCE/2)));

  //assert_greater_than(got, expected)
  test_case_trigger(assert_greater_than("NOT SUPPORTED", undefined));
  test_case_no_trigger(assert_greater_than(5, 3));
  test_case_no_trigger(assert_greater_than("cat", "boogie"));
  test_case_no_trigger(assert_greater_than("DOGS", "DOG"));
  test_case_no_trigger(assert_greater_than(test_fixture_array(5, "cat", "DOGS"), test_fixture_array(4, "boogie", "DOG")));
  test_case_no_trigger(assert_greater_than(test_fixture_array2(2, 5, "cat", "DOGS", 907), test_fixture_array2(2, 4, "boogie", "DOG", 583)));
  test_case_trigger(assert_greater_than(3, 5));
  test_case_trigger(assert_greater_than(3, 3));
  test_case_trigger(assert_greater_than("boogie", "cat"));
  test_case_trigger(assert_greater_than("boogie", "boogie"));
  test_case_trigger(assert_greater_than("DOG", "DOGS"));
  test_case_trigger(assert_greater_than(test_fixture_array(5, "cat", "DOGS"), test_fixture_array(4, "cat", "DOG")));
  test_case_trigger(assert_greater_than(arrayA, arrayA));
  test_case_trigger(assert_greater_than(test_fixture_array2(2, 5, "cat", "DOGS", 907), test_fixture_array2(2, 4, "boogie", "DOG", 907)));
  test_case_trigger(assert_greater_than(arrayB, arrayB));
  
  //assert_less_than(got, expected)
  test_case_trigger(assert_less_than("NOT SUPPORTED", undefined));
  test_case_trigger(assert_less_than(5, 3));
  test_case_trigger(assert_less_than("cat", "boogie"));
  test_case_trigger(assert_less_than("DOGS", "DOG"));
  test_case_trigger(assert_less_than(test_fixture_array(2, "cat", "DOGS"), test_fixture_array(4, "boogie", "DOG")));
  test_case_trigger(assert_less_than(test_fixture_array2(2, 3, "cat", "DOG", 907), test_fixture_array2(2, 4, "boogie", "DOGS", 583)));
  test_case_no_trigger(assert_less_than(3, 5));
  test_case_trigger(assert_less_than(3, 3));
  test_case_no_trigger(assert_less_than("boogie", "cat"));
  test_case_trigger(assert_less_than("boogie", "boogie"));
  test_case_no_trigger(assert_less_than("DOG", "DOGS"));
  test_case_no_trigger(assert_less_than(test_fixture_array(4, "cat", "DOG"), test_fixture_array(5, "cats", "DOGS")));
  test_case_trigger(assert_less_than(test_fixture_array(5, "cat", "DOGS"), test_fixture_array(4, "cat", "DOG")));
  test_case_trigger(assert_less_than(arrayA, arrayA));
  test_case_no_trigger(assert_less_than(test_fixture_array2(2, 4, "boogie", "DOG", 583), test_fixture_array2(2, 5, "cat", "DOGS", 907)));
  test_case_trigger(assert_less_than(test_fixture_array2(2, 5, "cat", "DOGS", 907), test_fixture_array2(2, 4, "boogie", "DOG", 907)));
  test_case_trigger(assert_less_than(arrayB, arrayB));
  
  //assert_greater_than_or_equal(got, expected)
  test_case_trigger(assert_greater_than_or_equal("NOT SUPPORTED", undefined));
  test_case_no_trigger(assert_greater_than_or_equal(5, 3));
  test_case_no_trigger(assert_greater_than_or_equal(5, 5));
  test_case_no_trigger(assert_greater_than_or_equal("cat", "boogie"));
  test_case_no_trigger(assert_greater_than_or_equal("cat", "cat"));
  test_case_no_trigger(assert_greater_than_or_equal("DOGS", "DOG"));
  test_case_no_trigger(assert_greater_than_or_equal(test_fixture_array(5, "cat", "DOGS"), test_fixture_array(4, "boogie", "DOG")));
  test_case_no_trigger(assert_greater_than_or_equal(test_fixture_array(5, "cat", "DOG"), test_fixture_array(4, "boogie", "DOG")));
  test_case_no_trigger(assert_greater_than_or_equal(test_fixture_array2(2, 5, "cat", "DOGS", 907), test_fixture_array2(2, 4, "boogie", "DOG", 583)));
  test_case_no_trigger(assert_greater_than_or_equal(test_fixture_array2(2, 4, "cat", "DOGS", 583), test_fixture_array2(2, 4, "boogie", "DOG", 583)));
  test_case_trigger(assert_greater_than_or_equal(3, 5));
  test_case_trigger(assert_greater_than_or_equal("boogie", "cat"));
  test_case_trigger(assert_greater_than_or_equal("DOG", "DOGS"));
  test_case_trigger(assert_greater_than_or_equal(test_fixture_array(5, "cat", "DOGS"), test_fixture_array(4, "cats", "DOG")));
  test_case_trigger(assert_greater_than_or_equal(test_fixture_array2(2, 5, "cat", "DOGS", 907), test_fixture_array2(2, 4, "doggie", "DOG", 907)));
  
  //assert_less_than_or_equal(got, expected)
  test_case_trigger(assert_less_than_or_equal("NOT SUPPORTED", undefined));
  test_case_trigger(assert_less_than_or_equal(5, 3));
  test_case_trigger(assert_less_than_or_equal("cat", "boogie"));
  test_case_trigger(assert_less_than_or_equal("DOGS", "DOG"));
  test_case_trigger(assert_less_than_or_equal(test_fixture_array(4, "boogie", "DOGS"), test_fixture_array(5, "cat", "DOG")));
  test_case_trigger(assert_less_than_or_equal(test_fixture_array2(2, 4, "cat", "DOGS", 907), test_fixture_array2(2, 5, "boogie", "DOG", 583)));
  test_case_no_trigger(assert_less_than_or_equal(3, 5));
  test_case_no_trigger(assert_less_than_or_equal(3, 3));
  test_case_no_trigger(assert_less_than_or_equal("boogie", "cat"));
  test_case_no_trigger(assert_less_than_or_equal("boogie", "boogie"));
  test_case_no_trigger(assert_less_than_or_equal("DOG", "DOGS"));
  test_case_no_trigger(assert_less_than_or_equal(test_fixture_array(4, "cat", "DOG"), test_fixture_array(5, "cat", "DOGS")));
  test_case_no_trigger(assert_less_than_or_equal(arrayA, arrayA));
  test_case_no_trigger(assert_less_than_or_equal(test_fixture_array2(2, 2, "boogie", "DOG", 907), test_fixture_array2(2, 5, "cat", "DOGS", 907)));
  test_case_no_trigger(assert_less_than_or_equal(arrayB, arrayB));
  
  //assert_is_string(got)
  test_case_trigger(assert_is_string(undefined));
  test_case_trigger(assert_is_string(3));
  test_case_no_trigger(assert_is_string(""));
  test_case_trigger(assert_is_string(arrayA));
  test_case_trigger(assert_is_string(arrayB));
  
  //assert_isnt_string(got)
  test_case_no_trigger(assert_isnt_string(undefined));
  test_case_no_trigger(assert_isnt_string(3));
  test_case_trigger(assert_isnt_string(""));
  test_case_no_trigger(assert_isnt_string(arrayA));
  test_case_no_trigger(assert_isnt_string(arrayB));
  
  //assert_is_real(got)
  test_case_trigger(assert_is_real(undefined));
  test_case_no_trigger(assert_is_real(3));
  test_case_trigger(assert_is_real(""));
  test_case_trigger(assert_is_real(arrayA));
  test_case_trigger(assert_is_real(arrayB));
  
  //assert_isn_real(got)
  test_case_no_trigger(assert_isnt_real(undefined));
  test_case_trigger(assert_isnt_real(3));
  test_case_no_trigger(assert_isnt_real(""));
  test_case_no_trigger(assert_isnt_real(arrayA));
  test_case_no_trigger(assert_isnt_real(arrayB));
  
  //assert_is_array(got)
  test_case_trigger(assert_is_array(undefined));
  test_case_trigger(assert_is_array(3));
  test_case_trigger(assert_is_array(""));
  test_case_no_trigger(assert_is_array(arrayA));
  test_case_no_trigger(assert_is_array(arrayB));
  
  //assert_isn_array(got)
  test_case_no_trigger(assert_isnt_array(undefined));
  test_case_no_trigger(assert_isnt_array(3));
  test_case_no_trigger(assert_isnt_array(""));
  test_case_trigger(assert_isnt_array(arrayA));
  test_case_trigger(assert_isnt_array(arrayB));
  
  //assert_is_undefined(got)
  //TODO: 1.4.1711 bug prevents assert_is_undefined() from saving at all, uncomment when resolved.
  //test_case_no_trigger(assert_is_undefined(undefined));
  //test_case_trigger(assert_is_undefined(3));
  //test_case_trigger(assert_is_undefined(""));
  //test_case_trigger(assert_is_undefined(arrayA));
  //test_case_trigger(assert_is_undefined(arrayB));
  
  //assert_is_defined(got)
  test_case_trigger(assert_is_defined(undefined));
  test_case_no_trigger(assert_is_defined(3));
  test_case_no_trigger(assert_is_defined(""));
  test_case_no_trigger(assert_is_defined(arrayA));
  test_case_no_trigger(assert_is_defined(arrayB));
  
  //assert_isnt_undefined(got)
  //TODO: 1.4.1711 bug prevents assert_isnt_undefined() from saving at all, uncomment when resolved.
  //test_case_trigger(assert_isnt_undefined(undefined));
  //test_case_no_trigger(assert_isnt_undefined(3));
  //test_case_no_trigger(assert_isnt_undefined(""));
  //test_case_no_trigger(assert_isnt_undefined(arrayA));
  //test_case_no_trigger(assert_isnt_undefined(arrayB));
  
  //assert_isnt_defined(got)
  test_case_no_trigger(assert_isnt_defined(undefined));
  test_case_trigger(assert_isnt_defined(3));
  test_case_trigger(assert_isnt_defined(""));
  test_case_trigger(assert_isnt_defined(arrayA));
  test_case_trigger(assert_isnt_defined(arrayB));
  
  //assert_in_range(got, lower, upper)
  test_case_trigger(assert_in_range(undefined, undefined, undefined));
  test_case_trigger(assert_in_range(3, 2, "5"));
  test_case_trigger(assert_in_range(pi, 4, 5));
  test_case_trigger(assert_in_range(pi, 2, 3));
  test_case_no_trigger(assert_in_range(pi, 3, 4));
  test_case_no_trigger(assert_in_range(pi, pi, 4));
  test_case_no_trigger(assert_in_range(pi, 3, pi));
  test_case_trigger(assert_in_range("Alice", "Bob", "Caitlyn"));
  test_case_trigger(assert_in_range("David", "Bob", "Caitlyn"));
  test_case_no_trigger(assert_in_range("Bob", "Alice", "Caitlyn"));
  test_case_no_trigger(assert_in_range("Alice", "Alice", "Bob"));
  test_case_no_trigger(assert_in_range("Bob", "Alice", "Bob"));
  test_case_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(4, "Caitlyn"), test_fixture_array(5, "David")));
  test_case_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(2, "Alice"), test_fixture_array(3, "Annie")));
  test_case_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(2, "Alice"), test_fixture_array(3, "Caitlyn")));
  test_case_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Alice"), test_fixture_array(4, "Annie")));
  test_case_no_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Alice"), test_fixture_array(4, "Caitlyn")));
  test_case_no_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Bob"), test_fixture_array(4, "Caitlyn")));
  test_case_no_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(pi, "Bob"), test_fixture_array(4, "Caitlyn")));
  test_case_no_trigger(assert_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(pi, "Alice"), test_fixture_array(4, "Bob")));

  //assert_not_in_range(got, lower, upper)
  test_case_trigger(assert_not_in_range(undefined, undefined, undefined));
  test_case_trigger(assert_not_in_range(3, 2, "5"));
  test_case_no_trigger(assert_not_in_range(pi, 4, 5));
  test_case_no_trigger(assert_not_in_range(pi, 2, 3));
  test_case_trigger(assert_not_in_range(pi, 3, 4));
  test_case_trigger(assert_not_in_range(pi, pi, 4));
  test_case_trigger(assert_not_in_range(pi, 3, pi));
  test_case_no_trigger(assert_not_in_range("Alice", "Bob", "Caitlyn"));
  test_case_no_trigger(assert_not_in_range("David", "Bob", "Caitlyn"));
  test_case_trigger(assert_not_in_range("Bob", "Alice", "Caitlyn"));
  test_case_trigger(assert_not_in_range("Alice", "Alice", "Bob"));
  test_case_trigger(assert_not_in_range("Bob", "Alice", "Bob"));
  test_case_no_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(4, "Caitlyn"), test_fixture_array(5, "David")));
  test_case_no_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(2, "Alice"), test_fixture_array(3, "Annie")));
  test_case_no_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(2, "Alice"), test_fixture_array(3, "Caitlyn")));
  test_case_no_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Alice"), test_fixture_array(4, "Annie")));
  test_case_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Alice"), test_fixture_array(4, "Caitlyn")));
  test_case_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(3, "Bob"), test_fixture_array(4, "Caitlyn")));
  test_case_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(pi, "Bob"), test_fixture_array(4, "Caitlyn")));
  test_case_trigger(assert_not_in_range(test_fixture_array(pi, "Bob"), test_fixture_array(pi, "Alice"), test_fixture_array(4, "Bob")));

  //assert_contains(got, content)
  test_case_trigger(assert_contains(undefined, "waahoo"));
  var inexistent = 0;
  while (ds_exists(inexistent, ds_type_list)) inexistent++;
  test_case_trigger(assert_contains(inexistent, "a"));
  test_case_trigger(assert_contains("waahoo", 5));
  test_case_trigger(assert_contains("waahoo", "abc"));
  test_case_no_trigger(assert_contains("Caitlyn", "it"));
  test_case_no_trigger(assert_contains("Caitlyn", "Ca"));
  test_case_no_trigger(assert_contains("Caitlyn", "n"));
  test_case_trigger(assert_contains(arrayA, "WAAHOO"));
  test_case_no_trigger(assert_contains(arrayA, 3));
  test_case_trigger(assert_contains(arrayB, undefined));
  test_case_trigger(assert_contains(arrayB, 583));
  test_case_trigger(assert_contains(arrayB, "superwaahoo"));
  test_case_no_trigger(assert_contains(arrayB, "a"));
  test_case_no_trigger(assert_contains(arrayB, "d"));
  test_case_trigger(assert_contains(list, undefined));
  test_case_trigger(assert_contains(list, arrayA));
  test_case_no_trigger(assert_contains(list, "b"));
  test_case_no_trigger(assert_contains(list, 2));
  
  //assert_doesnt_contain(got, content)
  test_case_trigger(assert_doesnt_contain(undefined, "waahoo"));
  var inexistent = 0;
  while (ds_exists(inexistent, ds_type_list)) inexistent++;
  test_case_trigger(assert_doesnt_contain(inexistent, "a"));
  test_case_trigger(assert_doesnt_contain("waahoo", 5));
  test_case_no_trigger(assert_doesnt_contain("waahoo", "abc"));
  test_case_trigger(assert_doesnt_contain("Caitlyn", "it"));
  test_case_trigger(assert_doesnt_contain("Caitlyn", "Ca"));
  test_case_trigger(assert_doesnt_contain("Caitlyn", "n"));
  test_case_no_trigger(assert_doesnt_contain(arrayA, "WAAHOO"));
  test_case_trigger(assert_doesnt_contain(arrayA, 3));
  test_case_no_trigger(assert_doesnt_contain(arrayB, undefined));
  test_case_no_trigger(assert_doesnt_contain(arrayB, 583));
  test_case_no_trigger(assert_doesnt_contain(arrayB, "superwaahoo"));
  test_case_trigger(assert_doesnt_contain(arrayB, "a"));
  test_case_trigger(assert_doesnt_contain(arrayB, "d"));
  test_case_no_trigger(assert_doesnt_contain(list, undefined));
  test_case_no_trigger(assert_doesnt_contain(list, arrayA));
  test_case_trigger(assert_doesnt_contain(list, "b"));
  test_case_trigger(assert_doesnt_contain(list, 2));
  
  //assert_contains_exact(got, content)
  test_case_trigger(assert_contains_exact(undefined, "waahoo"));
  var inexistent = 0;
  while (ds_exists(inexistent, ds_type_list)) inexistent++;
  test_case_trigger(assert_contains_exact(inexistent, "a"));
  test_case_trigger(assert_contains_exact("waahoo", 5));
  test_case_trigger(assert_contains_exact("waahoo", "abc"));
  test_case_no_trigger(assert_contains_exact("Caitlyn", "it"));
  test_case_no_trigger(assert_contains_exact("Caitlyn", "Ca"));
  test_case_no_trigger(assert_contains_exact("Caitlyn", "n"));
  test_case_trigger(assert_contains_exact(arrayA, "WAAHOO"));
  test_case_no_trigger(assert_contains_exact(arrayA, 3));
  test_case_trigger(assert_contains_exact(arrayB, undefined));
  test_case_trigger(assert_contains_exact(arrayB, 583));
  test_case_trigger(assert_contains_exact(arrayB, "superwaahoo"));
  test_case_no_trigger(assert_contains_exact(arrayB, "a"));
  test_case_no_trigger(assert_contains_exact(arrayB, "d"));
  test_case_trigger(assert_contains_exact(list, undefined));
  test_case_trigger(assert_contains_exact(list, arrayA));
  test_case_no_trigger(assert_contains_exact(list, "b"));
  test_case_no_trigger(assert_contains_exact(list, 2));
  
  //assert_doesnt_contain_exact(got, content)
  test_case_trigger(assert_doesnt_contain_exact(undefined, "waahoo"));
  var inexistent = 0;
  while (ds_exists(inexistent, ds_type_list)) inexistent++;
  test_case_trigger(assert_doesnt_contain_exact(inexistent, "a"));
  test_case_trigger(assert_doesnt_contain_exact("waahoo", 5));
  test_case_no_trigger(assert_doesnt_contain_exact("waahoo", "abc"));
  test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "it"));
  test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "Ca"));
  test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "n"));
  test_case_no_trigger(assert_doesnt_contain_exact(arrayA, "WAAHOO"));
  test_case_trigger(assert_doesnt_contain_exact(arrayA, 3));
  test_case_no_trigger(assert_doesnt_contain_exact(arrayB, undefined));
  test_case_no_trigger(assert_doesnt_contain_exact(arrayB, 583));
  test_case_no_trigger(assert_doesnt_contain_exact(arrayB, "superwaahoo"));
  test_case_trigger(assert_doesnt_contain_exact(arrayB, "a"));
  test_case_trigger(assert_doesnt_contain_exact(arrayB, "d"));
  test_case_no_trigger(assert_doesnt_contain_exact(list, undefined));
  test_case_no_trigger(assert_doesnt_contain_exact(list, arrayA));
  test_case_trigger(assert_doesnt_contain_exact(list, "b"));
  test_case_trigger(assert_doesnt_contain_exact(list, 2));
  
  //CLEANUP
  ds_list_destroy(list);
}
