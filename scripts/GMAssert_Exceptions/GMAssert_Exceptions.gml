///@func assert_doesnt_throw(func, thrown, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {Any} thrown The thing that func should not throw
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given function throws nothing or something other than the given thing.
function assert_doesnt_throw(func, thrown, msg="No-throw assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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
		if (__gma_equal__(exc, thrown)) {
			__gma_assert_error_raw__(msg, "No throw " + __gma_debug_value__(thrown), "throw " + __gma_debug_value__(exc));
		}
		exit;
	}
}

///@func assert_doesnt_throw_instance_of(func, typeName, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {String} typeName The type of the thing func should not throw
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given function doesn't throw the given type of thing.
function assert_doesnt_throw_instance_of(func, typeName, msg="Not-throw-type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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
		if (typeof(exc) == typeName || (is_struct(exc) && instanceof(exc) == typeName)) {
			__gma_assert_error_raw__(msg, "throw type other than " + typeName, "throw " + __gma_debug_value__(exc));
		}
		exit;
	}
}

///@func assert_not_throwless(func, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the function run throws something
function assert_not_throwless(func, msg="Not-throwless assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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

///@func assert_throwless(func, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the function run throws nothing
function assert_throwless(func, msg="Throwless assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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

///@func assert_throws(func, thrown, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {Any} thrown The thing that func should throw
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given function throws the given thing.
function assert_throws(func, thrown, msg="Throw assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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
		if (!__gma_equal__(exc, thrown)) {
			__gma_assert_error_raw__(msg, "throw " + __gma_debug_value__(thrown), "throw " + __gma_debug_value__(exc));
		}
		exit;
	}
	__gma_assert_error_raw__(msg, "throw " + __gma_debug_value__(thrown), "throw <none>");
}

///@func assert_throws_instance_of(func, typeName, msg)
///@param {Function,Array} func The function to run (can be function or 2-array of a function plus its argument)
///@param {String} typeName The type of the thing func should throw
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given function throws the given type of thing.
function assert_throws_instance_of(func, typeName, msg="Throw-type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	var _func, _arg, _arg0;
	var _noarg = false;
	if (is_array(func)) {
		_arg0 = func;
		_func = _arg0[0];
		_arg = _arg0[1];
	} else {
		_func = func;
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
		if (typeof(exc) != typeName && (!is_struct(exc) || instanceof(exc) != typeName)) {
			__gma_assert_error_raw__(msg, "throw type " + typeName, "throw " + __gma_debug_value__(exc));
		}
		exit;
	}
	__gma_assert_error_raw__(msg, "throw type " + typeName, "throw <none>");
}
