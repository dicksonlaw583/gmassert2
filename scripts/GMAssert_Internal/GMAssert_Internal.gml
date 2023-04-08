///@func __gma_assert_error__(message, expected, got)
///@param {String} message The message to display to the user
///@param {Any} expected The value expected for the assertion
///@param {Any} got The actual received value for the assertion
///@ignore
///@desc (INTERNAL: GMAssert 2) Show an assertion error.
function __gma_assert_error__(message, expected, got) {
	var gtbp = asset_get_index("__GMA_TEST_BREAKPOINT__");
	var gbp = asset_get_index("__GMA_BREAKPOINT__");
	
	///Feather disable GM1041
	if (GMASSERT_ENABLED && ((gtbp != -1 && !script_execute(gtbp, message, got, expected)) || (gbp != -1 && gtbp == -1 && !script_execute(gbp, message, got, expected)) || gbp == -1)) {
		var msg = message + "\r\nExpected: " + __gma_debug_value__(expected) + "\r\nGot: " + __gma_debug_value__(got) + "\r\n";
		if (os_browser == browser_not_a_browser) {
			show_error(msg, true);
		}
		else {
			show_message(msg);
		}
	}
	///Feather enable GM1041
}

///@function __gma_assert_error_simple__(message, got)
///@param {String} message The message to display to the user
///@param {Any} got The actual received value for the assertion
///@ignore
///@desc (INTERNAL: GMAssert 2) Show a simple assertion error.
function __gma_assert_error_simple__(message, got) {
	var gtbp = asset_get_index("__GMA_TEST_BREAKPOINT__");
	var gbp = asset_get_index("__GMA_BREAKPOINT__");
	
	///Feather disable GM1041
	if (GMASSERT_ENABLED && ((gtbp != -1 && !script_execute(gtbp, message, got, "")) || (gbp != -1 && gtbp == -1 && !script_execute(gbp, message, got, "")) || gbp == -1)) {
		var msg = message + "\r\n";
		if (os_browser == browser_not_a_browser) {
			show_error(msg, true);
		}
		else {
			show_message(msg);
		}
	}
	///Feather enable GM1041
}

///@function __gma_assert_error_raw__(message, expected, got)
///@param {String} message The message to display to the user
///@param {Any} expected The value expected for the assertion
///@param {Any} got The actual received value for the assertion
///@ignore
///@desc (INTERNAL: GMAssert 2) Show an assertion error containing raw values.
function __gma_assert_error_raw__(message, expected, got) {
	var gtbp = asset_get_index("__GMA_TEST_BREAKPOINT__");
	var gbp = asset_get_index("__GMA_BREAKPOINT__");
	
	///Feather disable GM1041
	if (GMASSERT_ENABLED && ((gtbp != -1 && !script_execute(gtbp, message, got, expected)) || (gbp != -1 && gtbp == -1 && !script_execute(gbp, message, got, expected)) || gbp == -1)) {
		var msg = message + "\r\nExpected: " + expected + "\r\nGot: " + got + "\r\n";
		if (os_browser == browser_not_a_browser) {
			show_error(msg, true);
		}
		else {
			show_message(msg);
		}
	}
	///Feather enable GM1041
}

///@func __gma_debug_value__(val, [noprefix])
///@param {Any} val The value to derive a debug-friendly value from
///@param {Bool} [noprefix] Whether to skip the "(type)" header (defaults to false)
///@return {String}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return a debug description string for the given value.
function __gma_debug_value__(val, noprefix=false) {
	var type = typeof(val);
	var dv, result, size;
	switch (type) {
		case "number":
		//Return integers as-is
		if (is_infinity(val)) {
			dv = (val < 0) ? "-infinity" : "infinity";
		}
		else if (is_nan(val)) {
			dv = "NaN";
		}
		else if (frac(val) == 0) {
			dv = string(val);
		}
		//Get mantissa and exponent
		else {
			var mantissa, exponent;
			exponent = floor(log10(abs(val)));
			mantissa = string_replace_all(string_format(val/power(10,exponent), 15, 14), " ", "");
			//Trim trailing zeros off mantissa
			var i, ca;
			i = string_length(mantissa);
			do {
				ca = string_char_at(mantissa, i);
				i -= 1;
			} until (ca != "0")
			if (ca != ".") {
				mantissa = string_copy(mantissa, 1, i+1);
			}
			else {
				mantissa = string_copy(mantissa, 1, i);
			}
			//Add exponent except if it is zero
			if (exponent != 0) {
				dv = mantissa + "e" + string(exponent);
			}
			else {
				dv = mantissa;
			}
		}
		break;
		case "string":
			var str = string_replace_all(val, "\\", "\\\\");
			str = string_replace_all(str, "\"", "\\\"");
			str = string_replace_all(str, "\n", "\\n");
			str = string_replace_all(str, "\r", "\\r");
			str = string_replace_all(str, "\t", "\\t");
			str = string_replace_all(str, "\f", "\\f");
			str = string_replace_all(str, "\b", "\\b");
			str = string_replace_all(str, "\v", "\\v");
			str = string_replace_all(str, "\a", "\\a");
			dv = "\"" + str + "\"";
		break;
		case "array":
			result = "";
			size = array_length(val);
			for (var i = 0; i < size; i++) {
				result += __gma_debug_value__(val[i], true);
				if (i < size-1) {
					result += ", ";
				}
			}
			dv = "[" + result + "]";
		break;
		case "struct":
			var strc = val;
			var structType = instanceof(strc);
			result = "";
			var properties = variable_struct_get_names(strc);
			size = array_length(properties);
			var gotFirst = false;
			for (var i = 0; i < size; i++) {
				var propertyValue = variable_struct_get(strc, properties[i]);
				if (is_method(propertyValue)) continue;
				if (gotFirst) {
					result += ", ";
				} else {
					gotFirst = true;
				}
				result += properties[i] + ": " + __gma_debug_value__(propertyValue, true);
			}
			if (structType == "struct") {
				dv = "{" + result + "}";
			} else {
				dv = structType + "({" + result + "})";
			}
		break;
		case "bool":
			if (val) {
				dv = "bool(true)";
			} else {
				dv = "bool(false)";
			}
		break;
		case "int32":
		case "int64":
			dv = type + "(" + string(val) + ")";
		break;
		case "ptr":
			var hexchars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
			var hex = "";
			var ptrval = int64(val);
			do {
				hex = hexchars[ptrval & $F] + hex;
				ptrval = ptrval >> 4;
			} until (ptrval == 0);
			dv = "ptr($" + hex + ")";
		break;
		case "undefined":
			dv = "undefined";
		break;
		case "method":
			dv = "function(){...}";
		break;
		case "null":
			dv = "null";
		break;
		case "unknown":
			dv = "???";
		break;
		case "vec3":
			dv = "vec3(" + string(val) + ")";
		break;
		case "vec4":
			dv = "vec4(" + string(val) + ")";
		break;
		case "ref":
			dv = string(val);
		break;
		default:
			dv = typeof(val) + "(" + string(val) + ")";
		break;
	}
	if (noprefix) {
		return dv;
	}
	return "(" + type + ")\r\n" + dv;
}

///@func __gma_debug_list_value__(val)
///@param {Id.DsList} val The DS List value to derive a debug-friendly value from
///@return {String}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return a debug description string for the given DS List value.
function __gma_debug_list_value__(val) {
	//Return list(<INVALID>) if it does not exist
	if (!(is_real(val) || is_int32(val) || is_int64(val)) || !ds_exists(val, ds_type_list)) {
		return "list(<INVALID>)";
	}
	//Return list(entry1, entry2, ..., entry n) if it exists
	var content = "",
	siz = ds_list_size(val);
	for (var i = 0; i < siz; i++) {
		content += __gma_debug_value__(val[| i], true);
		if (i < siz-1) {
			content += ", ";
		}
	}
	return "list(" + content + ")";
}

///@func __gma_debug_grid_value__(val)
///@param {Id.DsGrid} val The DS Grid value to derive a debug-friendly value from
///@return {String}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return a debug description string for the given DS Grid value.
function __gma_debug_grid_value__(val) {
	//Return grid(<INVALID>) if it does not exist
	if (!(is_real(val) || is_int32(val) || is_int64(val)) || !ds_exists(val, ds_type_grid)) {
		return "grid(<INVALID>)";
	}
	//Return grid(a, b, c; d, e, f; ...)
	var content = "";
	var width = ds_grid_width(val);
	var height = ds_grid_height(val);
	for (var yy = 0; yy < height; ++yy) {
		if (yy > 0) content += "; ";
		for (var xx = 0; xx < width; ++xx) {
			if (xx > 0) content += ", ";
			content += __gma_debug_value__(val[# xx, yy], true);
		}
	}
	return "grid(" + content + ")";
}

///@func __gma_debug_map_value__(val)
///@param {Id.DsMap} val The DS Map value to derive a debug-friendly value from
///@return {String}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return a debug description string for the given DS Map value.
function __gma_debug_map_value__(val) {
	//Return map(<INVALID>) if it does not exist
	if (!(is_real(val) || is_int32(val) || is_int64(val)) || !ds_exists(val, ds_type_map)) {
		return "map(<INVALID>)";
	}
	//Return map(key0: value0, key1: value1, ..., keyN: valueN) if it exists
	var content = "";
	var firstEntry = true;
	for (var k = ds_map_find_first(val); !is_undefined(k); k = ds_map_find_next(val, k)) {
		if (firstEntry) {
			firstEntry = false;
		} else {
			content += ", ";
		}
		content += __gma_debug_value__(k, true) + ": " + __gma_debug_value__(val[? k], true);
	}
	return "map(" + content + ")";
}

///@func __gma_debug_struct_value__(val)
///@param {Struct} val The struct value to derive a debug-friendly value from
///@return {String}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return a debug description string for the given struct value.
function __gma_debug_struct_value__(val) {
	//Fall back to __gma_debug_value__ if not a struct
	if (!is_struct(val)) return __gma_debug_value__(val, true);
	//Determine correct opening and closing
	var strc = val;
	var structType = instanceof(strc);
	//Grab properties
	var properties = variable_struct_get_names(strc);
	size = array_length(properties);
	var result = "";
	for (var i = 0; i < size; i++) {
		if (i > 0) {
			result += ", ";
		}
		result += properties[i] + ": " + __gma_debug_value__(variable_struct_get(strc, properties[i]), true);
	}
	//Return combined result
	if (structType == "struct") {
		return "{" + result + "}";
	}
	return structType + "({" + result + "})";
}

///@func __gma_equal__(got, expected)
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value equals the expected value.
function __gma_equal__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_equal__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_equal__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			default:
				return got == expected;
			break;
		}
	}
	else {
		return false;
	}
}

///@func __gma_equalish__(got, expected)
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value approximately equals the expected value.
function __gma_equalish__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_equalish__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_equalish__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			case "number":
				return got == expected || abs(got-expected) <= GMASSERT_TOLERANCE;
			break;
			default:
				return got == expected;
			break;
		}
	}
	else {
		return false;
	}
}

///@func __gma_greater_than__(got, expected)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value is greater than the expected value.
function __gma_greater_than__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "number":
				return got > expected;
			break;
			case "string":
				if (got == expected) return false;
				var len0 = string_length(got),
				len1 = string_length(expected),
				len = min(len0, len1);
				var c0, c1;
				for (var i = 1; i <= len; i++) {
					c0 = ord(string_char_at(got, i));
					c1 = ord(string_char_at(expected, i));
					if (c0 != c1) {
						return c0 > c1;
					}
				}
				return len0 > len1;
			break;
			case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_greater_than__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_greater_than__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			default:
				return false;
			break;
		}
	}
	else {
		return false;
	}
}

///@func __gma_less_than__(got, expected)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value is less than the expected value.
function __gma_less_than__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "number":
				return got < expected;
			break;
			case "string":
				if (got == expected) return false;
				var len0 = string_length(got),
				len1 = string_length(expected),
				len = min(len0, len1);
				var c0, c1;
				for (var i = 1; i <= len; i++) {
					c0 = ord(string_char_at(got, i));
					c1 = ord(string_char_at(expected, i));
					if (c0 != c1) {
						return c0 < c1;
					}
				}
				return len0 < len1;
				break;
				case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_less_than__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_less_than__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			default:
				return false;
			break;
		}
	}
	else {
		return false;
	}
}

///@func __gma_greater_than_or_equal__(got, expected)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value is greater than or equal to the expected value.
function __gma_greater_than_or_equal__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "number":
				return got >= expected;
			break;
			case "string":
				if (got == expected) return true;
				var len0 = string_length(got),
				len1 = string_length(expected),
				len = min(len0, len1);
				var c0, c1;
				for (var i = 1; i <= len; i++) {
					c0 = ord(string_char_at(got, i));
					c1 = ord(string_char_at(expected, i));
					if (c0 != c1) {
						return c0 > c1;
					}
				}
				return len0 > len1;
			break;
			case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_greater_than_or_equal__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_greater_than_or_equal__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			default:
				return false;
			break;
		}
	}
	else {
		return false;
	}
}

///@func __gma_less_than_or_equal__(got, expected)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) Return whether the received value is less than or equal to the expected value.
function __gma_less_than_or_equal__(got, expected) {
	var size;
	var type = typeof(got);
	if (type == typeof(expected)) {
		switch (type) {
			case "number":
				return got <= expected;
			break;
			case "string":
				if (got == expected) return true;
				var len0 = string_length(got),
				len1 = string_length(expected),
				len = min(len0, len1);
				var c0, c1;
				for (var i = 1; i <= len; i++) {
					c0 = ord(string_char_at(got, i));
					c1 = ord(string_char_at(expected, i));
					if (c0 != c1) {
						return c0 < c1;
					}
				}
				return len0 < len1;
			break;
			case "array":
				size = array_length(got);
				if (size != array_length(expected)) return false;
				for (var i = 0; i < size; i++) {
					if (!__gma_less_than_or_equal__(got[@ i], expected[@ i])) return false;
				}
				return true;
			break;
			case "struct":
				size = variable_struct_names_count(got);
				if (size != variable_struct_names_count(expected)) return false;
				var kn = variable_struct_get_names(got);
				for (var i = 0; i < size; ++i) {
					var k = kn[i];
					if (!variable_struct_exists(expected, k) || !__gma_less_than_or_equal__(variable_struct_get(got, k), variable_struct_get(expected, k))) return false;
				}
				return true;
			break;
			default:
				return false;
			break;
		}
	}
	else {
		return false;
	}
}

///@func assert_operation(got, expected, op, invert, msg, debug_got, debug_expected)
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {Function} op A script taking the gotten value and the expected as arguments and returning true/false
///@param {Bool} invert Whether to invert the result returned by op
///@param {String} msg (optional) A custom message to display when the assertion fails
///@param {Function,Undefined} debug_got (optional) A custom function returning the shown value of the gotten value
///@param {Function,Undefined,String} debug_expected (optional) A fixed description string or a custom function returning the shown value of the expected value
///@desc (INTERNAL: GMAssert 2) Basis for defining custom assertions. See the Wiki for details.
function assert_operation(got, expected, op, invert, msg="Assertion Failed!", debug_got=__gma_debug_value__, debug_expected=__gma_debug_value__) {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!(invert ^^ script_execute(op, got, expected))) {
		var debug_value_expected, debug_value_got;
		if (is_undefined(debug_expected)) {
			debug_value_expected = __gma_debug_value__(expected);
		} else if (is_string(debug_expected)) {
			debug_value_expected = debug_expected;
		} else {
			debug_value_expected = script_execute(debug_expected, expected)
		}
		if (is_undefined(debug_got)) {
			debug_value_got = __gma_debug_value__(got);
		} else {
			debug_value_got = script_execute(debug_got, got);
		}
		__gma_assert_error_raw__(msg, debug_value_expected, debug_value_got);
	}
}

