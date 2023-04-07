#define assert_doesnt_have_key
///@func assert_doesnt_have_key(got, key, [msg])
///@param got The actual received value for the assertion
///@param key The key got should not have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given struct or map does not have the given key.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "No-key assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion (struct form)
  if (is_struct(argument[0])) {
    if (variable_struct_exists(argument[0], argument[1])) {
      __gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(argument[1]), __gma_debug_struct_value__(argument[0]));
    }
  }
  //Check assertion (map form)
  else if (is_real(argument[0]) || is_int32(argument[0]) || is_int64(argument[0])) {
    if (!ds_exists(argument[0], ds_type_map) || ds_map_exists(argument[0], argument[1])) {
      __gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(argument[1]), __gma_debug_map_value__(argument[0]));
    }
  }
  //Invalid
  else {
    __gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
  }
}

#define assert_doesnt_have_method
///@func assert_doesnt_have_method(got, methodName, [msg])
///@param got The actual received value for the assertion
///@param methodName The method name got should not have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given value does not have a method of the given name.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "No-method assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_struct(argument[0]) || (variable_struct_exists(argument[0], argument[1]) && is_method(variable_struct_get(argument[0], argument[1])))) {
    __gma_assert_error_raw__(msg, "A struct without a method named " + argument[1], __gma_debug_struct_value__(argument[0]));
  }
}

#define assert_doesnt_throw
///@func assert_doesnt_throw(func, thrown, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param thrown The thing that func should not throw
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given function throws nothing or something other than the given thing.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "No-throw assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  var _arg1 = argument[1]; //Workaround for lost arguments in Runtime 23.1.1.254 (2.3.2 beta)
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    if (__gma_equal__(exc, _arg1)) {
      __gma_assert_error_raw__(msg, "No throw " + __gma_debug_value__(_arg1), "throw " + __gma_debug_value__(exc));
    }
    exit;
  }
}

#define assert_doesnt_throw_instance_of
///@func assert_doesnt_throw_instance_of(func, typeName, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param typeName The type of the thing func should not throw
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given function doesn't throw the given type of thing.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Not-throw-type assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  var _arg1 = argument[1]; //Workaround for lost arguments in Runtime 23.1.1.254 (2.3.2 beta)
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    if (typeof(exc) == _arg1 || (is_struct(exc) && instanceof(exc) == _arg1)) {
      __gma_assert_error_raw__(msg, "throw type other than " + _arg1, "throw " + __gma_debug_value__(exc));
    }
    exit;
  }
}

#define assert_has_key
///@func assert_has_key(got, key, [msg])
///@param got The actual received value for the assertion
///@param key The key got should have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given struct or map has the given key.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Key assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion (struct form)
  if (is_struct(argument[0])) {
    if (!variable_struct_exists(argument[0], argument[1])) {
      __gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(argument[1]), __gma_debug_struct_value__(argument[0]));
    }
  }
  //Check assertion (map form)
  else if (is_real(argument[0]) || is_int32(argument[0]) || is_int64(argument[0])) {
    if (!ds_exists(argument[0], ds_type_map) || !ds_map_exists(argument[0], argument[1])) {
      __gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(argument[1]), __gma_debug_map_value__(argument[0]));
    }
  }
  //Invalid
  else {
    __gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
  }
}

#define assert_has_method
///@func assert_has_method(got, methodName, [msg])
///@param got The actual received value for the assertion
///@param methodName The method name got should have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given value has a method of the given name.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Method assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_struct(argument[0]) || !variable_struct_exists(argument[0], argument[1]) || !is_method(variable_struct_get(argument[0], argument[1]))) {
    __gma_assert_error_raw__(msg, "A struct with a method named " + argument[1], __gma_debug_struct_value__(argument[0]));
  }
}

#define assert_is_instance_of
///@func assert_is_instance_of(got, typeName, [msg])
///@param got The actual received value for the assertion
///@param typeName The type that the given value should have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given value has the given type.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Instance-of assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (typeof(argument[0]) != argument[1] && (!is_struct(argument[0]) || instanceof(argument[0]) != argument[1])) {
    __gma_assert_error_raw__(msg, "Anything of type " + argument[1], __gma_debug_value__(argument[0]));
  }
}

#define assert_is_method
///@func assert_is_method(got, [msg])
///@param got The actual received value for the assertion
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the gotten expression is a method.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Function type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_method(argument[0])) {
    __gma_assert_error_raw__(msg, "Any method", __gma_debug_value__(argument[0]));
  }
}

#define assert_is_struct
///@func assert_is_struct(got, [msg])
///@param got The actual received value for the assertion
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the gotten expression is a struct.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Struct type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_struct(argument[0])) {
    __gma_assert_error_raw__(msg, "Any struct", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_instance_of
///@func assert_isnt_instance_of(got, typeName, [msg])
///@param got The actual received value for the assertion
///@param typeName The type that the given value should not have
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given value does not have the given type.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Not-instance-of assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (typeof(argument[0]) == argument[1] || (is_struct(argument[0]) && instanceof(argument[0]) == argument[1])) {
    __gma_assert_error_raw__(msg, "Anything not of type " + argument[1], __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_method
///@func assert_isnt_method(got, [msg])
///@param got The actual received value for the assertion
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the gotten expression is not a method.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-function type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_method(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a method", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_struct
///@func assert_isnt_struct(got, [msg])
///@param got The actual received value for the assertion
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the gotten expression is not a struct.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-struct type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_struct(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a struct", __gma_debug_value__(argument[0]));
  }
}

#define assert_not_throwless
///@func assert_not_throwless(func, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the function run throws something
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Not-throwless assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    exit;
  }
  __gma_assert_error_raw__(msg, "throw something", "throw <none>");
}

#define assert_throwless
///@func assert_throwless(func, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the function run throws nothing
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Throwless assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    __gma_assert_error_raw__(msg, "throw <none>", "throw " + __gma_debug_value__(exc));
  }
}

#define assert_throws
///@func assert_throws(func, thrown, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param thrown The thing that func should throw
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given function throws the given thing.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Throw assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  var _arg1 = argument[1]; //Workaround for lost arguments in Runtime 23.1.1.254 (2.3.2 beta)
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    if (!__gma_equal__(exc, _arg1)) {
      __gma_assert_error_raw__(msg, "throw " + __gma_debug_value__(_arg1), "throw " + __gma_debug_value__(exc));
    }
    exit;
  }
  __gma_assert_error_raw__(msg, "throw " + __gma_debug_value__(argument[1]), "throw <none>");
}

#define assert_throws_instance_of
///@func assert_throws_instance_of(func, typeName, [msg])
///@param func The function to run (can be function or 2-array of a function plus its argument)
///@param typeName The type of the thing func should throw
///@param [msg] (optional) A custom message to display when the assertion fails
///@description Assert that the given function throws the given type of thing.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Throw-type assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  var _func, _arg, _arg0;
  var _noarg = false;
  if (is_array(argument[0])) {
    _arg0 = argument[0];
    _func = _arg0[0];
    _arg = _arg0[1];
  } else {
    _func = argument[0];
    _noarg = true;
  }
  //Check assertion
  var _arg1 = argument[1]; //Workaround for lost arguments in Runtime 23.1.1.254 (2.3.2 beta)
  try {
    if (_noarg) {
      _func();
    } else {
      _func(_arg);
    }
  } catch (exc) {
    if (typeof(exc) != _arg1 && (!is_struct(exc) || instanceof(exc) != _arg1)) {
      __gma_assert_error_raw__(msg, "throw type " + _arg1, "throw " + __gma_debug_value__(exc));
    }
    exit;
  }
  __gma_assert_error_raw__(msg, "throw type " + argument[1], "throw <none>");
}
