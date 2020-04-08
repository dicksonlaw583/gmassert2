///@func __gma_test_trigger_messages_23__()

function Vector2(_x, _y) constructor {
  x = _x;
  y = _y;
  static mag = function() {
    return sqrt(x*x+y*y);
  };
  static norm = mag;
  static add = function(v2) {
    return new Vector2(x+v2.x, y+v2.y);
  }
}

function __gma_test_trigger_messages_23__() {
  var vector = new Vector2(3, 5);
  var map = test_fixture_map("foo", "bar", "baz", 907);
  var structAB = {a: 5, b: 7};
  
  // assert_is_method(got, [msg])
  test_case_no_trigger(assert_is_method(vector.mag), "__gma_test_trigger_messages__: assert_is_method 1");
  test_case_no_trigger(assert_is_method(vector.norm), "__gma_test_trigger_messages__: assert_is_method 2");
  test_case_no_trigger(assert_is_method(vector.add), "__gma_test_trigger_messages__: assert_is_method 3");
  test_case_trigger(assert_is_method(583), "__gma_test_trigger_messages__: assert_is_method 4");
  test_case_trigger(assert_is_method("boo"), "__gma_test_trigger_messages__: assert_is_method 5");
  test_case_trigger(assert_is_method(undefined), "__gma_test_trigger_messages__: assert_is_method 6");
  // assert_isnt_method(got, [msg])
  test_case_trigger(assert_isnt_method(vector.mag), "__gma_test_trigger_messages__: assert_isnt_method 1");
  test_case_trigger(assert_isnt_method(vector.norm), "__gma_test_trigger_messages__: assert_isnt_method 2");
  test_case_trigger(assert_isnt_method(vector.add), "__gma_test_trigger_messages__: assert_isnt_method 3");
  test_case_no_trigger(assert_isnt_method(583), "__gma_test_trigger_messages__: assert_isnt_method 4");
  test_case_no_trigger(assert_isnt_method("boo"), "__gma_test_trigger_messages__: assert_isnt_method 5");
  test_case_no_trigger(assert_isnt_method(undefined), "__gma_test_trigger_messages__: assert_isnt_method 6");
  // assert_has_method(got, methodName, [msg])
  test_case_no_trigger(assert_has_method(vector, "mag"), "__gma_test_trigger_messages__: assert_has_method 1");
  test_case_no_trigger(assert_has_method(vector, "norm"), "__gma_test_trigger_messages__: assert_has_method 2");
  test_case_no_trigger(assert_has_method(vector, "add"), "__gma_test_trigger_messages__: assert_has_method 3");
  test_case_trigger(assert_has_method(vector, "foo"), "__gma_test_trigger_messages__: assert_has_method 4");
  test_case_trigger(assert_has_method(583, "foo"), "__gma_test_trigger_messages__: assert_has_method 5");
  test_case_trigger(assert_has_method("boo", "foo"), "__gma_test_trigger_messages__: assert_has_method 6");
  test_case_trigger(assert_has_method(undefined, "foo"), "__gma_test_trigger_messages__: assert_has_method 7");
  // assert_doesnt_have_method(got, methodName, [msg])
  test_case_trigger(assert_doesnt_have_method(vector, "mag"), "__gma_test_trigger_messages__: assert_doesnt_have_method 1");
  test_case_trigger(assert_doesnt_have_method(vector, "norm"), "__gma_test_trigger_messages__: assert_doesnt_have_method 2");
  test_case_trigger(assert_doesnt_have_method(vector, "add"), "__gma_test_trigger_messages__: assert_doesnt_have_method 3");
  test_case_no_trigger(assert_doesnt_have_method(vector, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_method 4");
  test_case_trigger(assert_doesnt_have_method(583, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_method 5");
  test_case_trigger(assert_doesnt_have_method("boo", "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_method 6");
  test_case_trigger(assert_doesnt_have_method(undefined, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_method 7");
  // assert_is_struct(got, [msg])
  test_case_trigger(assert_is_struct(583), "__gma_test_trigger_messages__: assert_is_struct 1");
  test_case_trigger(assert_is_struct("boo"), "__gma_test_trigger_messages__: assert_is_struct 2");
  test_case_trigger(assert_is_struct(undefined), "__gma_test_trigger_messages__: assert_is_struct 3");
  test_case_no_trigger(assert_is_struct({a: 5, b: 7}), "__gma_test_trigger_messages__: assert_is_struct 4");
  test_case_no_trigger(assert_is_struct(vector));
  // assert_isnt_struct(got, [msg])
  test_case_no_trigger(assert_isnt_struct(583), "__gma_test_trigger_messages__: assert_isnt_struct 1");
  test_case_no_trigger(assert_isnt_struct("boo"), "__gma_test_trigger_messages__: assert_isnt_struct 2");
  test_case_no_trigger(assert_isnt_struct(undefined), "__gma_test_trigger_messages__: assert_isnt_struct 3");
  test_case_trigger(assert_isnt_struct({a: 5, b: 7}), "__gma_test_trigger_messages__: assert_isnt_struct 4");
  test_case_trigger(assert_isnt_struct(vector), "__gma_test_trigger_messages__: assert_isnt_struct 5");
  // assert_is_instance_of(val, typeName, [msg])
  test_case_no_trigger(assert_is_instance_of(583, "number"), "__gma_test_trigger_messages__: assert_is_instance_of 1");
  test_case_trigger(assert_is_instance_of(583, "string"), "__gma_test_trigger_messages__: assert_is_instance_of 2");
  test_case_no_trigger(assert_is_instance_of("abc", "string"), "__gma_test_trigger_messages__: assert_is_instance_of 3");
  test_case_trigger(assert_is_instance_of("abc", "struct"), "__gma_test_trigger_messages__: assert_is_instance_of 4");
  test_case_no_trigger(assert_is_instance_of({a: 5, b: 7}, "struct"), "__gma_test_trigger_messages__: assert_is_instance_of 5");
  test_case_trigger(assert_is_instance_of({a: 5, b: 7}, "Vector2"), "__gma_test_trigger_messages__: assert_is_instance_of 6");
  test_case_no_trigger(assert_is_instance_of(["a", "b", "c"], "array"), "__gma_test_trigger_messages__: assert_is_instance_of 7");
  test_case_trigger(assert_is_instance_of(["a", "b", "c"], "string"), "__gma_test_trigger_messages__: assert_is_instance_of 8");
  test_case_no_trigger(assert_is_instance_of(vector, "struct"), "__gma_test_trigger_messages__: assert_is_instance_of 9");
  test_case_no_trigger(assert_is_instance_of(vector, "Vector2"), "__gma_test_trigger_messages__: assert_is_instance_of 10");
  test_case_trigger(assert_is_instance_of(vector, "Vector3"), "__gma_test_trigger_messages__: assert_is_instance_of 11");
  // assert_isnt_instance_of(val, typeName, [msg])
  test_case_trigger(assert_isnt_instance_of(583, "number"), "__gma_test_trigger_messages__: assert_isnt_instance_of 1");
  test_case_no_trigger(assert_isnt_instance_of(583, "string"), "__gma_test_trigger_messages__: assert_isnt_instance_of 2");
  test_case_trigger(assert_isnt_instance_of("abc", "string"), "__gma_test_trigger_messages__: assert_isnt_instance_of 3");
  test_case_no_trigger(assert_isnt_instance_of("abc", "struct"), "__gma_test_trigger_messages__: assert_isnt_instance_of 4");
  test_case_trigger(assert_isnt_instance_of({a: 5, b: 7}, "struct"), "__gma_test_trigger_messages__: assert_isnt_instance_of 5");
  test_case_no_trigger(assert_isnt_instance_of({a: 5, b: 7}, "Vector2"), "__gma_test_trigger_messages__: assert_isnt_instance_of 6");
  test_case_trigger(assert_isnt_instance_of(["a", "b", "c"], "array"), "__gma_test_trigger_messages__: assert_isnt_instance_of 7");
  test_case_no_trigger(assert_isnt_instance_of(["a", "b", "c"], "string"), "__gma_test_trigger_messages__: assert_isnt_instance_of 8");
  test_case_trigger(assert_isnt_instance_of(vector, "struct"), "__gma_test_trigger_messages__: assert_isnt_instance_of 9");
  test_case_trigger(assert_isnt_instance_of(vector, "Vector2"), "__gma_test_trigger_messages__: assert_isnt_instance_of 10");
  test_case_no_trigger(assert_isnt_instance_of(vector, "Vector3"), "__gma_test_trigger_messages__: assert_isnt_instance_of 11");
  // assert_has_key(val, key, [msg])
  var mapDNE = map;
	while (ds_exists(mapDNE, ds_type_map)) mapDNE++;
  test_case_trigger(assert_has_key(undefined, "foo"), "__gma_test_trigger_messages__: assert_has_key 1");
  test_case_trigger(assert_has_key(mapDNE, "foo"), "__gma_test_trigger_messages__: assert_has_key 2");
  test_case_trigger(assert_has_key(mapDNE, "baz"), "__gma_test_trigger_messages__: assert_has_key 3");
  test_case_no_trigger(assert_has_key(map, "foo"), "__gma_test_trigger_messages__: assert_has_key 4");
  test_case_no_trigger(assert_has_key(map, "baz"), "__gma_test_trigger_messages__: assert_has_key 5");
  test_case_trigger(assert_has_key(map, "doo"), "__gma_test_trigger_messages__: assert_has_key 6");
  test_case_no_trigger(assert_has_key(structAB, "a"), "__gma_test_trigger_messages__: assert_has_key 7");
  test_case_no_trigger(assert_has_key(structAB, "b"), "__gma_test_trigger_messages__: assert_has_key 8");
  test_case_trigger(assert_has_key(structAB, "C"), "__gma_test_trigger_messages__: assert_has_key 9");
  test_case_no_trigger(assert_has_key(vector, "x"), "__gma_test_trigger_messages__: assert_has_key 10");
  test_case_no_trigger(assert_has_key(vector, "y"), "__gma_test_trigger_messages__: assert_has_key 11");
  test_case_no_trigger(assert_has_key(vector, "mag"), "__gma_test_trigger_messages__: assert_has_key 12");
  test_case_no_trigger(assert_has_key(vector, "norm"), "__gma_test_trigger_messages__: assert_has_key 13");
  test_case_no_trigger(assert_has_key(vector, "add"), "__gma_test_trigger_messages__: assert_has_key 14");
  test_case_trigger(assert_has_key(vector, "foo"), "__gma_test_trigger_messages__: assert_has_key 15");
  // assert_doesnt_have_key(val, key, [msg])
  test_case_trigger(assert_doesnt_have_key(undefined, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_key 1");
  test_case_trigger(assert_doesnt_have_key(mapDNE, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_key 2");
  test_case_trigger(assert_doesnt_have_key(mapDNE, "baz"), "__gma_test_trigger_messages__: assert_doesnt_have_key 3");
  test_case_trigger(assert_doesnt_have_key(map, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_key 4");
  test_case_trigger(assert_doesnt_have_key(map, "baz"), "__gma_test_trigger_messages__: assert_doesnt_have_key 5");
  test_case_no_trigger(assert_doesnt_have_key(map, "doo"), "__gma_test_trigger_messages__: assert_doesnt_have_key 6");
  test_case_trigger(assert_doesnt_have_key(structAB, "a"), "__gma_test_trigger_messages__: assert_doesnt_have_key 7");
  test_case_trigger(assert_doesnt_have_key(structAB, "b"), "__gma_test_trigger_messages__: assert_doesnt_have_key 8");
  test_case_no_trigger(assert_doesnt_have_key(structAB, "C"), "__gma_test_trigger_messages__: assert_doesnt_have_key 9");
  test_case_trigger(assert_doesnt_have_key(vector, "x"), "__gma_test_trigger_messages__: assert_doesnt_have_key 10");
  test_case_trigger(assert_doesnt_have_key(vector, "y"), "__gma_test_trigger_messages__: assert_doesnt_have_key 11");
  test_case_trigger(assert_doesnt_have_key(vector, "mag"), "__gma_test_trigger_messages__: assert_doesnt_have_key 12");
  test_case_trigger(assert_doesnt_have_key(vector, "norm"), "__gma_test_trigger_messages__: assert_doesnt_have_key 13");
  test_case_trigger(assert_doesnt_have_key(vector, "add"), "__gma_test_trigger_messages__: assert_doesnt_have_key 14");
  test_case_no_trigger(assert_doesnt_have_key(vector, "foo"), "__gma_test_trigger_messages__: assert_doesnt_have_key 15");
  // assert_throws(func, thrown, [msg])
  test_case_trigger(assert_throws(function() {
    return 1+2+3;
  }, "error!"), "__gma_test_trigger_messages__: assert_throws 1");
  test_case_trigger(assert_throws(function() {
    throw 654321;
  }, "error!"), "__gma_test_trigger_messages__: assert_throws 2");
  test_case_no_trigger(assert_throws(function() {
    throw "error!";
  }, "error!"), "__gma_test_trigger_messages__: assert_throws 3");
  test_case_trigger(assert_throws([function(_arg) {
    throw _arg + "!";
  }, "foo"], "error!"), "__gma_test_trigger_messages__: assert_throws 4");
  test_case_no_trigger(assert_throws([function(_arg) {
    throw _arg + "!";
  }, "error"], "error!"), "__gma_test_trigger_messages__: assert_throws 5");
  // assert_doesnt_throw(func, thrown, [msg])
  test_case_no_trigger(assert_doesnt_throw(function() {
    return 1+2+3;
  }, "error!"), "__gma_test_trigger_messages__: assert_doesnt_throw 1");
  test_case_no_trigger(assert_doesnt_throw(function() {
    throw 654321;
  }, "error!"), "__gma_test_trigger_messages__: assert_doesnt_throw 2");
  test_case_trigger(assert_doesnt_throw(function() {
    throw "error!";
  }, "error!"), "__gma_test_trigger_messages__: assert_doesnt_throw 3");
  test_case_no_trigger(assert_doesnt_throw([function(_arg) {
    throw _arg + "!";
  }, "foo"], "error!"), "__gma_test_trigger_messages__: assert_doesnt_throw 4");
  test_case_trigger(assert_doesnt_throw([function(_arg) {
    throw _arg + "!";
  }, "error"], "error!"), "__gma_test_trigger_messages__: assert_doesnt_throw 5");
  // assert_throws_instance_of(func, typeName, [msg])
  test_case_trigger(assert_throws_instance_of(function() {
    return 3.5;
  }, "number"), "__gma_test_trigger_messages__: assert_throws_instance_of 1");
  test_case_no_trigger(assert_throws_instance_of(function() {
    throw 3.5;
  }, "number"), "__gma_test_trigger_messages__: assert_throws_instance_of 2");
  test_case_trigger(assert_throws_instance_of(function() {
    throw { x:3, y: 9 };
  }, "Vector2"), "__gma_test_trigger_messages__: assert_throws_instance_of 3");
  test_case_no_trigger(assert_throws_instance_of(function() {
    throw new Vector2(3, 7);
  }, "Vector2"), "__gma_test_trigger_messages__: assert_throws_instance_of 4");
  test_case_trigger(assert_throws_instance_of([function(_arg) {
    return { a: _arg };
  }, 3], "struct"), "__gma_test_trigger_messages__: assert_throws_instance_of 5");
  test_case_no_trigger(assert_throws_instance_of([function(_arg) {
    throw new Vector2(3, _arg);
  }, 3], "struct"), "__gma_test_trigger_messages__: assert_throws_instance_of 6");
  // assert_doesnt_throw_instance_of(func, typeName, [msg])
  test_case_no_trigger(assert_doesnt_throw_instance_of(function() {
    return 3.5;
  }, "number"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 1");
  test_case_trigger(assert_doesnt_throw_instance_of(function() {
    throw 3.5;
  }, "number"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 2");
  test_case_no_trigger(assert_doesnt_throw_instance_of(function() {
    throw { x:3, y: 9 };
  }, "Vector2"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 3");
  test_case_trigger(assert_doesnt_throw_instance_of(function() {
    throw new Vector2(3, 7);
  }, "Vector2"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 4");
  test_case_no_trigger(assert_doesnt_throw_instance_of([function(_arg) {
    return { a: _arg };
  }, 3], "struct"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 5");
  test_case_trigger(assert_doesnt_throw_instance_of([function(_arg) {
    throw new Vector2(3, _arg);
  }, 3], "struct"), "__gma_test_trigger_messages__: assert_doesnt_throw_instance_of 6");
  // assert_throwless(func, [msg])
  test_case_no_trigger(assert_throwless(function() {
    return "Hello World!";
  }), "__gma_test_trigger_messages__: assert_throwless 1");
  test_case_trigger(assert_throwless(function() {
    throw "Hello world!";
  }), "__gma_test_trigger_messages__: assert_throwless 2");
  test_case_no_trigger(assert_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, false]), "__gma_test_trigger_messages__: assert_throwless 3");
  test_case_trigger(assert_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, true]), "__gma_test_trigger_messages__: assert_throwless 4");
  // assert_not_throwless(func, [msg])
  test_case_trigger(assert_not_throwless(function() {
    return "Hello World!";
  }), "__gma_test_trigger_messages__: assert_not_throwless 1");
  test_case_no_trigger(assert_not_throwless(function() {
    throw "Hello world!";
  }), "__gma_test_trigger_messages__: assert_not_throwless 2");
  test_case_trigger(assert_not_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, false]), "__gma_test_trigger_messages__: assert_not_throwless 3");
  test_case_no_trigger(assert_not_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, true]), "__gma_test_trigger_messages__: assert_not_throwless 4");
  // Cleanup
  ds_map_destroy(map);
}
