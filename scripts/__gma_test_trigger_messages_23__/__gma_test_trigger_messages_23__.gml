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
  test_case_no_trigger(assert_is_method(vector.mag));
  test_case_no_trigger(assert_is_method(vector.norm));
  test_case_no_trigger(assert_is_method(vector.add));
  test_case_trigger(assert_is_method(583));
  test_case_trigger(assert_is_method("boo"));
  test_case_trigger(assert_is_method(undefined));
  // assert_isnt_method(got, [msg])
  test_case_trigger(assert_isnt_method(vector.mag));
  test_case_trigger(assert_isnt_method(vector.norm));
  test_case_trigger(assert_isnt_method(vector.add));
  test_case_no_trigger(assert_isnt_method(583));
  test_case_no_trigger(assert_isnt_method("boo"));
  test_case_no_trigger(assert_isnt_method(undefined));
  // assert_has_method(got, methodName, [msg])
  test_case_no_trigger(assert_has_method(vector, "mag"));
  test_case_no_trigger(assert_has_method(vector, "norm"));
  test_case_no_trigger(assert_has_method(vector, "add"));
  test_case_trigger(assert_has_method(vector, "foo"));
  test_case_trigger(assert_has_method(583, "foo"));
  test_case_trigger(assert_has_method("boo", "foo"));
  test_case_trigger(assert_has_method(undefined, "foo"));
  // assert_doesnt_have_method(got, methodName, [msg])
  test_case_trigger(assert_doesnt_have_method(vector, "mag"));
  test_case_trigger(assert_doesnt_have_method(vector, "norm"));
  test_case_trigger(assert_doesnt_have_method(vector, "add"));
  test_case_no_trigger(assert_doesnt_have_method(vector, "foo"));
  test_case_trigger(assert_doesnt_have_method(583, "foo"));
  test_case_trigger(assert_doesnt_have_method("boo", "foo"));
  test_case_trigger(assert_doesnt_have_method(undefined, "foo"));
  // assert_is_struct(got, [msg])
  test_case_trigger(assert_is_struct(583));
  test_case_trigger(assert_is_struct("boo"));
  test_case_trigger(assert_is_struct(undefined));
  test_case_no_trigger(assert_is_struct({a: 5, b: 7}));
  test_case_no_trigger(assert_is_struct(vector));
  // assert_isnt_struct(got, [msg])
  test_case_no_trigger(assert_isnt_struct(583));
  test_case_no_trigger(assert_isnt_struct("boo"));
  test_case_no_trigger(assert_isnt_struct(undefined));
  test_case_trigger(assert_isnt_struct({a: 5, b: 7}));
  test_case_trigger(assert_isnt_struct(vector));
  // assert_is_instance_of(val, typeName, [msg])
  test_case_no_trigger(assert_is_instance_of(583, "number"));
  test_case_trigger(assert_is_instance_of(583, "string"));
  test_case_no_trigger(assert_is_instance_of("abc", "string"));
  test_case_trigger(assert_is_instance_of("abc", "struct"));
  test_case_no_trigger(assert_is_instance_of({a: 5, b: 7}, "struct"));
  test_case_trigger(assert_is_instance_of({a: 5, b: 7}, "Vector2"));
  test_case_no_trigger(assert_is_instance_of(["a", "b", "c"], "array"));
  test_case_trigger(assert_is_instance_of(["a", "b", "c"], "string"));
  test_case_no_trigger(assert_is_instance_of(vector, "struct"));
  test_case_no_trigger(assert_is_instance_of(vector, "Vector2"));
  test_case_trigger(assert_is_instance_of(vector, "Vector3"));
  // assert_isnt_instance_of(val, typeName, [msg])
  test_case_trigger(assert_isnt_instance_of(583, "number"));
  test_case_no_trigger(assert_isnt_instance_of(583, "string"));
  test_case_trigger(assert_isnt_instance_of("abc", "string"));
  test_case_no_trigger(assert_isnt_instance_of("abc", "struct"));
  test_case_trigger(assert_isnt_instance_of({a: 5, b: 7}, "struct"));
  test_case_no_trigger(assert_isnt_instance_of({a: 5, b: 7}, "Vector2"));
  test_case_trigger(assert_isnt_instance_of(["a", "b", "c"], "array"));
  test_case_no_trigger(assert_isnt_instance_of(["a", "b", "c"], "string"));
  test_case_trigger(assert_isnt_instance_of(vector, "struct"));
  test_case_trigger(assert_isnt_instance_of(vector, "Vector2"));
  test_case_no_trigger(assert_isnt_instance_of(vector, "Vector3"));
  // assert_has_key(val, key, [msg])
  var mapDNE = map;
	while (ds_exists(mapDNE, ds_type_map)) mapDNE++;
  test_case_trigger(assert_has_key(undefined, "foo"));
  test_case_trigger(assert_has_key(mapDNE, "foo"));
  test_case_trigger(assert_has_key(mapDNE, "baz"));
  test_case_no_trigger(assert_has_key(map, "foo"));
  test_case_no_trigger(assert_has_key(map, "baz"));
  test_case_trigger(assert_has_key(map, "doo"));
  test_case_no_trigger(assert_has_key(structAB, "a"));
  test_case_no_trigger(assert_has_key(structAB, "b"));
  test_case_trigger(assert_has_key(structAB, "C"));
  test_case_no_trigger(assert_has_key(vector, "x"));
  test_case_no_trigger(assert_has_key(vector, "y"));
  test_case_no_trigger(assert_has_key(vector, "mag"));
  test_case_no_trigger(assert_has_key(vector, "norm"));
  test_case_no_trigger(assert_has_key(vector, "add"));
  test_case_trigger(assert_has_key(vector, "foo"));
  // assert_doesnt_have_key(val, key, [msg])
  test_case_trigger(assert_doesnt_have_key(undefined, "foo"));
  test_case_trigger(assert_doesnt_have_key(mapDNE, "foo"));
  test_case_trigger(assert_doesnt_have_key(mapDNE, "baz"));
  test_case_trigger(assert_doesnt_have_key(map, "foo"));
  test_case_trigger(assert_doesnt_have_key(map, "baz"));
  test_case_no_trigger(assert_doesnt_have_key(map, "doo"));
  test_case_trigger(assert_doesnt_have_key(structAB, "a"));
  test_case_trigger(assert_doesnt_have_key(structAB, "b"));
  test_case_no_trigger(assert_doesnt_have_key(structAB, "C"));
  test_case_trigger(assert_doesnt_have_key(vector, "x"));
  test_case_trigger(assert_doesnt_have_key(vector, "y"));
  test_case_trigger(assert_doesnt_have_key(vector, "mag"));
  test_case_trigger(assert_doesnt_have_key(vector, "norm"));
  test_case_trigger(assert_doesnt_have_key(vector, "add"));
  test_case_no_trigger(assert_doesnt_have_key(vector, "foo"));
  // assert_throws(func, thrown, [msg])
  test_case_trigger(assert_throws(function() {
    return 1+2+3;
  }, "error!"));
  test_case_trigger(assert_throws(function() {
    throw 654321;
  }, "error!"));
  test_case_no_trigger(assert_throws(function() {
    throw "error!";
  }, "error!"));
  test_case_trigger(assert_throws([function(_arg) {
    throw _arg + "!";
  }, "foo"], "error!"));
  test_case_no_trigger(assert_throws([function(_arg) {
    throw _arg + "!";
  }, "error"], "error!"));
  // assert_doesnt_throw(func, thrown, [msg])
  test_case_no_trigger(assert_doesnt_throw(function() {
    return 1+2+3;
  }, "error!"));
  test_case_no_trigger(assert_doesnt_throw(function() {
    throw 654321;
  }, "error!"));
  test_case_trigger(assert_doesnt_throw(function() {
    throw "error!";
  }, "error!"));
  test_case_no_trigger(assert_doesnt_throw([function(_arg) {
    throw _arg + "!";
  }, "foo"], "error!"));
  test_case_trigger(assert_doesnt_throw([function(_arg) {
    throw _arg + "!";
  }, "error"], "error!"));
  // assert_throws_instance_of(func, typeName, [msg])
  test_case_trigger(assert_throws_instance_of(function() {
    return 3.5;
  }, "number"));
  test_case_no_trigger(assert_throws_instance_of(function() {
    throw 3.5;
  }, "number"));
  test_case_trigger(assert_throws_instance_of(function() {
    throw { x:3, y: 9 };
  }, "Vector2"));
  test_case_no_trigger(assert_throws_instance_of(function() {
    throw new Vector2(3, 7);
  }, "Vector2"));
  test_case_trigger(assert_throws_instance_of([function(_arg) {
    return { a: _arg };
  }, 3], "struct"));
  test_case_no_trigger(assert_throws_instance_of([function(_arg) {
    throw new Vector2(3, _arg);
  }, 3], "struct"));
  // assert_doesnt_throw_instance_of(func, typeName, [msg])
  test_case_no_trigger(assert_doesnt_throw_instance_of(function() {
    return 3.5;
  }, "number"));
  test_case_trigger(assert_doesnt_throw_instance_of(function() {
    throw 3.5;
  }, "number"));
  test_case_no_trigger(assert_doesnt_throw_instance_of(function() {
    throw { x:3, y: 9 };
  }, "Vector2"));
  test_case_trigger(assert_doesnt_throw_instance_of(function() {
    throw new Vector2(3, 7);
  }, "Vector2"));
  test_case_no_trigger(assert_doesnt_throw_instance_of([function(_arg) {
    return { a: _arg };
  }, 3], "struct"));
  test_case_trigger(assert_doesnt_throw_instance_of([function(_arg) {
    throw new Vector2(3, _arg);
  }, 3], "struct"));
  // assert_throwless(func, [msg])
  test_case_no_trigger(assert_throwless(function() {
    return "Hello World!";
  }));
  test_case_trigger(assert_throwless(function() {
    throw "Hello world!";
  }));
  test_case_no_trigger(assert_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, false]));
  test_case_trigger(assert_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, true]));
  // assert_not_throwless(func, [msg])
  test_case_trigger(assert_not_throwless(function() {
    return "Hello World!";
  }));
  test_case_no_trigger(assert_not_throwless(function() {
    throw "Hello world!";
  }));
  test_case_trigger(assert_not_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, false]));
  test_case_no_trigger(assert_not_throwless([function(_arg) {
    if (_arg) throw 123456;
  }, true]));
  // Cleanup
  ds_map_destroy(map);
}
