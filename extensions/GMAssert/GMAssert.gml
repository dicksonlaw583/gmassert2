#define assert_greater_than
/// @function assert_greater_than(got, expected, [msg])
/// @param got The actual received value for the assertion
/// @param expected The value expected for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is greater than the expected expression.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Greater than assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!__gma_greater_than__(argument[0], argument[1])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value greater than " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that comes after " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all greater than " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error__(msg + " (unsupported type)", argument[1], argument[0]);
      break;
    }
  }
}

#define assert_less_than
/// @function assert_less_than(got, expected, [msg])
/// @param got The actual received value for the assertion
/// @param expected The value expected for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is less than the expected expression.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Less than assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!__gma_less_than__(argument[0], argument[1])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value less than " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that comes before " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all less than " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error__(msg + " (unsupported type)", argument[1], argument[0]);
      break;
    }
  }
}

#define assert_greater_than_or_equal
/// @function assert_greater_than_or_equal(got, expected, [msg])
/// @param got The actual received value for the assertion
/// @param expected The value expected for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is greater than or equal to the expected expression.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Greater than or equal assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!__gma_greater_than_or_equal__(argument[0], argument[1])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value greater than or equal to " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that comes after or is " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all greater than or equal to " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error__(msg + " (unsupported type)", argument[1], argument[0]);
      break;
    }
  }
}

#define assert_less_than_or_equal
/// @function assert_less_than_or_equal(got, expected, [msg])
/// @param got The actual received value for the assertion
/// @param expected The value expected for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is less than or equal to the expected expression.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Less than or equal assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!__gma_less_than_or_equal__(argument[0], argument[1])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value less than or equal to " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that comes before or is " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all less than or equal " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error__(msg + " (unsupported type)", argument[1], argument[0]);
      break;
    }
  }
}

#define assert_is_string
/// @function assert_is_string(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is a string.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "String type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_string(argument[0])) {
    __gma_assert_error_raw__(msg, "Any string", __gma_debug_value__(argument[0]));
  }
}

#define assert_is_real
/// @function assert_is_real(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is a real number.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Real type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_real(argument[0])) {
    __gma_assert_error_raw__(msg, "Any real value", __gma_debug_value__(argument[0]));
  }
}

#define assert_is_array
/// @function assert_is_array(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is an array.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Array type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_array(argument[0])) {
    __gma_assert_error_raw__(msg, "Any array", __gma_debug_value__(argument[0]));
  }
}

#define assert_is_defined
/// @function assert_is_defined(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not undefined.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Defined type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_undefined(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but undefined", __gma_debug_value__(argument[0]));
  }
}

#define assert_is_undefined
/// @function assert_is_undefined(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is undefined.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Undefined type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_undefined(argument[0])) {
    __gma_assert_error_raw__(msg, "undefined", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_string
/// @function assert_isnt_string(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not a string.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-string type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_string(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a string", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_real
/// @function assert_isnt_real(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not a real number.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-real type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_real(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a real value", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_array
/// @function assert_isnt_array(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not an array.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-array type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_array(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but an array", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_defined
/// @function assert_isnt_defined(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is undefined.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Undefined type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (!is_undefined(argument[0])) {
    __gma_assert_error_raw__(msg, "undefined", __gma_debug_value__(argument[0]));
  }
}

#define assert_isnt_undefined
/// @function assert_isnt_undefined(got, [msg])
/// @param got The actual received value for the assertion
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not undefined.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Defined type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check assertion
  if (is_undefined(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but undefined", __gma_debug_value__(argument[0]));
  }
}

#define assert_in_range
/// @function assert_in_range(got, lower, upper, [msg])
/// @param got The actual received value for the assertion
/// @param lower The lower bound of the range (inclusive)
/// @param upper The upper bound of the range (inclusive)
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is within the inclusive range between lower and upper.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 3:
      msg = "In-range assertion failed!";
    break;
    case 4:
      msg = argument[3];
    break;
    default:
      show_error("Expected 3 or 4 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types
  switch (typeof(argument[1])) {
    case "number":
    case "string":
    case "array":
    break;
    default:
      msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
    exit;
  }
  if (typeof(argument[1]) != typeof(argument[2])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "string":
        __gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "array":
        __gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(argument[2]));
      break;
      default:
        msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
      break;
    }
    exit;
  }
  //Check assertion
  if (!(__gma_less_than_or_equal__(argument[0], argument[2]) && __gma_less_than_or_equal__(argument[1], argument[0]))) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that lies between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
    }
  }
}

#define assert_not_in_range
/// @function assert_not_in_range(got, lower, upper, [msg])
/// @param got The actual received value for the assertion
/// @param lower The lower bound of the range (inclusive)
/// @param upper The upper bound of the range (inclusive)
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten expression is not within the inclusive range between lower and upper.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 3:
      msg = "Out-of-range assertion failed!";
    break;
    case 4:
      msg = argument[3];
    break;
    default:
      show_error("Expected 3 or 4 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types
  switch (typeof(argument[1])) {
    case "number":
    case "string":
    case "array":
    break;
    default:
      msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
    exit;
  }
  if (typeof(argument[1]) != typeof(argument[2])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "string":
        __gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "array":
        __gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(argument[2]));
      break;
      default:
        msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
      break;
    }
    exit;
  }
  //Check assertion
  if (__gma_less_than_or_equal__(argument[0], argument[2]) && __gma_less_than_or_equal__(argument[1], argument[0])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value not between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that does not lie between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all not between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
    }
  }
}

#define assert_contains
/// @function assert_contains(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten string, list or array contains a value equal to content.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "string":
      if (typeof(argument[1]) == "string") {
        if (string_pos(argument[1], argument[0]) == 0) {
          __gma_assert_error_raw__(msg, "A string that contains " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
        }
      }
      else {
        msg += " (invalid content type)";
        __gma_assert_error_raw__(msg, "A string", __gma_debug_value__(argument[1]));
      }
    break;
    case "array":
      var arr = argument[0];
      var size = array_length(arr);
      for (var i = 0; i < size; i++) {
        if (__gma_equal__(argument[1], arr[i])) {
          found = true;
          break;
        }
      }
      if (!found) {
        __gma_assert_error_raw__(msg, "An array that contains " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_list)) {
        var list = argument[0],
            size = ds_list_size(list);
        for (var i = 0; i < size; i++) {
          if (__gma_equal__(argument[1], list[| i])) {
            found = true;
            break;
          }
        }
        if (!found) {
          __gma_assert_error_raw__(msg, "A list that contains " + __gma_debug_value__(argument[1]), __gma_debug_list_value__(argument[0]));
        }
      }
      else {
        msg += " (list ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
        __gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_contains_exact
/// @function assert_contains_exact(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten string, list or array contains a value exactly equal to content (as compared using ==).
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exact inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "string":
      if (typeof(argument[1]) == "string") {
        if (string_pos(argument[1], argument[0]) == 0) {
          __gma_assert_error_raw__(msg, "A string that contains exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
        }
      }
      else {
        msg += " (invalid content type)";
        __gma_assert_error_raw__(msg, "A string", __gma_debug_value__(argument[1]));
      }
    break;
    case "array":
      var arr = argument[0];
      var size = array_length(arr);
      for (var i = 0; i < size; i++) {
        if (typeof(argument[1]) == typeof(arr[i]) && argument[1] == arr[i]) {
          found = true;
          break;
        }
      }
      if (!found) {
        __gma_assert_error_raw__(msg, "An array that contains exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_list)) {
        var list = argument[0],
            size = ds_list_size(list);
        for (var i = 0; i < size; i++) {
          if (typeof(argument[1]) == typeof(list[| i]) && argument[1] == list[| i]) {
            found = true;
            break;
          }
        }
        if (!found) {
          __gma_assert_error_raw__(msg, "A list that contains exactly " + __gma_debug_value__(argument[1]), __gma_debug_list_value__(argument[0]));
        }
      }
      else {
        msg += " (list ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
        __gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_doesnt_contain
/// @function assert_doesnt_contain(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten string, list or array does not contain a value equal to content.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "string":
      if (typeof(argument[1]) == "string") {
        if (string_pos(argument[1], argument[0]) > 0) {
          __gma_assert_error_raw__(msg, "A string that does not contain " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
        }
      }
      else {
        msg += " (invalid content type)";
        __gma_assert_error_raw__(msg, "A string", __gma_debug_value__(argument[1]));
      }
    break;
    case "array":
      var arr = argument[0];
      var size = array_length(arr);
      for (var i = 0; i < size; i++) {
        if (__gma_equal__(argument[1], arr[i])) {
          found = true;
          break;
        }
      }
      if (found) {
        __gma_assert_error_raw__(msg, "An array that does not contain " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_list)) {
        var list = argument[0],
            size = ds_list_size(list);
        for (var i = 0; i < size; i++) {
          if (__gma_equal__(argument[1], list[| i])) {
            found = true;
            break;
          }
        }
        if (found) {
          __gma_assert_error_raw__(msg, "A list that does not contain " + __gma_debug_value__(argument[1]), __gma_debug_list_value__(argument[0]));
        }
      }
      else {
        msg += " (list ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
        __gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_doesnt_contain_exact
/// @function assert_doesnt_contain_exact(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten string, list or array does not contain a value exactly equal to content (as compared using ==).
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exact exclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "string":
      if (typeof(argument[1]) == "string") {
        if (string_pos(argument[1], argument[0]) > 0) {
          __gma_assert_error_raw__(msg, "A string that does not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
        }
      }
      else {
        msg += " (invalid content type)";
        __gma_assert_error_raw__(msg, "A string", __gma_debug_value__(argument[1]));
      }
    break;
    case "array":
      var arr = argument[0];
      var size = array_length(arr);
      for (var i = 0; i < size; i++) {
        if (typeof(argument[1]) == typeof(arr[i]) && argument[1] == arr[i]) {
          found = true;
          break;
        }
      }
      if (found) {
        __gma_assert_error_raw__(msg, "An array that eoes not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_list)) {
        var list = argument[0],
            size = ds_list_size(list);
        for (var i = 0; i < size; i++) {
          if (typeof(argument[1]) == typeof(list[| i]) && argument[1] == list[| i]) {
            found = true;
            break;
          }
        }
        if (found) {
          __gma_assert_error_raw__(msg, "A list that does not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_list_value__(argument[0]));
        }
      }
      else {
        msg += " (list ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
        __gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_contains_2d
/// @function assert_contains_2d(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten grid or 2D array contains a value equal to content.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "2D inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "array":
      var arr = argument[0];
      var size_i = array_length(arr);
      for (var i = 0; i < size_i && !found; i++) {
        var size_j = array_length(arr[i]);
        for (var j = 0; j < size_j; j++) {
          if (__gma_equal__(argument[1], arr[i][j])) {
            found = true;
            break;
          }
        }
      }
      if (!found) {
        __gma_assert_error_raw__(msg, "A 2D array that contains " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_grid)) {
        var grid = argument[0],
            size_i = ds_grid_width(grid),
            size_j = ds_grid_height(grid);
        for (var i = 0; i < size_i && !found; i++) {
          for (var j = 0; j < size_j; j++) {
            if (__gma_equal__(argument[1], grid[# i, j])) {
              found = true;
              break;
            }
          }
        }
        if (!found) {
          __gma_assert_error_raw__(msg, "A grid that contains " + __gma_debug_value__(argument[1]), __gma_debug_grid_value__(argument[0]));
        }
      }
      else {
        msg += " (grid ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
      __gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_contains_exact_2d
/// @function assert_contains_exact_2d(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten grid or 2D array contains a value equal to content, as compared using ==.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exact 2D inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "array":
      var arr = argument[0];
      var size_i = array_length(arr);
      for (var i = 0; i < size_i && !found; i++) {
        var size_j = array_length(arr[i]);
        for (var j = 0; j < size_j; j++) {
          if (argument[1] == arr[i][j]) {
            found = true;
            break;
          }
        }
      }
      if (!found) {
        __gma_assert_error_raw__(msg, "A 2D array that contains " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_grid)) {
        var grid = argument[0],
            size_i = ds_grid_width(grid),
            size_j = ds_grid_height(grid);
        for (var i = 0; i < size_i && !found; i++) {
          for (var j = 0; j < size_j; j++) {
            if (argument[1] == grid[# i, j]) {
              found = true;
              break;
            }
          }
        }
        if (!found) {
          __gma_assert_error_raw__(msg, "A grid that contains " + __gma_debug_value__(argument[1]), __gma_debug_grid_value__(argument[0]));
        }
      }
      else {
        msg += " (grid ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
      __gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_doesnt_contain_2d
/// @function assert_doesnt_contain_2d(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten grid or 2D array doesn't contain a value equal to content.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "2D non-inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "array":
      var arr = argument[0];
      var size_i = array_length(arr);
      for (var i = 0; i < size_i && !found; i++) {
        var size_j = array_length(arr[i]);
        for (var j = 0; j < size_j; j++) {
          if (__gma_equal__(argument[1], arr[i][j])) {
            found = true;
            break;
          }
        }
      }
      if (found) {
        __gma_assert_error_raw__(msg, "A 2D array that doesn't contain " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_grid)) {
        var grid = argument[0],
            size_i = ds_grid_width(grid),
            size_j = ds_grid_height(grid);
        for (var i = 0; i < size_i && !found; i++) {
          for (var j = 0; j < size_j; j++) {
            if (__gma_equal__(argument[1], grid[# i, j])) {
              found = true;
              break;
            }
          }
        }
        if (found) {
          __gma_assert_error_raw__(msg, "A grid that doesn't contain " + __gma_debug_value__(argument[1]), __gma_debug_grid_value__(argument[0]));
        }
      }
      else {
        msg += " (grid ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
      __gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(argument[0]));
    break;
  }
}

#define assert_doesnt_contain_exact_2d
/// @function assert_doesnt_contain_exact_2d(got, content, [msg]);
/// @param got The actual received value for the assertion
/// @param content A value to look for in the received value
/// @param [msg] (optional) A custom message to display when the assertion fails
/// @description Assert that the gotten grid or 2D array doesn't contain a value equal to content, as compared using ==.
{
  if (!GMASSERT_ENABLED) exit;
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exact 2D non-inclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  //Check types and assertion
  var found = false;
  switch (typeof(argument[0])) {
    case "array":
      var arr = argument[0];
      var size_i = array_length(arr);
      for (var i = 0; i < size_i && !found; i++) {
        var size_j = array_length(arr[i]);
        for (var j = 0; j < size_j; j++) {
          if (argument[1] == arr[i][j]) {
            found = true;
            break;
          }
        }
      }
      if (found) {
        __gma_assert_error_raw__(msg, "A 2D array that doesn't contain " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case "number": case "int32": case "int64":
      if (ds_exists(argument[0], ds_type_grid)) {
        var grid = argument[0],
            size_i = ds_grid_width(grid),
            size_j = ds_grid_height(grid);
        for (var i = 0; i < size_i && !found; i++) {
          for (var j = 0; j < size_j; j++) {
            if (argument[1] == grid[# i, j]) {
              found = true;
              break;
            }
          }
        }
        if (found) {
          __gma_assert_error_raw__(msg, "A grid that doesn't contain " + __gma_debug_value__(argument[1]), __gma_debug_grid_value__(argument[0]));
        }
      }
      else {
        msg += " (grid ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
      __gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(argument[0]));
    break;
  }
}

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
