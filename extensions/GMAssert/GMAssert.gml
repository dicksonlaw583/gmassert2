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
