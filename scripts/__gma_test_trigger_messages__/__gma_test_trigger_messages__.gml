function __gma_test_trigger_messages__() {
	var arrayA = [1, 2, 3],
		arrayB = [["a", "b"], ["c", "d"]],
		structA = {a: 3, b: 5, c: 7},
		structB = {a: {b: 5, c: 7, d: 9}},
		list = ds_list_create(),
		grid = ds_grid_create(2, 2),
		inexistent = 0;
	ds_list_add(list, "a", "b", 1, 2);
	grid[# 0, 0] = "A";
	grid[# 1, 0] = "B";
	grid[# 0, 1] = "C";
	grid[# 1, 1] = "D";

	//assert(got)
	test_case_no_trigger(assert(5 > 3), "__gma_test_trigger_messages__: assert 1");
	test_case_trigger(assert("waahoo" == "woohah"), "__gma_test_trigger_messages__: assert 2");
	test_case_trigger(assert(undefined), "__gma_test_trigger_messages__: assert 3");

	//assert_fail(got)
	test_case_no_trigger(assert_fail("waahoo" == "woohah"), "__gma_test_trigger_messages__: assert_fail 1");
	test_case_no_trigger(assert_fail(undefined), "__gma_test_trigger_messages__: assert_fail 2");
	test_case_trigger(assert_fail(5 > 3), "__gma_test_trigger_messages__: assert_fail 3");

	//assert_operation(got, expected, op, invert, [msg], [debug_got], [debug_expected])
	test_case_no_trigger(assert_operation(584, 583, test_fixture_greater_than, false), "__gma_test_trigger_messages__: assert_operation 1");
	test_case_trigger(assert_operation(582, 583, test_fixture_greater_than, false), "__gma_test_trigger_messages__: assert_operation 2");
	test_case_trigger(assert_operation(584, 583, test_fixture_greater_than, true), "__gma_test_trigger_messages__: assert_operation 3");
	test_case_no_trigger(assert_operation(582, 583, test_fixture_greater_than, true), "__gma_test_trigger_messages__: assert_operation 4");

	//assert_equal(got, expected)
	test_case_no_trigger(assert_equal(-4, -4), "__gma_test_trigger_messages__: assert_equal 1");
	test_case_no_trigger(assert_equal("abc", "abc"), "__gma_test_trigger_messages__: assert_equal 2");
	test_case_no_trigger(assert_equal(undefined, undefined), "__gma_test_trigger_messages__: assert_equal 3");
	test_case_no_trigger(assert_equal(arrayA, arrayA), "__gma_test_trigger_messages__: assert_equal 4");
	test_case_no_trigger(assert_equal(arrayB, arrayB), "__gma_test_trigger_messages__: assert_equal 5");
	test_case_no_trigger(assert_equal(structA, structA), "__gma_test_trigger_messages__: assert_equal 6");
	test_case_no_trigger(assert_equal(structB, structB), "__gma_test_trigger_messages__: assert_equal 7");
	test_case_trigger(assert_equal(-4, 7), "__gma_test_trigger_messages__: assert_equal 8");
	test_case_trigger(assert_equal("abc", ""), "__gma_test_trigger_messages__: assert_equal 9");
	test_case_trigger(assert_equal(undefined, 72), "__gma_test_trigger_messages__: assert_equal 10");
	test_case_trigger(assert_equal(arrayA, arrayB), "__gma_test_trigger_messages__: assert_equal 11");
	test_case_no_trigger(assert_equal([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_equal 12");
	test_case_no_trigger(assert_equal(arrayA, [1, 2, 3]), "__gma_test_trigger_messages__: assert_equal 13");
	test_case_trigger(assert_equal({a: 3}, {b: 4}), "__gma_test_trigger_messages__: assert_equal 14");
	test_case_trigger(assert_equal({a: 3}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_equal 15");
	test_case_no_trigger(assert_equal({a: 3, b: 4}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_equal 16");
	test_case_no_trigger(assert_equal({a: 3, b: 4}, {b: 4, a: 3}), "__gma_test_trigger_messages__: assert_equal 17");

	//assert_not_equal(got, expected)
	test_case_no_trigger(assert_not_equal(-4, 7), "__gma_test_trigger_messages__: assert_not_equal 1");
	test_case_no_trigger(assert_not_equal("abc", ""), "__gma_test_trigger_messages__: assert_not_equal 2");
	test_case_no_trigger(assert_not_equal(undefined, 72), "__gma_test_trigger_messages__: assert_not_equal 3");
	test_case_no_trigger(assert_not_equal(arrayA, arrayB), "__gma_test_trigger_messages__: assert_not_equal 4");
	test_case_no_trigger(assert_not_equal(structA, structB), "__gma_test_trigger_messages__: assert_not_equal 5");
	test_case_trigger(assert_not_equal(arrayA, [1, 2, 3]), "__gma_test_trigger_messages__: assert_not_equal 6");
	test_case_trigger(assert_not_equal([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_not_equal 7");
	test_case_trigger(assert_not_equal(-4, -4), "__gma_test_trigger_messages__: assert_not_equal 8");
	test_case_trigger(assert_not_equal("abc", "abc"), "__gma_test_trigger_messages__: assert_not_equal 9");
	test_case_trigger(assert_not_equal(undefined, undefined), "__gma_test_trigger_messages__: assert_not_equal 10");
	test_case_trigger(assert_not_equal(arrayA, arrayA), "__gma_test_trigger_messages__: assert_not_equal 11");
	test_case_trigger(assert_not_equal(arrayB, arrayB), "__gma_test_trigger_messages__: assert_not_equal 12");
	test_case_no_trigger(assert_not_equal({a: 3}, {b: 4}), "__gma_test_trigger_messages__: assert_not_equal 13");
	test_case_no_trigger(assert_not_equal({a: 3}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_not_equal 14");
	test_case_trigger(assert_not_equal({a: 3, b: 4}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_not_equal 15");
	test_case_trigger(assert_not_equal({a: 3, b: 4}, {b: 4, a: 3}), "__gma_test_trigger_messages__: assert_not_equal 16");

	//assert_is(got, expected)
	test_case_no_trigger(assert_is(-4, -4), "__gma_test_trigger_messages__: assert_is 1");
	test_case_no_trigger(assert_is("abc", "abc"), "__gma_test_trigger_messages__: assert_is 2");
	test_case_no_trigger(assert_is(undefined, undefined), "__gma_test_trigger_messages__: assert_is 3");
	test_case_no_trigger(assert_is(arrayA, arrayA), "__gma_test_trigger_messages__: assert_is 4");
	test_case_no_trigger(assert_is(arrayB, arrayB), "__gma_test_trigger_messages__: assert_is 5");
	test_case_no_trigger(assert_is(structA, structA), "__gma_test_trigger_messages__: assert_is 6");
	test_case_no_trigger(assert_is(structB, structB), "__gma_test_trigger_messages__: assert_is 7");
	test_case_trigger(assert_is(-4, 7), "__gma_test_trigger_messages__: assert_is 8");
	test_case_trigger(assert_is("abc", ""), "__gma_test_trigger_messages__: assert_is 9");
	test_case_trigger(assert_is(undefined, 72), "__gma_test_trigger_messages__: assert_is 10");
	test_case_trigger(assert_is(arrayA, arrayB), "__gma_test_trigger_messages__: assert_is 11");
	test_case_trigger(assert_is([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_is 12");
	test_case_trigger(assert_is({a: 3, b: 4}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_is 13");

	//assert_isnt(got, expected)
	test_case_no_trigger(assert_isnt(-4, 7), "__gma_test_trigger_messages__: assert_isnt 1");
	test_case_no_trigger(assert_isnt("abc", ""), "__gma_test_trigger_messages__: assert_isnt 2");
	test_case_no_trigger(assert_isnt(undefined, 72), "__gma_test_trigger_messages__: assert_isnt 3");
	test_case_no_trigger(assert_isnt(arrayA, arrayB), "__gma_test_trigger_messages__: assert_isnt 4");
	test_case_no_trigger(assert_isnt(structA, structB), "__gma_test_trigger_messages__: assert_isnt 5");
	test_case_no_trigger(assert_isnt([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_isnt 6");
	test_case_no_trigger(assert_isnt({a: 3, b: 4}, {a: 3, b: 4}), "__gma_test_trigger_messages__: assert_isnt 7");
	test_case_trigger(assert_isnt(-4, -4), "__gma_test_trigger_messages__: assert_isnt 8");
	test_case_trigger(assert_isnt("abc", "abc"), "__gma_test_trigger_messages__: assert_isnt 9");
	test_case_trigger(assert_isnt(undefined, undefined), "__gma_test_trigger_messages__: assert_isnt 10");
	test_case_trigger(assert_isnt(arrayA, arrayA), "__gma_test_trigger_messages__: assert_isnt 11");
	test_case_trigger(assert_isnt(arrayB, arrayB), "__gma_test_trigger_messages__: assert_isnt 12");
	test_case_trigger(assert_isnt(structA, structA), "__gma_test_trigger_messages__: assert_isnt 13");
	test_case_trigger(assert_isnt(structB, structB), "__gma_test_trigger_messages__: assert_isnt 14");

	//assert_equalish(got, expected)
	test_case_no_trigger(assert_equalish(-4, -4), "__gma_test_trigger_messages__: assert_equalish 1");
	test_case_no_trigger(assert_equalish("abc", "abc"), "__gma_test_trigger_messages__: assert_equalish 2");
	test_case_no_trigger(assert_equalish(undefined, undefined), "__gma_test_trigger_messages__: assert_equalish 3");
	test_case_no_trigger(assert_equalish(arrayA, arrayA), "__gma_test_trigger_messages__: assert_equalish 4");
	test_case_no_trigger(assert_equalish(arrayB, arrayB), "__gma_test_trigger_messages__: assert_equalish 5");
	test_case_no_trigger(assert_equalish(structA, structA), "__gma_test_trigger_messages__: assert_equalish 6");
	test_case_no_trigger(assert_equalish(structB, structB), "__gma_test_trigger_messages__: assert_equalish 7");
	test_case_trigger(assert_equalish(-4, 7), "__gma_test_trigger_messages__: assert_equalish 8");
	test_case_trigger(assert_equalish("abc", ""), "__gma_test_trigger_messages__: assert_equalish 9");
	test_case_trigger(assert_equalish(undefined, 72), "__gma_test_trigger_messages__: assert_equalish 10");
	test_case_trigger(assert_equalish(arrayA, arrayB), "__gma_test_trigger_messages__: assert_equalish 11");
	test_case_no_trigger(assert_equalish([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_equalish 12");
	test_case_no_trigger(assert_equalish(arrayA, [1, 2, 3]), "__gma_test_trigger_messages__: assert_equalish 13");
	test_case_trigger(assert_equalish(5, 5.001), "__gma_test_trigger_messages__: assert_equalish 14");
	test_case_no_trigger(assert_equalish(5, 5+GMASSERT_TOLERANCE/2), "__gma_test_trigger_messages__: assert_equalish 15");
	test_case_trigger(assert_equalish([6, 5], [6, 5.001]), "__gma_test_trigger_messages__: assert_equalish 16");
	test_case_no_trigger(assert_equalish([6, 5], [6, 5+GMASSERT_TOLERANCE/2]), "__gma_test_trigger_messages__: assert_equalish 17");
	test_case_trigger(assert_equalish([{foo: 6, bar: 5}], [{foo:6, bar: 5.001}]), "__gma_test_trigger_messages__: assert_equalish 18");
	test_case_no_trigger(assert_equalish([{foo: 6, bar: 5}], [{foo: 6, bar: 5+GMASSERT_TOLERANCE/2}]), "__gma_test_trigger_messages__: assert_equalish 19");

	//assert_not_equalish(got, expected)
	test_case_no_trigger(assert_not_equalish(-4, 7), "__gma_test_trigger_messages__: assert_not_equalish 1");
	test_case_no_trigger(assert_not_equalish("abc", ""), "__gma_test_trigger_messages__: assert_not_equalish 2");
	test_case_no_trigger(assert_not_equalish(undefined, 72), "__gma_test_trigger_messages__: assert_not_equalish 3");
	test_case_no_trigger(assert_not_equalish(arrayA, arrayB), "__gma_test_trigger_messages__: assert_not_equalish 4");
	test_case_no_trigger(assert_not_equalish(structA, structB), "__gma_test_trigger_messages__: assert_not_equalish 5");
	test_case_trigger(assert_not_equalish(arrayA, [1, 2, 3]), "__gma_test_trigger_messages__: assert_not_equalish 6");
	test_case_trigger(assert_not_equalish([1, 2, 3], [1, 2, 3]), "__gma_test_trigger_messages__: assert_not_equalish 7");
	test_case_trigger(assert_not_equalish(-4, -4), "__gma_test_trigger_messages__: assert_not_equalish 8");
	test_case_trigger(assert_not_equalish("abc", "abc"), "__gma_test_trigger_messages__: assert_not_equalish 9");
	test_case_trigger(assert_not_equalish(undefined, undefined), "__gma_test_trigger_messages__: assert_not_equalish 10");
	test_case_trigger(assert_not_equalish(arrayA, arrayA), "__gma_test_trigger_messages__: assert_not_equalish 11");
	test_case_trigger(assert_not_equalish(arrayB, arrayB), "__gma_test_trigger_messages__: assert_not_equalish 12");
	test_case_trigger(assert_not_equalish(structA, structA), "__gma_test_trigger_messages__: assert_not_equalish 13");
	test_case_trigger(assert_not_equalish(structB, structB), "__gma_test_trigger_messages__: assert_not_equalish 14");
	test_case_no_trigger(assert_not_equalish(5, 5.001), "__gma_test_trigger_messages__: assert_not_equalish 15");
	test_case_trigger(assert_not_equalish(5, 5+GMASSERT_TOLERANCE/2), "__gma_test_trigger_messages__: assert_not_equalish 16");
	test_case_no_trigger(assert_not_equalish([6, 5], [6, 5.001]), "__gma_test_trigger_messages__: assert_not_equalish 17");
	test_case_trigger(assert_not_equalish([6, 5], [6, 5+GMASSERT_TOLERANCE/2]), "__gma_test_trigger_messages__: assert_not_equalish 18");
	test_case_no_trigger(assert_not_equalish([{foo: 6, bar: 5}], [{foo: 6, bar: 5.001}]), "__gma_test_trigger_messages__: assert_not_equalish 19");
	test_case_trigger(assert_not_equalish([{foo: 6, bar: 5}], [{foo: 6, bar: 5+GMASSERT_TOLERANCE/2}]), "__gma_test_trigger_messages__: assert_not_equalish 20");

	//assert_greater_than(got, expected)
	///Feather disable GM1041
	test_case_trigger(assert_greater_than("NOT SUPPORTED", undefined), "__gma_test_trigger_messages__: assert_greater_than 1");
	///Feather enable GM1041
	test_case_no_trigger(assert_greater_than(5, 3), "__gma_test_trigger_messages__: assert_greater_than 2");
	test_case_no_trigger(assert_greater_than("cat", "boogie"), "__gma_test_trigger_messages__: assert_greater_than 3");
	test_case_no_trigger(assert_greater_than("DOGS", "DOG"), "__gma_test_trigger_messages__: assert_greater_than 4");
	test_case_no_trigger(assert_greater_than([5, "cat", "DOGS"], [4, "boogie", "DOG"]), "__gma_test_trigger_messages__: assert_greater_than 5");
	test_case_no_trigger(assert_greater_than({foo: 5, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "boogie", baz: "DOG"}), "__gma_test_trigger_messages__: assert_greater_than 6");
	test_case_no_trigger(assert_greater_than([[5, "cat"], ["DOGS", 907]], [[4, "boogie"], ["DOG", 583]]), "__gma_test_trigger_messages__: assert_greater_than 7");
	test_case_trigger(assert_greater_than(3, 5), "__gma_test_trigger_messages__: assert_greater_than 8");
	test_case_trigger(assert_greater_than(3, 3), "__gma_test_trigger_messages__: assert_greater_than 9");
	test_case_trigger(assert_greater_than("boogie", "cat"), "__gma_test_trigger_messages__: assert_greater_than 10");
	test_case_trigger(assert_greater_than("boogie", "boogie"), "__gma_test_trigger_messages__: assert_greater_than 11");
	test_case_trigger(assert_greater_than("DOG", "DOGS"), "__gma_test_trigger_messages__: assert_greater_than 12");
	test_case_trigger(assert_greater_than([5, "cat", "DOGS"], [4, "cat", "DOG"]), "__gma_test_trigger_messages__: assert_greater_than 13");
	test_case_trigger(assert_greater_than({foo: 5, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "cat", baz: "DOG"}), "__gma_test_trigger_messages__: assert_greater_than 14");
	test_case_trigger(assert_greater_than(arrayA, arrayA), "__gma_test_trigger_messages__: assert_greater_than 15");
	test_case_trigger(assert_greater_than(structA, structA), "__gma_test_trigger_messages__: assert_greater_than 16");
	test_case_trigger(assert_greater_than([[5, "cat"], ["DOGS", 907]], [[4, "boogie"], ["DOG", 907]]), "__gma_test_trigger_messages__: assert_greater_than 17");
	test_case_trigger(assert_greater_than(arrayB, arrayB), "__gma_test_trigger_messages__: assert_greater_than 18");
	test_case_trigger(assert_greater_than(structB, structB), "__gma_test_trigger_messages__: assert_greater_than 19");

	//assert_less_than(got, expected)
	///Feather disable GM1041
	test_case_trigger(assert_less_than("NOT SUPPORTED", undefined), "__gma_test_trigger_messages__: assert_less_than 1");
	///Feather enable GM1041
	test_case_trigger(assert_less_than(5, 3), "__gma_test_trigger_messages__: assert_less_than 2");
	test_case_trigger(assert_less_than("cat", "boogie"), "__gma_test_trigger_messages__: assert_less_than 3");
	test_case_trigger(assert_less_than("DOGS", "DOG"), "__gma_test_trigger_messages__: assert_less_than 4");
	test_case_trigger(assert_less_than([2, "cat", "DOGS"], [4, "boogie", "DOG"]), "__gma_test_trigger_messages__: assert_less_than 5");
	test_case_trigger(assert_less_than({foo: 2, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "boogie", baz: "DOG"}), "__gma_test_trigger_messages__: assert_less_than 6");
	test_case_trigger(assert_less_than([[3, "cat"], ["DOG", 907]], [[4, "boogie"], ["DOGS", 583]]), "__gma_test_trigger_messages__: assert_less_than 7");
	test_case_no_trigger(assert_less_than(3, 5), "__gma_test_trigger_messages__: assert_less_than 8");
	test_case_trigger(assert_less_than(3, 3), "__gma_test_trigger_messages__: assert_less_than 9");
	test_case_no_trigger(assert_less_than("boogie", "cat"), "__gma_test_trigger_messages__: assert_less_than 10");
	test_case_trigger(assert_less_than("boogie", "boogie"), "__gma_test_trigger_messages__: assert_less_than 11");
	test_case_no_trigger(assert_less_than("DOG", "DOGS"), "__gma_test_trigger_messages__: assert_less_than 12");
	test_case_no_trigger(assert_less_than([4, "cat", "DOG"], [5, "cats", "DOGS"]), "__gma_test_trigger_messages__: assert_less_than 13");
	test_case_no_trigger(assert_less_than({foo: 4, bar: "cat", baz: "DOG"}, {foo: 5, bar: "cats", baz: "DOGS"}), "__gma_test_trigger_messages__: assert_less_than 14");
	test_case_trigger(assert_less_than([5, "cat", "DOGS"], [4, "cat", "DOG"]), "__gma_test_trigger_messages__: assert_less_than 15");
	test_case_trigger(assert_less_than({foo: 5, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "cat", baz: "DOG"}), "__gma_test_trigger_messages__: assert_less_than 16");
	test_case_trigger(assert_less_than(arrayA, arrayA), "__gma_test_trigger_messages__: assert_less_than 17");
	test_case_trigger(assert_less_than(structA, structA), "__gma_test_trigger_messages__: assert_less_than 18");
	test_case_no_trigger(assert_less_than([[4, "boogie"], ["DOG", 583]], [[5, "cat"], ["DOGS", 907]]), "__gma_test_trigger_messages__: assert_less_than 19");
	test_case_trigger(assert_less_than([[5, "cat"], ["DOGS", 907]], [[4, "boogie"], ["DOG", 907]]), "__gma_test_trigger_messages__: assert_less_than 20");
	test_case_trigger(assert_less_than(arrayB, arrayB), "__gma_test_trigger_messages__: assert_less_than 21");
	test_case_trigger(assert_less_than(structA, structB), "__gma_test_trigger_messages__: assert_less_than 22");

	//assert_greater_than_or_equal(got, expected)
	///Feather disable GM1041
	test_case_trigger(assert_greater_than_or_equal("NOT SUPPORTED", undefined), "__gma_test_trigger_messages__: assert_greater_than_or_equal 1");
	///Feather enable GM1041
	test_case_no_trigger(assert_greater_than_or_equal(5, 3), "__gma_test_trigger_messages__: assert_greater_than_or_equal 2");
	test_case_no_trigger(assert_greater_than_or_equal(5, 5), "__gma_test_trigger_messages__: assert_greater_than_or_equal 3");
	test_case_no_trigger(assert_greater_than_or_equal("cat", "boogie"), "__gma_test_trigger_messages__: assert_greater_than_or_equal 4");
	test_case_no_trigger(assert_greater_than_or_equal("cat", "cat"), "__gma_test_trigger_messages__: assert_greater_than_or_equal 5");
	test_case_no_trigger(assert_greater_than_or_equal("DOGS", "DOG"), "__gma_test_trigger_messages__: assert_greater_than_or_equal 6");
	test_case_no_trigger(assert_greater_than_or_equal([5, "cat", "DOGS"], [4, "boogie", "DOG"]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 7");
	test_case_no_trigger(assert_greater_than_or_equal([5, "cat", "DOG"], [4, "boogie", "DOG"]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 8");
	test_case_no_trigger(assert_greater_than_or_equal({foo: 5, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "boogie", baz: "DOG"}), "__gma_test_trigger_messages__: assert_greater_than_or_equal 9");
	test_case_no_trigger(assert_greater_than_or_equal({foo: 5, bar: "cat", baz: "DOG"}, {foo: 4, bar: "boogie", baz: "DOG"}), "__gma_test_trigger_messages__: assert_greater_than_or_equal 10");
	test_case_no_trigger(assert_greater_than_or_equal([[5, "cat"], ["DOGS", 907]], [[4, "boogie"], ["DOG", 583]]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 11");
	test_case_no_trigger(assert_greater_than_or_equal([[4, "cat"], ["DOGS", 583]], [[4, "boogie"], ["DOG", 583]]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 12");
	test_case_trigger(assert_greater_than_or_equal(3, 5), "__gma_test_trigger_messages__: assert_greater_than_or_equal 13");
	test_case_trigger(assert_greater_than_or_equal("boogie", "cat"), "__gma_test_trigger_messages__: assert_greater_than_or_equal 14");
	test_case_trigger(assert_greater_than_or_equal("DOG", "DOGS"), "__gma_test_trigger_messages__: assert_greater_than_or_equal 15");
	test_case_trigger(assert_greater_than_or_equal([5, "cat", "DOGS"], [4, "cats", "DOG"]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 16");
	test_case_trigger(assert_greater_than_or_equal({foo: 5, bar: "cat", baz: "DOGS"}, {foo: 4, bar: "cats", baz: "DOG"}), "__gma_test_trigger_messages__: assert_greater_than_or_equal 17");
	test_case_trigger(assert_greater_than_or_equal([[5, "cat"], ["DOGS", 907]], [[4, "doggie"], ["DOG", 907]]), "__gma_test_trigger_messages__: assert_greater_than_or_equal 18");

	//assert_less_than_or_equal(got, expected)
	///Feather disable GM1041
	test_case_trigger(assert_less_than_or_equal("NOT SUPPORTED", undefined), "__gma_test_trigger_messages__: assert_less_than_or_equal 1");
	///Feather enable GM1041
	test_case_trigger(assert_less_than_or_equal(5, 3), "__gma_test_trigger_messages__: assert_less_than_or_equal 2");
	test_case_trigger(assert_less_than_or_equal("cat", "boogie"), "__gma_test_trigger_messages__: assert_less_than_or_equal 3");
	test_case_trigger(assert_less_than_or_equal("DOGS", "DOG"), "__gma_test_trigger_messages__: assert_less_than_or_equal 4");
	test_case_trigger(assert_less_than_or_equal([4, "boogie", "DOGS"], [5, "cat", "DOG"]), "__gma_test_trigger_messages__: assert_less_than_or_equal 5");
	test_case_trigger(assert_less_than_or_equal({foo: 4, bar: "boogie", baz: "DOGS"}, {foo: 5, bar: "cat", baz: "DOG"}), "__gma_test_trigger_messages__: assert_less_than_or_equal 6");
	test_case_trigger(assert_less_than_or_equal([[4, "cat"], ["DOGS", 907]], [[5, "boogie"], ["DOG", 583]]), "__gma_test_trigger_messages__: assert_less_than_or_equal 7");
	test_case_no_trigger(assert_less_than_or_equal(3, 5), "__gma_test_trigger_messages__: assert_less_than_or_equal 8");
	test_case_no_trigger(assert_less_than_or_equal(3, 3), "__gma_test_trigger_messages__: assert_less_than_or_equal 9");
	test_case_no_trigger(assert_less_than_or_equal("boogie", "cat"), "__gma_test_trigger_messages__: assert_less_than_or_equal 10");
	test_case_no_trigger(assert_less_than_or_equal("boogie", "boogie"), "__gma_test_trigger_messages__: assert_less_than_or_equal 11");
	test_case_no_trigger(assert_less_than_or_equal("DOG", "DOGS"), "__gma_test_trigger_messages__: assert_less_than_or_equal 12");
	test_case_no_trigger(assert_less_than_or_equal([4, "cat", "DOG"], [5, "cat", "DOGS"]), "__gma_test_trigger_messages__: assert_less_than_or_equal 13");
	test_case_no_trigger(assert_less_than_or_equal({foo: 4, bar: "cat", baz: "DOG"}, {foo: 5, bar: "cat", baz: "DOGS"}), "__gma_test_trigger_messages__: assert_less_than_or_equal 14");
	test_case_no_trigger(assert_less_than_or_equal(arrayA, arrayA), "__gma_test_trigger_messages__: assert_less_than_or_equal 15");
	test_case_no_trigger(assert_less_than_or_equal(structA, structA), "__gma_test_trigger_messages__: assert_less_than_or_equal 16");
	test_case_no_trigger(assert_less_than_or_equal([[2, "boogie"], ["DOG", 907]], [[5, "cat"], ["DOGS", 907]]), "__gma_test_trigger_messages__: assert_less_than_or_equal 17");
	test_case_no_trigger(assert_less_than_or_equal(arrayB, arrayB), "__gma_test_trigger_messages__: assert_less_than_or_equal 18");
	test_case_no_trigger(assert_less_than_or_equal(structB, structB), "__gma_test_trigger_messages__: assert_less_than_or_equal 19");

	///Feather disable GM1041
	//assert_is_string(got)
	test_case_trigger(assert_is_string(undefined), "__gma_test_trigger_messages__: is_string 1");
	test_case_trigger(assert_is_string(3), "__gma_test_trigger_messages__: is_string 2");
	test_case_no_trigger(assert_is_string(""), "__gma_test_trigger_messages__: is_string 3");
	test_case_trigger(assert_is_string(arrayA), "__gma_test_trigger_messages__: is_string 4");
	test_case_trigger(assert_is_string(arrayB), "__gma_test_trigger_messages__: is_string 5");

	//assert_isnt_string(got)
	test_case_no_trigger(assert_isnt_string(undefined), "__gma_test_trigger_messages__: isnt_string 1");
	test_case_no_trigger(assert_isnt_string(3), "__gma_test_trigger_messages__: isnt_string 2");
	test_case_trigger(assert_isnt_string(""), "__gma_test_trigger_messages__: isnt_string 3");
	test_case_no_trigger(assert_isnt_string(arrayA), "__gma_test_trigger_messages__: isnt_string 4");
	test_case_no_trigger(assert_isnt_string(arrayB), "__gma_test_trigger_messages__: isnt_string 5");

	//assert_is_real(got)
	test_case_trigger(assert_is_real(undefined), "__gma_test_trigger_messages__: is_real 1");
	test_case_no_trigger(assert_is_real(3), "__gma_test_trigger_messages__: is_real 2");
	test_case_trigger(assert_is_real(""), "__gma_test_trigger_messages__: is_real 3");
	test_case_trigger(assert_is_real(arrayA), "__gma_test_trigger_messages__: is_real 4");
	test_case_trigger(assert_is_real(arrayB), "__gma_test_trigger_messages__: is_real 5");

	//assert_isn_real(got)
	test_case_no_trigger(assert_isnt_real(undefined), "__gma_test_trigger_messages__: isnt_real 1");
	test_case_trigger(assert_isnt_real(3), "__gma_test_trigger_messages__: isnt_real 2");
	test_case_no_trigger(assert_isnt_real(""), "__gma_test_trigger_messages__: isnt_real 3");
	test_case_no_trigger(assert_isnt_real(arrayA), "__gma_test_trigger_messages__: isnt_real 4");
	test_case_no_trigger(assert_isnt_real(arrayB), "__gma_test_trigger_messages__: isnt_real 5");

	//assert_is_array(got)
	test_case_trigger(assert_is_array(undefined), "__gma_test_trigger_messages__: is_array 1");
	test_case_trigger(assert_is_array(3), "__gma_test_trigger_messages__: is_array 2");
	test_case_trigger(assert_is_array(""), "__gma_test_trigger_messages__: is_array 3");
	test_case_no_trigger(assert_is_array(arrayA), "__gma_test_trigger_messages__: is_array 4");
	test_case_no_trigger(assert_is_array(arrayB), "__gma_test_trigger_messages__: is_array 5");

	//assert_isn_array(got)
	test_case_no_trigger(assert_isnt_array(undefined), "__gma_test_trigger_messages__: isnt_array 1");
	test_case_no_trigger(assert_isnt_array(3), "__gma_test_trigger_messages__: isnt_array 2");
	test_case_no_trigger(assert_isnt_array(""), "__gma_test_trigger_messages__: isnt_array 3");
	test_case_trigger(assert_isnt_array(arrayA), "__gma_test_trigger_messages__: isnt_array 4");
	test_case_trigger(assert_isnt_array(arrayB), "__gma_test_trigger_messages__: isnt_array 5");

	//assert_is_undefined(got)
	test_case_no_trigger(assert_is_undefined(undefined), "__gma_test_trigger_messages__: is_undefined 1");
	test_case_trigger(assert_is_undefined(3), "__gma_test_trigger_messages__: is_undefined 2");
	test_case_trigger(assert_is_undefined(""), "__gma_test_trigger_messages__: is_undefined 3");
	test_case_trigger(assert_is_undefined(arrayA), "__gma_test_trigger_messages__: is_undefined 4");
	test_case_trigger(assert_is_undefined(arrayB), "__gma_test_trigger_messages__: is_undefined 5");

	//assert_is_defined(got)
	test_case_trigger(assert_is_defined(undefined), "__gma_test_trigger_messages__: is_defined 1");
	test_case_no_trigger(assert_is_defined(3), "__gma_test_trigger_messages__: is_defined 2");
	test_case_no_trigger(assert_is_defined(""), "__gma_test_trigger_messages__: is_defined 3");
	test_case_no_trigger(assert_is_defined(arrayA), "__gma_test_trigger_messages__: is_defined 4");
	test_case_no_trigger(assert_is_defined(arrayB), "__gma_test_trigger_messages__: is_defined 5");

	//assert_isnt_undefined(got)
	test_case_trigger(assert_isnt_undefined(undefined), "__gma_test_trigger_messages__: isnt_undefined 1");
	test_case_no_trigger(assert_isnt_undefined(3), "__gma_test_trigger_messages__: isnt_undefined 2");
	test_case_no_trigger(assert_isnt_undefined(""), "__gma_test_trigger_messages__: isnt_undefined 3");
	test_case_no_trigger(assert_isnt_undefined(arrayA), "__gma_test_trigger_messages__: isnt_undefined 4");
	test_case_no_trigger(assert_isnt_undefined(arrayB), "__gma_test_trigger_messages__: isnt_undefined 5");

	//assert_isnt_defined(got)
	test_case_no_trigger(assert_isnt_defined(undefined), "__gma_test_trigger_messages__: isnt_defined 1");
	test_case_trigger(assert_isnt_defined(3), "__gma_test_trigger_messages__: isnt_defined 2");
	test_case_trigger(assert_isnt_defined(""), "__gma_test_trigger_messages__: isnt_defined 3");
	test_case_trigger(assert_isnt_defined(arrayA), "__gma_test_trigger_messages__: isnt_defined 4");
	test_case_trigger(assert_isnt_defined(arrayB), "__gma_test_trigger_messages__: isnt_defined 5");
	///Feather enable GM1041

	//assert_in_range(got, lower, upper)
	///Feather disable GM1041
	test_case_trigger(assert_in_range(undefined, undefined, undefined), "__gma_test_trigger_messages__: assert_in_range 1");
	///Feather enable GM1041
	test_case_trigger(assert_in_range(3, 2, "5"), "__gma_test_trigger_messages__: assert_in_range 2");
	test_case_trigger(assert_in_range(pi, 4, 5), "__gma_test_trigger_messages__: assert_in_range 3");
	test_case_trigger(assert_in_range(pi, 2, 3), "__gma_test_trigger_messages__: assert_in_range 4");
	test_case_no_trigger(assert_in_range(pi, 3, 4), "__gma_test_trigger_messages__: assert_in_range 5");
	test_case_no_trigger(assert_in_range(pi, pi, 4), "__gma_test_trigger_messages__: assert_in_range 6");
	test_case_no_trigger(assert_in_range(pi, 3, pi), "__gma_test_trigger_messages__: assert_in_range 7");
	test_case_trigger(assert_in_range("Alice", "Bob", "Caitlyn"), "__gma_test_trigger_messages__: assert_in_range 8");
	test_case_trigger(assert_in_range("David", "Bob", "Caitlyn"), "__gma_test_trigger_messages__: assert_in_range 9");
	test_case_no_trigger(assert_in_range("Bob", "Alice", "Caitlyn"), "__gma_test_trigger_messages__: assert_in_range 10");
	test_case_no_trigger(assert_in_range("Alice", "Alice", "Bob"), "__gma_test_trigger_messages__: assert_in_range 11");
	test_case_no_trigger(assert_in_range("Bob", "Alice", "Bob"), "__gma_test_trigger_messages__: assert_in_range 12");
	test_case_trigger(assert_in_range([pi, "Bob"], [4, "Caitlyn"], [5, "David"]), "__gma_test_trigger_messages__: assert_in_range 13");
	test_case_trigger(assert_in_range([pi, "Bob"], [2, "Alice"], [3, "Annie"]), "__gma_test_trigger_messages__: assert_in_range 14");
	test_case_trigger(assert_in_range([pi, "Bob"], [2, "Alice"], [3, "Caitlyn"]), "__gma_test_trigger_messages__: assert_in_range 15");
	test_case_trigger(assert_in_range([pi, "Bob"], [3, "Alice"], [4, "Annie"]), "__gma_test_trigger_messages__: assert_in_range 16");
	test_case_no_trigger(assert_in_range([pi, "Bob"], [3, "Alice"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_in_range 17");
	test_case_no_trigger(assert_in_range([pi, "Bob"], [3, "Bob"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_in_range 18");
	test_case_no_trigger(assert_in_range([pi, "Bob"], [pi, "Bob"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_in_range 19");
	test_case_no_trigger(assert_in_range([pi, "Bob"], [pi, "Alice"], [4, "Bob"]), "__gma_test_trigger_messages__: assert_in_range 20");
	test_case_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 4, b: "Caitlyn" }, {a: 5, b: "David"}), "__gma_test_trigger_messages__: assert_in_range 21");
	test_case_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 2, b: "Alice" }, {a: 3, b: "Annie"}), "__gma_test_trigger_messages__: assert_in_range 22");
	test_case_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 2, b: "Alice" }, {a: 3, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_in_range 23");
	test_case_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 3, b: "Alice" }, {a: 4, b: "Annie"}), "__gma_test_trigger_messages__: assert_in_range 24");
	test_case_no_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 3, b: "Alice"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_in_range 25");
	test_case_no_trigger(assert_in_range({a: pi, b: "Bob"}, {a: 3, b: "Bob"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_in_range 26");
	test_case_no_trigger(assert_in_range({a: pi, b: "Bob"}, {a: pi, b: "Bob"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_in_range 27");
	test_case_no_trigger(assert_in_range({a: pi, b: "Bob"}, {a: pi, b: "Alice"}, {a: 4, b: "Bob"}), "__gma_test_trigger_messages__: assert_in_range 28");

	//assert_not_in_range(got, lower, upper)
	///Feather disable GM1041
	test_case_trigger(assert_not_in_range(undefined, undefined, undefined), "__gma_test_trigger_messages__: assert_not_in_range 1");
	///Feather enable GM1041
	test_case_trigger(assert_not_in_range(3, 2, "5"), "__gma_test_trigger_messages__: assert_not_in_range 2");
	test_case_no_trigger(assert_not_in_range(pi, 4, 5), "__gma_test_trigger_messages__: assert_not_in_range 3");
	test_case_no_trigger(assert_not_in_range(pi, 2, 3), "__gma_test_trigger_messages__: assert_not_in_range 4");
	test_case_trigger(assert_not_in_range(pi, 3, 4), "__gma_test_trigger_messages__: assert_not_in_range 5");
	test_case_trigger(assert_not_in_range(pi, pi, 4), "__gma_test_trigger_messages__: assert_not_in_range 6");
	test_case_trigger(assert_not_in_range(pi, 3, pi), "__gma_test_trigger_messages__: assert_not_in_range 7");
	test_case_no_trigger(assert_not_in_range("Alice", "Bob", "Caitlyn"), "__gma_test_trigger_messages__: assert_not_in_range 8");
	test_case_no_trigger(assert_not_in_range("David", "Bob", "Caitlyn"), "__gma_test_trigger_messages__: assert_not_in_range 9");
	test_case_trigger(assert_not_in_range("Bob", "Alice", "Caitlyn"), "__gma_test_trigger_messages__: assert_not_in_range 10");
	test_case_trigger(assert_not_in_range("Alice", "Alice", "Bob"), "__gma_test_trigger_messages__: assert_not_in_range 11");
	test_case_trigger(assert_not_in_range("Bob", "Alice", "Bob"), "__gma_test_trigger_messages__: assert_not_in_range 12");
	test_case_no_trigger(assert_not_in_range([pi, "Bob"], [4, "Caitlyn"], [5, "David"]), "__gma_test_trigger_messages__: assert_not_in_range 13");
	test_case_no_trigger(assert_not_in_range([pi, "Bob"], [2, "Alice"], [3, "Annie"]), "__gma_test_trigger_messages__: assert_not_in_range 14");
	test_case_no_trigger(assert_not_in_range([pi, "Bob"], [2, "Alice"], [3, "Caitlyn"]), "__gma_test_trigger_messages__: assert_not_in_range 15");
	test_case_no_trigger(assert_not_in_range([pi, "Bob"], [3, "Alice"], [4, "Annie"]), "__gma_test_trigger_messages__: assert_not_in_range 16");
	test_case_trigger(assert_not_in_range([pi, "Bob"], [3, "Alice"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_not_in_range 17");
	test_case_trigger(assert_not_in_range([pi, "Bob"], [3, "Bob"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_not_in_range 18");
	test_case_trigger(assert_not_in_range([pi, "Bob"], [pi, "Bob"], [4, "Caitlyn"]), "__gma_test_trigger_messages__: assert_not_in_range 19");
	test_case_trigger(assert_not_in_range([pi, "Bob"], [pi, "Alice"], [4, "Bob"]), "__gma_test_trigger_messages__: assert_not_in_range 20");
	test_case_no_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 4, b: "Caitlyn"}, {a: 5, b: "David"}), "__gma_test_trigger_messages__: assert_not_in_range 21");
	test_case_no_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 2, b: "Alice"}, {a: 3, b: "Annie"}), "__gma_test_trigger_messages__: assert_not_in_range 22");
	test_case_no_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 2, b: "Alice"}, {a: 3, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_not_in_range 23");
	test_case_no_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 3, b: "Alice"}, {a: 4, b: "Annie"}), "__gma_test_trigger_messages__: assert_not_in_range 24");
	test_case_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 3, b: "Alice"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_not_in_range 25");
	test_case_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: 3, b: "Bob"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_not_in_range 26");
	test_case_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: pi, b: "Bob"}, {a: 4, b: "Caitlyn"}), "__gma_test_trigger_messages__: assert_not_in_range 27");
	test_case_trigger(assert_not_in_range({a: pi, b: "Bob"}, {a: pi, b: "Alice"}, {a: 4, b: "Bob"}), "__gma_test_trigger_messages__: assert_not_in_range 28");

	//assert_contains(got, content)
	test_case_trigger(assert_contains(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_contains 1");
	inexistent = ds_list_create();
	ds_list_destroy(inexistent);
	test_case_trigger(assert_contains(inexistent, "a"), "__gma_test_trigger_messages__: assert_contains 2");
	test_case_trigger(assert_contains("waahoo", 5), "__gma_test_trigger_messages__: assert_contains 3");
	test_case_trigger(assert_contains("waahoo", "abc"), "__gma_test_trigger_messages__: assert_contains 4");
	test_case_no_trigger(assert_contains("Caitlyn", "it"), "__gma_test_trigger_messages__: assert_contains 5");
	test_case_no_trigger(assert_contains("Caitlyn", "Ca"), "__gma_test_trigger_messages__: assert_contains 6");
	test_case_no_trigger(assert_contains("Caitlyn", "n"), "__gma_test_trigger_messages__: assert_contains 7");
	test_case_trigger(assert_contains(arrayA, "WAAHOO"), "__gma_test_trigger_messages__: assert_contains 8");
	test_case_no_trigger(assert_contains(arrayA, 3), "__gma_test_trigger_messages__: assert_contains 9");
	test_case_trigger(assert_contains(list, undefined), "__gma_test_trigger_messages__: assert_contains 10");
	test_case_trigger(assert_contains(list, arrayA), "__gma_test_trigger_messages__: assert_contains 11");
	test_case_no_trigger(assert_contains(list, "b"), "__gma_test_trigger_messages__: assert_contains 12");
	test_case_no_trigger(assert_contains(list, 2), "__gma_test_trigger_messages__: assert_contains 13");

	//assert_contains_2d(got, content)
	test_case_trigger(assert_contains_2d(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_contains2d 1");
	inexistent = ds_grid_create(1, 1);
	ds_grid_destroy(inexistent);
	test_case_trigger(assert_contains_2d(inexistent, "a"), "__gma_test_trigger_messages__: assert_contains2d 2");
	test_case_trigger(assert_contains_2d(arrayB, undefined), "__gma_test_trigger_messages__: assert_contains2d 3");
	test_case_trigger(assert_contains_2d(arrayB, 583), "__gma_test_trigger_messages__: assert_contains2d 4");
	test_case_trigger(assert_contains_2d(arrayB, "superwaahoo"), "__gma_test_trigger_messages__: assert_contains2d 5");
	test_case_no_trigger(assert_contains_2d(arrayB, "a"), "__gma_test_trigger_messages__: assert_contains2d 6");
	test_case_no_trigger(assert_contains_2d(arrayB, "d"), "__gma_test_trigger_messages__: assert_contains2d 7");
	test_case_trigger(assert_contains_2d(grid, undefined), "__gma_test_trigger_messages__: assert_contains2d 8");
	test_case_trigger(assert_contains_2d(grid, 583), "__gma_test_trigger_messages__: assert_contains2d 9");
	test_case_trigger(assert_contains_2d(grid, "superwaahoo"), "__gma_test_trigger_messages__: assert_contains2d 10");
	test_case_no_trigger(assert_contains_2d(grid, "A"), "__gma_test_trigger_messages__: assert_contains2d 11");
	test_case_no_trigger(assert_contains_2d(grid, "D"), "__gma_test_trigger_messages__: assert_contains2d 12");

	//assert_doesnt_contain(got, content)
	test_case_trigger(assert_doesnt_contain(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain 1");
	inexistent = ds_list_create();
	ds_list_destroy(inexistent);
	test_case_trigger(assert_doesnt_contain(inexistent, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain 2");
	test_case_trigger(assert_doesnt_contain("waahoo", 5), "__gma_test_trigger_messages__: assert_doesnt_contain 3");
	test_case_no_trigger(assert_doesnt_contain("waahoo", "abc"), "__gma_test_trigger_messages__: assert_doesnt_contain 4");
	test_case_trigger(assert_doesnt_contain("Caitlyn", "it"), "__gma_test_trigger_messages__: assert_doesnt_contain 5");
	test_case_trigger(assert_doesnt_contain("Caitlyn", "Ca"), "__gma_test_trigger_messages__: assert_doesnt_contain 6");
	test_case_trigger(assert_doesnt_contain("Caitlyn", "n"), "__gma_test_trigger_messages__: assert_doesnt_contain 7");
	test_case_no_trigger(assert_doesnt_contain(arrayA, "WAAHOO"), "__gma_test_trigger_messages__: assert_doesnt_contain 8");
	test_case_trigger(assert_doesnt_contain(arrayA, 3), "__gma_test_trigger_messages__: assert_doesnt_contain 9");
	test_case_no_trigger(assert_doesnt_contain(list, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain 10");
	test_case_no_trigger(assert_doesnt_contain(list, arrayA), "__gma_test_trigger_messages__: assert_doesnt_contain 11");
	test_case_trigger(assert_doesnt_contain(list, "b"), "__gma_test_trigger_messages__: assert_doesnt_contain 12");
	test_case_trigger(assert_doesnt_contain(list, 2), "__gma_test_trigger_messages__: assert_doesnt_contain 13");

	//assert_doesnt_contain_2d(got, content)
	test_case_trigger(assert_doesnt_contain_2d(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 1");
	inexistent = ds_grid_create(1, 1);
	ds_grid_destroy(inexistent);
	test_case_trigger(assert_doesnt_contain_2d(inexistent, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 2");
	test_case_no_trigger(assert_doesnt_contain_2d(arrayB, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 3");
	test_case_no_trigger(assert_doesnt_contain_2d(arrayB, 583), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 4");
	test_case_no_trigger(assert_doesnt_contain_2d(arrayB, "superwaahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 5");
	test_case_trigger(assert_doesnt_contain_2d(arrayB, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 6");
	test_case_trigger(assert_doesnt_contain_2d(arrayB, "d"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 7");
	test_case_no_trigger(assert_doesnt_contain_2d(grid, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 8");
	test_case_no_trigger(assert_doesnt_contain_2d(grid, 583), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 9");
	test_case_no_trigger(assert_doesnt_contain_2d(grid, "superwaahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 10");
	test_case_trigger(assert_doesnt_contain_2d(grid, "A"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 11");
	test_case_trigger(assert_doesnt_contain_2d(grid, "D"), "__gma_test_trigger_messages__: assert_doesnt_contain_2d 12");

	//assert_contains_exact(got, content)
	test_case_trigger(assert_contains_exact(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_contains_exact 1");
	inexistent = ds_list_create();
	ds_list_destroy(inexistent);
	test_case_trigger(assert_contains_exact(inexistent, "a"), "__gma_test_trigger_messages__: assert_contains_exact 2");
	test_case_trigger(assert_contains_exact("waahoo", 5), "__gma_test_trigger_messages__: assert_contains_exact 3");
	test_case_trigger(assert_contains_exact("waahoo", "abc"), "__gma_test_trigger_messages__: assert_contains_exact 4");
	test_case_no_trigger(assert_contains_exact("Caitlyn", "it"), "__gma_test_trigger_messages__: assert_contains_exact 5");
	test_case_no_trigger(assert_contains_exact("Caitlyn", "Ca"), "__gma_test_trigger_messages__: assert_contains_exact 6");
	test_case_no_trigger(assert_contains_exact("Caitlyn", "n"), "__gma_test_trigger_messages__: assert_contains_exact 7");
	test_case_trigger(assert_contains_exact(arrayA, "WAAHOO"), "__gma_test_trigger_messages__: assert_contains_exact 8");
	test_case_no_trigger(assert_contains_exact(arrayA, 3), "__gma_test_trigger_messages__: assert_contains_exact 9");
	test_case_trigger(assert_contains_exact(list, undefined), "__gma_test_trigger_messages__: assert_contains_exact 10");
	test_case_trigger(assert_contains_exact(list, arrayA), "__gma_test_trigger_messages__: assert_contains_exact 11");
	test_case_no_trigger(assert_contains_exact(list, "b"), "__gma_test_trigger_messages__: assert_contains_exact 12");
	test_case_no_trigger(assert_contains_exact(list, 2), "__gma_test_trigger_messages__: assert_contains_exact 13");

	//assert_contains_exact_2d(got, content)
	test_case_trigger(assert_contains_exact_2d(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_contains_exact_2d 1");
	inexistent = ds_grid_create(1, 1);
	ds_grid_destroy(inexistent);
	test_case_trigger(assert_contains_exact_2d(inexistent, "a"), "__gma_test_trigger_messages__: assert_contains_exact_2d 2");
	test_case_trigger(assert_contains_exact_2d(arrayB, undefined), "__gma_test_trigger_messages__: assert_contains_exact_2d 3");
	test_case_trigger(assert_contains_exact_2d(arrayB, 583), "__gma_test_trigger_messages__: assert_contains_exact_2d 4");
	test_case_trigger(assert_contains_exact_2d(arrayB, "superwaahoo"), "__gma_test_trigger_messages__: assert_contains_exact_2d 5");
	test_case_no_trigger(assert_contains_exact_2d(arrayB, "a"), "__gma_test_trigger_messages__: assert_contains_exact_2d 6");
	test_case_no_trigger(assert_contains_exact_2d(arrayB, "d"), "__gma_test_trigger_messages__: assert_contains_exact_2d 7");
	test_case_trigger(assert_contains_exact_2d(grid, undefined), "__gma_test_trigger_messages__: assert_contains_exact_2d 8");
	test_case_trigger(assert_contains_exact_2d(grid, 583), "__gma_test_trigger_messages__: assert_contains_exact_2d 9");
	test_case_trigger(assert_contains_exact_2d(grid, "superwaahoo"), "__gma_test_trigger_messages__: assert_contains_exact_2d 10");
	test_case_no_trigger(assert_contains_exact_2d(grid, "A"), "__gma_test_trigger_messages__: assert_contains_exact_2d 11");
	test_case_no_trigger(assert_contains_exact_2d(grid, "D"), "__gma_test_trigger_messages__: assert_contains_exact_2d 12");

	//assert_doesnt_contain_exact(got, content)
	test_case_trigger(assert_doesnt_contain_exact(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 1");
	inexistent = ds_list_create();
	ds_list_destroy(inexistent);
	test_case_trigger(assert_doesnt_contain_exact(inexistent, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 2");
	test_case_trigger(assert_doesnt_contain_exact("waahoo", 5), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 3");
	test_case_no_trigger(assert_doesnt_contain_exact("waahoo", "abc"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 4");
	test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "it"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 5");
	test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "Ca"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 6");
	test_case_trigger(assert_doesnt_contain_exact("Caitlyn", "n"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 7");
	test_case_no_trigger(assert_doesnt_contain_exact(arrayA, "WAAHOO"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 8");
	test_case_trigger(assert_doesnt_contain_exact(arrayA, 3), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 9");
	test_case_no_trigger(assert_doesnt_contain_exact(list, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 10");
	test_case_no_trigger(assert_doesnt_contain_exact(list, arrayA), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 11");
	test_case_trigger(assert_doesnt_contain_exact(list, "b"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 12");
	test_case_trigger(assert_doesnt_contain_exact(list, 2), "__gma_test_trigger_messages__: assert_doesnt_contain_exact 13");

	//assert_doesnt_contain_exact_2d(got, content)
	test_case_trigger(assert_doesnt_contain_exact_2d(undefined, "waahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 1");
	inexistent = ds_grid_create(1, 1);
	ds_grid_destroy(inexistent);
	test_case_trigger(assert_doesnt_contain_exact_2d(inexistent, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 2");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(arrayB, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 3");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(arrayB, 583), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 4");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(arrayB, "superwaahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 5");
	test_case_trigger(assert_doesnt_contain_exact_2d(arrayB, "a"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 6");
	test_case_trigger(assert_doesnt_contain_exact_2d(arrayB, "d"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 7");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(grid, undefined), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 8");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(grid, 583), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 9");
	test_case_no_trigger(assert_doesnt_contain_exact_2d(grid, "superwaahoo"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 10");
	test_case_trigger(assert_doesnt_contain_exact_2d(grid, "A"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 11");
	test_case_trigger(assert_doesnt_contain_exact_2d(grid, "B"), "__gma_test_trigger_messages__: assert_doesnt_contain_exact_2d 12");

	//CLEANUP
	ds_list_destroy(list);
	ds_grid_destroy(grid);
}
