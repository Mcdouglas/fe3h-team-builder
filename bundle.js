(function(scope){
'use strict';

function F(arity, fun, wrapper) {
  wrapper.a = arity;
  wrapper.f = fun;
  return wrapper;
}

function F2(fun) {
  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })
}
function F3(fun) {
  return F(3, fun, function(a) {
    return function(b) { return function(c) { return fun(a, b, c); }; };
  });
}
function F4(fun) {
  return F(4, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return fun(a, b, c, d); }; }; };
  });
}
function F5(fun) {
  return F(5, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };
  });
}
function F6(fun) {
  return F(6, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return fun(a, b, c, d, e, f); }; }; }; }; };
  });
}
function F7(fun) {
  return F(7, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };
  });
}
function F8(fun) {
  return F(8, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) {
    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };
  });
}
function F9(fun) {
  return F(9, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) { return function(i) {
    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };
  });
}

function A2(fun, a, b) {
  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);
}
function A3(fun, a, b, c) {
  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);
}
function A4(fun, a, b, c, d) {
  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);
}
function A5(fun, a, b, c, d, e) {
  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);
}
function A6(fun, a, b, c, d, e, f) {
  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);
}
function A7(fun, a, b, c, d, e, f, g) {
  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);
}
function A8(fun, a, b, c, d, e, f, g, h) {
  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);
}
function A9(fun, a, b, c, d, e, f, g, h, i) {
  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);
}

console.warn('Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.0/optimize for better performance and smaller assets.');


var _JsArray_empty = [];

function _JsArray_singleton(value)
{
    return [value];
}

function _JsArray_length(array)
{
    return array.length;
}

var _JsArray_initialize = F3(function(size, offset, func)
{
    var result = new Array(size);

    for (var i = 0; i < size; i++)
    {
        result[i] = func(offset + i);
    }

    return result;
});

var _JsArray_initializeFromList = F2(function (max, ls)
{
    var result = new Array(max);

    for (var i = 0; i < max && ls.b; i++)
    {
        result[i] = ls.a;
        ls = ls.b;
    }

    result.length = i;
    return _Utils_Tuple2(result, ls);
});

var _JsArray_unsafeGet = F2(function(index, array)
{
    return array[index];
});

var _JsArray_unsafeSet = F3(function(index, value, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[index] = value;
    return result;
});

var _JsArray_push = F2(function(value, array)
{
    var length = array.length;
    var result = new Array(length + 1);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[length] = value;
    return result;
});

var _JsArray_foldl = F3(function(func, acc, array)
{
    var length = array.length;

    for (var i = 0; i < length; i++)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_foldr = F3(function(func, acc, array)
{
    for (var i = array.length - 1; i >= 0; i--)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_map = F2(function(func, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = func(array[i]);
    }

    return result;
});

var _JsArray_indexedMap = F3(function(func, offset, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = A2(func, offset + i, array[i]);
    }

    return result;
});

var _JsArray_slice = F3(function(from, to, array)
{
    return array.slice(from, to);
});

var _JsArray_appendN = F3(function(n, dest, source)
{
    var destLen = dest.length;
    var itemsToCopy = n - destLen;

    if (itemsToCopy > source.length)
    {
        itemsToCopy = source.length;
    }

    var size = destLen + itemsToCopy;
    var result = new Array(size);

    for (var i = 0; i < destLen; i++)
    {
        result[i] = dest[i];
    }

    for (var i = 0; i < itemsToCopy; i++)
    {
        result[i + destLen] = source[i];
    }

    return result;
});



// LOG

var _Debug_log_UNUSED = F2(function(tag, value)
{
	return value;
});

var _Debug_log = F2(function(tag, value)
{
	console.log(tag + ': ' + _Debug_toString(value));
	return value;
});


// TODOS

function _Debug_todo(moduleName, region)
{
	return function(message) {
		_Debug_crash(8, moduleName, region, message);
	};
}

function _Debug_todoCase(moduleName, region, value)
{
	return function(message) {
		_Debug_crash(9, moduleName, region, value, message);
	};
}


// TO STRING

function _Debug_toString_UNUSED(value)
{
	return '<internals>';
}

function _Debug_toString(value)
{
	return _Debug_toAnsiString(false, value);
}

function _Debug_toAnsiString(ansi, value)
{
	if (typeof value === 'function')
	{
		return _Debug_internalColor(ansi, '<function>');
	}

	if (typeof value === 'boolean')
	{
		return _Debug_ctorColor(ansi, value ? 'True' : 'False');
	}

	if (typeof value === 'number')
	{
		return _Debug_numberColor(ansi, value + '');
	}

	if (value instanceof String)
	{
		return _Debug_charColor(ansi, "'" + _Debug_addSlashes(value, true) + "'");
	}

	if (typeof value === 'string')
	{
		return _Debug_stringColor(ansi, '"' + _Debug_addSlashes(value, false) + '"');
	}

	if (typeof value === 'object' && '$' in value)
	{
		var tag = value.$;

		if (typeof tag === 'number')
		{
			return _Debug_internalColor(ansi, '<internals>');
		}

		if (tag[0] === '#')
		{
			var output = [];
			for (var k in value)
			{
				if (k === '$') continue;
				output.push(_Debug_toAnsiString(ansi, value[k]));
			}
			return '(' + output.join(',') + ')';
		}

		if (tag === 'Set_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Set')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Set$toList(value));
		}

		if (tag === 'RBNode_elm_builtin' || tag === 'RBEmpty_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Dict')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Dict$toList(value));
		}

		if (tag === 'Array_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Array')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Array$toList(value));
		}

		if (tag === '::' || tag === '[]')
		{
			var output = '[';

			value.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)

			for (; value.b; value = value.b) // WHILE_CONS
			{
				output += ',' + _Debug_toAnsiString(ansi, value.a);
			}
			return output + ']';
		}

		var output = '';
		for (var i in value)
		{
			if (i === '$') continue;
			var str = _Debug_toAnsiString(ansi, value[i]);
			var c0 = str[0];
			var parenless = c0 === '{' || c0 === '(' || c0 === '[' || c0 === '<' || c0 === '"' || str.indexOf(' ') < 0;
			output += ' ' + (parenless ? str : '(' + str + ')');
		}
		return _Debug_ctorColor(ansi, tag) + output;
	}

	if (typeof DataView === 'function' && value instanceof DataView)
	{
		return _Debug_stringColor(ansi, '<' + value.byteLength + ' bytes>');
	}

	if (typeof File === 'function' && value instanceof File)
	{
		return _Debug_internalColor(ansi, '<' + value.name + '>');
	}

	if (typeof value === 'object')
	{
		var output = [];
		for (var key in value)
		{
			var field = key[0] === '_' ? key.slice(1) : key;
			output.push(_Debug_fadeColor(ansi, field) + ' = ' + _Debug_toAnsiString(ansi, value[key]));
		}
		if (output.length === 0)
		{
			return '{}';
		}
		return '{ ' + output.join(', ') + ' }';
	}

	return _Debug_internalColor(ansi, '<internals>');
}

function _Debug_addSlashes(str, isChar)
{
	var s = str
		.replace(/\\/g, '\\\\')
		.replace(/\n/g, '\\n')
		.replace(/\t/g, '\\t')
		.replace(/\r/g, '\\r')
		.replace(/\v/g, '\\v')
		.replace(/\0/g, '\\0');

	if (isChar)
	{
		return s.replace(/\'/g, '\\\'');
	}
	else
	{
		return s.replace(/\"/g, '\\"');
	}
}

function _Debug_ctorColor(ansi, string)
{
	return ansi ? '\x1b[96m' + string + '\x1b[0m' : string;
}

function _Debug_numberColor(ansi, string)
{
	return ansi ? '\x1b[95m' + string + '\x1b[0m' : string;
}

function _Debug_stringColor(ansi, string)
{
	return ansi ? '\x1b[93m' + string + '\x1b[0m' : string;
}

function _Debug_charColor(ansi, string)
{
	return ansi ? '\x1b[92m' + string + '\x1b[0m' : string;
}

function _Debug_fadeColor(ansi, string)
{
	return ansi ? '\x1b[37m' + string + '\x1b[0m' : string;
}

function _Debug_internalColor(ansi, string)
{
	return ansi ? '\x1b[94m' + string + '\x1b[0m' : string;
}

function _Debug_toHexDigit(n)
{
	return String.fromCharCode(n < 10 ? 48 + n : 55 + n);
}


// CRASH


function _Debug_crash_UNUSED(identifier)
{
	throw new Error('https://github.com/elm/core/blob/1.0.0/hints/' + identifier + '.md');
}


function _Debug_crash(identifier, fact1, fact2, fact3, fact4)
{
	switch(identifier)
	{
		case 0:
			throw new Error('What node should I take over? In JavaScript I need something like:\n\n    Elm.Main.init({\n        node: document.getElementById("elm-node")\n    })\n\nYou need to do this with any Browser.sandbox or Browser.element program.');

		case 1:
			throw new Error('Browser.application programs cannot handle URLs like this:\n\n    ' + document.location.href + '\n\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.');

		case 2:
			var jsonErrorString = fact1;
			throw new Error('Problem with the flags given to your Elm program on initialization.\n\n' + jsonErrorString);

		case 3:
			var portName = fact1;
			throw new Error('There can only be one port named `' + portName + '`, but your program has multiple.');

		case 4:
			var portName = fact1;
			var problem = fact2;
			throw new Error('Trying to send an unexpected type of value through port `' + portName + '`:\n' + problem);

		case 5:
			throw new Error('Trying to use `(==)` on functions.\nThere is no way to know if functions are "the same" in the Elm sense.\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.');

		case 6:
			var moduleName = fact1;
			throw new Error('Your page is loading multiple Elm scripts with a module named ' + moduleName + '. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!');

		case 8:
			var moduleName = fact1;
			var region = fact2;
			var message = fact3;
			throw new Error('TODO in module `' + moduleName + '` ' + _Debug_regionToString(region) + '\n\n' + message);

		case 9:
			var moduleName = fact1;
			var region = fact2;
			var value = fact3;
			var message = fact4;
			throw new Error(
				'TODO in module `' + moduleName + '` from the `case` expression '
				+ _Debug_regionToString(region) + '\n\nIt received the following value:\n\n    '
				+ _Debug_toString(value).replace('\n', '\n    ')
				+ '\n\nBut the branch that handles it says:\n\n    ' + message.replace('\n', '\n    ')
			);

		case 10:
			throw new Error('Bug in https://github.com/elm/virtual-dom/issues');

		case 11:
			throw new Error('Cannot perform mod 0. Division by zero error.');
	}
}

function _Debug_regionToString(region)
{
	if (region.start.line === region.end.line)
	{
		return 'on line ' + region.start.line;
	}
	return 'on lines ' + region.start.line + ' through ' + region.end.line;
}



// EQUALITY

function _Utils_eq(x, y)
{
	for (
		var pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);
		isEqual && (pair = stack.pop());
		isEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)
		)
	{}

	return isEqual;
}

function _Utils_eqHelp(x, y, depth, stack)
{
	if (depth > 100)
	{
		stack.push(_Utils_Tuple2(x,y));
		return true;
	}

	if (x === y)
	{
		return true;
	}

	if (typeof x !== 'object' || x === null || y === null)
	{
		typeof x === 'function' && _Debug_crash(5);
		return false;
	}

	/**/
	if (x.$ === 'Set_elm_builtin')
	{
		x = elm$core$Set$toList(x);
		y = elm$core$Set$toList(y);
	}
	if (x.$ === 'RBNode_elm_builtin' || x.$ === 'RBEmpty_elm_builtin')
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	/**_UNUSED/
	if (x.$ < 0)
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	for (var key in x)
	{
		if (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))
		{
			return false;
		}
	}
	return true;
}

var _Utils_equal = F2(_Utils_eq);
var _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });



// COMPARISONS

// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on
// the particular integer values assigned to LT, EQ, and GT.

function _Utils_cmp(x, y, ord)
{
	if (typeof x !== 'object')
	{
		return x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;
	}

	/**/
	if (x instanceof String)
	{
		var a = x.valueOf();
		var b = y.valueOf();
		return a === b ? 0 : a < b ? -1 : 1;
	}
	//*/

	/**_UNUSED/
	if (typeof x.$ === 'undefined')
	//*/
	/**/
	if (x.$[0] === '#')
	//*/
	{
		return (ord = _Utils_cmp(x.a, y.a))
			? ord
			: (ord = _Utils_cmp(x.b, y.b))
				? ord
				: _Utils_cmp(x.c, y.c);
	}

	// traverse conses until end of a list or a mismatch
	for (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES
	return ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);
}

var _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });
var _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });
var _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });
var _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });

var _Utils_compare = F2(function(x, y)
{
	var n = _Utils_cmp(x, y);
	return n < 0 ? elm$core$Basics$LT : n ? elm$core$Basics$GT : elm$core$Basics$EQ;
});


// COMMON VALUES

var _Utils_Tuple0_UNUSED = 0;
var _Utils_Tuple0 = { $: '#0' };

function _Utils_Tuple2_UNUSED(a, b) { return { a: a, b: b }; }
function _Utils_Tuple2(a, b) { return { $: '#2', a: a, b: b }; }

function _Utils_Tuple3_UNUSED(a, b, c) { return { a: a, b: b, c: c }; }
function _Utils_Tuple3(a, b, c) { return { $: '#3', a: a, b: b, c: c }; }

function _Utils_chr_UNUSED(c) { return c; }
function _Utils_chr(c) { return new String(c); }


// RECORDS

function _Utils_update(oldRecord, updatedFields)
{
	var newRecord = {};

	for (var key in oldRecord)
	{
		newRecord[key] = oldRecord[key];
	}

	for (var key in updatedFields)
	{
		newRecord[key] = updatedFields[key];
	}

	return newRecord;
}


// APPEND

var _Utils_append = F2(_Utils_ap);

function _Utils_ap(xs, ys)
{
	// append Strings
	if (typeof xs === 'string')
	{
		return xs + ys;
	}

	// append Lists
	if (!xs.b)
	{
		return ys;
	}
	var root = _List_Cons(xs.a, ys);
	xs = xs.b
	for (var curr = root; xs.b; xs = xs.b) // WHILE_CONS
	{
		curr = curr.b = _List_Cons(xs.a, ys);
	}
	return root;
}



var _List_Nil_UNUSED = { $: 0 };
var _List_Nil = { $: '[]' };

function _List_Cons_UNUSED(hd, tl) { return { $: 1, a: hd, b: tl }; }
function _List_Cons(hd, tl) { return { $: '::', a: hd, b: tl }; }


var _List_cons = F2(_List_Cons);

function _List_fromArray(arr)
{
	var out = _List_Nil;
	for (var i = arr.length; i--; )
	{
		out = _List_Cons(arr[i], out);
	}
	return out;
}

function _List_toArray(xs)
{
	for (var out = []; xs.b; xs = xs.b) // WHILE_CONS
	{
		out.push(xs.a);
	}
	return out;
}

var _List_map2 = F3(function(f, xs, ys)
{
	for (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES
	{
		arr.push(A2(f, xs.a, ys.a));
	}
	return _List_fromArray(arr);
});

var _List_map3 = F4(function(f, xs, ys, zs)
{
	for (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A3(f, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map4 = F5(function(f, ws, xs, ys, zs)
{
	for (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A4(f, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map5 = F6(function(f, vs, ws, xs, ys, zs)
{
	for (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_sortBy = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		return _Utils_cmp(f(a), f(b));
	}));
});

var _List_sortWith = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		var ord = A2(f, a, b);
		return ord === elm$core$Basics$EQ ? 0 : ord === elm$core$Basics$LT ? -1 : 1;
	}));
});



var _String_cons = F2(function(chr, str)
{
	return chr + str;
});

function _String_uncons(string)
{
	var word = string.charCodeAt(0);
	return word
		? elm$core$Maybe$Just(
			0xD800 <= word && word <= 0xDBFF
				? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))
				: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))
		)
		: elm$core$Maybe$Nothing;
}

var _String_append = F2(function(a, b)
{
	return a + b;
});

function _String_length(str)
{
	return str.length;
}

var _String_map = F2(function(func, string)
{
	var len = string.length;
	var array = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = string.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			array[i] = func(_Utils_chr(string[i] + string[i+1]));
			i += 2;
			continue;
		}
		array[i] = func(_Utils_chr(string[i]));
		i++;
	}
	return array.join('');
});

var _String_filter = F2(function(isGood, str)
{
	var arr = [];
	var len = str.length;
	var i = 0;
	while (i < len)
	{
		var char = str[i];
		var word = str.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += str[i];
			i++;
		}

		if (isGood(_Utils_chr(char)))
		{
			arr.push(char);
		}
	}
	return arr.join('');
});

function _String_reverse(str)
{
	var len = str.length;
	var arr = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = str.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			arr[len - i] = str[i + 1];
			i++;
			arr[len - i] = str[i - 1];
			i++;
		}
		else
		{
			arr[len - i] = str[i];
			i++;
		}
	}
	return arr.join('');
}

var _String_foldl = F3(function(func, state, string)
{
	var len = string.length;
	var i = 0;
	while (i < len)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += string[i];
			i++;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_foldr = F3(function(func, state, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_split = F2(function(sep, str)
{
	return str.split(sep);
});

var _String_join = F2(function(sep, strs)
{
	return strs.join(sep);
});

var _String_slice = F3(function(start, end, str) {
	return str.slice(start, end);
});

function _String_trim(str)
{
	return str.trim();
}

function _String_trimLeft(str)
{
	return str.replace(/^\s+/, '');
}

function _String_trimRight(str)
{
	return str.replace(/\s+$/, '');
}

function _String_words(str)
{
	return _List_fromArray(str.trim().split(/\s+/g));
}

function _String_lines(str)
{
	return _List_fromArray(str.split(/\r\n|\r|\n/g));
}

function _String_toUpper(str)
{
	return str.toUpperCase();
}

function _String_toLower(str)
{
	return str.toLowerCase();
}

var _String_any = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (isGood(_Utils_chr(char)))
		{
			return true;
		}
	}
	return false;
});

var _String_all = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (!isGood(_Utils_chr(char)))
		{
			return false;
		}
	}
	return true;
});

var _String_contains = F2(function(sub, str)
{
	return str.indexOf(sub) > -1;
});

var _String_startsWith = F2(function(sub, str)
{
	return str.indexOf(sub) === 0;
});

var _String_endsWith = F2(function(sub, str)
{
	return str.length >= sub.length &&
		str.lastIndexOf(sub) === str.length - sub.length;
});

var _String_indexes = F2(function(sub, str)
{
	var subLen = sub.length;

	if (subLen < 1)
	{
		return _List_Nil;
	}

	var i = 0;
	var is = [];

	while ((i = str.indexOf(sub, i)) > -1)
	{
		is.push(i);
		i = i + subLen;
	}

	return _List_fromArray(is);
});


// TO STRING

function _String_fromNumber(number)
{
	return number + '';
}


// INT CONVERSIONS

function _String_toInt(str)
{
	var total = 0;
	var code0 = str.charCodeAt(0);
	var start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;

	for (var i = start; i < str.length; ++i)
	{
		var code = str.charCodeAt(i);
		if (code < 0x30 || 0x39 < code)
		{
			return elm$core$Maybe$Nothing;
		}
		total = 10 * total + code - 0x30;
	}

	return i == start
		? elm$core$Maybe$Nothing
		: elm$core$Maybe$Just(code0 == 0x2D ? -total : total);
}


// FLOAT CONVERSIONS

function _String_toFloat(s)
{
	// check if it is a hex, octal, or binary number
	if (s.length === 0 || /[\sxbo]/.test(s))
	{
		return elm$core$Maybe$Nothing;
	}
	var n = +s;
	// faster isNaN check
	return n === n ? elm$core$Maybe$Just(n) : elm$core$Maybe$Nothing;
}

function _String_fromList(chars)
{
	return _List_toArray(chars).join('');
}




// MATH

var _Basics_add = F2(function(a, b) { return a + b; });
var _Basics_sub = F2(function(a, b) { return a - b; });
var _Basics_mul = F2(function(a, b) { return a * b; });
var _Basics_fdiv = F2(function(a, b) { return a / b; });
var _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });
var _Basics_pow = F2(Math.pow);

var _Basics_remainderBy = F2(function(b, a) { return a % b; });

// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf
var _Basics_modBy = F2(function(modulus, x)
{
	var answer = x % modulus;
	return modulus === 0
		? _Debug_crash(11)
		:
	((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))
		? answer + modulus
		: answer;
});


// TRIGONOMETRY

var _Basics_pi = Math.PI;
var _Basics_e = Math.E;
var _Basics_cos = Math.cos;
var _Basics_sin = Math.sin;
var _Basics_tan = Math.tan;
var _Basics_acos = Math.acos;
var _Basics_asin = Math.asin;
var _Basics_atan = Math.atan;
var _Basics_atan2 = F2(Math.atan2);


// MORE MATH

function _Basics_toFloat(x) { return x; }
function _Basics_truncate(n) { return n | 0; }
function _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }

var _Basics_ceiling = Math.ceil;
var _Basics_floor = Math.floor;
var _Basics_round = Math.round;
var _Basics_sqrt = Math.sqrt;
var _Basics_log = Math.log;
var _Basics_isNaN = isNaN;


// BOOLEANS

function _Basics_not(bool) { return !bool; }
var _Basics_and = F2(function(a, b) { return a && b; });
var _Basics_or  = F2(function(a, b) { return a || b; });
var _Basics_xor = F2(function(a, b) { return a !== b; });



function _Char_toCode(char)
{
	var code = char.charCodeAt(0);
	if (0xD800 <= code && code <= 0xDBFF)
	{
		return (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000
	}
	return code;
}

function _Char_fromCode(code)
{
	return _Utils_chr(
		(code < 0 || 0x10FFFF < code)
			? '\uFFFD'
			:
		(code <= 0xFFFF)
			? String.fromCharCode(code)
			:
		(code -= 0x10000,
			String.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)
		)
	);
}

function _Char_toUpper(char)
{
	return _Utils_chr(char.toUpperCase());
}

function _Char_toLower(char)
{
	return _Utils_chr(char.toLowerCase());
}

function _Char_toLocaleUpper(char)
{
	return _Utils_chr(char.toLocaleUpperCase());
}

function _Char_toLocaleLower(char)
{
	return _Utils_chr(char.toLocaleLowerCase());
}



/**/
function _Json_errorToString(error)
{
	return elm$json$Json$Decode$errorToString(error);
}
//*/


// CORE DECODERS

function _Json_succeed(msg)
{
	return {
		$: 0,
		a: msg
	};
}

function _Json_fail(msg)
{
	return {
		$: 1,
		a: msg
	};
}

function _Json_decodePrim(decoder)
{
	return { $: 2, b: decoder };
}

var _Json_decodeInt = _Json_decodePrim(function(value) {
	return (typeof value !== 'number')
		? _Json_expecting('an INT', value)
		:
	(-2147483647 < value && value < 2147483647 && (value | 0) === value)
		? elm$core$Result$Ok(value)
		:
	(isFinite(value) && !(value % 1))
		? elm$core$Result$Ok(value)
		: _Json_expecting('an INT', value);
});

var _Json_decodeBool = _Json_decodePrim(function(value) {
	return (typeof value === 'boolean')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a BOOL', value);
});

var _Json_decodeFloat = _Json_decodePrim(function(value) {
	return (typeof value === 'number')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a FLOAT', value);
});

var _Json_decodeValue = _Json_decodePrim(function(value) {
	return elm$core$Result$Ok(_Json_wrap(value));
});

var _Json_decodeString = _Json_decodePrim(function(value) {
	return (typeof value === 'string')
		? elm$core$Result$Ok(value)
		: (value instanceof String)
			? elm$core$Result$Ok(value + '')
			: _Json_expecting('a STRING', value);
});

function _Json_decodeList(decoder) { return { $: 3, b: decoder }; }
function _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }

function _Json_decodeNull(value) { return { $: 5, c: value }; }

var _Json_decodeField = F2(function(field, decoder)
{
	return {
		$: 6,
		d: field,
		b: decoder
	};
});

var _Json_decodeIndex = F2(function(index, decoder)
{
	return {
		$: 7,
		e: index,
		b: decoder
	};
});

function _Json_decodeKeyValuePairs(decoder)
{
	return {
		$: 8,
		b: decoder
	};
}

function _Json_mapMany(f, decoders)
{
	return {
		$: 9,
		f: f,
		g: decoders
	};
}

var _Json_andThen = F2(function(callback, decoder)
{
	return {
		$: 10,
		b: decoder,
		h: callback
	};
});

function _Json_oneOf(decoders)
{
	return {
		$: 11,
		g: decoders
	};
}


// DECODING OBJECTS

var _Json_map1 = F2(function(f, d1)
{
	return _Json_mapMany(f, [d1]);
});

var _Json_map2 = F3(function(f, d1, d2)
{
	return _Json_mapMany(f, [d1, d2]);
});

var _Json_map3 = F4(function(f, d1, d2, d3)
{
	return _Json_mapMany(f, [d1, d2, d3]);
});

var _Json_map4 = F5(function(f, d1, d2, d3, d4)
{
	return _Json_mapMany(f, [d1, d2, d3, d4]);
});

var _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5]);
});

var _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);
});

var _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);
});

var _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);
});


// DECODE

var _Json_runOnString = F2(function(decoder, string)
{
	try
	{
		var value = JSON.parse(string);
		return _Json_runHelp(decoder, value);
	}
	catch (e)
	{
		return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'This is not valid JSON! ' + e.message, _Json_wrap(string)));
	}
});

var _Json_run = F2(function(decoder, value)
{
	return _Json_runHelp(decoder, _Json_unwrap(value));
});

function _Json_runHelp(decoder, value)
{
	switch (decoder.$)
	{
		case 2:
			return decoder.b(value);

		case 5:
			return (value === null)
				? elm$core$Result$Ok(decoder.c)
				: _Json_expecting('null', value);

		case 3:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('a LIST', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _List_fromArray);

		case 4:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);

		case 6:
			var field = decoder.d;
			if (typeof value !== 'object' || value === null || !(field in value))
			{
				return _Json_expecting('an OBJECT with a field named `' + field + '`', value);
			}
			var result = _Json_runHelp(decoder.b, value[field]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Field, field, result.a));

		case 7:
			var index = decoder.e;
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			if (index >= value.length)
			{
				return _Json_expecting('a LONGER array. Need index ' + index + ' but only see ' + value.length + ' entries', value);
			}
			var result = _Json_runHelp(decoder.b, value[index]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Index, index, result.a));

		case 8:
			if (typeof value !== 'object' || value === null || _Json_isArray(value))
			{
				return _Json_expecting('an OBJECT', value);
			}

			var keyValuePairs = _List_Nil;
			// TODO test perf of Object.keys and switch when support is good enough
			for (var key in value)
			{
				if (value.hasOwnProperty(key))
				{
					var result = _Json_runHelp(decoder.b, value[key]);
					if (!elm$core$Result$isOk(result))
					{
						return elm$core$Result$Err(A2(elm$json$Json$Decode$Field, key, result.a));
					}
					keyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);
				}
			}
			return elm$core$Result$Ok(elm$core$List$reverse(keyValuePairs));

		case 9:
			var answer = decoder.f;
			var decoders = decoder.g;
			for (var i = 0; i < decoders.length; i++)
			{
				var result = _Json_runHelp(decoders[i], value);
				if (!elm$core$Result$isOk(result))
				{
					return result;
				}
				answer = answer(result.a);
			}
			return elm$core$Result$Ok(answer);

		case 10:
			var result = _Json_runHelp(decoder.b, value);
			return (!elm$core$Result$isOk(result))
				? result
				: _Json_runHelp(decoder.h(result.a), value);

		case 11:
			var errors = _List_Nil;
			for (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS
			{
				var result = _Json_runHelp(temp.a, value);
				if (elm$core$Result$isOk(result))
				{
					return result;
				}
				errors = _List_Cons(result.a, errors);
			}
			return elm$core$Result$Err(elm$json$Json$Decode$OneOf(elm$core$List$reverse(errors)));

		case 1:
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));

		case 0:
			return elm$core$Result$Ok(decoder.a);
	}
}

function _Json_runArrayDecoder(decoder, value, toElmValue)
{
	var len = value.length;
	var array = new Array(len);
	for (var i = 0; i < len; i++)
	{
		var result = _Json_runHelp(decoder, value[i]);
		if (!elm$core$Result$isOk(result))
		{
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Index, i, result.a));
		}
		array[i] = result.a;
	}
	return elm$core$Result$Ok(toElmValue(array));
}

function _Json_isArray(value)
{
	return Array.isArray(value) || (typeof FileList !== 'undefined' && value instanceof FileList);
}

function _Json_toElmArray(array)
{
	return A2(elm$core$Array$initialize, array.length, function(i) { return array[i]; });
}

function _Json_expecting(type, value)
{
	return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'Expecting ' + type, _Json_wrap(value)));
}


// EQUALITY

function _Json_equality(x, y)
{
	if (x === y)
	{
		return true;
	}

	if (x.$ !== y.$)
	{
		return false;
	}

	switch (x.$)
	{
		case 0:
		case 1:
			return x.a === y.a;

		case 2:
			return x.b === y.b;

		case 5:
			return x.c === y.c;

		case 3:
		case 4:
		case 8:
			return _Json_equality(x.b, y.b);

		case 6:
			return x.d === y.d && _Json_equality(x.b, y.b);

		case 7:
			return x.e === y.e && _Json_equality(x.b, y.b);

		case 9:
			return x.f === y.f && _Json_listEquality(x.g, y.g);

		case 10:
			return x.h === y.h && _Json_equality(x.b, y.b);

		case 11:
			return _Json_listEquality(x.g, y.g);
	}
}

function _Json_listEquality(aDecoders, bDecoders)
{
	var len = aDecoders.length;
	if (len !== bDecoders.length)
	{
		return false;
	}
	for (var i = 0; i < len; i++)
	{
		if (!_Json_equality(aDecoders[i], bDecoders[i]))
		{
			return false;
		}
	}
	return true;
}


// ENCODE

var _Json_encode = F2(function(indentLevel, value)
{
	return JSON.stringify(_Json_unwrap(value), null, indentLevel) + '';
});

function _Json_wrap(value) { return { $: 0, a: value }; }
function _Json_unwrap(value) { return value.a; }

function _Json_wrap_UNUSED(value) { return value; }
function _Json_unwrap_UNUSED(value) { return value; }

function _Json_emptyArray() { return []; }
function _Json_emptyObject() { return {}; }

var _Json_addField = F3(function(key, value, object)
{
	object[key] = _Json_unwrap(value);
	return object;
});

function _Json_addEntry(func)
{
	return F2(function(entry, array)
	{
		array.push(_Json_unwrap(func(entry)));
		return array;
	});
}

var _Json_encodeNull = _Json_wrap(null);



// TASKS

function _Scheduler_succeed(value)
{
	return {
		$: 0,
		a: value
	};
}

function _Scheduler_fail(error)
{
	return {
		$: 1,
		a: error
	};
}

function _Scheduler_binding(callback)
{
	return {
		$: 2,
		b: callback,
		c: null
	};
}

var _Scheduler_andThen = F2(function(callback, task)
{
	return {
		$: 3,
		b: callback,
		d: task
	};
});

var _Scheduler_onError = F2(function(callback, task)
{
	return {
		$: 4,
		b: callback,
		d: task
	};
});

function _Scheduler_receive(callback)
{
	return {
		$: 5,
		b: callback
	};
}


// PROCESSES

var _Scheduler_guid = 0;

function _Scheduler_rawSpawn(task)
{
	var proc = {
		$: 0,
		e: _Scheduler_guid++,
		f: task,
		g: null,
		h: []
	};

	_Scheduler_enqueue(proc);

	return proc;
}

function _Scheduler_spawn(task)
{
	return _Scheduler_binding(function(callback) {
		callback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));
	});
}

function _Scheduler_rawSend(proc, msg)
{
	proc.h.push(msg);
	_Scheduler_enqueue(proc);
}

var _Scheduler_send = F2(function(proc, msg)
{
	return _Scheduler_binding(function(callback) {
		_Scheduler_rawSend(proc, msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});

function _Scheduler_kill(proc)
{
	return _Scheduler_binding(function(callback) {
		var task = proc.f;
		if (task.$ === 2 && task.c)
		{
			task.c();
		}

		proc.f = null;

		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
}


/* STEP PROCESSES

type alias Process =
  { $ : tag
  , id : unique_id
  , root : Task
  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }
  , mailbox : [msg]
  }

*/


var _Scheduler_working = false;
var _Scheduler_queue = [];


function _Scheduler_enqueue(proc)
{
	_Scheduler_queue.push(proc);
	if (_Scheduler_working)
	{
		return;
	}
	_Scheduler_working = true;
	while (proc = _Scheduler_queue.shift())
	{
		_Scheduler_step(proc);
	}
	_Scheduler_working = false;
}


function _Scheduler_step(proc)
{
	while (proc.f)
	{
		var rootTag = proc.f.$;
		if (rootTag === 0 || rootTag === 1)
		{
			while (proc.g && proc.g.$ !== rootTag)
			{
				proc.g = proc.g.i;
			}
			if (!proc.g)
			{
				return;
			}
			proc.f = proc.g.b(proc.f.a);
			proc.g = proc.g.i;
		}
		else if (rootTag === 2)
		{
			proc.f.c = proc.f.b(function(newRoot) {
				proc.f = newRoot;
				_Scheduler_enqueue(proc);
			});
			return;
		}
		else if (rootTag === 5)
		{
			if (proc.h.length === 0)
			{
				return;
			}
			proc.f = proc.f.b(proc.h.shift());
		}
		else // if (rootTag === 3 || rootTag === 4)
		{
			proc.g = {
				$: rootTag === 3 ? 0 : 1,
				b: proc.f.b,
				i: proc.g
			};
			proc.f = proc.f.d;
		}
	}
}



function _Process_sleep(time)
{
	return _Scheduler_binding(function(callback) {
		var id = setTimeout(function() {
			callback(_Scheduler_succeed(_Utils_Tuple0));
		}, time);

		return function() { clearTimeout(id); };
	});
}




// PROGRAMS


var _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function() { return function() {} }
	);
});



// INITIALIZE A PROGRAM


function _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)
{
	var result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args['flags'] : undefined));
	elm$core$Result$isOk(result) || _Debug_crash(2 /**/, _Json_errorToString(result.a) /**/);
	var managers = {};
	result = init(result.a);
	var model = result.a;
	var stepper = stepperBuilder(sendToApp, model);
	var ports = _Platform_setupEffects(managers, sendToApp);

	function sendToApp(msg, viewMetadata)
	{
		result = A2(update, msg, model);
		stepper(model = result.a, viewMetadata);
		_Platform_dispatchEffects(managers, result.b, subscriptions(model));
	}

	_Platform_dispatchEffects(managers, result.b, subscriptions(model));

	return ports ? { ports: ports } : {};
}



// TRACK PRELOADS
//
// This is used by code in elm/browser and elm/http
// to register any HTTP requests that are triggered by init.
//


var _Platform_preload;


function _Platform_registerPreload(url)
{
	_Platform_preload.add(url);
}



// EFFECT MANAGERS


var _Platform_effectManagers = {};


function _Platform_setupEffects(managers, sendToApp)
{
	var ports;

	// setup all necessary effect managers
	for (var key in _Platform_effectManagers)
	{
		var manager = _Platform_effectManagers[key];

		if (manager.a)
		{
			ports = ports || {};
			ports[key] = manager.a(key, sendToApp);
		}

		managers[key] = _Platform_instantiateManager(manager, sendToApp);
	}

	return ports;
}


function _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)
{
	return {
		b: init,
		c: onEffects,
		d: onSelfMsg,
		e: cmdMap,
		f: subMap
	};
}


function _Platform_instantiateManager(info, sendToApp)
{
	var router = {
		g: sendToApp,
		h: undefined
	};

	var onEffects = info.c;
	var onSelfMsg = info.d;
	var cmdMap = info.e;
	var subMap = info.f;

	function loop(state)
	{
		return A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)
		{
			var value = msg.a;

			if (msg.$ === 0)
			{
				return A3(onSelfMsg, router, value, state);
			}

			return cmdMap && subMap
				? A4(onEffects, router, value.i, value.j, state)
				: A3(onEffects, router, cmdMap ? value.i : value.j, state);
		}));
	}

	return router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));
}



// ROUTING


var _Platform_sendToApp = F2(function(router, msg)
{
	return _Scheduler_binding(function(callback)
	{
		router.g(msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});


var _Platform_sendToSelf = F2(function(router, msg)
{
	return A2(_Scheduler_send, router.h, {
		$: 0,
		a: msg
	});
});



// BAGS


function _Platform_leaf(home)
{
	return function(value)
	{
		return {
			$: 1,
			k: home,
			l: value
		};
	};
}


function _Platform_batch(list)
{
	return {
		$: 2,
		m: list
	};
}


var _Platform_map = F2(function(tagger, bag)
{
	return {
		$: 3,
		n: tagger,
		o: bag
	}
});



// PIPE BAGS INTO EFFECT MANAGERS


function _Platform_dispatchEffects(managers, cmdBag, subBag)
{
	var effectsDict = {};
	_Platform_gatherEffects(true, cmdBag, effectsDict, null);
	_Platform_gatherEffects(false, subBag, effectsDict, null);

	for (var home in managers)
	{
		_Scheduler_rawSend(managers[home], {
			$: 'fx',
			a: effectsDict[home] || { i: _List_Nil, j: _List_Nil }
		});
	}
}


function _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)
{
	switch (bag.$)
	{
		case 1:
			var home = bag.k;
			var effect = _Platform_toEffect(isCmd, home, taggers, bag.l);
			effectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);
			return;

		case 2:
			for (var list = bag.m; list.b; list = list.b) // WHILE_CONS
			{
				_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);
			}
			return;

		case 3:
			_Platform_gatherEffects(isCmd, bag.o, effectsDict, {
				p: bag.n,
				q: taggers
			});
			return;
	}
}


function _Platform_toEffect(isCmd, home, taggers, value)
{
	function applyTaggers(x)
	{
		for (var temp = taggers; temp; temp = temp.q)
		{
			x = temp.p(x);
		}
		return x;
	}

	var map = isCmd
		? _Platform_effectManagers[home].e
		: _Platform_effectManagers[home].f;

	return A2(map, applyTaggers, value)
}


function _Platform_insert(isCmd, newEffect, effects)
{
	effects = effects || { i: _List_Nil, j: _List_Nil };

	isCmd
		? (effects.i = _List_Cons(newEffect, effects.i))
		: (effects.j = _List_Cons(newEffect, effects.j));

	return effects;
}



// PORTS


function _Platform_checkPortName(name)
{
	if (_Platform_effectManagers[name])
	{
		_Debug_crash(3, name)
	}
}



// OUTGOING PORTS


function _Platform_outgoingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		e: _Platform_outgoingPortMap,
		r: converter,
		a: _Platform_setupOutgoingPort
	};
	return _Platform_leaf(name);
}


var _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });


function _Platform_setupOutgoingPort(name)
{
	var subs = [];
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Process_sleep(0);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, cmdList, state)
	{
		for ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS
		{
			// grab a separate reference to subs in case unsubscribe is called
			var currentSubs = subs;
			var value = _Json_unwrap(converter(cmdList.a));
			for (var i = 0; i < currentSubs.length; i++)
			{
				currentSubs[i](value);
			}
		}
		return init;
	});

	// PUBLIC API

	function subscribe(callback)
	{
		subs.push(callback);
	}

	function unsubscribe(callback)
	{
		// copy subs into a new array in case unsubscribe is called within a
		// subscribed callback
		subs = subs.slice();
		var index = subs.indexOf(callback);
		if (index >= 0)
		{
			subs.splice(index, 1);
		}
	}

	return {
		subscribe: subscribe,
		unsubscribe: unsubscribe
	};
}



// INCOMING PORTS


function _Platform_incomingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		f: _Platform_incomingPortMap,
		r: converter,
		a: _Platform_setupIncomingPort
	};
	return _Platform_leaf(name);
}


var _Platform_incomingPortMap = F2(function(tagger, finalTagger)
{
	return function(value)
	{
		return tagger(finalTagger(value));
	};
});


function _Platform_setupIncomingPort(name, sendToApp)
{
	var subs = _List_Nil;
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Scheduler_succeed(null);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, subList, state)
	{
		subs = subList;
		return init;
	});

	// PUBLIC API

	function send(incomingValue)
	{
		var result = A2(_Json_run, converter, _Json_wrap(incomingValue));

		elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);

		var value = result.a;
		for (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS
		{
			sendToApp(temp.a(value));
		}
	}

	return { send: send };
}



// EXPORT ELM MODULES
//
// Have DEBUG and PROD versions so that we can (1) give nicer errors in
// debug mode and (2) not pay for the bits needed for that in prod mode.
//


function _Platform_export_UNUSED(exports)
{
	scope['Elm']
		? _Platform_mergeExportsProd(scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsProd(obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6)
				: _Platform_mergeExportsProd(obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}


function _Platform_export(exports)
{
	scope['Elm']
		? _Platform_mergeExportsDebug('Elm', scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsDebug(moduleName, obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6, moduleName)
				: _Platform_mergeExportsDebug(moduleName + '.' + name, obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}




// HELPERS


var _VirtualDom_divertHrefToApp;

var _VirtualDom_doc = typeof document !== 'undefined' ? document : {};


function _VirtualDom_appendChild(parent, child)
{
	parent.appendChild(child);
}

var _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)
{
	// NOTE: this function needs _Platform_export available to work

	/**_UNUSED/
	var node = args['node'];
	//*/
	/**/
	var node = args && args['node'] ? args['node'] : _Debug_crash(0);
	//*/

	node.parentNode.replaceChild(
		_VirtualDom_render(virtualNode, function() {}),
		node
	);

	return {};
});



// TEXT


function _VirtualDom_text(string)
{
	return {
		$: 0,
		a: string
	};
}



// NODE


var _VirtualDom_nodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 1,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_node = _VirtualDom_nodeNS(undefined);



// KEYED NODE


var _VirtualDom_keyedNodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 2,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);



// CUSTOM


function _VirtualDom_custom(factList, model, render, diff)
{
	return {
		$: 3,
		d: _VirtualDom_organizeFacts(factList),
		g: model,
		h: render,
		i: diff
	};
}



// MAP


var _VirtualDom_map = F2(function(tagger, node)
{
	return {
		$: 4,
		j: tagger,
		k: node,
		b: 1 + (node.b || 0)
	};
});



// LAZY


function _VirtualDom_thunk(refs, thunk)
{
	return {
		$: 5,
		l: refs,
		m: thunk,
		k: undefined
	};
}

var _VirtualDom_lazy = F2(function(func, a)
{
	return _VirtualDom_thunk([func, a], function() {
		return func(a);
	});
});

var _VirtualDom_lazy2 = F3(function(func, a, b)
{
	return _VirtualDom_thunk([func, a, b], function() {
		return A2(func, a, b);
	});
});

var _VirtualDom_lazy3 = F4(function(func, a, b, c)
{
	return _VirtualDom_thunk([func, a, b, c], function() {
		return A3(func, a, b, c);
	});
});

var _VirtualDom_lazy4 = F5(function(func, a, b, c, d)
{
	return _VirtualDom_thunk([func, a, b, c, d], function() {
		return A4(func, a, b, c, d);
	});
});

var _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)
{
	return _VirtualDom_thunk([func, a, b, c, d, e], function() {
		return A5(func, a, b, c, d, e);
	});
});

var _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f], function() {
		return A6(func, a, b, c, d, e, f);
	});
});

var _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {
		return A7(func, a, b, c, d, e, f, g);
	});
});

var _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {
		return A8(func, a, b, c, d, e, f, g, h);
	});
});



// FACTS


var _VirtualDom_on = F2(function(key, handler)
{
	return {
		$: 'a0',
		n: key,
		o: handler
	};
});
var _VirtualDom_style = F2(function(key, value)
{
	return {
		$: 'a1',
		n: key,
		o: value
	};
});
var _VirtualDom_property = F2(function(key, value)
{
	return {
		$: 'a2',
		n: key,
		o: value
	};
});
var _VirtualDom_attribute = F2(function(key, value)
{
	return {
		$: 'a3',
		n: key,
		o: value
	};
});
var _VirtualDom_attributeNS = F3(function(namespace, key, value)
{
	return {
		$: 'a4',
		n: key,
		o: { f: namespace, o: value }
	};
});



// XSS ATTACK VECTOR CHECKS


function _VirtualDom_noScript(tag)
{
	return tag == 'script' ? 'p' : tag;
}

function _VirtualDom_noOnOrFormAction(key)
{
	return /^(on|formAction$)/i.test(key) ? 'data-' + key : key;
}

function _VirtualDom_noInnerHtmlOrFormAction(key)
{
	return key == 'innerHTML' || key == 'formAction' ? 'data-' + key : key;
}

function _VirtualDom_noJavaScriptUri_UNUSED(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,'')) ? '' : value;
}

function _VirtualDom_noJavaScriptUri(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,''))
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}

function _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value) ? '' : value;
}

function _VirtualDom_noJavaScriptOrHtmlUri(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value)
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}



// MAP FACTS


var _VirtualDom_mapAttribute = F2(function(func, attr)
{
	return (attr.$ === 'a0')
		? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))
		: attr;
});

function _VirtualDom_mapHandler(func, handler)
{
	var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

	// 0 = Normal
	// 1 = MayStopPropagation
	// 2 = MayPreventDefault
	// 3 = Custom

	return {
		$: handler.$,
		a:
			!tag
				? A2(elm$json$Json$Decode$map, func, handler.a)
				:
			A3(elm$json$Json$Decode$map2,
				tag < 3
					? _VirtualDom_mapEventTuple
					: _VirtualDom_mapEventRecord,
				elm$json$Json$Decode$succeed(func),
				handler.a
			)
	};
}

var _VirtualDom_mapEventTuple = F2(function(func, tuple)
{
	return _Utils_Tuple2(func(tuple.a), tuple.b);
});

var _VirtualDom_mapEventRecord = F2(function(func, record)
{
	return {
		message: func(record.message),
		stopPropagation: record.stopPropagation,
		preventDefault: record.preventDefault
	}
});



// ORGANIZE FACTS


function _VirtualDom_organizeFacts(factList)
{
	for (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS
	{
		var entry = factList.a;

		var tag = entry.$;
		var key = entry.n;
		var value = entry.o;

		if (tag === 'a2')
		{
			(key === 'className')
				? _VirtualDom_addClass(facts, key, _Json_unwrap(value))
				: facts[key] = _Json_unwrap(value);

			continue;
		}

		var subFacts = facts[tag] || (facts[tag] = {});
		(tag === 'a3' && key === 'class')
			? _VirtualDom_addClass(subFacts, key, value)
			: subFacts[key] = value;
	}

	return facts;
}

function _VirtualDom_addClass(object, key, newClass)
{
	var classes = object[key];
	object[key] = classes ? classes + ' ' + newClass : newClass;
}



// RENDER


function _VirtualDom_render(vNode, eventNode)
{
	var tag = vNode.$;

	if (tag === 5)
	{
		return _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);
	}

	if (tag === 0)
	{
		return _VirtualDom_doc.createTextNode(vNode.a);
	}

	if (tag === 4)
	{
		var subNode = vNode.k;
		var tagger = vNode.j;

		while (subNode.$ === 4)
		{
			typeof tagger !== 'object'
				? tagger = [tagger, subNode.j]
				: tagger.push(subNode.j);

			subNode = subNode.k;
		}

		var subEventRoot = { j: tagger, p: eventNode };
		var domNode = _VirtualDom_render(subNode, subEventRoot);
		domNode.elm_event_node_ref = subEventRoot;
		return domNode;
	}

	if (tag === 3)
	{
		var domNode = vNode.h(vNode.g);
		_VirtualDom_applyFacts(domNode, eventNode, vNode.d);
		return domNode;
	}

	// at this point `tag` must be 1 or 2

	var domNode = vNode.f
		? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)
		: _VirtualDom_doc.createElement(vNode.c);

	if (_VirtualDom_divertHrefToApp && vNode.c == 'a')
	{
		domNode.addEventListener('click', _VirtualDom_divertHrefToApp(domNode));
	}

	_VirtualDom_applyFacts(domNode, eventNode, vNode.d);

	for (var kids = vNode.e, i = 0; i < kids.length; i++)
	{
		_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));
	}

	return domNode;
}



// APPLY FACTS


function _VirtualDom_applyFacts(domNode, eventNode, facts)
{
	for (var key in facts)
	{
		var value = facts[key];

		key === 'a1'
			? _VirtualDom_applyStyles(domNode, value)
			:
		key === 'a0'
			? _VirtualDom_applyEvents(domNode, eventNode, value)
			:
		key === 'a3'
			? _VirtualDom_applyAttrs(domNode, value)
			:
		key === 'a4'
			? _VirtualDom_applyAttrsNS(domNode, value)
			:
		((key !== 'value' && key !== 'checked') || domNode[key] !== value) && (domNode[key] = value);
	}
}



// APPLY STYLES


function _VirtualDom_applyStyles(domNode, styles)
{
	var domNodeStyle = domNode.style;

	for (var key in styles)
	{
		domNodeStyle[key] = styles[key];
	}
}



// APPLY ATTRS


function _VirtualDom_applyAttrs(domNode, attrs)
{
	for (var key in attrs)
	{
		var value = attrs[key];
		typeof value !== 'undefined'
			? domNode.setAttribute(key, value)
			: domNode.removeAttribute(key);
	}
}



// APPLY NAMESPACED ATTRS


function _VirtualDom_applyAttrsNS(domNode, nsAttrs)
{
	for (var key in nsAttrs)
	{
		var pair = nsAttrs[key];
		var namespace = pair.f;
		var value = pair.o;

		typeof value !== 'undefined'
			? domNode.setAttributeNS(namespace, key, value)
			: domNode.removeAttributeNS(namespace, key);
	}
}



// APPLY EVENTS


function _VirtualDom_applyEvents(domNode, eventNode, events)
{
	var allCallbacks = domNode.elmFs || (domNode.elmFs = {});

	for (var key in events)
	{
		var newHandler = events[key];
		var oldCallback = allCallbacks[key];

		if (!newHandler)
		{
			domNode.removeEventListener(key, oldCallback);
			allCallbacks[key] = undefined;
			continue;
		}

		if (oldCallback)
		{
			var oldHandler = oldCallback.q;
			if (oldHandler.$ === newHandler.$)
			{
				oldCallback.q = newHandler;
				continue;
			}
			domNode.removeEventListener(key, oldCallback);
		}

		oldCallback = _VirtualDom_makeCallback(eventNode, newHandler);
		domNode.addEventListener(key, oldCallback,
			_VirtualDom_passiveSupported
			&& { passive: elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }
		);
		allCallbacks[key] = oldCallback;
	}
}



// PASSIVE EVENTS


var _VirtualDom_passiveSupported;

try
{
	window.addEventListener('t', null, Object.defineProperty({}, 'passive', {
		get: function() { _VirtualDom_passiveSupported = true; }
	}));
}
catch(e) {}



// EVENT HANDLERS


function _VirtualDom_makeCallback(eventNode, initialHandler)
{
	function callback(event)
	{
		var handler = callback.q;
		var result = _Json_runHelp(handler.a, event);

		if (!elm$core$Result$isOk(result))
		{
			return;
		}

		var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

		// 0 = Normal
		// 1 = MayStopPropagation
		// 2 = MayPreventDefault
		// 3 = Custom

		var value = result.a;
		var message = !tag ? value : tag < 3 ? value.a : value.message;
		var stopPropagation = tag == 1 ? value.b : tag == 3 && value.stopPropagation;
		var currentEventNode = (
			stopPropagation && event.stopPropagation(),
			(tag == 2 ? value.b : tag == 3 && value.preventDefault) && event.preventDefault(),
			eventNode
		);
		var tagger;
		var i;
		while (tagger = currentEventNode.j)
		{
			if (typeof tagger == 'function')
			{
				message = tagger(message);
			}
			else
			{
				for (var i = tagger.length; i--; )
				{
					message = tagger[i](message);
				}
			}
			currentEventNode = currentEventNode.p;
		}
		currentEventNode(message, stopPropagation); // stopPropagation implies isSync
	}

	callback.q = initialHandler;

	return callback;
}

function _VirtualDom_equalEvents(x, y)
{
	return x.$ == y.$ && _Json_equality(x.a, y.a);
}



// DIFF


// TODO: Should we do patches like in iOS?
//
// type Patch
//   = At Int Patch
//   | Batch (List Patch)
//   | Change ...
//
// How could it not be better?
//
function _VirtualDom_diff(x, y)
{
	var patches = [];
	_VirtualDom_diffHelp(x, y, patches, 0);
	return patches;
}


function _VirtualDom_pushPatch(patches, type, index, data)
{
	var patch = {
		$: type,
		r: index,
		s: data,
		t: undefined,
		u: undefined
	};
	patches.push(patch);
	return patch;
}


function _VirtualDom_diffHelp(x, y, patches, index)
{
	if (x === y)
	{
		return;
	}

	var xType = x.$;
	var yType = y.$;

	// Bail if you run into different types of nodes. Implies that the
	// structure has changed significantly and it's not worth a diff.
	if (xType !== yType)
	{
		if (xType === 1 && yType === 2)
		{
			y = _VirtualDom_dekey(y);
			yType = 1;
		}
		else
		{
			_VirtualDom_pushPatch(patches, 0, index, y);
			return;
		}
	}

	// Now we know that both nodes are the same $.
	switch (yType)
	{
		case 5:
			var xRefs = x.l;
			var yRefs = y.l;
			var i = xRefs.length;
			var same = i === yRefs.length;
			while (same && i--)
			{
				same = xRefs[i] === yRefs[i];
			}
			if (same)
			{
				y.k = x.k;
				return;
			}
			y.k = y.m();
			var subPatches = [];
			_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);
			subPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);
			return;

		case 4:
			// gather nested taggers
			var xTaggers = x.j;
			var yTaggers = y.j;
			var nesting = false;

			var xSubNode = x.k;
			while (xSubNode.$ === 4)
			{
				nesting = true;

				typeof xTaggers !== 'object'
					? xTaggers = [xTaggers, xSubNode.j]
					: xTaggers.push(xSubNode.j);

				xSubNode = xSubNode.k;
			}

			var ySubNode = y.k;
			while (ySubNode.$ === 4)
			{
				nesting = true;

				typeof yTaggers !== 'object'
					? yTaggers = [yTaggers, ySubNode.j]
					: yTaggers.push(ySubNode.j);

				ySubNode = ySubNode.k;
			}

			// Just bail if different numbers of taggers. This implies the
			// structure of the virtual DOM has changed.
			if (nesting && xTaggers.length !== yTaggers.length)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			// check if taggers are "the same"
			if (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)
			{
				_VirtualDom_pushPatch(patches, 2, index, yTaggers);
			}

			// diff everything below the taggers
			_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);
			return;

		case 0:
			if (x.a !== y.a)
			{
				_VirtualDom_pushPatch(patches, 3, index, y.a);
			}
			return;

		case 1:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);
			return;

		case 2:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);
			return;

		case 3:
			if (x.h !== y.h)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
			factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

			var patch = y.i(x.g, y.g);
			patch && _VirtualDom_pushPatch(patches, 5, index, patch);

			return;
	}
}

// assumes the incoming arrays are the same length
function _VirtualDom_pairwiseRefEqual(as, bs)
{
	for (var i = 0; i < as.length; i++)
	{
		if (as[i] !== bs[i])
		{
			return false;
		}
	}

	return true;
}

function _VirtualDom_diffNodes(x, y, patches, index, diffKids)
{
	// Bail if obvious indicators have changed. Implies more serious
	// structural changes such that it's not worth it to diff.
	if (x.c !== y.c || x.f !== y.f)
	{
		_VirtualDom_pushPatch(patches, 0, index, y);
		return;
	}

	var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
	factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

	diffKids(x, y, patches, index);
}



// DIFF FACTS


// TODO Instead of creating a new diff object, it's possible to just test if
// there *is* a diff. During the actual patch, do the diff again and make the
// modifications directly. This way, there's no new allocations. Worth it?
function _VirtualDom_diffFacts(x, y, category)
{
	var diff;

	// look for changes and removals
	for (var xKey in x)
	{
		if (xKey === 'a1' || xKey === 'a0' || xKey === 'a3' || xKey === 'a4')
		{
			var subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);
			if (subDiff)
			{
				diff = diff || {};
				diff[xKey] = subDiff;
			}
			continue;
		}

		// remove if not in the new facts
		if (!(xKey in y))
		{
			diff = diff || {};
			diff[xKey] =
				!category
					? (typeof x[xKey] === 'string' ? '' : null)
					:
				(category === 'a1')
					? ''
					:
				(category === 'a0' || category === 'a3')
					? undefined
					:
				{ f: x[xKey].f, o: undefined };

			continue;
		}

		var xValue = x[xKey];
		var yValue = y[xKey];

		// reference equal, so don't worry about it
		if (xValue === yValue && xKey !== 'value' && xKey !== 'checked'
			|| category === 'a0' && _VirtualDom_equalEvents(xValue, yValue))
		{
			continue;
		}

		diff = diff || {};
		diff[xKey] = yValue;
	}

	// add new stuff
	for (var yKey in y)
	{
		if (!(yKey in x))
		{
			diff = diff || {};
			diff[yKey] = y[yKey];
		}
	}

	return diff;
}



// DIFF KIDS


function _VirtualDom_diffKids(xParent, yParent, patches, index)
{
	var xKids = xParent.e;
	var yKids = yParent.e;

	var xLen = xKids.length;
	var yLen = yKids.length;

	// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS

	if (xLen > yLen)
	{
		_VirtualDom_pushPatch(patches, 6, index, {
			v: yLen,
			i: xLen - yLen
		});
	}
	else if (xLen < yLen)
	{
		_VirtualDom_pushPatch(patches, 7, index, {
			v: xLen,
			e: yKids
		});
	}

	// PAIRWISE DIFF EVERYTHING ELSE

	for (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)
	{
		var xKid = xKids[i];
		_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);
		index += xKid.b || 0;
	}
}



// KEYED DIFF


function _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)
{
	var localPatches = [];

	var changes = {}; // Dict String Entry
	var inserts = []; // Array { index : Int, entry : Entry }
	// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }

	var xKids = xParent.e;
	var yKids = yParent.e;
	var xLen = xKids.length;
	var yLen = yKids.length;
	var xIndex = 0;
	var yIndex = 0;

	var index = rootIndex;

	while (xIndex < xLen && yIndex < yLen)
	{
		var x = xKids[xIndex];
		var y = yKids[yIndex];

		var xKey = x.a;
		var yKey = y.a;
		var xNode = x.b;
		var yNode = y.b;

		var newMatch = undefined;
		var oldMatch = undefined;

		// check if keys match

		if (xKey === yKey)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNode, localPatches, index);
			index += xNode.b || 0;

			xIndex++;
			yIndex++;
			continue;
		}

		// look ahead 1 to detect insertions and removals.

		var xNext = xKids[xIndex + 1];
		var yNext = yKids[yIndex + 1];

		if (xNext)
		{
			var xNextKey = xNext.a;
			var xNextNode = xNext.b;
			oldMatch = yKey === xNextKey;
		}

		if (yNext)
		{
			var yNextKey = yNext.a;
			var yNextNode = yNext.b;
			newMatch = xKey === yNextKey;
		}


		// swap x and y
		if (newMatch && oldMatch)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		// insert y
		if (newMatch)
		{
			index++;
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			index += xNode.b || 0;

			xIndex += 1;
			yIndex += 2;
			continue;
		}

		// remove x
		if (oldMatch)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 1;
			continue;
		}

		// remove x, insert y
		if (xNext && xNextKey === yNextKey)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		break;
	}

	// eat up any remaining nodes with removeNode and insertNode

	while (xIndex < xLen)
	{
		index++;
		var x = xKids[xIndex];
		var xNode = x.b;
		_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);
		index += xNode.b || 0;
		xIndex++;
	}

	while (yIndex < yLen)
	{
		var endInserts = endInserts || [];
		var y = yKids[yIndex];
		_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);
		yIndex++;
	}

	if (localPatches.length > 0 || inserts.length > 0 || endInserts)
	{
		_VirtualDom_pushPatch(patches, 8, rootIndex, {
			w: localPatches,
			x: inserts,
			y: endInserts
		});
	}
}



// CHANGES FROM KEYED DIFF


var _VirtualDom_POSTFIX = '_elmW6BL';


function _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		entry = {
			c: 0,
			z: vnode,
			r: yIndex,
			s: undefined
		};

		inserts.push({ r: yIndex, A: entry });
		changes[key] = entry;

		return;
	}

	// this key was removed earlier, a match!
	if (entry.c === 1)
	{
		inserts.push({ r: yIndex, A: entry });

		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);
		entry.r = yIndex;
		entry.s.s = {
			w: subPatches,
			A: entry
		};

		return;
	}

	// this key has already been inserted or moved, a duplicate!
	_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);
}


function _VirtualDom_removeNode(changes, localPatches, key, vnode, index)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		var patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);

		changes[key] = {
			c: 1,
			z: vnode,
			r: index,
			s: patch
		};

		return;
	}

	// this key was inserted earlier, a match!
	if (entry.c === 0)
	{
		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);

		_VirtualDom_pushPatch(localPatches, 9, index, {
			w: subPatches,
			A: entry
		});

		return;
	}

	// this key has already been removed or moved, a duplicate!
	_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);
}



// ADD DOM NODES
//
// Each DOM node has an "index" assigned in order of traversal. It is important
// to minimize our crawl over the actual DOM, so these indexes (along with the
// descendantsCount of virtual nodes) let us skip touching entire subtrees of
// the DOM if we know there are no patches there.


function _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)
{
	_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);
}


// assumes `patches` is non-empty and indexes increase monotonically.
function _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)
{
	var patch = patches[i];
	var index = patch.r;

	while (index === low)
	{
		var patchType = patch.$;

		if (patchType === 1)
		{
			_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);
		}
		else if (patchType === 8)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var subPatches = patch.s.w;
			if (subPatches.length > 0)
			{
				_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
			}
		}
		else if (patchType === 9)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var data = patch.s;
			if (data)
			{
				data.A.s = domNode;
				var subPatches = data.w;
				if (subPatches.length > 0)
				{
					_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
				}
			}
		}
		else
		{
			patch.t = domNode;
			patch.u = eventNode;
		}

		i++;

		if (!(patch = patches[i]) || (index = patch.r) > high)
		{
			return i;
		}
	}

	var tag = vNode.$;

	if (tag === 4)
	{
		var subNode = vNode.k;

		while (subNode.$ === 4)
		{
			subNode = subNode.k;
		}

		return _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);
	}

	// tag must be 1 or 2 at this point

	var vKids = vNode.e;
	var childNodes = domNode.childNodes;
	for (var j = 0; j < vKids.length; j++)
	{
		low++;
		var vKid = tag === 1 ? vKids[j] : vKids[j].b;
		var nextLow = low + (vKid.b || 0);
		if (low <= index && index <= nextLow)
		{
			i = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);
			if (!(patch = patches[i]) || (index = patch.r) > high)
			{
				return i;
			}
		}
		low = nextLow;
	}
	return i;
}



// APPLY PATCHES


function _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)
{
	if (patches.length === 0)
	{
		return rootDomNode;
	}

	_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);
	return _VirtualDom_applyPatchesHelp(rootDomNode, patches);
}

function _VirtualDom_applyPatchesHelp(rootDomNode, patches)
{
	for (var i = 0; i < patches.length; i++)
	{
		var patch = patches[i];
		var localDomNode = patch.t
		var newNode = _VirtualDom_applyPatch(localDomNode, patch);
		if (localDomNode === rootDomNode)
		{
			rootDomNode = newNode;
		}
	}
	return rootDomNode;
}

function _VirtualDom_applyPatch(domNode, patch)
{
	switch (patch.$)
	{
		case 0:
			return _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);

		case 4:
			_VirtualDom_applyFacts(domNode, patch.u, patch.s);
			return domNode;

		case 3:
			domNode.replaceData(0, domNode.length, patch.s);
			return domNode;

		case 1:
			return _VirtualDom_applyPatchesHelp(domNode, patch.s);

		case 2:
			if (domNode.elm_event_node_ref)
			{
				domNode.elm_event_node_ref.j = patch.s;
			}
			else
			{
				domNode.elm_event_node_ref = { j: patch.s, p: patch.u };
			}
			return domNode;

		case 6:
			var data = patch.s;
			for (var i = 0; i < data.i; i++)
			{
				domNode.removeChild(domNode.childNodes[data.v]);
			}
			return domNode;

		case 7:
			var data = patch.s;
			var kids = data.e;
			var i = data.v;
			var theEnd = domNode.childNodes[i];
			for (; i < kids.length; i++)
			{
				domNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);
			}
			return domNode;

		case 9:
			var data = patch.s;
			if (!data)
			{
				domNode.parentNode.removeChild(domNode);
				return domNode;
			}
			var entry = data.A;
			if (typeof entry.r !== 'undefined')
			{
				domNode.parentNode.removeChild(domNode);
			}
			entry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);
			return domNode;

		case 8:
			return _VirtualDom_applyPatchReorder(domNode, patch);

		case 5:
			return patch.s(domNode);

		default:
			_Debug_crash(10); // 'Ran into an unknown patch!'
	}
}


function _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)
{
	var parentNode = domNode.parentNode;
	var newNode = _VirtualDom_render(vNode, eventNode);

	if (!newNode.elm_event_node_ref)
	{
		newNode.elm_event_node_ref = domNode.elm_event_node_ref;
	}

	if (parentNode && newNode !== domNode)
	{
		parentNode.replaceChild(newNode, domNode);
	}
	return newNode;
}


function _VirtualDom_applyPatchReorder(domNode, patch)
{
	var data = patch.s;

	// remove end inserts
	var frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);

	// removals
	domNode = _VirtualDom_applyPatchesHelp(domNode, data.w);

	// inserts
	var inserts = data.x;
	for (var i = 0; i < inserts.length; i++)
	{
		var insert = inserts[i];
		var entry = insert.A;
		var node = entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u);
		domNode.insertBefore(node, domNode.childNodes[insert.r]);
	}

	// add end inserts
	if (frag)
	{
		_VirtualDom_appendChild(domNode, frag);
	}

	return domNode;
}


function _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)
{
	if (!endInserts)
	{
		return;
	}

	var frag = _VirtualDom_doc.createDocumentFragment();
	for (var i = 0; i < endInserts.length; i++)
	{
		var insert = endInserts[i];
		var entry = insert.A;
		_VirtualDom_appendChild(frag, entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u)
		);
	}
	return frag;
}


function _VirtualDom_virtualize(node)
{
	// TEXT NODES

	if (node.nodeType === 3)
	{
		return _VirtualDom_text(node.textContent);
	}


	// WEIRD NODES

	if (node.nodeType !== 1)
	{
		return _VirtualDom_text('');
	}


	// ELEMENT NODES

	var attrList = _List_Nil;
	var attrs = node.attributes;
	for (var i = attrs.length; i--; )
	{
		var attr = attrs[i];
		var name = attr.name;
		var value = attr.value;
		attrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );
	}

	var tag = node.tagName.toLowerCase();
	var kidList = _List_Nil;
	var kids = node.childNodes;

	for (var i = kids.length; i--; )
	{
		kidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);
	}
	return A3(_VirtualDom_node, tag, attrList, kidList);
}

function _VirtualDom_dekey(keyedNode)
{
	var keyedKids = keyedNode.e;
	var len = keyedKids.length;
	var kids = new Array(len);
	for (var i = 0; i < len; i++)
	{
		kids[i] = keyedKids[i].b;
	}

	return {
		$: 1,
		c: keyedNode.c,
		d: keyedNode.d,
		e: kids,
		f: keyedNode.f,
		b: keyedNode.b
	};
}




// ELEMENT


var _Debugger_element;

var _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function(sendToApp, initialModel) {
			var view = impl.view;
			/**_UNUSED/
			var domNode = args['node'];
			//*/
			/**/
			var domNode = args && args['node'] ? args['node'] : _Debug_crash(0);
			//*/
			var currNode = _VirtualDom_virtualize(domNode);

			return _Browser_makeAnimator(initialModel, function(model)
			{
				var nextNode = view(model);
				var patches = _VirtualDom_diff(currNode, nextNode);
				domNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);
				currNode = nextNode;
			});
		}
	);
});



// DOCUMENT


var _Debugger_document;

var _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function(sendToApp, initialModel) {
			var divertHrefToApp = impl.setup && impl.setup(sendToApp)
			var view = impl.view;
			var title = _VirtualDom_doc.title;
			var bodyNode = _VirtualDom_doc.body;
			var currNode = _VirtualDom_virtualize(bodyNode);
			return _Browser_makeAnimator(initialModel, function(model)
			{
				_VirtualDom_divertHrefToApp = divertHrefToApp;
				var doc = view(model);
				var nextNode = _VirtualDom_node('body')(_List_Nil)(doc.body);
				var patches = _VirtualDom_diff(currNode, nextNode);
				bodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);
				currNode = nextNode;
				_VirtualDom_divertHrefToApp = 0;
				(title !== doc.title) && (_VirtualDom_doc.title = title = doc.title);
			});
		}
	);
});



// ANIMATION


var _Browser_cancelAnimationFrame =
	typeof cancelAnimationFrame !== 'undefined'
		? cancelAnimationFrame
		: function(id) { clearTimeout(id); };

var _Browser_requestAnimationFrame =
	typeof requestAnimationFrame !== 'undefined'
		? requestAnimationFrame
		: function(callback) { return setTimeout(callback, 1000 / 60); };


function _Browser_makeAnimator(model, draw)
{
	draw(model);

	var state = 0;

	function updateIfNeeded()
	{
		state = state === 1
			? 0
			: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );
	}

	return function(nextModel, isSync)
	{
		model = nextModel;

		isSync
			? ( draw(model),
				state === 2 && (state = 1)
				)
			: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),
				state = 2
				);
	};
}



// APPLICATION


function _Browser_application(impl)
{
	var onUrlChange = impl.onUrlChange;
	var onUrlRequest = impl.onUrlRequest;
	var key = function() { key.a(onUrlChange(_Browser_getUrl())); };

	return _Browser_document({
		setup: function(sendToApp)
		{
			key.a = sendToApp;
			_Browser_window.addEventListener('popstate', key);
			_Browser_window.navigator.userAgent.indexOf('Trident') < 0 || _Browser_window.addEventListener('hashchange', key);

			return F2(function(domNode, event)
			{
				if (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute('download'))
				{
					event.preventDefault();
					var href = domNode.href;
					var curr = _Browser_getUrl();
					var next = elm$url$Url$fromString(href).a;
					sendToApp(onUrlRequest(
						(next
							&& curr.protocol === next.protocol
							&& curr.host === next.host
							&& curr.port_.a === next.port_.a
						)
							? elm$browser$Browser$Internal(next)
							: elm$browser$Browser$External(href)
					));
				}
			});
		},
		init: function(flags)
		{
			return A3(impl.init, flags, _Browser_getUrl(), key);
		},
		view: impl.view,
		update: impl.update,
		subscriptions: impl.subscriptions
	});
}

function _Browser_getUrl()
{
	return elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);
}

var _Browser_go = F2(function(key, n)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		n && history.go(n);
		key();
	}));
});

var _Browser_pushUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.pushState({}, '', url);
		key();
	}));
});

var _Browser_replaceUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.replaceState({}, '', url);
		key();
	}));
});



// GLOBAL EVENTS


var _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };
var _Browser_doc = typeof document !== 'undefined' ? document : _Browser_fakeNode;
var _Browser_window = typeof window !== 'undefined' ? window : _Browser_fakeNode;

var _Browser_on = F3(function(node, eventName, sendToSelf)
{
	return _Scheduler_spawn(_Scheduler_binding(function(callback)
	{
		function handler(event)	{ _Scheduler_rawSpawn(sendToSelf(event)); }
		node.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });
		return function() { node.removeEventListener(eventName, handler); };
	}));
});

var _Browser_decodeEvent = F2(function(decoder, event)
{
	var result = _Json_runHelp(decoder, event);
	return elm$core$Result$isOk(result) ? elm$core$Maybe$Just(result.a) : elm$core$Maybe$Nothing;
});



// PAGE VISIBILITY


function _Browser_visibilityInfo()
{
	return (typeof _VirtualDom_doc.hidden !== 'undefined')
		? { hidden: 'hidden', change: 'visibilitychange' }
		:
	(typeof _VirtualDom_doc.mozHidden !== 'undefined')
		? { hidden: 'mozHidden', change: 'mozvisibilitychange' }
		:
	(typeof _VirtualDom_doc.msHidden !== 'undefined')
		? { hidden: 'msHidden', change: 'msvisibilitychange' }
		:
	(typeof _VirtualDom_doc.webkitHidden !== 'undefined')
		? { hidden: 'webkitHidden', change: 'webkitvisibilitychange' }
		: { hidden: 'hidden', change: 'visibilitychange' };
}



// ANIMATION FRAMES


function _Browser_rAF()
{
	return _Scheduler_binding(function(callback)
	{
		var id = _Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(Date.now()));
		});

		return function() {
			_Browser_cancelAnimationFrame(id);
		};
	});
}


function _Browser_now()
{
	return _Scheduler_binding(function(callback)
	{
		callback(_Scheduler_succeed(Date.now()));
	});
}



// DOM STUFF


function _Browser_withNode(id, doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			var node = document.getElementById(id);
			callback(node
				? _Scheduler_succeed(doStuff(node))
				: _Scheduler_fail(elm$browser$Browser$Dom$NotFound(id))
			);
		});
	});
}


function _Browser_withWindow(doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(doStuff()));
		});
	});
}


// FOCUS and BLUR


var _Browser_call = F2(function(functionName, id)
{
	return _Browser_withNode(id, function(node) {
		node[functionName]();
		return _Utils_Tuple0;
	});
});



// WINDOW VIEWPORT


function _Browser_getViewport()
{
	return {
		scene: _Browser_getScene(),
		viewport: {
			x: _Browser_window.pageXOffset,
			y: _Browser_window.pageYOffset,
			width: _Browser_doc.documentElement.clientWidth,
			height: _Browser_doc.documentElement.clientHeight
		}
	};
}

function _Browser_getScene()
{
	var body = _Browser_doc.body;
	var elem = _Browser_doc.documentElement;
	return {
		width: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),
		height: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)
	};
}

var _Browser_setViewport = F2(function(x, y)
{
	return _Browser_withWindow(function()
	{
		_Browser_window.scroll(x, y);
		return _Utils_Tuple0;
	});
});



// ELEMENT VIEWPORT


function _Browser_getViewportOf(id)
{
	return _Browser_withNode(id, function(node)
	{
		return {
			scene: {
				width: node.scrollWidth,
				height: node.scrollHeight
			},
			viewport: {
				x: node.scrollLeft,
				y: node.scrollTop,
				width: node.clientWidth,
				height: node.clientHeight
			}
		};
	});
}


var _Browser_setViewportOf = F3(function(id, x, y)
{
	return _Browser_withNode(id, function(node)
	{
		node.scrollLeft = x;
		node.scrollTop = y;
		return _Utils_Tuple0;
	});
});



// ELEMENT


function _Browser_getElement(id)
{
	return _Browser_withNode(id, function(node)
	{
		var rect = node.getBoundingClientRect();
		var x = _Browser_window.pageXOffset;
		var y = _Browser_window.pageYOffset;
		return {
			scene: _Browser_getScene(),
			viewport: {
				x: x,
				y: y,
				width: _Browser_doc.documentElement.clientWidth,
				height: _Browser_doc.documentElement.clientHeight
			},
			element: {
				x: x + rect.left,
				y: y + rect.top,
				width: rect.width,
				height: rect.height
			}
		};
	});
}



// LOAD and RELOAD


function _Browser_reload(skipCache)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		_VirtualDom_doc.location.reload(skipCache);
	}));
}

function _Browser_load(url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		try
		{
			_Browser_window.location = url;
		}
		catch(err)
		{
			// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.
			// Other browsers reload the page, so let's be consistent about that.
			_VirtualDom_doc.location.reload(false);
		}
	}));
}
var author$project$GlobalMessage$LinkClicked = function (a) {
	return {$: 'LinkClicked', a: a};
};
var author$project$GlobalMessage$UrlChanged = function (a) {
	return {$: 'UrlChanged', a: a};
};
var author$project$CustomTypes$SortByName = {$: 'SortByName'};
var author$project$CustomTypes$Character = F7(
	function (id, name, gender, characterSkillId, holderType, crestId, bannerId) {
		return {bannerId: bannerId, characterSkillId: characterSkillId, crestId: crestId, gender: gender, holderType: holderType, id: id, name: name};
	});
var author$project$CustomTypes$Female = {$: 'Female'};
var author$project$CustomTypes$Major = {$: 'Major'};
var author$project$CustomTypes$Male = {$: 'Male'};
var author$project$CustomTypes$Minor = {$: 'Minor'};
var author$project$CustomTypes$NonOwner = {$: 'NonOwner'};
var elm$core$Maybe$Just = function (a) {
	return {$: 'Just', a: a};
};
var elm$core$Maybe$Nothing = {$: 'Nothing'};
var elm$core$Basics$EQ = {$: 'EQ'};
var elm$core$Basics$LT = {$: 'LT'};
var elm$core$Elm$JsArray$foldr = _JsArray_foldr;
var elm$core$Array$foldr = F3(
	function (func, baseCase, _n0) {
		var tree = _n0.c;
		var tail = _n0.d;
		var helper = F2(
			function (node, acc) {
				if (node.$ === 'SubTree') {
					var subTree = node.a;
					return A3(elm$core$Elm$JsArray$foldr, helper, acc, subTree);
				} else {
					var values = node.a;
					return A3(elm$core$Elm$JsArray$foldr, func, acc, values);
				}
			});
		return A3(
			elm$core$Elm$JsArray$foldr,
			helper,
			A3(elm$core$Elm$JsArray$foldr, func, baseCase, tail),
			tree);
	});
var elm$core$List$cons = _List_cons;
var elm$core$Array$toList = function (array) {
	return A3(elm$core$Array$foldr, elm$core$List$cons, _List_Nil, array);
};
var elm$core$Basics$GT = {$: 'GT'};
var elm$core$Dict$foldr = F3(
	function (func, acc, t) {
		foldr:
		while (true) {
			if (t.$ === 'RBEmpty_elm_builtin') {
				return acc;
			} else {
				var key = t.b;
				var value = t.c;
				var left = t.d;
				var right = t.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldr, func, acc, right)),
					$temp$t = left;
				func = $temp$func;
				acc = $temp$acc;
				t = $temp$t;
				continue foldr;
			}
		}
	});
var elm$core$Dict$toList = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, list) {
				return A2(
					elm$core$List$cons,
					_Utils_Tuple2(key, value),
					list);
			}),
		_List_Nil,
		dict);
};
var elm$core$Dict$keys = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, keyList) {
				return A2(elm$core$List$cons, key, keyList);
			}),
		_List_Nil,
		dict);
};
var elm$core$Set$toList = function (_n0) {
	var dict = _n0.a;
	return elm$core$Dict$keys(dict);
};
var author$project$Character$initCharacters = _List_fromArray(
	[
		A7(author$project$CustomTypes$Character, 0, 'Byleth', author$project$CustomTypes$Male, 1, author$project$CustomTypes$Major, 1, elm$core$Maybe$Nothing),
		A7(author$project$CustomTypes$Character, 1, 'Byleth', author$project$CustomTypes$Female, 1, author$project$CustomTypes$Major, 1, elm$core$Maybe$Nothing),
		A7(
		author$project$CustomTypes$Character,
		2,
		'Edelgard',
		author$project$CustomTypes$Female,
		3,
		author$project$CustomTypes$Minor,
		17,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		3,
		'Hubert',
		author$project$CustomTypes$Male,
		8,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		4,
		'Ferdinand',
		author$project$CustomTypes$Male,
		10,
		author$project$CustomTypes$Minor,
		13,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		5,
		'Linhardt',
		author$project$CustomTypes$Male,
		13,
		author$project$CustomTypes$Minor,
		12,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		6,
		'Caspar',
		author$project$CustomTypes$Male,
		12,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		7,
		'Bernadetta',
		author$project$CustomTypes$Female,
		11,
		author$project$CustomTypes$Minor,
		14,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		8,
		'Dorothea',
		author$project$CustomTypes$Female,
		9,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		9,
		'Petra',
		author$project$CustomTypes$Female,
		14,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(0)),
		A7(
		author$project$CustomTypes$Character,
		10,
		'Dimitri',
		author$project$CustomTypes$Male,
		5,
		author$project$CustomTypes$Minor,
		2,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		11,
		'Dedue',
		author$project$CustomTypes$Male,
		16,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		12,
		'Felix',
		author$project$CustomTypes$Male,
		17,
		author$project$CustomTypes$Major,
		6,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		13,
		'Ashe',
		author$project$CustomTypes$Male,
		18,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		14,
		'Sylvain',
		author$project$CustomTypes$Male,
		20,
		author$project$CustomTypes$Minor,
		7,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		15,
		'Mercedes',
		author$project$CustomTypes$Female,
		15,
		author$project$CustomTypes$Minor,
		10,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		16,
		'Annette',
		author$project$CustomTypes$Female,
		19,
		author$project$CustomTypes$Minor,
		5,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		17,
		'Ingrid',
		author$project$CustomTypes$Female,
		21,
		author$project$CustomTypes$Minor,
		4,
		elm$core$Maybe$Just(1)),
		A7(
		author$project$CustomTypes$Character,
		18,
		'Claude',
		author$project$CustomTypes$Male,
		7,
		author$project$CustomTypes$Minor,
		11,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		19,
		'Lorenz',
		author$project$CustomTypes$Male,
		22,
		author$project$CustomTypes$Minor,
		8,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		20,
		'Raphael',
		author$project$CustomTypes$Male,
		24,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		21,
		'Ignatz',
		author$project$CustomTypes$Male,
		26,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		22,
		'Lysithea',
		author$project$CustomTypes$Female,
		25,
		author$project$CustomTypes$Major,
		8,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		23,
		'Marianne',
		author$project$CustomTypes$Female,
		27,
		author$project$CustomTypes$Minor,
		16,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		24,
		'Hilda',
		author$project$CustomTypes$Female,
		23,
		author$project$CustomTypes$Minor,
		9,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		25,
		'Leonie',
		author$project$CustomTypes$Female,
		28,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(2)),
		A7(
		author$project$CustomTypes$Character,
		26,
		'Seteth',
		author$project$CustomTypes$Male,
		32,
		author$project$CustomTypes$Major,
		13,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		27,
		'Flayn',
		author$project$CustomTypes$Female,
		33,
		author$project$CustomTypes$Major,
		12,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		28,
		'Manuela',
		author$project$CustomTypes$Female,
		29,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		29,
		'Hanneman',
		author$project$CustomTypes$Male,
		30,
		author$project$CustomTypes$Minor,
		14,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		30,
		'Catherine',
		author$project$CustomTypes$Female,
		31,
		author$project$CustomTypes$Major,
		3,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		31,
		'Gilbert',
		author$project$CustomTypes$Male,
		35,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		32,
		'Alois',
		author$project$CustomTypes$Male,
		32,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		33,
		'Shamir',
		author$project$CustomTypes$Female,
		36,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(3)),
		A7(
		author$project$CustomTypes$Character,
		34,
		'Cyril',
		author$project$CustomTypes$Male,
		37,
		author$project$CustomTypes$NonOwner,
		0,
		elm$core$Maybe$Just(3))
	]);
var author$project$GlobalModel$DataModel = F7(
	function (studies, jobCategories, jobs, jobSkills, masterySkills, standardSkills, characters) {
		return {characters: characters, jobCategories: jobCategories, jobSkills: jobSkills, jobs: jobs, masterySkills: masterySkills, standardSkills: standardSkills, studies: studies};
	});
var author$project$CustomTypes$Authority = {$: 'Authority'};
var author$project$CustomTypes$Axe = {$: 'Axe'};
var author$project$CustomTypes$Bow = {$: 'Bow'};
var author$project$CustomTypes$Brawling = {$: 'Brawling'};
var author$project$CustomTypes$CanUseMagic = {$: 'CanUseMagic'};
var author$project$CustomTypes$CanUseSomeMagic = {$: 'CanUseSomeMagic'};
var author$project$CustomTypes$Faith = {$: 'Faith'};
var author$project$CustomTypes$Flying = {$: 'Flying'};
var author$project$CustomTypes$HeavyArmor = {$: 'HeavyArmor'};
var author$project$CustomTypes$Job = function (id) {
	return function (idPicture) {
		return function (name) {
			return function (jobCategoryId) {
				return function (proficiencyList) {
					return function (studyIdList) {
						return function (gender) {
							return function (magicUsage) {
								return function (note) {
									return function (customExperience) {
										return function (onlyCharacters) {
											return function (canFly) {
												return {canFly: canFly, customExperience: customExperience, gender: gender, id: id, idPicture: idPicture, jobCategoryId: jobCategoryId, magicUsage: magicUsage, name: name, note: note, onlyCharacters: onlyCharacters, proficiencyList: proficiencyList, studyIdList: studyIdList};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$CustomTypes$Lance = {$: 'Lance'};
var author$project$CustomTypes$Proficiency = F2(
	function (subject, bonus) {
		return {bonus: bonus, subject: subject};
	});
var author$project$CustomTypes$Reason = {$: 'Reason'};
var author$project$CustomTypes$Riding = {$: 'Riding'};
var author$project$CustomTypes$Sword = {$: 'Sword'};
var elm$core$Basics$False = {$: 'False'};
var elm$core$Basics$True = {$: 'True'};
var author$project$Job$initJobs = _List_fromArray(
	[
		author$project$CustomTypes$Job(0)(0)('Commoner')(0)(_List_Nil)(_List_Nil)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseSomeMagic))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(_List_Nil)(false),
		author$project$CustomTypes$Job(1)(1)('Noble')(0)(_List_Nil)(_List_Nil)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseSomeMagic))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(_List_Nil)(false),
		author$project$CustomTypes$Job(39)(39)('Dancer')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(100))(_List_Nil)(false),
		author$project$CustomTypes$Job(40)(40)('Enlightened One')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(
		elm$core$Maybe$Just('Byleth only'))(
		elm$core$Maybe$Just(100))(
		_List_fromArray(
			[0, 1]))(false),
		author$project$CustomTypes$Job(41)(41)('Armored Lord')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$HeavyArmor, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Edelgard only'))(
		elm$core$Maybe$Just(150))(
		_List_fromArray(
			[2]))(false),
		author$project$CustomTypes$Job(42)(42)('Emperor')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$HeavyArmor, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Edelgard only'))(
		elm$core$Maybe$Just(200))(
		_List_fromArray(
			[2]))(false),
		author$project$CustomTypes$Job(43)(43)('High Lord')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Dimitri only'))(
		elm$core$Maybe$Just(150))(
		_List_fromArray(
			[10]))(false),
		author$project$CustomTypes$Job(44)(44)('Great Lord')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Dimitri only'))(
		elm$core$Maybe$Just(200))(
		_List_fromArray(
			[10]))(false),
		author$project$CustomTypes$Job(45)(45)('Wyvern Master')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Claude only'))(
		elm$core$Maybe$Just(150))(
		_List_fromArray(
			[18]))(true),
		author$project$CustomTypes$Job(46)(46)('Barbarossa')(0)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 3)
			]))(_List_Nil)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Claude only'))(
		elm$core$Maybe$Just(200))(
		_List_fromArray(
			[18]))(true),
		author$project$CustomTypes$Job(2)(2)('Myrmidon')(1)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 1)
			]))(
		_List_fromArray(
			[2]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(3)(3)('Soldier')(1)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 1)
			]))(
		_List_fromArray(
			[14]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(4)(4)('Fighter')(1)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 1)
			]))(
		_List_fromArray(
			[26, 38, 50]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(5)(5)('Monk')(1)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 1)
			]))(
		_List_fromArray(
			[62, 74]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(6)(6)('Lord')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Authority, 2)
			]))(
		_List_fromArray(
			[3, 89]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just('Edelgard, Dimitri and Claude only'))(elm$core$Maybe$Nothing)(
		_List_fromArray(
			[2, 10, 18]))(false),
		author$project$CustomTypes$Job(7)(7)('Mercenary')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 1)
			]))(
		_List_fromArray(
			[4]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(8)(8)('Thief')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 1)
			]))(
		_List_fromArray(
			[4]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(9)(9)('Cavalier')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Riding, 2)
			]))(
		_List_fromArray(
			[16, 111]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(10)(10)('Pegasus Knight')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 2)
			]))(
		_List_fromArray(
			[16, 123]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Female))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(true),
		author$project$CustomTypes$Job(11)(11)('Brigand')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 1)
			]))(
		_List_fromArray(
			[28]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(12)(12)('Armored Knight')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$HeavyArmor, 1)
			]))(
		_List_fromArray(
			[28, 99]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(13)(13)('Archer')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 2)
			]))(
		_List_fromArray(
			[40]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(14)(14)('Brawler')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 1)
			]))(
		_List_fromArray(
			[52]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(15)(15)('Mage')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 1)
			]))(
		_List_fromArray(
			[64]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(16)(16)('Dark Mage')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 1)
			]))(
		_List_fromArray(
			[64]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(17)(17)('Priest')(2)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 1),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 2)
			]))(
		_List_fromArray(
			[76]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(18)(18)('Swordmaster')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3)
			]))(
		_List_fromArray(
			[8]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(19)(19)('Hero')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 2)
			]))(
		_List_fromArray(
			[6, 28]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(20)(20)('Assassin')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 2)
			]))(
		_List_fromArray(
			[6, 40]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(21)(21)('Paladin')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Riding, 3)
			]))(
		_List_fromArray(
			[18, 115]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(22)(22)('Warrior')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3)
			]))(
		_List_fromArray(
			[32]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(23)(23)('Fortress Knight')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$HeavyArmor, 3)
			]))(
		_List_fromArray(
			[30, 103]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(24)(24)('Wyvern Rider')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 2)
			]))(
		_List_fromArray(
			[30, 125]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(true),
		author$project$CustomTypes$Job(25)(25)('Sniper')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 3)
			]))(
		_List_fromArray(
			[44]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(26)(26)('Grappler')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 3)
			]))(
		_List_fromArray(
			[56]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(27)(27)('Warlock')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 2)
			]))(
		_List_fromArray(
			[68]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(28)(28)('Dark Bishop')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 2)
			]))(
		_List_fromArray(
			[68]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(29)(29)('Bishop')(3)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 2),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 3)
			]))(
		_List_fromArray(
			[80]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(30)(30)('Mortal Savant')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 3)
			]))(
		_List_fromArray(
			[8, 67]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(31)(33)('Falcon Knight')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Sword, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 3)
			]))(
		_List_fromArray(
			[4, 20, 128]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Female))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(true),
		author$project$CustomTypes$Job(32)(34)('War Master')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Brawling, 3)
			]))(
		_List_fromArray(
			[32, 54]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Male))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(33)(32)('Wyvern Lord')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Flying, 3)
			]))(
		_List_fromArray(
			[16, 32, 129]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(true),
		author$project$CustomTypes$Job(34)(31)('Great Knight')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Axe, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$HeavyArmor, 3)
			]))(
		_List_fromArray(
			[31, 105, 116]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(35)(35)('Bow Knight')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Bow, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Riding, 3)
			]))(
		_List_fromArray(
			[16, 44, 117]))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(36)(37)('Gremory')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 3)
			]))(
		_List_fromArray(
			[68, 80]))(
		elm$core$Maybe$Just(author$project$CustomTypes$Female))(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(37)(36)('Dark Knight')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Reason, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Riding, 3)
			]))(
		_List_fromArray(
			[16, 67, 117]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false),
		author$project$CustomTypes$Job(38)(38)('Holy Knight')(4)(
		_List_fromArray(
			[
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Lance, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Faith, 3),
				A2(author$project$CustomTypes$Proficiency, author$project$CustomTypes$Riding, 3)
			]))(
		_List_fromArray(
			[16, 79, 117]))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(author$project$CustomTypes$CanUseMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false)
	]);
var author$project$CustomTypes$Advanced = {$: 'Advanced'};
var author$project$CustomTypes$Beginner = {$: 'Beginner'};
var author$project$CustomTypes$Intermediate = {$: 'Intermediate'};
var author$project$CustomTypes$JobCategory = F4(
	function (id, category, experience, level) {
		return {category: category, experience: experience, id: id, level: level};
	});
var author$project$CustomTypes$Master = {$: 'Master'};
var author$project$CustomTypes$Unique = {$: 'Unique'};
var author$project$JobCategory$initJobCategories = _List_fromArray(
	[
		A4(author$project$CustomTypes$JobCategory, 0, author$project$CustomTypes$Unique, elm$core$Maybe$Nothing, elm$core$Maybe$Nothing),
		A4(
		author$project$CustomTypes$JobCategory,
		1,
		author$project$CustomTypes$Beginner,
		elm$core$Maybe$Just(60),
		elm$core$Maybe$Just(5)),
		A4(
		author$project$CustomTypes$JobCategory,
		2,
		author$project$CustomTypes$Intermediate,
		elm$core$Maybe$Just(100),
		elm$core$Maybe$Just(10)),
		A4(
		author$project$CustomTypes$JobCategory,
		3,
		author$project$CustomTypes$Advanced,
		elm$core$Maybe$Just(150),
		elm$core$Maybe$Just(20)),
		A4(
		author$project$CustomTypes$JobCategory,
		4,
		author$project$CustomTypes$Master,
		elm$core$Maybe$Just(200),
		elm$core$Maybe$Just(30))
	]);
var author$project$CustomTypes$JobSkill = function (id) {
	return function (pictureId) {
		return function (name) {
			return function (jobIdList) {
				return function (combatArt) {
					return function (description) {
						return function (durabilityCost) {
							return function (might) {
								return function (hit) {
									return function (avoid) {
										return function (criticalRate) {
											return function (range) {
												return {avoid: avoid, combatArt: combatArt, criticalRate: criticalRate, description: description, durabilityCost: durabilityCost, hit: hit, id: id, jobIdList: jobIdList, might: might, name: name, pictureId: pictureId, range: range};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$JobSkill$initJobSkills = _List_fromArray(
	[
		author$project$CustomTypes$JobSkill(0)(140)('Charm')(
		_List_fromArray(
			[6, 41, 42, 43, 44, 45, 46]))(false)('When allies adjacent to unit enter combat, allies gain +3 Damage.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(1)(151)('Canto')(
		_List_fromArray(
			[9, 10, 21, 24, 31, 33, 34, 35, 37, 38, 45, 46]))(false)('After performing an action, user can use their leftover movement.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(2)(180)('Unarmed Combat')(
		_List_fromArray(
			[14, 26]))(false)('User can fight without a weapon equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(3)(164)('Fire')(
		_List_fromArray(
			[15]))(false)('Enables the use of Fire. If already learned, doubles the number of uses.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(4)(166)('Miasma Δ')(
		_List_fromArray(
			[16, 28]))(false)('Enables the use of Miasma Δ. If already learned, doubles the number of uses.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(5)(165)('Heartseeker')(
		_List_fromArray(
			[16, 28]))(false)('Reduces Avoid of adjacent foes by 20.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(6)(179)('Steal')(
		_List_fromArray(
			[8]))(false)('Unit can steal non-weapon items from enemies with lower Spd than self.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(7)(142)('Locktouch')(
		_List_fromArray(
			[8, 20]))(false)('Unit can open locks and chests without keys.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(8)(71)('Avoid +10')(
		_List_fromArray(
			[10, 31, 33]))(false)('Increases Avoid by 10.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(9)(95)('Bowrange +1')(
		_List_fromArray(
			[13, 25]))(false)('Increases range of Bows by 1.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(10)(96)('Bowrange +2')(
		_List_fromArray(
			[35]))(false)('Increases range of Bows by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(11)(145)('Heal')(
		_List_fromArray(
			[17]))(false)('Unit can use Heal. If it has already been learnt, the number of times it can be used is doubled.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(12)(146)('White Magic Heal +5')(
		_List_fromArray(
			[17]))(false)('White Magic heals +5 more HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(13)(147)('White Magic Heal +10')(
		_List_fromArray(
			[29]))(false)('White Magic heals +10 more HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(14)(73)('Swordfaire')(
		_List_fromArray(
			[18, 19, 20, 30, 40]))(false)('Might +5 when a sword is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(15)(74)('Axefaire')(
		_List_fromArray(
			[22, 23, 24, 32, 33, 34, 41, 42]))(false)('Might +5 when an axe is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(16)(75)('Lancefaire')(
		_List_fromArray(
			[21, 31, 34, 43, 44]))(false)('Might +5 when a lance is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(17)(76)('Bowfaire')(
		_List_fromArray(
			[25, 35, 45, 46]))(false)('Might +5 when a bow is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(18)(77)('Fistfaire')(
		_List_fromArray(
			[26, 32]))(false)('Might +5 when a gauntlet is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(19)(78)('Black Tomefaire')(
		_List_fromArray(
			[27, 30, 37]))(false)('Might +5 when Black Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(20)(79)('Dark Tomefaire')(
		_List_fromArray(
			[37]))(false)('Might +5 when Dark Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(21)(80)('White Tomefaire')(
		_List_fromArray(
			[38]))(false)('Might +5 when White Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(22)(157)('Vantage')(
		_List_fromArray(
			[19]))(false)('Always attack first when under 50% HP.\ufeff')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(23)(178)('Weight -5')(
		_List_fromArray(
			[23]))(false)('The combined weight of equipment is reduced by 5.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(24)(181)('Terrain Resistance')(
		_List_fromArray(
			[21, 29, 38, 40]))(false)('Unit does not receive terrain damage.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(25)(97)('Black Magic Uses x2')(
		_List_fromArray(
			[27, 36]))(false)('Doubles the number of uses of Black Magic spells.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(26)(98)('Dark Magic uses x2')(
		_List_fromArray(
			[36]))(false)('Doubles the number of uses of Dark Magic spells.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(27)(99)('White Magic uses x2')(
		_List_fromArray(
			[27, 36]))(false)('Doubles the number of uses of White Magic spells.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(28)(52)('Sword Critical +10')(
		_List_fromArray(
			[18]))(false)('Critical +10 when equipped with a sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(29)(182)('Stealth')(
		_List_fromArray(
			[8, 20]))(false)('Unit is less likely to be targeted by enemies.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(30)(54)('Axe Critical +10')(
		_List_fromArray(
			[22]))(false)('Critical +10 when equipped with an axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(31)(60)('Critical +20')(
		_List_fromArray(
			[32]))(false)('Critical +20.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$JobSkill(32)(109)('Fiendish Blow')(
		_List_fromArray(
			[29]))(false)('Mag +6 when initiating attack.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)
	]);
var author$project$CustomTypes$MasterySkill = function (id) {
	return function (pictureId) {
		return function (name) {
			return function (jobIdList) {
				return function (combatArt) {
					return function (description) {
						return function (durabilityCost) {
							return function (might) {
								return function (hit) {
									return function (avoid) {
										return function (criticalRate) {
											return function (range) {
												return {avoid: avoid, combatArt: combatArt, criticalRate: criticalRate, description: description, durabilityCost: durabilityCost, hit: hit, id: id, jobIdList: jobIdList, might: might, name: name, pictureId: pictureId, range: range};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var elm$core$Basics$negate = function (n) {
	return -n;
};
var author$project$MasterySkill$initMasterySkills = _List_fromArray(
	[
		author$project$CustomTypes$MasterySkill(0)(122)('HP +5')(
		_List_fromArray(
			[0, 1]))(false)('Increases HP by 5.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(1)(123)('Speed +2')(
		_List_fromArray(
			[2]))(false)('Increases Spd by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(2)(124)('Defense +2')(
		_List_fromArray(
			[3]))(false)('Increases Def by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(4)(125)('Strength +2')(
		_List_fromArray(
			[4]))(false)('Increases Str by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(6)(127)('Magic +2')(
		_List_fromArray(
			[5]))(false)('Increases Mag by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(8)(128)('Resistance +2')(
		_List_fromArray(
			[6]))(false)('Increases Res by 2.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(10)(157)('Vantage')(
		_List_fromArray(
			[7]))(false)('Always attack first when under 50% HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(11)(179)('Steal')(
		_List_fromArray(
			[8]))(false)('Unit can steal non-weapon items from enemies with lower Spd than self.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(12)(160)('Desperation')(
		_List_fromArray(
			[9]))(false)('If unit initiates combat with HP ≤ 50%, unit’s follow-up attack (if possible) occurs before foe’s counterattack.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(13)(110)('Darting Blow')(
		_List_fromArray(
			[10]))(false)('If unit initiates combat, grants AS +6 during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(14)(111)('Death Blow')(
		_List_fromArray(
			[11]))(false)('If unit initiates combat, grants Str +6 during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(15)(112)('Armored Blow')(
		_List_fromArray(
			[12]))(false)('If unit initiates combat, grants Def +6 during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(16)(170)('Hit +20')(
		_List_fromArray(
			[13]))(false)('Increases Hit by 20.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(17)(180)('Unarmed Combat')(
		_List_fromArray(
			[14]))(false)('User can fight without a weapon equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(18)(109)('Fiendish Blow')(
		_List_fromArray(
			[15]))(false)('If unit initiates combat, grants Mag+6 during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(19)(167)('Poison Strike')(
		_List_fromArray(
			[16]))(false)('If unit initiates combat, enemy loses up to 20% HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(20)(176)('Miracle')(
		_List_fromArray(
			[17]))(false)('Luck\u00a0% chance to survive lethal damage with 1HP if HP is above 1.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(22)(135)('Defiant Str')(
		_List_fromArray(
			[19]))(false)('Grants Str +8 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(23)(168)('Lethality')(
		_List_fromArray(
			[20]))(false)('Chance to instantly kill a foe when dealing damage. Trigger\u00a0% = 0.25×Dex.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(24)(171)('Aegis')(
		_List_fromArray(
			[21]))(false)('Chance to reduce bow/magic damage by half. Trigger\u00a0% = Dex stat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(25)(185)('Wrath')(
		_List_fromArray(
			[22]))(false)('If foe initiates combat while unit’s HP is ≤ 50%, grants Crit +50.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(26)(172)('Pavise')(
		_List_fromArray(
			[23]))(false)('Chance to reduce sword/lance/axe/brawling damage by half. Trigger\u00a0% = Dex stat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(27)(88)('Seal Defense')(
		_List_fromArray(
			[24]))(false)('If unit damages foe during combat, foe suffers Def -6 for 1 turn after combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(28)(85)('Tomebreaker')(
		_List_fromArray(
			[26]))(false)('Grants Hit/Avo +20 when brawling against magic users.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(29)(84)('Bowbreaker')(
		_List_fromArray(
			[27]))(false)('Grants Hit/Avo +20 when using magic against bow users.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(30)(150)('Lifetaker')(
		_List_fromArray(
			[28]))(false)('Unit recovers HP equal to 50% of damage dealt after defeating a foe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(31)(149)('Renewal')(
		_List_fromArray(
			[29]))(false)('Unit recovers up to 20% of max HP at the start of each turn.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(32)(113)('Warding Blow')(
		_List_fromArray(
			[30]))(false)('If unit initiates combat, grants Res +6 during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(33)(70)('Defiant Avo')(
		_List_fromArray(
			[31]))(false)('Grants Avo +30 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(34)(162)('Quick Riposte')(
		_List_fromArray(
			[32]))(false)('If foe initiates combat while unit’s HP is ≥ 50%, unit makes guaranteed follow-up attack.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(35)(61)('Defiant Crit')(
		_List_fromArray(
			[33]))(false)('Grants Crit +50 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(36)(136)('Defiant Def')(
		_List_fromArray(
			[34]))(false)('Grants Def +8 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(37)(139)('Defiant Spd')(
		_List_fromArray(
			[35]))(false)('Grants Spd +8 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(38)(138)('Defiant Mag')(
		_List_fromArray(
			[36]))(false)('Grants Mag +8 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(39)(89)('Seal Resistance')(
		_List_fromArray(
			[37]))(false)('If unit damages foe during combat, foe suffers Res -6 for 1 turn after combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(40)(137)('Defiant Res')(
		_List_fromArray(
			[38]))(false)('Grants Res +8 when HP is ≤ 25%.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(41)(184)('Special Dance')(
		_List_fromArray(
			[39]))(false)('Dex/Spd/Luck +4 to target ally when using Dance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(43)(183)('Sacred Power')(
		_List_fromArray(
			[40]))(false)('Adjacent allies deal 3 extra damage and take 3 less damage during combat.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(44)(144)('Pomp & Circumstance')(
		_List_fromArray(
			[41, 43, 45]))(false)('Increases Lck/Cha by 4.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$MasterySkill(3)(191)('Reposition')(
		_List_fromArray(
			[3]))(true)('User moves ally to the space behind the user.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(5)(191)('Shove')(
		_List_fromArray(
			[4]))(true)('User pushes ally forward 1 space.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(7)(191)('Draw Back')(
		_List_fromArray(
			[5]))(true)('User moves 1 space backwards and ally is moved to where the user was previously.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(9)(186)('Subdue')(
		_List_fromArray(
			[6]))(true)('Leaves foe with at least 1 HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(21)(191)('Swap')(
		_List_fromArray(
			[18]))(true)('User swaps places with an ally.')(
		elm$core$Maybe$Just(3))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(42)(186)('Sword Dance')(
		_List_fromArray(
			[39]))(true)('Might increases based on user’s Charm.')(
		elm$core$Maybe$Just(2))(
		elm$core$Maybe$Just(1))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(45)(189)('Hunter\'s Volley')(
		_List_fromArray(
			[25]))(true)('Triggers 2 consecutive hits.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(1))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$MasterySkill(46)(190)('Fierce Iron Fist')(
		_List_fromArray(
			[26]))(true)('Triggers 3 consecutive hits.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(1))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(47)(188)('Flickering Flower')(
		_List_fromArray(
			[42]))(true)('After combat, prevents foe from moving for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(48)(187)('Paraselene')(
		_List_fromArray(
			[44]))(true)('After combat, user moves 1 space backwards.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(49)(189)('Wind God')(
		_List_fromArray(
			[46]))(true)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$MasterySkill(50)(186)('Assassinate')(
		_List_fromArray(
			[20]))(true)('Can kill enemies instantly.')(
		elm$core$Maybe$Just(5))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(15))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(51)(186)('Astra')(
		_List_fromArray(
			[18]))(true)('5 consecutive hits at 30% Mt.')(
		elm$core$Maybe$Just(9))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(-10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(52)(191)('Triangle Attack')(
		_List_fromArray(
			[10]))(true)('Can only be triggered when 3 allied Flying units (including the user) are adjacent to the same enemy. Only user needs to know Triangle Attack.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(8))(
		elm$core$Maybe$Just(30))(
		elm$core$Maybe$Just(40))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$MasterySkill(53)(188)('War Master\'s Strike')(
		_List_fromArray(
			[32]))(true)('Effective against all foes.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(30))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1)))
	]);
var author$project$CustomTypes$StandardSkill = function (id) {
	return function (pictureId) {
		return function (name) {
			return function (studyId) {
				return function (combatArt) {
					return function (charactersOnly) {
						return function (allExcept) {
							return function (description) {
								return function (durabilityCost) {
									return function (might) {
										return function (hit) {
											return function (avoid) {
												return function (criticalRate) {
													return function (range) {
														return {allExcept: allExcept, avoid: avoid, charactersOnly: charactersOnly, combatArt: combatArt, criticalRate: criticalRate, description: description, durabilityCost: durabilityCost, hit: hit, id: id, might: might, name: name, pictureId: pictureId, range: range, studyId: studyId};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$StandardSkill$initStandardSkills = _List_fromArray(
	[
		author$project$CustomTypes$StandardSkill(0)(11)('Sword Prowess Lv.1')(1)(false)(_List_Nil)(false)('Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(2)(12)('Sword Prowess Lv.2')(3)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(4)(13)('Sword Prowess Lv.3')(5)(false)(_List_Nil)(false)('Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(10)(83)('Axebreaker')(6)(false)(_List_Nil)(false)('Grants Hit/Avo +20 when using a sword against axe users.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(11)(14)('Sword Prowess Lv.4')(7)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(15)(15)('Sword Prowess Lv.5')(9)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(16)(52)('Sword Critical +10')(10)(false)(_List_Nil)(false)('Grants Crit +10 when using a sword.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(17)(73)('Swordfaire')(11)(false)(_List_Nil)(false)('Might +5 when a sword is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(18)(16)('Lance Prowess Lv.1')(13)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(20)(17)('Lance Prowess Lv.2')(15)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(22)(18)('Lance Prowess Lv.3')(17)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(28)(81)('Swordbreaker')(18)(false)(_List_Nil)(false)('Grants Hit/Avo +20 when using a lance against sword users.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(29)(19)('Lance Prowess Lv.4')(19)(false)(_List_Nil)(false)('Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(34)(21)('Lance Prowess Lv.5')(21)(false)(_List_Nil)(false)('Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(35)(53)('Lance Critical +10')(22)(false)(_List_Nil)(false)('Grants Crit +10 when using a lance.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(36)(75)('Lancefaire')(23)(false)(_List_Nil)(false)('Might +5 when a lance is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(37)(22)('Axe Prowess Lv.1')(25)(false)(_List_Nil)(false)('Grants Hit +7, Avoid +5 and Critical Evade +5 when equipped with Axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(39)(23)('Axe Prowess Lv.2')(27)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +6 and Critical Evade +6 when equipped with Axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(41)(24)('Axe Prowess Lv.3')(29)(false)(_List_Nil)(false)('Grants Hit +13, Avoid +7 and Critical Evade +7 when equipped with Axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(47)(82)('Lancebreaker')(30)(false)(_List_Nil)(false)('Grants Hit/Avo +20 when using an axe against lance users.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(48)(25)('Axe Prowess Lv.4')(31)(false)(_List_Nil)(false)('Grants Hit +16, Avoid +8 and Critical Evade +8 when equipped with Axe')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(53)(26)('Axe Prowess Lv.5')(33)(false)(_List_Nil)(false)('Grants Hit +20, Avoid +10 and Critical Evade +10 when equipped with Axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(54)(54)('Axe Critical +10')(34)(false)(_List_Nil)(false)('Grants Crit +10 when using an axe.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(55)(74)('Axefaire')(35)(false)(_List_Nil)(false)('Might +5 when an axe is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(56)(27)('Bow Prowess Lv.1')(37)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(58)(28)('Bow Prowess Lv.2')(39)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(59)(169)('Close Counter')(40)(false)(_List_Nil)(false)('Allows unit to counterattack adjacent foes.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(67)(29)('Bow Prowess Lv.3')(41)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(68)(30)('Bow Prowess Lv.4')(43)(false)(_List_Nil)(false)('Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(74)(31)('Bow Prowess Lv.5')(45)(false)(_List_Nil)(false)('Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(75)(55)('Bow Critical +10')(46)(false)(_List_Nil)(false)('Grants Crit +10 when using a bow.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(76)(76)('Bowfaire')(47)(false)(_List_Nil)(false)('Might +5 when a bow is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(77)(32)('Brawling Prowess Lv.1')(49)(false)(_List_Nil)(false)('Grants Hit +5, Avoid +7 and Critical Evade +5 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(79)(33)('Brawling Prowess Lv.2')(51)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +10 and Critical Evade +6 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(81)(34)('Brawling Prowess Lv.3')(53)(false)(_List_Nil)(false)('Grants Hit +7, Avoid +13 and Critical Evade +7 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(88)(35)('Brawling Prowess Lv.4')(55)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +16 and Critical Evade +8 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(93)(36)('Brawling Prowess Lv.5')(57)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +20 and Critical Evade +10 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(94)(56)('Brawl Critical +10')(58)(false)(_List_Nil)(false)('Grants Crit +10 when brawling.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(95)(77)('Fistfaire')(59)(false)(_List_Nil)(false)('Might +5 when a gauntlet is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(96)(37)('Reason Prowess Lv.1')(61)(false)(_List_Nil)(false)('Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Reason Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(97)(38)('Reason Prowess Lv.2')(63)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Reason Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(98)(39)('Reason Prowess Lv.3')(65)(false)(_List_Nil)(false)('Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Reason Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(99)(40)('Reason Prowess Lv.4')(67)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Reason Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(100)(41)('Reason Prowess Lv.5')(69)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Reason Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(101)(92)('Black Magic Range +1')(70)(false)(
		_List_fromArray(
			[2, 3, 22]))(true)('Increases black magic range by 1.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(102)(93)('Dark Magic Range +1')(70)(false)(
		_List_fromArray(
			[2, 3, 22]))(false)('Increases dark magic range by 1.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(103)(78)('Black Tomefaire')(71)(false)(
		_List_fromArray(
			[2, 3, 22]))(true)('Might +5 when Black Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(104)(79)('Dark Tomefaire')(71)(false)(
		_List_fromArray(
			[2, 3, 22]))(false)('Might +5 when Dark Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(105)(42)('Faith Prowess Lv.1')(73)(false)(_List_Nil)(false)('Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Faith Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(106)(43)('Faith Prowess Lv.2')(75)(false)(_List_Nil)(false)('Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Faith Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(107)(44)('Faith Prowess Lv.3')(77)(false)(_List_Nil)(false)('Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Faith Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(108)(45)('Faith Prowess Lv.4')(79)(false)(_List_Nil)(false)('Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Faith Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(109)(46)('Faith Prowess Lv.5')(81)(false)(_List_Nil)(false)('Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Faith Magic.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(110)(94)('White Magic Range +1')(82)(false)(_List_Nil)(false)('Increases White Magic range by 1 for attacks that damage foes.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(111)(80)('White Tomefaire')(83)(false)(_List_Nil)(false)('Might +5 when White Magic is equipped.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(112)(47)('Authority Prowess Lv.1')(85)(false)(_List_Nil)(false)('Grants Mt +2 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(113)(100)('Rally Magic')(86)(false)(
		_List_fromArray(
			[3, 17]))(false)('Use Rally to grant Mag +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(114)(101)('Rally Charm')(86)(false)(
		_List_fromArray(
			[8, 28]))(false)('Use Rally to grant Cha +8 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(115)(102)('Rally Dexterity')(86)(false)(
		_List_fromArray(
			[4]))(false)('Use Rally to grant Dex +8 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(116)(103)('Rally Resistance')(86)(false)(
		_List_fromArray(
			[16]))(false)('Use Rally to grant Res +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(117)(104)('Rally Strength')(86)(false)(
		_List_fromArray(
			[20, 32]))(false)('Use Rally to grant Str +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(118)(105)('Rally Speed')(86)(false)(
		_List_fromArray(
			[21]))(false)('Use Rally to grant Spd +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(119)(106)('Rally Defense')(86)(false)(
		_List_fromArray(
			[26, 31]))(false)('Use Rally to grant Def +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(120)(107)('Rally Luck')(86)(false)(
		_List_fromArray(
			[27]))(false)('Use Rally to grant Lck +8 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(121)(48)('Authority Prowess Lv.2')(87)(false)(_List_Nil)(false)('Grants Mt +4 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(122)(158)('Battalion Vantage')(88)(false)(
		_List_fromArray(
			[0, 1, 2, 12, 24, 19, 30]))(false)('When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(123)(154)('Battalion Wrath')(88)(false)(
		_List_fromArray(
			[3, 6, 7, 9, 10, 11, 20, 24, 26, 31, 32]))(false)('If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(124)(159)('Battalion Desperation')(88)(false)(
		_List_fromArray(
			[4, 8, 13, 17, 18, 21, 22, 25, 29, 33, 34]))(false)('If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(125)(152)('Battalion Renewal')(88)(false)(
		_List_fromArray(
			[5, 15, 16, 23, 27, 28]))(false)('Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(126)(49)('Authority Prowess Lv.3')(89)(false)(_List_Nil)(false)('Grants Mt +6 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(127)(102)('Rally Dexterity')(89)(false)(
		_List_fromArray(
			[21]))(false)('Use Rally to grant Dex +8 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(128)(103)('Rally Resistance')(89)(false)(
		_List_fromArray(
			[3]))(false)('Use Rally to grant Res +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(129)(105)('Rally Speed')(89)(false)(
		_List_fromArray(
			[16]))(false)('Use Rally to grant Spd +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(130)(183)('Model Leader')(89)(false)(
		_List_fromArray(
			[0, 1, 2, 10, 18, 26]))(false)('Doubles experience earned for battalions.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(131)(155)('Defense Tactics')(90)(false)(_List_Nil)(false)('Battalion endurance takes half damage.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(132)(50)('Authority Prowess Lv.4')(91)(false)(_List_Nil)(false)('Grants Mt +8 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(133)(158)('Battalion Vantage')(92)(false)(
		_List_fromArray(
			[10, 21]))(false)('When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(134)(154)('Battalion Wrath')(92)(false)(
		_List_fromArray(
			[16, 18]))(false)('If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(135)(159)('Battalion Desperation')(92)(false)(
		_List_fromArray(
			[0, 1, 3, 26]))(false)('If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(136)(152)('Battalion Renewal')(92)(false)(
		_List_fromArray(
			[2]))(false)('Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(137)(51)('Authority Prowess Lv.5')(93)(false)(_List_Nil)(false)('Grants Mt +10 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(138)(101)('Rally Charm')(94)(false)(
		_List_fromArray(
			[2, 10, 18]))(false)('Use Rally to grant Cha +8 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(139)(103)('Rally Resistance')(94)(false)(
		_List_fromArray(
			[26]))(false)('Use Rally to grant Res +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(140)(104)('Rally Strength')(94)(false)(
		_List_fromArray(
			[21]))(false)('Use Rally to grant Str +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(141)(105)('Rally Speed')(94)(false)(
		_List_fromArray(
			[3]))(false)('Use Rally to grant Spd +4 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(142)(108)('Rally Movement')(94)(false)(
		_List_fromArray(
			[0, 1, 16]))(false)('Use Rally to grant Mv +1 to an ally.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(143)(156)('Offensive Tactics')(95)(false)(_List_Nil)(false)('Grants Mt +5 and Hit +20 with gambits.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(144)(177)('Weight -3')(100)(false)(_List_Nil)(false)('The combined weight of equipment is reduced by 3.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(145)(190)('Smite')(102)(true)(_List_Nil)(false)('User pushes ally foward 2 spaces.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(146)(178)('Weight -5')(105)(false)(_List_Nil)(false)('The combined weight of equipment is reduced by 5.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(147)(173)('Armored Effect Null')(107)(false)(_List_Nil)(false)('Nullifies any extra effectiveness against armored units.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(148)(126)('Dexterity +4')(112)(false)(_List_Nil)(false)('Increases Dex by 4.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(149)(129)('Movement +1')(117)(false)(_List_Nil)(false)('Increases Mv by 1.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(150)(174)('Cavalry Effect Null')(119)(false)(_List_Nil)(false)('Nullifies any extra effectiveness against cavalry units.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(151)(130)('Alert Stance+')(126)(false)(_List_Nil)(false)('If unit takes no action except Wait, grants Avo +15 for 1 turn.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(152)(131)('Alert Stance+')(129)(false)(_List_Nil)(false)('If unit takes no action except Wait, grants Avo +30 for 1 turn.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(153)(175)('Flying Effect Null')(131)(false)(_List_Nil)(false)('Nullifies any extra effectiveness against flying units.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
		author$project$CustomTypes$StandardSkill(1)(186)('Wrath Strike')(2)(true)(_List_Nil)(false)('')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(3)(186)('Grounder')(4)(true)(_List_Nil)(false)('Effective against Flying enemies.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(5)(186)('Bane of Monsters')(5)(true)(
		_List_fromArray(
			[0, 1, 9, 18, 30]))(false)('Effective against Monsters.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(6))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(6)(186)('Haze Slice')(5)(true)(
		_List_fromArray(
			[2, 21, 26]))(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(2))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(30))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(7)(186)('Hexblade')(5)(true)(
		_List_fromArray(
			[8, 28]))(false)('Deals magic-based damage.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(7))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(8)(186)('Sunder')(5)(true)(
		_List_fromArray(
			[4, 10, 12]))(false)('')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(15))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(9)(186)('Soulblade')(5)(true)(
		_List_fromArray(
			[23]))(false)('Deals magic-based damage, Might increases based on user\'s Resistance.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(2))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(12)(186)('Hexblade')(8)(true)(
		_List_fromArray(
			[2, 17]))(false)('Deals magic-based damage.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(7))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(13)(186)('Windsweep')(8)(true)(
		_List_fromArray(
			[0, 1, 10]))(false)('Prevents enemy counterattack.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(14)(186)('Finess Blade')(8)(true)(
		_List_fromArray(
			[9, 12, 18, 30]))(false)('Might increases based on user\'s Dexterity.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(2))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(19)(187)('Tempest Lance')(14)(true)(_List_Nil)(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(8))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(21)(187)('Knightkneeler')(16)(true)(_List_Nil)(false)('Effective against Cavalry enemies.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(23)(187)('Shatter Slash')(17)(true)(
		_List_fromArray(
			[4, 24, 31]))(false)('After combat, inflicts Def -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(24)(187)('Vengeance')(17)(true)(
		_List_fromArray(
			[7, 11, 34]))(false)('Damage increases in relation to the user’s missing HP.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(2))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(25)(187)('Monster Piercer')(17)(true)(
		_List_fromArray(
			[10, 14, 25, 26]))(false)('Effective against Monsters.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(7))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(26)(187)('Hit and Run')(17)(true)(
		_List_fromArray(
			[17, 27, 33]))(false)('After combat, user moves 1 space backwards.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(27)(187)('Frozen Lance')(17)(true)(
		_List_fromArray(
			[19]))(false)('Deals magic-based damage. Might increases based on user’s Dexterity.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(5))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(30)(187)('Frozen Lance')(20)(true)(
		_List_fromArray(
			[17, 27]))(false)('Deals magic-based damage. Might increases based on user’s Dexterity.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(5))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(31)(187)('Swift Strikes')(20)(true)(
		_List_fromArray(
			[4, 14, 26]))(false)('Triggers 2 consecutive hits.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(2))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(32)(187)('Glowing Ember')(20)(true)(
		_List_fromArray(
			[10, 31]))(false)('Might increases based on user’s Defense.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(2))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(33)(187)('Lance Jab')(20)(true)(
		_List_fromArray(
			[25, 33, 34]))(false)('Might increases based on user’s Speed.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(3))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(38)(188)('Smash')(26)(true)(_List_Nil)(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(40)(188)('Helm Splitter')(28)(true)(_List_Nil)(false)('Effective against Armored enemies.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(7))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(42)(188)('Monster Breaker')(29)(true)(
		_List_fromArray(
			[2, 11, 34]))(false)('Effective against Monsters.')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(9))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(43)(188)('Focused Strike')(29)(true)(
		_List_fromArray(
			[4, 13, 26]))(false)('')(
		elm$core$Maybe$Just(3))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(30))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(44)(188)('Wild Abandon')(29)(true)(
		_List_fromArray(
			[6, 9, 20]))(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(-30))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(30))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(45)(188)('Lightning Axe')(29)(true)(
		_List_fromArray(
			[16]))(false)('Deals magic-based damage. Might increases based on user’s Resistance.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(46)(188)('Spike')(29)(true)(
		_List_fromArray(
			[14, 24, 31, 32]))(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(49)(188)('Lightning Axe')(32)(true)(
		_List_fromArray(
			[2, 14]))(false)('Deals magic-based damage. Might increases based on user’s Resistance.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(50)(188)('Diamond Axe')(32)(true)(
		_List_fromArray(
			[9, 24, 26]))(false)('')(
		elm$core$Maybe$Just(7))(
		elm$core$Maybe$Just(14))(
		elm$core$Maybe$Just(-20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(51)(188)('Armored Strike')(32)(true)(
		_List_fromArray(
			[4, 11, 34]))(false)('Might increases based on user’s Defense.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(52)(188)('Exhaustive Strike')(32)(true)(
		_List_fromArray(
			[6, 32]))(false)('Depletes all of the weapon’s remaining durability and adds 30% of that value to Might.')(
		elm$core$Maybe$Just(1))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(57)(189)('Curved Shot')(38)(true)(_List_Nil)(false)('')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(1))(
		elm$core$Maybe$Just(30))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(60)(189)('Heavy Draw')(40)(true)(
		_List_fromArray(
			[3, 12, 33]))(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(8))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 2))),
		author$project$CustomTypes$StandardSkill(61)(189)('Deadeye')(40)(true)(
		_List_fromArray(
			[7, 13]))(false)('')(
		elm$core$Maybe$Just(5))(
		elm$core$Maybe$Just(6))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(3, 5))),
		author$project$CustomTypes$StandardSkill(62)(189)('Warning Shot')(40)(true)(
		_List_fromArray(
			[9]))(false)('After combat, inflicts Str -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(63)(189)('Monster Blast')(40)(true)(
		_List_fromArray(
			[18, 33]))(false)('Effective against Monsters.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(5))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 2))),
		author$project$CustomTypes$StandardSkill(64)(189)('Break Shot')(40)(true)(
		_List_fromArray(
			[21, 25]))(false)('After combat, inflicts Def -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(5))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(65)(189)('Schisms Shot')(40)(true)(
		_List_fromArray(
			[29]))(false)('After combat, inflicts Res -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(66)(189)('Point-Blank Volley')(40)(true)(
		_List_fromArray(
			[34]))(false)('')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(69)(189)('Warning Shot')(44)(true)(
		_List_fromArray(
			[13]))(false)('After combat, inflicts Str -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(70)(189)('Schisms Shot')(44)(true)(
		_List_fromArray(
			[3]))(false)('After combat, inflicts Res -5 on foe for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 3))),
		author$project$CustomTypes$StandardSkill(71)(189)('Point-Blank Volley')(44)(true)(
		_List_fromArray(
			[25]))(false)('2 consecutive hits.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(72)(189)('Encloser')(44)(true)(
		_List_fromArray(
			[7, 18]))(false)('Prevents foe from moving for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 2))),
		author$project$CustomTypes$StandardSkill(73)(189)('Ward Arrow')(44)(true)(
		_List_fromArray(
			[21, 29]))(false)('Prevents foe from using magic for 1 turn.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(15))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(2, 2))),
		author$project$CustomTypes$StandardSkill(78)(190)('Fading Blow')(50)(true)(_List_Nil)(false)('After combat, user moves 1 space backwards.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(6))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(30))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(80)(190)('Rushing Blow')(52)(true)(_List_Nil)(false)('After combat, user moves 1 space in front of the enemy.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(7))(
		elm$core$Maybe$Just(20))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(82)(190)('Draining Blow')(53)(true)(
		_List_fromArray(
			[0, 1]))(false)('Restores HP equal to 50% of the damage inflicted to the enemy.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(83)(190)('Bombard')(53)(true)(
		_List_fromArray(
			[6]))(false)('Triggers 2 consecutive hits.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(3))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(84)(190)('One-Two Punch')(53)(true)(
		_List_fromArray(
			[11, 32]))(false)('Triggers a follow-up attack.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(8))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(85)(190)('Nimble Combo')(53)(true)(
		_List_fromArray(
			[12, 30]))(false)('2 consecutive hits.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(86)(190)('Monster Crusher')(53)(true)(
		_List_fromArray(
			[20]))(false)('Effective against Monsters.')(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(13))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(87)(190)('Healing Focus')(54)(true)(_List_Nil)(false)('Restores 50% of the user\'s HP.')(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(89)(190)('Draining Blow')(56)(true)(
		_List_fromArray(
			[20]))(false)('Restores HP equal to 50% of the damage inflicted to the enemy.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(4))(
		elm$core$Maybe$Just(20))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(90)(190)('Bombard')(56)(true)(
		_List_fromArray(
			[30]))(false)('Triggers 2 consecutive hits.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(3))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(91)(190)('Mystic Blow')(56)(true)(
		_List_fromArray(
			[0, 1, 12]))(false)('Deals magic-based damage.')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(10))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1))),
		author$project$CustomTypes$StandardSkill(92)(190)('Mighty Blow')(56)(true)(
		_List_fromArray(
			[6, 11, 32]))(false)('')(
		elm$core$Maybe$Just(3))(
		elm$core$Maybe$Just(10))(
		elm$core$Maybe$Just(-5))(elm$core$Maybe$Nothing)(
		elm$core$Maybe$Just(20))(
		elm$core$Maybe$Just(
			_Utils_Tuple2(1, 1)))
	]);
var author$project$CustomTypes$A = {$: 'A'};
var author$project$CustomTypes$Aplus = {$: 'Aplus'};
var author$project$CustomTypes$B = {$: 'B'};
var author$project$CustomTypes$Bplus = {$: 'Bplus'};
var author$project$CustomTypes$C = {$: 'C'};
var author$project$CustomTypes$Cplus = {$: 'Cplus'};
var author$project$CustomTypes$D = {$: 'D'};
var author$project$CustomTypes$Dplus = {$: 'Dplus'};
var author$project$CustomTypes$E = {$: 'E'};
var author$project$CustomTypes$Eplus = {$: 'Eplus'};
var author$project$CustomTypes$S = {$: 'S'};
var author$project$CustomTypes$Splus = {$: 'Splus'};
var author$project$CustomTypes$Study = F3(
	function (id, subject, rank) {
		return {id: id, rank: rank, subject: subject};
	});
var author$project$Study$initStudies = _List_fromArray(
	[
		A3(author$project$CustomTypes$Study, 0, author$project$CustomTypes$Sword, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 1, author$project$CustomTypes$Sword, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 2, author$project$CustomTypes$Sword, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 3, author$project$CustomTypes$Sword, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 4, author$project$CustomTypes$Sword, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 5, author$project$CustomTypes$Sword, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 6, author$project$CustomTypes$Sword, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 7, author$project$CustomTypes$Sword, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 8, author$project$CustomTypes$Sword, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 9, author$project$CustomTypes$Sword, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 10, author$project$CustomTypes$Sword, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 11, author$project$CustomTypes$Sword, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 12, author$project$CustomTypes$Lance, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 13, author$project$CustomTypes$Lance, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 14, author$project$CustomTypes$Lance, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 15, author$project$CustomTypes$Lance, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 16, author$project$CustomTypes$Lance, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 17, author$project$CustomTypes$Lance, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 18, author$project$CustomTypes$Lance, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 19, author$project$CustomTypes$Lance, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 20, author$project$CustomTypes$Lance, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 21, author$project$CustomTypes$Lance, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 22, author$project$CustomTypes$Lance, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 23, author$project$CustomTypes$Lance, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 24, author$project$CustomTypes$Axe, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 25, author$project$CustomTypes$Axe, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 26, author$project$CustomTypes$Axe, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 27, author$project$CustomTypes$Axe, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 28, author$project$CustomTypes$Axe, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 29, author$project$CustomTypes$Axe, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 30, author$project$CustomTypes$Axe, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 31, author$project$CustomTypes$Axe, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 32, author$project$CustomTypes$Axe, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 33, author$project$CustomTypes$Axe, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 34, author$project$CustomTypes$Axe, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 35, author$project$CustomTypes$Axe, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 36, author$project$CustomTypes$Bow, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 37, author$project$CustomTypes$Bow, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 38, author$project$CustomTypes$Bow, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 39, author$project$CustomTypes$Bow, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 40, author$project$CustomTypes$Bow, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 41, author$project$CustomTypes$Bow, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 42, author$project$CustomTypes$Bow, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 43, author$project$CustomTypes$Bow, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 44, author$project$CustomTypes$Bow, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 45, author$project$CustomTypes$Bow, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 46, author$project$CustomTypes$Bow, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 47, author$project$CustomTypes$Bow, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 48, author$project$CustomTypes$Brawling, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 49, author$project$CustomTypes$Brawling, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 50, author$project$CustomTypes$Brawling, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 51, author$project$CustomTypes$Brawling, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 52, author$project$CustomTypes$Brawling, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 53, author$project$CustomTypes$Brawling, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 54, author$project$CustomTypes$Brawling, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 55, author$project$CustomTypes$Brawling, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 56, author$project$CustomTypes$Brawling, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 57, author$project$CustomTypes$Brawling, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 58, author$project$CustomTypes$Brawling, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 59, author$project$CustomTypes$Brawling, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 60, author$project$CustomTypes$Reason, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 61, author$project$CustomTypes$Reason, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 62, author$project$CustomTypes$Reason, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 63, author$project$CustomTypes$Reason, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 64, author$project$CustomTypes$Reason, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 65, author$project$CustomTypes$Reason, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 66, author$project$CustomTypes$Reason, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 67, author$project$CustomTypes$Reason, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 68, author$project$CustomTypes$Reason, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 69, author$project$CustomTypes$Reason, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 70, author$project$CustomTypes$Reason, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 71, author$project$CustomTypes$Reason, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 72, author$project$CustomTypes$Faith, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 73, author$project$CustomTypes$Faith, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 74, author$project$CustomTypes$Faith, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 75, author$project$CustomTypes$Faith, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 76, author$project$CustomTypes$Faith, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 77, author$project$CustomTypes$Faith, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 78, author$project$CustomTypes$Faith, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 79, author$project$CustomTypes$Faith, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 80, author$project$CustomTypes$Faith, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 81, author$project$CustomTypes$Faith, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 82, author$project$CustomTypes$Faith, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 83, author$project$CustomTypes$Faith, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 84, author$project$CustomTypes$Authority, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 85, author$project$CustomTypes$Authority, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 86, author$project$CustomTypes$Authority, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 87, author$project$CustomTypes$Authority, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 88, author$project$CustomTypes$Authority, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 89, author$project$CustomTypes$Authority, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 90, author$project$CustomTypes$Authority, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 91, author$project$CustomTypes$Authority, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 92, author$project$CustomTypes$Authority, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 93, author$project$CustomTypes$Authority, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 94, author$project$CustomTypes$Authority, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 95, author$project$CustomTypes$Authority, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 96, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 97, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 98, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 99, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 100, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 101, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 102, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 103, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 104, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 105, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 106, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 107, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 108, author$project$CustomTypes$Riding, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 109, author$project$CustomTypes$Riding, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 110, author$project$CustomTypes$Riding, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 111, author$project$CustomTypes$Riding, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 112, author$project$CustomTypes$Riding, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 113, author$project$CustomTypes$Riding, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 114, author$project$CustomTypes$Riding, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 115, author$project$CustomTypes$Riding, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 116, author$project$CustomTypes$Riding, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 117, author$project$CustomTypes$Riding, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 118, author$project$CustomTypes$Riding, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 119, author$project$CustomTypes$Riding, author$project$CustomTypes$Splus),
		A3(author$project$CustomTypes$Study, 120, author$project$CustomTypes$Flying, author$project$CustomTypes$E),
		A3(author$project$CustomTypes$Study, 121, author$project$CustomTypes$Flying, author$project$CustomTypes$Eplus),
		A3(author$project$CustomTypes$Study, 122, author$project$CustomTypes$Flying, author$project$CustomTypes$D),
		A3(author$project$CustomTypes$Study, 123, author$project$CustomTypes$Flying, author$project$CustomTypes$Dplus),
		A3(author$project$CustomTypes$Study, 124, author$project$CustomTypes$Flying, author$project$CustomTypes$C),
		A3(author$project$CustomTypes$Study, 125, author$project$CustomTypes$Flying, author$project$CustomTypes$Cplus),
		A3(author$project$CustomTypes$Study, 126, author$project$CustomTypes$Flying, author$project$CustomTypes$B),
		A3(author$project$CustomTypes$Study, 127, author$project$CustomTypes$Flying, author$project$CustomTypes$Bplus),
		A3(author$project$CustomTypes$Study, 128, author$project$CustomTypes$Flying, author$project$CustomTypes$A),
		A3(author$project$CustomTypes$Study, 129, author$project$CustomTypes$Flying, author$project$CustomTypes$Aplus),
		A3(author$project$CustomTypes$Study, 130, author$project$CustomTypes$Flying, author$project$CustomTypes$S),
		A3(author$project$CustomTypes$Study, 131, author$project$CustomTypes$Flying, author$project$CustomTypes$Splus)
	]);
var author$project$DataHandler$initStaticData = A7(author$project$GlobalModel$DataModel, author$project$Study$initStudies, author$project$JobCategory$initJobCategories, author$project$Job$initJobs, author$project$JobSkill$initJobSkills, author$project$MasterySkill$initMasterySkills, author$project$StandardSkill$initStandardSkills, author$project$Character$initCharacters);
var author$project$GlobalModel$Model = F6(
	function (team, data, view, errorMessage, url, key) {
		return {data: data, errorMessage: errorMessage, key: key, team: team, url: url, view: view};
	});
var author$project$GlobalModel$ViewModel = function (characterModalIsOpen) {
	return function (skillModalIsOpen) {
		return function (jobModalIsOpen) {
			return function (skipNextClosure) {
				return function (characterPicker) {
					return function (skillPicker) {
						return function (jobPicker) {
							return function (isCreatingBuild) {
								return function (skillListSortBy) {
									return function (skillSearch) {
										return function (categorySelected) {
											return {categorySelected: categorySelected, characterModalIsOpen: characterModalIsOpen, characterPicker: characterPicker, isCreatingBuild: isCreatingBuild, jobModalIsOpen: jobModalIsOpen, jobPicker: jobPicker, skillListSortBy: skillListSortBy, skillModalIsOpen: skillModalIsOpen, skillPicker: skillPicker, skillSearch: skillSearch, skipNextClosure: skipNextClosure};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$Job$getJobByDefault = author$project$CustomTypes$Job(0)(0)('Commoner')(0)(_List_Nil)(_List_Nil)(elm$core$Maybe$Nothing)(
	elm$core$Maybe$Just(author$project$CustomTypes$CanUseSomeMagic))(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(_List_Nil)(false);
var author$project$CustomTypes$Build = F5(
	function (idCharacter, listPassiveSkill, listActiveSkill, jobId, hiddenInfo) {
		return {hiddenInfo: hiddenInfo, idCharacter: idCharacter, jobId: jobId, listActiveSkill: listActiveSkill, listPassiveSkill: listPassiveSkill};
	});
var author$project$CustomTypes$MasteryType = {$: 'MasteryType'};
var author$project$CustomTypes$NoType = {$: 'NoType'};
var author$project$CustomTypes$StandardType = {$: 'StandardType'};
var elm$core$Basics$apR = F2(
	function (x, f) {
		return f(x);
	});
var elm$core$Result$withDefault = F2(
	function (def, result) {
		if (result.$ === 'Ok') {
			var a = result.a;
			return a;
		} else {
			return def;
		}
	});
var elm$core$String$slice = _String_slice;
var elm$core$Basics$append = _Utils_append;
var elm$core$Basics$sub = _Basics_sub;
var elm$core$Basics$add = _Basics_add;
var elm$core$List$foldl = F3(
	function (func, acc, list) {
		foldl:
		while (true) {
			if (!list.b) {
				return acc;
			} else {
				var x = list.a;
				var xs = list.b;
				var $temp$func = func,
					$temp$acc = A2(func, x, acc),
					$temp$list = xs;
				func = $temp$func;
				acc = $temp$acc;
				list = $temp$list;
				continue foldl;
			}
		}
	});
var elm$core$List$length = function (xs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, i) {
				return i + 1;
			}),
		0,
		xs);
};
var elm$core$List$tail = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(xs);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var elm$core$Maybe$withDefault = F2(
	function (_default, maybe) {
		if (maybe.$ === 'Just') {
			var value = maybe.a;
			return value;
		} else {
			return _default;
		}
	});
var elm$core$Result$Err = function (a) {
	return {$: 'Err', a: a};
};
var elm$core$Result$Ok = function (a) {
	return {$: 'Ok', a: a};
};
var elm$core$Result$map = F2(
	function (func, ra) {
		if (ra.$ === 'Ok') {
			var a = ra.a;
			return elm$core$Result$Ok(
				func(a));
		} else {
			var e = ra.a;
			return elm$core$Result$Err(e);
		}
	});
var elm$core$Result$mapError = F2(
	function (f, result) {
		if (result.$ === 'Ok') {
			var v = result.a;
			return elm$core$Result$Ok(v);
		} else {
			var e = result.a;
			return elm$core$Result$Err(
				f(e));
		}
	});
var elm$core$Basics$eq = _Utils_equal;
var elm$core$String$isEmpty = function (string) {
	return string === '';
};
var elm$core$String$join = F2(
	function (sep, chunks) {
		return A2(
			_String_join,
			sep,
			_List_toArray(chunks));
	});
var elm$core$String$length = _String_length;
var elm$core$String$startsWith = _String_startsWith;
var elm$core$String$foldr = _String_foldr;
var elm$core$String$toList = function (string) {
	return A3(elm$core$String$foldr, elm$core$List$cons, _List_Nil, string);
};
var elm$core$Basics$mul = _Basics_mul;
var elm$core$Basics$pow = _Basics_pow;
var elm$core$String$cons = _String_cons;
var elm$core$String$fromChar = function (_char) {
	return A2(elm$core$String$cons, _char, '');
};
var rtfeldman$elm_hex$Hex$fromStringHelp = F3(
	function (position, chars, accumulated) {
		fromStringHelp:
		while (true) {
			if (!chars.b) {
				return elm$core$Result$Ok(accumulated);
			} else {
				var _char = chars.a;
				var rest = chars.b;
				switch (_char.valueOf()) {
					case '0':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated;
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '1':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + A2(elm$core$Basics$pow, 16, position);
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '2':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (2 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '3':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (3 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '4':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (4 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '5':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (5 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '6':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (6 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '7':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (7 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '8':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (8 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case '9':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (9 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'a':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (10 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'b':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (11 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'c':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (12 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'd':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (13 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'e':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (14 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					case 'f':
						var $temp$position = position - 1,
							$temp$chars = rest,
							$temp$accumulated = accumulated + (15 * A2(elm$core$Basics$pow, 16, position));
						position = $temp$position;
						chars = $temp$chars;
						accumulated = $temp$accumulated;
						continue fromStringHelp;
					default:
						var nonHex = _char;
						return elm$core$Result$Err(
							elm$core$String$fromChar(nonHex) + ' is not a valid hexadecimal character.');
				}
			}
		}
	});
var rtfeldman$elm_hex$Hex$fromString = function (str) {
	if (elm$core$String$isEmpty(str)) {
		return elm$core$Result$Err('Empty strings are not valid hexadecimal strings.');
	} else {
		var result = function () {
			if (A2(elm$core$String$startsWith, '-', str)) {
				var list = A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					elm$core$List$tail(
						elm$core$String$toList(str)));
				return A2(
					elm$core$Result$map,
					elm$core$Basics$negate,
					A3(
						rtfeldman$elm_hex$Hex$fromStringHelp,
						elm$core$List$length(list) - 1,
						list,
						0));
			} else {
				return A3(
					rtfeldman$elm_hex$Hex$fromStringHelp,
					elm$core$String$length(str) - 1,
					elm$core$String$toList(str),
					0);
			}
		}();
		var formatError = function (err) {
			return A2(
				elm$core$String$join,
				' ',
				_List_fromArray(
					['\"' + (str + '\"'), 'is not a valid hexadecimal string because', err]));
		};
		return A2(elm$core$Result$mapError, formatError, result);
	}
};
var author$project$UrlDecoder$decodeUrlInSkill = function (segment) {
	var skillType = function () {
		var _n0 = A3(elm$core$String$slice, 0, 1, segment);
		switch (_n0) {
			case 'm':
				return author$project$CustomTypes$MasteryType;
			case 's':
				return author$project$CustomTypes$StandardType;
			default:
				return author$project$CustomTypes$NoType;
		}
	}();
	var skillId = A2(
		elm$core$Result$withDefault,
		0,
		rtfeldman$elm_hex$Hex$fromString(
			A3(elm$core$String$slice, 1, 3, segment)));
	return _Utils_Tuple2(skillId, skillType);
};
var elm$core$List$map2 = _List_map2;
var elm$core$Basics$le = _Utils_le;
var elm$core$List$rangeHelp = F3(
	function (lo, hi, list) {
		rangeHelp:
		while (true) {
			if (_Utils_cmp(lo, hi) < 1) {
				var $temp$lo = lo,
					$temp$hi = hi - 1,
					$temp$list = A2(elm$core$List$cons, hi, list);
				lo = $temp$lo;
				hi = $temp$hi;
				list = $temp$list;
				continue rangeHelp;
			} else {
				return list;
			}
		}
	});
var elm$core$List$range = F2(
	function (lo, hi) {
		return A3(elm$core$List$rangeHelp, lo, hi, _List_Nil);
	});
var elm$core$List$indexedMap = F2(
	function (f, xs) {
		return A3(
			elm$core$List$map2,
			f,
			A2(
				elm$core$List$range,
				0,
				elm$core$List$length(xs) - 1),
			xs);
	});
var elm$core$Basics$gt = _Utils_gt;
var elm$core$List$reverse = function (list) {
	return A3(elm$core$List$foldl, elm$core$List$cons, _List_Nil, list);
};
var elm$core$List$foldrHelper = F4(
	function (fn, acc, ctr, ls) {
		if (!ls.b) {
			return acc;
		} else {
			var a = ls.a;
			var r1 = ls.b;
			if (!r1.b) {
				return A2(fn, a, acc);
			} else {
				var b = r1.a;
				var r2 = r1.b;
				if (!r2.b) {
					return A2(
						fn,
						a,
						A2(fn, b, acc));
				} else {
					var c = r2.a;
					var r3 = r2.b;
					if (!r3.b) {
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(fn, c, acc)));
					} else {
						var d = r3.a;
						var r4 = r3.b;
						var res = (ctr > 500) ? A3(
							elm$core$List$foldl,
							fn,
							acc,
							elm$core$List$reverse(r4)) : A4(elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(
									fn,
									c,
									A2(fn, d, res))));
					}
				}
			}
		}
	});
var elm$core$List$foldr = F3(
	function (fn, acc, ls) {
		return A4(elm$core$List$foldrHelper, fn, acc, 0, ls);
	});
var elm$core$List$map = F2(
	function (f, xs) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, acc) {
					return A2(
						elm$core$List$cons,
						f(x),
						acc);
				}),
			_List_Nil,
			xs);
	});
var elm$core$String$split = F2(
	function (sep, string) {
		return _List_fromArray(
			A2(_String_split, sep, string));
	});
var elm$core$Tuple$pair = F2(
	function (a, b) {
		return _Utils_Tuple2(a, b);
	});
var author$project$UrlDecoder$decodeUrlInBuild = function (segment) {
	var listPassiveSkillId = A2(
		elm$core$List$map,
		function (_n2) {
			var id = _n2.a;
			var _n3 = _n2.b;
			var skillId = _n3.a;
			var skillType = _n3.b;
			return _Utils_Tuple3(id, skillId, skillType);
		},
		A2(
			elm$core$List$indexedMap,
			elm$core$Tuple$pair,
			A2(
				elm$core$List$map,
				function (s) {
					return author$project$UrlDecoder$decodeUrlInSkill(s);
				},
				A2(
					elm$core$String$split,
					'%',
					A3(elm$core$String$slice, 3, 22, segment)))));
	var listActiveSkillId = A2(
		elm$core$List$map,
		function (_n0) {
			var id = _n0.a;
			var _n1 = _n0.b;
			var skillId = _n1.a;
			var skillType = _n1.b;
			return _Utils_Tuple3(id, skillId, skillType);
		},
		A2(
			elm$core$List$indexedMap,
			elm$core$Tuple$pair,
			A2(
				elm$core$List$map,
				function (s) {
					return author$project$UrlDecoder$decodeUrlInSkill(s);
				},
				A2(
					elm$core$String$split,
					'%',
					A3(elm$core$String$slice, 23, 34, segment)))));
	var jobId = A2(
		elm$core$Result$withDefault,
		0,
		rtfeldman$elm_hex$Hex$fromString(
			A3(elm$core$String$slice, 35, 37, segment)));
	var characterId = A2(
		elm$core$Result$withDefault,
		0,
		rtfeldman$elm_hex$Hex$fromString(
			A3(elm$core$String$slice, 0, 2, segment)));
	var buildHidden = A3(elm$core$String$slice, 37, 38, segment) === 'h';
	return A5(author$project$CustomTypes$Build, characterId, listPassiveSkillId, listActiveSkillId, jobId, buildHidden);
};
var elm$core$Dict$RBEmpty_elm_builtin = {$: 'RBEmpty_elm_builtin'};
var elm$core$Dict$empty = elm$core$Dict$RBEmpty_elm_builtin;
var elm$core$Dict$Black = {$: 'Black'};
var elm$core$Dict$RBNode_elm_builtin = F5(
	function (a, b, c, d, e) {
		return {$: 'RBNode_elm_builtin', a: a, b: b, c: c, d: d, e: e};
	});
var elm$core$Basics$compare = _Utils_compare;
var elm$core$Dict$Red = {$: 'Red'};
var elm$core$Dict$balance = F5(
	function (color, key, value, left, right) {
		if ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Red')) {
			var _n1 = right.a;
			var rK = right.b;
			var rV = right.c;
			var rLeft = right.d;
			var rRight = right.e;
			if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
				var _n3 = left.a;
				var lK = left.b;
				var lV = left.c;
				var lLeft = left.d;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Red,
					key,
					value,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					color,
					rK,
					rV,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, left, rLeft),
					rRight);
			}
		} else {
			if ((((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) && (left.d.$ === 'RBNode_elm_builtin')) && (left.d.a.$ === 'Red')) {
				var _n5 = left.a;
				var lK = left.b;
				var lV = left.c;
				var _n6 = left.d;
				var _n7 = _n6.a;
				var llK = _n6.b;
				var llV = _n6.c;
				var llLeft = _n6.d;
				var llRight = _n6.e;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Red,
					lK,
					lV,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, llK, llV, llLeft, llRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, key, value, lRight, right));
			} else {
				return A5(elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);
			}
		}
	});
var elm$core$Dict$insertHelp = F3(
	function (key, value, dict) {
		if (dict.$ === 'RBEmpty_elm_builtin') {
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, elm$core$Dict$RBEmpty_elm_builtin, elm$core$Dict$RBEmpty_elm_builtin);
		} else {
			var nColor = dict.a;
			var nKey = dict.b;
			var nValue = dict.c;
			var nLeft = dict.d;
			var nRight = dict.e;
			var _n1 = A2(elm$core$Basics$compare, key, nKey);
			switch (_n1.$) {
				case 'LT':
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						A3(elm$core$Dict$insertHelp, key, value, nLeft),
						nRight);
				case 'EQ':
					return A5(elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);
				default:
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						nLeft,
						A3(elm$core$Dict$insertHelp, key, value, nRight));
			}
		}
	});
var elm$core$Dict$insert = F3(
	function (key, value, dict) {
		var _n0 = A3(elm$core$Dict$insertHelp, key, value, dict);
		if ((_n0.$ === 'RBNode_elm_builtin') && (_n0.a.$ === 'Red')) {
			var _n1 = _n0.a;
			var k = _n0.b;
			var v = _n0.c;
			var l = _n0.d;
			var r = _n0.e;
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, k, v, l, r);
		} else {
			var x = _n0;
			return x;
		}
	});
var elm$core$Dict$fromList = function (assocs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, dict) {
				var key = _n0.a;
				var value = _n0.b;
				return A3(elm$core$Dict$insert, key, value, dict);
			}),
		elm$core$Dict$empty,
		assocs);
};
var author$project$UrlDecoder$decodeUrlInTeam = function (url) {
	return elm$core$Dict$fromList(
		A2(
			elm$core$List$indexedMap,
			elm$core$Tuple$pair,
			A2(
				elm$core$List$map,
				function (s) {
					return author$project$UrlDecoder$decodeUrlInBuild(s);
				},
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					elm$core$List$tail(
						A2(elm$core$String$split, '#', url))))));
};
var elm$core$Result$isOk = function (result) {
	if (result.$ === 'Ok') {
		return true;
	} else {
		return false;
	}
};
var elm$core$Array$branchFactor = 32;
var elm$core$Array$Array_elm_builtin = F4(
	function (a, b, c, d) {
		return {$: 'Array_elm_builtin', a: a, b: b, c: c, d: d};
	});
var elm$core$Basics$ceiling = _Basics_ceiling;
var elm$core$Basics$fdiv = _Basics_fdiv;
var elm$core$Basics$logBase = F2(
	function (base, number) {
		return _Basics_log(number) / _Basics_log(base);
	});
var elm$core$Basics$toFloat = _Basics_toFloat;
var elm$core$Array$shiftStep = elm$core$Basics$ceiling(
	A2(elm$core$Basics$logBase, 2, elm$core$Array$branchFactor));
var elm$core$Elm$JsArray$empty = _JsArray_empty;
var elm$core$Array$empty = A4(elm$core$Array$Array_elm_builtin, 0, elm$core$Array$shiftStep, elm$core$Elm$JsArray$empty, elm$core$Elm$JsArray$empty);
var elm$core$Array$Leaf = function (a) {
	return {$: 'Leaf', a: a};
};
var elm$core$Array$SubTree = function (a) {
	return {$: 'SubTree', a: a};
};
var elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;
var elm$core$Array$compressNodes = F2(
	function (nodes, acc) {
		compressNodes:
		while (true) {
			var _n0 = A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodes);
			var node = _n0.a;
			var remainingNodes = _n0.b;
			var newAcc = A2(
				elm$core$List$cons,
				elm$core$Array$SubTree(node),
				acc);
			if (!remainingNodes.b) {
				return elm$core$List$reverse(newAcc);
			} else {
				var $temp$nodes = remainingNodes,
					$temp$acc = newAcc;
				nodes = $temp$nodes;
				acc = $temp$acc;
				continue compressNodes;
			}
		}
	});
var elm$core$Tuple$first = function (_n0) {
	var x = _n0.a;
	return x;
};
var elm$core$Array$treeFromBuilder = F2(
	function (nodeList, nodeListSize) {
		treeFromBuilder:
		while (true) {
			var newNodeSize = elm$core$Basics$ceiling(nodeListSize / elm$core$Array$branchFactor);
			if (newNodeSize === 1) {
				return A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodeList).a;
			} else {
				var $temp$nodeList = A2(elm$core$Array$compressNodes, nodeList, _List_Nil),
					$temp$nodeListSize = newNodeSize;
				nodeList = $temp$nodeList;
				nodeListSize = $temp$nodeListSize;
				continue treeFromBuilder;
			}
		}
	});
var elm$core$Basics$apL = F2(
	function (f, x) {
		return f(x);
	});
var elm$core$Basics$floor = _Basics_floor;
var elm$core$Basics$max = F2(
	function (x, y) {
		return (_Utils_cmp(x, y) > 0) ? x : y;
	});
var elm$core$Elm$JsArray$length = _JsArray_length;
var elm$core$Array$builderToArray = F2(
	function (reverseNodeList, builder) {
		if (!builder.nodeListSize) {
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.tail),
				elm$core$Array$shiftStep,
				elm$core$Elm$JsArray$empty,
				builder.tail);
		} else {
			var treeLen = builder.nodeListSize * elm$core$Array$branchFactor;
			var depth = elm$core$Basics$floor(
				A2(elm$core$Basics$logBase, elm$core$Array$branchFactor, treeLen - 1));
			var correctNodeList = reverseNodeList ? elm$core$List$reverse(builder.nodeList) : builder.nodeList;
			var tree = A2(elm$core$Array$treeFromBuilder, correctNodeList, builder.nodeListSize);
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.tail) + treeLen,
				A2(elm$core$Basics$max, 5, depth * elm$core$Array$shiftStep),
				tree,
				builder.tail);
		}
	});
var elm$core$Basics$idiv = _Basics_idiv;
var elm$core$Basics$lt = _Utils_lt;
var elm$core$Elm$JsArray$initialize = _JsArray_initialize;
var elm$core$Array$initializeHelp = F5(
	function (fn, fromIndex, len, nodeList, tail) {
		initializeHelp:
		while (true) {
			if (fromIndex < 0) {
				return A2(
					elm$core$Array$builderToArray,
					false,
					{nodeList: nodeList, nodeListSize: (len / elm$core$Array$branchFactor) | 0, tail: tail});
			} else {
				var leaf = elm$core$Array$Leaf(
					A3(elm$core$Elm$JsArray$initialize, elm$core$Array$branchFactor, fromIndex, fn));
				var $temp$fn = fn,
					$temp$fromIndex = fromIndex - elm$core$Array$branchFactor,
					$temp$len = len,
					$temp$nodeList = A2(elm$core$List$cons, leaf, nodeList),
					$temp$tail = tail;
				fn = $temp$fn;
				fromIndex = $temp$fromIndex;
				len = $temp$len;
				nodeList = $temp$nodeList;
				tail = $temp$tail;
				continue initializeHelp;
			}
		}
	});
var elm$core$Basics$remainderBy = _Basics_remainderBy;
var elm$core$Array$initialize = F2(
	function (len, fn) {
		if (len <= 0) {
			return elm$core$Array$empty;
		} else {
			var tailLen = len % elm$core$Array$branchFactor;
			var tail = A3(elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);
			var initialFromIndex = (len - tailLen) - elm$core$Array$branchFactor;
			return A5(elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);
		}
	});
var elm$json$Json$Decode$Failure = F2(
	function (a, b) {
		return {$: 'Failure', a: a, b: b};
	});
var elm$json$Json$Decode$Field = F2(
	function (a, b) {
		return {$: 'Field', a: a, b: b};
	});
var elm$json$Json$Decode$Index = F2(
	function (a, b) {
		return {$: 'Index', a: a, b: b};
	});
var elm$json$Json$Decode$OneOf = function (a) {
	return {$: 'OneOf', a: a};
};
var elm$core$Basics$and = _Basics_and;
var elm$core$Basics$or = _Basics_or;
var elm$core$Char$toCode = _Char_toCode;
var elm$core$Char$isLower = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (97 <= code) && (code <= 122);
};
var elm$core$Char$isUpper = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 90) && (65 <= code);
};
var elm$core$Char$isAlpha = function (_char) {
	return elm$core$Char$isLower(_char) || elm$core$Char$isUpper(_char);
};
var elm$core$Char$isDigit = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 57) && (48 <= code);
};
var elm$core$Char$isAlphaNum = function (_char) {
	return elm$core$Char$isLower(_char) || (elm$core$Char$isUpper(_char) || elm$core$Char$isDigit(_char));
};
var elm$core$String$all = _String_all;
var elm$core$String$fromInt = _String_fromNumber;
var elm$core$String$uncons = _String_uncons;
var elm$json$Json$Decode$indent = function (str) {
	return A2(
		elm$core$String$join,
		'\n    ',
		A2(elm$core$String$split, '\n', str));
};
var elm$json$Json$Encode$encode = _Json_encode;
var elm$json$Json$Decode$errorOneOf = F2(
	function (i, error) {
		return '\n\n(' + (elm$core$String$fromInt(i + 1) + (') ' + elm$json$Json$Decode$indent(
			elm$json$Json$Decode$errorToString(error))));
	});
var elm$json$Json$Decode$errorToString = function (error) {
	return A2(elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);
};
var elm$json$Json$Decode$errorToStringHelp = F2(
	function (error, context) {
		errorToStringHelp:
		while (true) {
			switch (error.$) {
				case 'Field':
					var f = error.a;
					var err = error.b;
					var isSimple = function () {
						var _n1 = elm$core$String$uncons(f);
						if (_n1.$ === 'Nothing') {
							return false;
						} else {
							var _n2 = _n1.a;
							var _char = _n2.a;
							var rest = _n2.b;
							return elm$core$Char$isAlpha(_char) && A2(elm$core$String$all, elm$core$Char$isAlphaNum, rest);
						}
					}();
					var fieldName = isSimple ? ('.' + f) : ('[\'' + (f + '\']'));
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, fieldName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 'Index':
					var i = error.a;
					var err = error.b;
					var indexName = '[' + (elm$core$String$fromInt(i) + ']');
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, indexName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 'OneOf':
					var errors = error.a;
					if (!errors.b) {
						return 'Ran into a Json.Decode.oneOf with no possibilities' + function () {
							if (!context.b) {
								return '!';
							} else {
								return ' at json' + A2(
									elm$core$String$join,
									'',
									elm$core$List$reverse(context));
							}
						}();
					} else {
						if (!errors.b.b) {
							var err = errors.a;
							var $temp$error = err,
								$temp$context = context;
							error = $temp$error;
							context = $temp$context;
							continue errorToStringHelp;
						} else {
							var starter = function () {
								if (!context.b) {
									return 'Json.Decode.oneOf';
								} else {
									return 'The Json.Decode.oneOf at json' + A2(
										elm$core$String$join,
										'',
										elm$core$List$reverse(context));
								}
							}();
							var introduction = starter + (' failed in the following ' + (elm$core$String$fromInt(
								elm$core$List$length(errors)) + ' ways:'));
							return A2(
								elm$core$String$join,
								'\n\n',
								A2(
									elm$core$List$cons,
									introduction,
									A2(elm$core$List$indexedMap, elm$json$Json$Decode$errorOneOf, errors)));
						}
					}
				default:
					var msg = error.a;
					var json = error.b;
					var introduction = function () {
						if (!context.b) {
							return 'Problem with the given value:\n\n';
						} else {
							return 'Problem with the value at json' + (A2(
								elm$core$String$join,
								'',
								elm$core$List$reverse(context)) + ':\n\n    ');
						}
					}();
					return introduction + (elm$json$Json$Decode$indent(
						A2(elm$json$Json$Encode$encode, 4, json)) + ('\n\n' + msg));
			}
		}
	});
var elm$core$Platform$Cmd$batch = _Platform_batch;
var elm$core$Platform$Cmd$none = elm$core$Platform$Cmd$batch(_List_Nil);
var elm$url$Url$addPort = F2(
	function (maybePort, starter) {
		if (maybePort.$ === 'Nothing') {
			return starter;
		} else {
			var port_ = maybePort.a;
			return starter + (':' + elm$core$String$fromInt(port_));
		}
	});
var elm$url$Url$addPrefixed = F3(
	function (prefix, maybeSegment, starter) {
		if (maybeSegment.$ === 'Nothing') {
			return starter;
		} else {
			var segment = maybeSegment.a;
			return _Utils_ap(
				starter,
				_Utils_ap(prefix, segment));
		}
	});
var elm$url$Url$toString = function (url) {
	var http = function () {
		var _n0 = url.protocol;
		if (_n0.$ === 'Http') {
			return 'http://';
		} else {
			return 'https://';
		}
	}();
	return A3(
		elm$url$Url$addPrefixed,
		'#',
		url.fragment,
		A3(
			elm$url$Url$addPrefixed,
			'?',
			url.query,
			_Utils_ap(
				A2(
					elm$url$Url$addPort,
					url.port_,
					_Utils_ap(http, url.host)),
				url.path)));
};
var author$project$Main$init = F3(
	function (_n0, url, key) {
		var team = author$project$UrlDecoder$decodeUrlInTeam(
			elm$url$Url$toString(url));
		var initSkillPicker = _Utils_Tuple3(
			_Utils_Tuple2(-1, -1),
			elm$core$Maybe$Nothing,
			false);
		var initJobPicker = _Utils_Tuple2(-1, author$project$Job$getJobByDefault);
		var initCharacterPicker = _Utils_Tuple2(-1, elm$core$Maybe$Nothing);
		var viewModel = author$project$GlobalModel$ViewModel(false)(false)(false)(false)(initCharacterPicker)(initSkillPicker)(initJobPicker)(false)(author$project$CustomTypes$SortByName)('')(elm$core$Maybe$Nothing);
		var errorMessage = elm$core$Maybe$Nothing;
		var dataModel = author$project$DataHandler$initStaticData;
		var model = A6(author$project$GlobalModel$Model, team, dataModel, viewModel, errorMessage, url, key);
		return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
	});
var author$project$BuildEventListener$addBuild = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{characterModalIsOpen: true, isCreatingBuild: true});
	return _Utils_update(
		model,
		{view: newView});
};
var elm$core$Dict$getMin = function (dict) {
	getMin:
	while (true) {
		if ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
			var left = dict.d;
			var $temp$dict = left;
			dict = $temp$dict;
			continue getMin;
		} else {
			return dict;
		}
	}
};
var elm$core$Dict$moveRedLeft = function (dict) {
	if (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
		if ((dict.e.d.$ === 'RBNode_elm_builtin') && (dict.e.d.a.$ === 'Red')) {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n1 = dict.d;
			var lClr = _n1.a;
			var lK = _n1.b;
			var lV = _n1.c;
			var lLeft = _n1.d;
			var lRight = _n1.e;
			var _n2 = dict.e;
			var rClr = _n2.a;
			var rK = _n2.b;
			var rV = _n2.c;
			var rLeft = _n2.d;
			var _n3 = rLeft.a;
			var rlK = rLeft.b;
			var rlV = rLeft.c;
			var rlL = rLeft.d;
			var rlR = rLeft.e;
			var rRight = _n2.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				elm$core$Dict$Red,
				rlK,
				rlV,
				A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					rlL),
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, rK, rV, rlR, rRight));
		} else {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n4 = dict.d;
			var lClr = _n4.a;
			var lK = _n4.b;
			var lV = _n4.c;
			var lLeft = _n4.d;
			var lRight = _n4.e;
			var _n5 = dict.e;
			var rClr = _n5.a;
			var rK = _n5.b;
			var rV = _n5.c;
			var rLeft = _n5.d;
			var rRight = _n5.e;
			if (clr.$ === 'Black') {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			}
		}
	} else {
		return dict;
	}
};
var elm$core$Dict$moveRedRight = function (dict) {
	if (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
		if ((dict.d.d.$ === 'RBNode_elm_builtin') && (dict.d.d.a.$ === 'Red')) {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n1 = dict.d;
			var lClr = _n1.a;
			var lK = _n1.b;
			var lV = _n1.c;
			var _n2 = _n1.d;
			var _n3 = _n2.a;
			var llK = _n2.b;
			var llV = _n2.c;
			var llLeft = _n2.d;
			var llRight = _n2.e;
			var lRight = _n1.e;
			var _n4 = dict.e;
			var rClr = _n4.a;
			var rK = _n4.b;
			var rV = _n4.c;
			var rLeft = _n4.d;
			var rRight = _n4.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				elm$core$Dict$Red,
				lK,
				lV,
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, llK, llV, llLeft, llRight),
				A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					lRight,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight)));
		} else {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n5 = dict.d;
			var lClr = _n5.a;
			var lK = _n5.b;
			var lV = _n5.c;
			var lLeft = _n5.d;
			var lRight = _n5.e;
			var _n6 = dict.e;
			var rClr = _n6.a;
			var rK = _n6.b;
			var rV = _n6.c;
			var rLeft = _n6.d;
			var rRight = _n6.e;
			if (clr.$ === 'Black') {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			}
		}
	} else {
		return dict;
	}
};
var elm$core$Dict$removeHelpPrepEQGT = F7(
	function (targetKey, dict, color, key, value, left, right) {
		if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
			var _n1 = left.a;
			var lK = left.b;
			var lV = left.c;
			var lLeft = left.d;
			var lRight = left.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				color,
				lK,
				lV,
				lLeft,
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, lRight, right));
		} else {
			_n2$2:
			while (true) {
				if ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Black')) {
					if (right.d.$ === 'RBNode_elm_builtin') {
						if (right.d.a.$ === 'Black') {
							var _n3 = right.a;
							var _n4 = right.d;
							var _n5 = _n4.a;
							return elm$core$Dict$moveRedRight(dict);
						} else {
							break _n2$2;
						}
					} else {
						var _n6 = right.a;
						var _n7 = right.d;
						return elm$core$Dict$moveRedRight(dict);
					}
				} else {
					break _n2$2;
				}
			}
			return dict;
		}
	});
var elm$core$Dict$removeMin = function (dict) {
	if ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
		var color = dict.a;
		var key = dict.b;
		var value = dict.c;
		var left = dict.d;
		var lColor = left.a;
		var lLeft = left.d;
		var right = dict.e;
		if (lColor.$ === 'Black') {
			if ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
				var _n3 = lLeft.a;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					color,
					key,
					value,
					elm$core$Dict$removeMin(left),
					right);
			} else {
				var _n4 = elm$core$Dict$moveRedLeft(dict);
				if (_n4.$ === 'RBNode_elm_builtin') {
					var nColor = _n4.a;
					var nKey = _n4.b;
					var nValue = _n4.c;
					var nLeft = _n4.d;
					var nRight = _n4.e;
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						elm$core$Dict$removeMin(nLeft),
						nRight);
				} else {
					return elm$core$Dict$RBEmpty_elm_builtin;
				}
			}
		} else {
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				color,
				key,
				value,
				elm$core$Dict$removeMin(left),
				right);
		}
	} else {
		return elm$core$Dict$RBEmpty_elm_builtin;
	}
};
var elm$core$Dict$removeHelp = F2(
	function (targetKey, dict) {
		if (dict.$ === 'RBEmpty_elm_builtin') {
			return elm$core$Dict$RBEmpty_elm_builtin;
		} else {
			var color = dict.a;
			var key = dict.b;
			var value = dict.c;
			var left = dict.d;
			var right = dict.e;
			if (_Utils_cmp(targetKey, key) < 0) {
				if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Black')) {
					var _n4 = left.a;
					var lLeft = left.d;
					if ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
						var _n6 = lLeft.a;
						return A5(
							elm$core$Dict$RBNode_elm_builtin,
							color,
							key,
							value,
							A2(elm$core$Dict$removeHelp, targetKey, left),
							right);
					} else {
						var _n7 = elm$core$Dict$moveRedLeft(dict);
						if (_n7.$ === 'RBNode_elm_builtin') {
							var nColor = _n7.a;
							var nKey = _n7.b;
							var nValue = _n7.c;
							var nLeft = _n7.d;
							var nRight = _n7.e;
							return A5(
								elm$core$Dict$balance,
								nColor,
								nKey,
								nValue,
								A2(elm$core$Dict$removeHelp, targetKey, nLeft),
								nRight);
						} else {
							return elm$core$Dict$RBEmpty_elm_builtin;
						}
					}
				} else {
					return A5(
						elm$core$Dict$RBNode_elm_builtin,
						color,
						key,
						value,
						A2(elm$core$Dict$removeHelp, targetKey, left),
						right);
				}
			} else {
				return A2(
					elm$core$Dict$removeHelpEQGT,
					targetKey,
					A7(elm$core$Dict$removeHelpPrepEQGT, targetKey, dict, color, key, value, left, right));
			}
		}
	});
var elm$core$Dict$removeHelpEQGT = F2(
	function (targetKey, dict) {
		if (dict.$ === 'RBNode_elm_builtin') {
			var color = dict.a;
			var key = dict.b;
			var value = dict.c;
			var left = dict.d;
			var right = dict.e;
			if (_Utils_eq(targetKey, key)) {
				var _n1 = elm$core$Dict$getMin(right);
				if (_n1.$ === 'RBNode_elm_builtin') {
					var minKey = _n1.b;
					var minValue = _n1.c;
					return A5(
						elm$core$Dict$balance,
						color,
						minKey,
						minValue,
						left,
						elm$core$Dict$removeMin(right));
				} else {
					return elm$core$Dict$RBEmpty_elm_builtin;
				}
			} else {
				return A5(
					elm$core$Dict$balance,
					color,
					key,
					value,
					left,
					A2(elm$core$Dict$removeHelp, targetKey, right));
			}
		} else {
			return elm$core$Dict$RBEmpty_elm_builtin;
		}
	});
var elm$core$Dict$remove = F2(
	function (key, dict) {
		var _n0 = A2(elm$core$Dict$removeHelp, key, dict);
		if ((_n0.$ === 'RBNode_elm_builtin') && (_n0.a.$ === 'Red')) {
			var _n1 = _n0.a;
			var k = _n0.b;
			var v = _n0.c;
			var l = _n0.d;
			var r = _n0.e;
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, k, v, l, r);
		} else {
			var x = _n0;
			return x;
		}
	});
var elm$core$Dict$sizeHelp = F2(
	function (n, dict) {
		sizeHelp:
		while (true) {
			if (dict.$ === 'RBEmpty_elm_builtin') {
				return n;
			} else {
				var left = dict.d;
				var right = dict.e;
				var $temp$n = A2(elm$core$Dict$sizeHelp, n + 1, right),
					$temp$dict = left;
				n = $temp$n;
				dict = $temp$dict;
				continue sizeHelp;
			}
		}
	});
var elm$core$Dict$size = function (dict) {
	return A2(elm$core$Dict$sizeHelp, 0, dict);
};
var elm$core$Dict$values = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, valueList) {
				return A2(elm$core$List$cons, value, valueList);
			}),
		_List_Nil,
		dict);
};
var author$project$BuildEventListener$deleteBuild = F2(
	function (model, buildIdx) {
		var newTeam = (elm$core$Dict$size(model.team) > 1) ? elm$core$Dict$fromList(
			A2(
				elm$core$List$indexedMap,
				elm$core$Tuple$pair,
				elm$core$Dict$values(
					A2(elm$core$Dict$remove, buildIdx, model.team)))) : model.team;
		return _Utils_update(
			model,
			{team: newTeam});
	});
var elm$core$Dict$get = F2(
	function (targetKey, dict) {
		get:
		while (true) {
			if (dict.$ === 'RBEmpty_elm_builtin') {
				return elm$core$Maybe$Nothing;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var _n1 = A2(elm$core$Basics$compare, targetKey, key);
				switch (_n1.$) {
					case 'LT':
						var $temp$targetKey = targetKey,
							$temp$dict = left;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
					case 'EQ':
						return elm$core$Maybe$Just(value);
					default:
						var $temp$targetKey = targetKey,
							$temp$dict = right;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
				}
			}
		}
	});
var elm$core$Dict$update = F3(
	function (targetKey, alter, dictionary) {
		var _n0 = alter(
			A2(elm$core$Dict$get, targetKey, dictionary));
		if (_n0.$ === 'Just') {
			var value = _n0.a;
			return A3(elm$core$Dict$insert, targetKey, value, dictionary);
		} else {
			return A2(elm$core$Dict$remove, targetKey, dictionary);
		}
	});
var author$project$BuildEventListener$downBuildInDict = F2(
	function (model, buildIdx) {
		var newTeam = function () {
			if (buildIdx < 11) {
				var buildToUp = A2(elm$core$Dict$get, buildIdx + 1, model.team);
				var buildToDown = A2(elm$core$Dict$get, buildIdx, model.team);
				return A3(
					elm$core$Dict$update,
					buildIdx + 1,
					function (_n1) {
						return buildToDown;
					},
					A3(
						elm$core$Dict$update,
						buildIdx,
						function (_n0) {
							return buildToUp;
						},
						model.team));
			} else {
				return model.team;
			}
		}();
		return _Utils_update(
			model,
			{team: newTeam});
	});
var author$project$BuildEventListener$upBuildInDict = F2(
	function (model, buildIdx) {
		var newTeam = function () {
			if (buildIdx > 0) {
				var buildToUp = A2(elm$core$Dict$get, buildIdx, model.team);
				var buildToDown = A2(elm$core$Dict$get, buildIdx - 1, model.team);
				return A3(
					elm$core$Dict$update,
					buildIdx - 1,
					function (_n1) {
						return buildToUp;
					},
					A3(
						elm$core$Dict$update,
						buildIdx,
						function (_n0) {
							return buildToDown;
						},
						model.team));
			} else {
				return model.team;
			}
		}();
		return _Utils_update(
			model,
			{team: newTeam});
	});
var author$project$BuildEventListener$handle = F2(
	function (msg, model) {
		switch (msg.$) {
			case 'DeleteBuild':
				var value = msg.a;
				return A2(author$project$BuildEventListener$deleteBuild, model, value);
			case 'UpBuild':
				var value = msg.a;
				return A2(author$project$BuildEventListener$upBuildInDict, model, value);
			case 'DownBuild':
				var value = msg.a;
				return A2(author$project$BuildEventListener$downBuildInDict, model, value);
			default:
				return author$project$BuildEventListener$addBuild(model);
		}
	});
var elm$core$Basics$not = _Basics_not;
var elm$core$Dict$map = F2(
	function (func, dict) {
		if (dict.$ === 'RBEmpty_elm_builtin') {
			return elm$core$Dict$RBEmpty_elm_builtin;
		} else {
			var color = dict.a;
			var key = dict.b;
			var value = dict.c;
			var left = dict.d;
			var right = dict.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				color,
				key,
				A2(func, key, value),
				A2(elm$core$Dict$map, func, left),
				A2(elm$core$Dict$map, func, right));
		}
	});
var author$project$BuildInfoHandler$toggleBuildInfo = F2(
	function (model, characterId) {
		var toggleInfo = function (item) {
			return _Utils_eq(item.idCharacter, characterId) ? _Utils_update(
				item,
				{hiddenInfo: !item.hiddenInfo}) : item;
		};
		var newTeam = A2(
			elm$core$Dict$map,
			F2(
				function (_n0, v) {
					return toggleInfo(v);
				}),
			model.team);
		return _Utils_update(
			model,
			{team: newTeam});
	});
var author$project$CharacterEventListener$closeModal = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{characterModalIsOpen: false});
	return _Utils_update(
		model,
		{view: newView});
};
var elm$core$List$filter = F2(
	function (isGood, list) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, xs) {
					return isGood(x) ? A2(elm$core$List$cons, x, xs) : xs;
				}),
			_List_Nil,
			list);
	});
var elm$core$List$head = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(x);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var author$project$Character$getCharacterById = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$Character$initCharacters));
};
var elm$core$Maybe$map = F2(
	function (f, maybe) {
		if (maybe.$ === 'Just') {
			var value = maybe.a;
			return elm$core$Maybe$Just(
				f(value));
		} else {
			return elm$core$Maybe$Nothing;
		}
	});
var author$project$CharacterEventListener$openModal = F2(
	function (model, buildIdx) {
		var oldView = model.view;
		var maybeCharacter = A2(
			elm$core$Maybe$map,
			function (build) {
				return author$project$Character$getCharacterById(build.idCharacter);
			},
			A2(elm$core$Dict$get, buildIdx, model.team));
		var newView = function () {
			if (maybeCharacter.$ === 'Just') {
				var character = maybeCharacter.a;
				return _Utils_update(
					oldView,
					{
						characterModalIsOpen: true,
						characterPicker: _Utils_Tuple2(buildIdx, character)
					});
			} else {
				return _Utils_update(
					oldView,
					{characterModalIsOpen: true});
			}
		}();
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$CharacterEventListener$updateCurrent = F2(
	function (model, element) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{characterPicker: element});
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$DataHandler$initBuild = function (idCharacter) {
	return A5(
		author$project$CustomTypes$Build,
		idCharacter,
		_List_fromArray(
			[
				_Utils_Tuple3(0, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(1, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(2, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(3, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(4, 0, author$project$CustomTypes$NoType)
			]),
		_List_fromArray(
			[
				_Utils_Tuple3(0, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(1, 0, author$project$CustomTypes$NoType),
				_Utils_Tuple3(2, 0, author$project$CustomTypes$NoType)
			]),
		255,
		true);
};
var author$project$CharacterEventListener$createBuild = F2(
	function (model, character) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{isCreatingBuild: false});
		var newTeam = A3(
			elm$core$Dict$insert,
			elm$core$Dict$size(model.team),
			author$project$DataHandler$initBuild(character.id),
			model.team);
		return _Utils_update(
			model,
			{team: newTeam, view: newView});
	});
var author$project$CharacterEventListener$updateBuild = F2(
	function (model, _n0) {
		var buildIdx = _n0.a;
		var character = _n0.b;
		var build = author$project$DataHandler$initBuild(character.id);
		return _Utils_update(
			model,
			{
				team: A3(elm$core$Dict$insert, buildIdx, build, model.team)
			});
	});
var elm$core$Dict$foldl = F3(
	function (func, acc, dict) {
		foldl:
		while (true) {
			if (dict.$ === 'RBEmpty_elm_builtin') {
				return acc;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldl, func, acc, left)),
					$temp$dict = right;
				func = $temp$func;
				acc = $temp$acc;
				dict = $temp$dict;
				continue foldl;
			}
		}
	});
var elm$core$Dict$filter = F2(
	function (isGood, dict) {
		return A3(
			elm$core$Dict$foldl,
			F3(
				function (k, v, d) {
					return A2(isGood, k, v) ? A3(elm$core$Dict$insert, k, v, d) : d;
				}),
			elm$core$Dict$empty,
			dict);
	});
var elm$core$Dict$isEmpty = function (dict) {
	if (dict.$ === 'RBEmpty_elm_builtin') {
		return true;
	} else {
		return false;
	}
};
var author$project$CharacterEventListener$updateOrCreateBuild = F2(
	function (model, _n0) {
		var position = _n0.a;
		var character = _n0.b;
		return elm$core$Dict$isEmpty(
			A2(
				elm$core$Dict$filter,
				F2(
					function (_n1, v) {
						return _Utils_eq(v.idCharacter, character.id);
					}),
				model.team)) ? (model.view.isCreatingBuild ? author$project$CharacterEventListener$closeModal(
			A2(author$project$CharacterEventListener$createBuild, model, character)) : author$project$CharacterEventListener$closeModal(
			A2(
				author$project$CharacterEventListener$updateBuild,
				model,
				_Utils_Tuple2(position, character)))) : model;
	});
var author$project$CharacterEventListener$handle = F2(
	function (msg, model) {
		switch (msg.$) {
			case 'OpenCharacterModal':
				var id = msg.a;
				return A2(author$project$CharacterEventListener$openModal, model, id);
			case 'UpdateCharacterPicker':
				var value = msg.a;
				return A2(author$project$CharacterEventListener$updateCurrent, model, value);
			case 'UpdateBuildWithCharacter':
				var value = msg.a;
				return A2(author$project$CharacterEventListener$updateOrCreateBuild, model, value);
			default:
				return author$project$CharacterEventListener$closeModal(model);
		}
	});
var author$project$GlobalMessage$RewriteUrl = {$: 'RewriteUrl'};
var author$project$JobEventListener$closeModal = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{jobModalIsOpen: false});
	return _Utils_update(
		model,
		{view: newView});
};
var author$project$JobEventListener$deleteCategory = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{categorySelected: elm$core$Maybe$Nothing});
	return _Utils_update(
		model,
		{view: newView});
};
var author$project$JobEventListener$openModal = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{jobModalIsOpen: true});
	return _Utils_update(
		model,
		{view: newView});
};
var elm$core$Maybe$andThen = F2(
	function (callback, maybeValue) {
		if (maybeValue.$ === 'Just') {
			var value = maybeValue.a;
			return callback(value);
		} else {
			return elm$core$Maybe$Nothing;
		}
	});
var author$project$JobEventListener$updateBuild = F2(
	function (model, _n0) {
		var buildIdx = _n0.a;
		var job = _n0.b;
		var updateIf = function (maybeBuild) {
			return A2(
				elm$core$Maybe$andThen,
				function (b) {
					return elm$core$Maybe$Just(
						_Utils_update(
							b,
							{jobId: job.id}));
				},
				maybeBuild);
		};
		var newTeam = A3(elm$core$Dict$update, buildIdx, updateIf, model.team);
		return _Utils_update(
			model,
			{team: newTeam});
	});
var author$project$JobEventListener$updateCategory = F2(
	function (model, value) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{
				categorySelected: elm$core$Maybe$Just(value)
			});
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$JobEventListener$updateJobPicker = F2(
	function (model, picker) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{jobPicker: picker});
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$JobEventListener$handle = F2(
	function (msg, model) {
		switch (msg.$) {
			case 'OpenJobModal':
				var value = msg.a;
				return author$project$JobEventListener$openModal(
					A2(author$project$JobEventListener$updateJobPicker, model, value));
			case 'UpdateJobPicker':
				var value = msg.a;
				return A2(author$project$JobEventListener$updateJobPicker, model, value);
			case 'UpdateBuild':
				var value = msg.a;
				return author$project$JobEventListener$closeModal(
					A2(author$project$JobEventListener$updateBuild, model, value));
			case 'UpdateCategory':
				var value = msg.a;
				return A2(author$project$JobEventListener$updateCategory, model, value);
			case 'DeleteCategory':
				return author$project$JobEventListener$deleteCategory(model);
			default:
				return author$project$JobEventListener$closeModal(model);
		}
	});
var author$project$SkillEventListener$closeModal = function (model) {
	var oldView = model.view;
	var newView = _Utils_update(
		oldView,
		{skillModalIsOpen: false});
	return _Utils_update(
		model,
		{view: newView});
};
var author$project$SkillEventListener$openModal = F2(
	function (skillPicker, model) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{skillModalIsOpen: true, skillPicker: skillPicker});
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$SkillEventListener$updateSkillAndKeepOther = F3(
	function (_n0, skillIdx, skill) {
		var idx = _n0.a;
		var oldSkillId = _n0.b;
		var skillType = _n0.c;
		return _Utils_eq(idx, skillIdx) ? _Utils_Tuple3(idx, skill.id, skill.skillType) : _Utils_Tuple3(idx, oldSkillId, skillType);
	});
var elm$core$List$repeatHelp = F3(
	function (result, n, value) {
		repeatHelp:
		while (true) {
			if (n <= 0) {
				return result;
			} else {
				var $temp$result = A2(elm$core$List$cons, value, result),
					$temp$n = n - 1,
					$temp$value = value;
				result = $temp$result;
				n = $temp$n;
				value = $temp$value;
				continue repeatHelp;
			}
		}
	});
var elm$core$List$repeat = F2(
	function (n, value) {
		return A3(elm$core$List$repeatHelp, _List_Nil, n, value);
	});
var elm$core$List$takeReverse = F3(
	function (n, list, kept) {
		takeReverse:
		while (true) {
			if (n <= 0) {
				return kept;
			} else {
				if (!list.b) {
					return kept;
				} else {
					var x = list.a;
					var xs = list.b;
					var $temp$n = n - 1,
						$temp$list = xs,
						$temp$kept = A2(elm$core$List$cons, x, kept);
					n = $temp$n;
					list = $temp$list;
					kept = $temp$kept;
					continue takeReverse;
				}
			}
		}
	});
var elm$core$List$takeTailRec = F2(
	function (n, list) {
		return elm$core$List$reverse(
			A3(elm$core$List$takeReverse, n, list, _List_Nil));
	});
var elm$core$List$takeFast = F3(
	function (ctr, n, list) {
		if (n <= 0) {
			return _List_Nil;
		} else {
			var _n0 = _Utils_Tuple2(n, list);
			_n0$1:
			while (true) {
				_n0$5:
				while (true) {
					if (!_n0.b.b) {
						return list;
					} else {
						if (_n0.b.b.b) {
							switch (_n0.a) {
								case 1:
									break _n0$1;
								case 2:
									var _n2 = _n0.b;
									var x = _n2.a;
									var _n3 = _n2.b;
									var y = _n3.a;
									return _List_fromArray(
										[x, y]);
								case 3:
									if (_n0.b.b.b.b) {
										var _n4 = _n0.b;
										var x = _n4.a;
										var _n5 = _n4.b;
										var y = _n5.a;
										var _n6 = _n5.b;
										var z = _n6.a;
										return _List_fromArray(
											[x, y, z]);
									} else {
										break _n0$5;
									}
								default:
									if (_n0.b.b.b.b && _n0.b.b.b.b.b) {
										var _n7 = _n0.b;
										var x = _n7.a;
										var _n8 = _n7.b;
										var y = _n8.a;
										var _n9 = _n8.b;
										var z = _n9.a;
										var _n10 = _n9.b;
										var w = _n10.a;
										var tl = _n10.b;
										return (ctr > 1000) ? A2(
											elm$core$List$cons,
											x,
											A2(
												elm$core$List$cons,
												y,
												A2(
													elm$core$List$cons,
													z,
													A2(
														elm$core$List$cons,
														w,
														A2(elm$core$List$takeTailRec, n - 4, tl))))) : A2(
											elm$core$List$cons,
											x,
											A2(
												elm$core$List$cons,
												y,
												A2(
													elm$core$List$cons,
													z,
													A2(
														elm$core$List$cons,
														w,
														A3(elm$core$List$takeFast, ctr + 1, n - 4, tl)))));
									} else {
										break _n0$5;
									}
							}
						} else {
							if (_n0.a === 1) {
								break _n0$1;
							} else {
								break _n0$5;
							}
						}
					}
				}
				return list;
			}
			var _n1 = _n0.b;
			var x = _n1.a;
			return _List_fromArray(
				[x]);
		}
	});
var elm$core$List$take = F2(
	function (n, list) {
		return A3(elm$core$List$takeFast, 0, n, list);
	});
var author$project$SkillEventListener$updateSkillInBuild = F2(
	function (maybeBuild, _n0) {
		var _n1 = _n0.a;
		var skillIdx = _n1.b;
		var skill = _n0.b;
		var isCombatArt = _n0.c;
		return A2(
			elm$core$Maybe$andThen,
			function (build) {
				if (isCombatArt) {
					var newListSkill = A2(
						elm$core$List$map,
						function (l) {
							return A3(author$project$SkillEventListener$updateSkillAndKeepOther, l, skillIdx, skill);
						},
						A2(
							elm$core$List$take,
							3,
							A3(
								elm$core$List$foldr,
								elm$core$List$cons,
								A2(
									elm$core$List$repeat,
									3,
									_Utils_Tuple3(-1, 0, author$project$CustomTypes$NoType)),
								build.listActiveSkill)));
					return elm$core$Maybe$Just(
						_Utils_update(
							build,
							{listActiveSkill: newListSkill}));
				} else {
					var newListSkill = A2(
						elm$core$List$map,
						function (l) {
							return A3(author$project$SkillEventListener$updateSkillAndKeepOther, l, skillIdx, skill);
						},
						A2(
							elm$core$List$take,
							5,
							A3(
								elm$core$List$foldr,
								elm$core$List$cons,
								A2(
									elm$core$List$repeat,
									3,
									_Utils_Tuple3(-1, 0, author$project$CustomTypes$NoType)),
								build.listPassiveSkill)));
					return elm$core$Maybe$Just(
						_Utils_update(
							build,
							{listPassiveSkill: newListSkill}));
				}
			},
			maybeBuild);
	});
var author$project$SkillEventListener$updateBuild = F2(
	function (shift, model) {
		var _n0 = shift;
		var _n1 = _n0.a;
		var buildIdx = _n1.a;
		var newTeam = A3(
			elm$core$Dict$update,
			buildIdx,
			function (build) {
				return A2(author$project$SkillEventListener$updateSkillInBuild, build, shift);
			},
			model.team);
		return _Utils_update(
			model,
			{team: newTeam});
	});
var elm$core$List$isEmpty = function (xs) {
	if (!xs.b) {
		return true;
	} else {
		return false;
	}
};
var author$project$SkillEventListener$updateBuildWithSkill = F2(
	function (shift, model) {
		var _n0 = shift;
		var _n1 = _n0.a;
		var buildIdx = _n1.a;
		var skill = _n0.b;
		var isCombatArt = _n0.c;
		var doUpdate = elm$core$List$isEmpty(
			A2(
				elm$core$List$filter,
				function (_n2) {
					var skillId = _n2.b;
					var skillType = _n2.c;
					return _Utils_eq(skillId, skill.id) && _Utils_eq(skillType, skill.skillType);
				},
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					A2(
						elm$core$Maybe$map,
						function (build) {
							return isCombatArt ? build.listActiveSkill : build.listPassiveSkill;
						},
						A2(elm$core$Dict$get, buildIdx, model.team)))));
		return doUpdate ? author$project$SkillEventListener$closeModal(
			A2(author$project$SkillEventListener$updateBuild, shift, model)) : model;
	});
var author$project$SkillEventListener$updatePicker = F2(
	function (skillPicker, model) {
		var oldView = model.view;
		var newView = _Utils_update(
			oldView,
			{skillPicker: skillPicker});
		return _Utils_update(
			model,
			{view: newView});
	});
var author$project$SkillEventListener$updateSearchSkillFilter = F2(
	function (value, model) {
		var oldView = model.view;
		return _Utils_update(
			model,
			{
				view: _Utils_update(
					oldView,
					{skillSearch: value})
			});
	});
var author$project$CustomTypes$SortByType = {$: 'SortByType'};
var author$project$ModelUtils$stringToSortType = function (value) {
	if (value === 'SortByType') {
		return author$project$CustomTypes$SortByType;
	} else {
		return author$project$CustomTypes$SortByName;
	}
};
var author$project$SkillEventListener$updateSortTypeFilter = F2(
	function (value, model) {
		var oldView = model.view;
		return _Utils_update(
			model,
			{
				view: _Utils_update(
					oldView,
					{
						skillListSortBy: author$project$ModelUtils$stringToSortType(value)
					})
			});
	});
var author$project$SkillEventListener$handle = F2(
	function (msg, model) {
		switch (msg.$) {
			case 'OpenSkillModal':
				var value = msg.a;
				return A2(author$project$SkillEventListener$openModal, value, model);
			case 'UpdateSkillPicker':
				var value = msg.a;
				return A2(author$project$SkillEventListener$updatePicker, value, model);
			case 'UpdateBuildWithSkill':
				var value = msg.a;
				return A2(author$project$SkillEventListener$updateBuildWithSkill, value, model);
			case 'CloseSkillModal':
				return author$project$SkillEventListener$closeModal(model);
			case 'UpdateSkillFilter':
				var value = msg.a;
				return A2(author$project$SkillEventListener$updateSearchSkillFilter, value, model);
			case 'CleanSearchSkillFilter':
				return A2(author$project$SkillEventListener$updateSearchSkillFilter, '', model);
			default:
				var value = msg.a;
				return A2(author$project$SkillEventListener$updateSortTypeFilter, value, model);
		}
	});
var author$project$UrlDecoder$encodeSkillTypeToString = function (skillType) {
	switch (skillType.$) {
		case 'MasteryType':
			return 'm';
		case 'StandardType':
			return 's';
		default:
			return 'a';
	}
};
var elm$core$String$fromList = _String_fromList;
var elm$core$Basics$modBy = _Basics_modBy;
var rtfeldman$elm_hex$Hex$unsafeToDigit = function (num) {
	unsafeToDigit:
	while (true) {
		switch (num) {
			case 0:
				return _Utils_chr('0');
			case 1:
				return _Utils_chr('1');
			case 2:
				return _Utils_chr('2');
			case 3:
				return _Utils_chr('3');
			case 4:
				return _Utils_chr('4');
			case 5:
				return _Utils_chr('5');
			case 6:
				return _Utils_chr('6');
			case 7:
				return _Utils_chr('7');
			case 8:
				return _Utils_chr('8');
			case 9:
				return _Utils_chr('9');
			case 10:
				return _Utils_chr('a');
			case 11:
				return _Utils_chr('b');
			case 12:
				return _Utils_chr('c');
			case 13:
				return _Utils_chr('d');
			case 14:
				return _Utils_chr('e');
			case 15:
				return _Utils_chr('f');
			default:
				var $temp$num = num;
				num = $temp$num;
				continue unsafeToDigit;
		}
	}
};
var rtfeldman$elm_hex$Hex$unsafePositiveToDigits = F2(
	function (digits, num) {
		unsafePositiveToDigits:
		while (true) {
			if (num < 16) {
				return A2(
					elm$core$List$cons,
					rtfeldman$elm_hex$Hex$unsafeToDigit(num),
					digits);
			} else {
				var $temp$digits = A2(
					elm$core$List$cons,
					rtfeldman$elm_hex$Hex$unsafeToDigit(
						A2(elm$core$Basics$modBy, 16, num)),
					digits),
					$temp$num = (num / 16) | 0;
				digits = $temp$digits;
				num = $temp$num;
				continue unsafePositiveToDigits;
			}
		}
	});
var rtfeldman$elm_hex$Hex$toString = function (num) {
	return elm$core$String$fromList(
		(num < 0) ? A2(
			elm$core$List$cons,
			_Utils_chr('-'),
			A2(rtfeldman$elm_hex$Hex$unsafePositiveToDigits, _List_Nil, -num)) : A2(rtfeldman$elm_hex$Hex$unsafePositiveToDigits, _List_Nil, num));
};
var author$project$UrlDecoder$intToHex = function (value) {
	var hexValue = rtfeldman$elm_hex$Hex$toString(value);
	return (elm$core$String$length(hexValue) > 1) ? hexValue : ('0' + hexValue);
};
var author$project$UrlDecoder$encodeBuildInQuerySegment = function (build) {
	var listPassiveSkillHex = A3(
		elm$core$List$foldr,
		elm$core$Basics$append,
		'',
		A2(
			elm$core$List$map,
			function (_n1) {
				var skillId = _n1.b;
				var skillType = _n1.c;
				return author$project$UrlDecoder$encodeSkillTypeToString(skillType) + (author$project$UrlDecoder$intToHex(skillId) + '%');
			},
			build.listPassiveSkill));
	var listActiveSkillHex = A3(
		elm$core$List$foldr,
		elm$core$Basics$append,
		'',
		A2(
			elm$core$List$map,
			function (_n0) {
				var skillId = _n0.b;
				var skillType = _n0.c;
				return author$project$UrlDecoder$encodeSkillTypeToString(skillType) + (author$project$UrlDecoder$intToHex(skillId) + '%');
			},
			build.listActiveSkill));
	var jobInHex = author$project$UrlDecoder$intToHex(build.jobId);
	var charInHex = author$project$UrlDecoder$intToHex(build.idCharacter) + '%';
	var buildHidden = build.hiddenInfo ? 'h' : 's';
	return '#' + (charInHex + (listPassiveSkillHex + (listActiveSkillHex + (jobInHex + buildHidden))));
};
var author$project$UrlDecoder$encodeTeamInUrl = function (model) {
	return A3(
		elm$core$List$foldr,
		elm$core$Basics$append,
		'',
		A2(
			elm$core$List$map,
			function (v) {
				return author$project$UrlDecoder$encodeBuildInQuerySegment(v);
			},
			elm$core$Dict$values(model.team)));
};
var elm$browser$Browser$External = function (a) {
	return {$: 'External', a: a};
};
var elm$browser$Browser$Internal = function (a) {
	return {$: 'Internal', a: a};
};
var elm$browser$Browser$Dom$NotFound = function (a) {
	return {$: 'NotFound', a: a};
};
var elm$core$Basics$never = function (_n0) {
	never:
	while (true) {
		var nvr = _n0.a;
		var $temp$_n0 = nvr;
		_n0 = $temp$_n0;
		continue never;
	}
};
var elm$core$Basics$identity = function (x) {
	return x;
};
var elm$core$Task$Perform = function (a) {
	return {$: 'Perform', a: a};
};
var elm$core$Task$succeed = _Scheduler_succeed;
var elm$core$Task$init = elm$core$Task$succeed(_Utils_Tuple0);
var elm$core$Task$andThen = _Scheduler_andThen;
var elm$core$Task$map = F2(
	function (func, taskA) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return elm$core$Task$succeed(
					func(a));
			},
			taskA);
	});
var elm$core$Task$map2 = F3(
	function (func, taskA, taskB) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return A2(
					elm$core$Task$andThen,
					function (b) {
						return elm$core$Task$succeed(
							A2(func, a, b));
					},
					taskB);
			},
			taskA);
	});
var elm$core$Task$sequence = function (tasks) {
	return A3(
		elm$core$List$foldr,
		elm$core$Task$map2(elm$core$List$cons),
		elm$core$Task$succeed(_List_Nil),
		tasks);
};
var elm$core$Platform$sendToApp = _Platform_sendToApp;
var elm$core$Task$spawnCmd = F2(
	function (router, _n0) {
		var task = _n0.a;
		return _Scheduler_spawn(
			A2(
				elm$core$Task$andThen,
				elm$core$Platform$sendToApp(router),
				task));
	});
var elm$core$Task$onEffects = F3(
	function (router, commands, state) {
		return A2(
			elm$core$Task$map,
			function (_n0) {
				return _Utils_Tuple0;
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$map,
					elm$core$Task$spawnCmd(router),
					commands)));
	});
var elm$core$Task$onSelfMsg = F3(
	function (_n0, _n1, _n2) {
		return elm$core$Task$succeed(_Utils_Tuple0);
	});
var elm$core$Task$cmdMap = F2(
	function (tagger, _n0) {
		var task = _n0.a;
		return elm$core$Task$Perform(
			A2(elm$core$Task$map, tagger, task));
	});
_Platform_effectManagers['Task'] = _Platform_createManager(elm$core$Task$init, elm$core$Task$onEffects, elm$core$Task$onSelfMsg, elm$core$Task$cmdMap);
var elm$core$Task$command = _Platform_leaf('Task');
var elm$core$Task$perform = F2(
	function (toMessage, task) {
		return elm$core$Task$command(
			elm$core$Task$Perform(
				A2(elm$core$Task$map, toMessage, task)));
	});
var elm$json$Json$Decode$map = _Json_map1;
var elm$json$Json$Decode$map2 = _Json_map2;
var elm$json$Json$Decode$succeed = _Json_succeed;
var elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {
	switch (handler.$) {
		case 'Normal':
			return 0;
		case 'MayStopPropagation':
			return 1;
		case 'MayPreventDefault':
			return 2;
		default:
			return 3;
	}
};
var elm$core$String$dropLeft = F2(
	function (n, string) {
		return (n < 1) ? string : A3(
			elm$core$String$slice,
			n,
			elm$core$String$length(string),
			string);
	});
var elm$url$Url$Http = {$: 'Http'};
var elm$url$Url$Https = {$: 'Https'};
var elm$core$String$indexes = _String_indexes;
var elm$core$String$left = F2(
	function (n, string) {
		return (n < 1) ? '' : A3(elm$core$String$slice, 0, n, string);
	});
var elm$core$String$contains = _String_contains;
var elm$core$String$toInt = _String_toInt;
var elm$url$Url$Url = F6(
	function (protocol, host, port_, path, query, fragment) {
		return {fragment: fragment, host: host, path: path, port_: port_, protocol: protocol, query: query};
	});
var elm$url$Url$chompBeforePath = F5(
	function (protocol, path, params, frag, str) {
		if (elm$core$String$isEmpty(str) || A2(elm$core$String$contains, '@', str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, ':', str);
			if (!_n0.b) {
				return elm$core$Maybe$Just(
					A6(elm$url$Url$Url, protocol, str, elm$core$Maybe$Nothing, path, params, frag));
			} else {
				if (!_n0.b.b) {
					var i = _n0.a;
					var _n1 = elm$core$String$toInt(
						A2(elm$core$String$dropLeft, i + 1, str));
					if (_n1.$ === 'Nothing') {
						return elm$core$Maybe$Nothing;
					} else {
						var port_ = _n1;
						return elm$core$Maybe$Just(
							A6(
								elm$url$Url$Url,
								protocol,
								A2(elm$core$String$left, i, str),
								port_,
								path,
								params,
								frag));
					}
				} else {
					return elm$core$Maybe$Nothing;
				}
			}
		}
	});
var elm$url$Url$chompBeforeQuery = F4(
	function (protocol, params, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '/', str);
			if (!_n0.b) {
				return A5(elm$url$Url$chompBeforePath, protocol, '/', params, frag, str);
			} else {
				var i = _n0.a;
				return A5(
					elm$url$Url$chompBeforePath,
					protocol,
					A2(elm$core$String$dropLeft, i, str),
					params,
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompBeforeFragment = F3(
	function (protocol, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '?', str);
			if (!_n0.b) {
				return A4(elm$url$Url$chompBeforeQuery, protocol, elm$core$Maybe$Nothing, frag, str);
			} else {
				var i = _n0.a;
				return A4(
					elm$url$Url$chompBeforeQuery,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompAfterProtocol = F2(
	function (protocol, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '#', str);
			if (!_n0.b) {
				return A3(elm$url$Url$chompBeforeFragment, protocol, elm$core$Maybe$Nothing, str);
			} else {
				var i = _n0.a;
				return A3(
					elm$url$Url$chompBeforeFragment,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$fromString = function (str) {
	return A2(elm$core$String$startsWith, 'http://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		elm$url$Url$Http,
		A2(elm$core$String$dropLeft, 7, str)) : (A2(elm$core$String$startsWith, 'https://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		elm$url$Url$Https,
		A2(elm$core$String$dropLeft, 8, str)) : elm$core$Maybe$Nothing);
};
var elm$browser$Browser$Navigation$load = _Browser_load;
var elm$browser$Browser$Navigation$pushUrl = _Browser_pushUrl;
var elm$browser$Browser$Navigation$replaceUrl = _Browser_replaceUrl;
var author$project$Main$update = F2(
	function (msg, model) {
		update:
		while (true) {
			switch (msg.$) {
				case 'BuildMsg':
					var value = msg.a;
					var $temp$msg = author$project$GlobalMessage$RewriteUrl,
						$temp$model = A2(author$project$BuildEventListener$handle, value, model);
					msg = $temp$msg;
					model = $temp$model;
					continue update;
				case 'CModalMsg':
					var value = msg.a;
					var $temp$msg = author$project$GlobalMessage$RewriteUrl,
						$temp$model = A2(author$project$CharacterEventListener$handle, value, model);
					msg = $temp$msg;
					model = $temp$model;
					continue update;
				case 'JModalMsg':
					var value = msg.a;
					var $temp$msg = author$project$GlobalMessage$RewriteUrl,
						$temp$model = A2(author$project$JobEventListener$handle, value, model);
					msg = $temp$msg;
					model = $temp$model;
					continue update;
				case 'SModalMsg':
					var value = msg.a;
					var $temp$msg = author$project$GlobalMessage$RewriteUrl,
						$temp$model = A2(author$project$SkillEventListener$handle, value, model);
					msg = $temp$msg;
					model = $temp$model;
					continue update;
				case 'ToggleBuildInfo':
					var value = msg.a;
					return _Utils_Tuple2(
						A2(author$project$BuildInfoHandler$toggleBuildInfo, model, value),
						elm$core$Platform$Cmd$none);
				case 'UrlChanged':
					var url = msg.a;
					return _Utils_Tuple2(
						_Utils_update(
							model,
							{
								team: author$project$UrlDecoder$decodeUrlInTeam(
									elm$url$Url$toString(url)),
								url: url
							}),
						elm$core$Platform$Cmd$none);
				case 'LinkClicked':
					var urlRequest = msg.a;
					if (urlRequest.$ === 'Internal') {
						var url = urlRequest.a;
						return _Utils_Tuple2(
							model,
							A2(
								elm$browser$Browser$Navigation$pushUrl,
								model.key,
								elm$url$Url$toString(url)));
					} else {
						var href = urlRequest.a;
						return _Utils_Tuple2(
							model,
							elm$browser$Browser$Navigation$load(href));
					}
				case 'RewriteUrl':
					return _Utils_Tuple2(
						model,
						A2(
							elm$browser$Browser$Navigation$replaceUrl,
							model.key,
							author$project$UrlDecoder$encodeTeamInUrl(model)));
				default:
					return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
			}
		}
	});
var elm$html$Html$div = _VirtualDom_node('div');
var elm$html$Html$h3 = _VirtualDom_node('h3');
var elm$virtual_dom$VirtualDom$text = _VirtualDom_text;
var elm$html$Html$text = elm$virtual_dom$VirtualDom$text;
var author$project$ErrorHandler$viewError = function (errorMessage) {
	var errorHeading = 'Couldn\'t fetch json file at this time.';
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				A2(
				elm$html$Html$h3,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text(errorHeading)
					])),
				elm$html$Html$text('Error: ' + errorMessage)
			]));
};
var author$project$Character$getCharacterByDefault = A2(
	elm$core$Maybe$withDefault,
	A7(author$project$CustomTypes$Character, -1, '', author$project$CustomTypes$Male, -1, author$project$CustomTypes$Minor, -1, elm$core$Maybe$Nothing),
	elm$core$List$head(author$project$Character$initCharacters));
var author$project$GlobalMessage$CModalMsg = function (a) {
	return {$: 'CModalMsg', a: a};
};
var author$project$GlobalMessage$UpdateBuildWithCharacter = function (a) {
	return {$: 'UpdateBuildWithCharacter', a: a};
};
var author$project$GlobalMessage$UpdateCharacterPicker = function (a) {
	return {$: 'UpdateCharacterPicker', a: a};
};
var elm$core$List$any = F2(
	function (isOkay, list) {
		any:
		while (true) {
			if (!list.b) {
				return false;
			} else {
				var x = list.a;
				var xs = list.b;
				if (isOkay(x)) {
					return true;
				} else {
					var $temp$isOkay = isOkay,
						$temp$list = xs;
					isOkay = $temp$isOkay;
					list = $temp$list;
					continue any;
				}
			}
		}
	});
var elm$core$List$member = F2(
	function (x, xs) {
		return A2(
			elm$core$List$any,
			function (a) {
				return _Utils_eq(a, x);
			},
			xs);
	});
var elm$html$Html$img = _VirtualDom_node('img');
var elm$json$Json$Encode$string = _Json_wrap;
var elm$html$Html$Attributes$stringProperty = F2(
	function (key, string) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$string(string));
	});
var elm$html$Html$Attributes$class = elm$html$Html$Attributes$stringProperty('className');
var elm$html$Html$Attributes$src = function (url) {
	return A2(
		elm$html$Html$Attributes$stringProperty,
		'src',
		_VirtualDom_noJavaScriptOrHtmlUri(url));
};
var elm$virtual_dom$VirtualDom$Normal = function (a) {
	return {$: 'Normal', a: a};
};
var elm$virtual_dom$VirtualDom$on = _VirtualDom_on;
var elm$html$Html$Events$on = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$Normal(decoder));
	});
var elm$html$Html$Events$onClick = function (msg) {
	return A2(
		elm$html$Html$Events$on,
		'click',
		elm$json$Json$Decode$succeed(msg));
};
var elm$html$Html$Events$onMouseOver = function (msg) {
	return A2(
		elm$html$Html$Events$on,
		'mouseover',
		elm$json$Json$Decode$succeed(msg));
};
var author$project$CharacterModal$viewCharacterPicker = F3(
	function (model, buildIdx, character) {
		var lockedCss = A2(
			elm$core$List$member,
			character.id,
			elm$core$Dict$values(
				A2(
					elm$core$Dict$map,
					F2(
						function (_n2, v) {
							return v.idCharacter;
						}),
					model.team))) ? 'locked-picture' : '';
		var bannerCss = function () {
			var _n0 = character.bannerId;
			if (_n0.$ === 'Just') {
				var value = _n0.a;
				switch (value) {
					case 0:
						return 'black-eagle-tile';
					case 1:
						return 'blue-lyon-tile';
					case 2:
						return 'golden-deer-tile';
					default:
						return 'church-seiros-tile';
				}
			} else {
				return 'avatar-tile';
			}
		}();
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('tile ' + lockedCss),
					elm$html$Html$Events$onMouseOver(
					author$project$GlobalMessage$CModalMsg(
						author$project$GlobalMessage$UpdateCharacterPicker(
							_Utils_Tuple2(
								buildIdx,
								elm$core$Maybe$Just(character))))),
					elm$html$Html$Events$onClick(
					author$project$GlobalMessage$CModalMsg(
						author$project$GlobalMessage$UpdateBuildWithCharacter(
							_Utils_Tuple2(buildIdx, character))))
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$img,
					_List_fromArray(
						[
							elm$html$Html$Attributes$src(
							'resources/img/portraits/' + (elm$core$String$fromInt(character.id) + '.png')),
							elm$html$Html$Attributes$class(lockedCss)
						]),
					_List_Nil),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('tile-overlay ' + bannerCss)
						]),
					_List_Nil)
				]));
	});
var author$project$CharacterModal$viewCharacterGrid = F2(
	function (model, buildIdx) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('characters-grid')
				]),
			A2(
				elm$core$List$map,
				function (e) {
					return A3(author$project$CharacterModal$viewCharacterPicker, model, buildIdx, e);
				},
				model.data.characters));
	});
var author$project$GlobalMessage$CloseCharacterModal = {$: 'CloseCharacterModal'};
var elm$virtual_dom$VirtualDom$style = _VirtualDom_style;
var elm$html$Html$Attributes$style = elm$virtual_dom$VirtualDom$style;
var author$project$CharacterModal$buttonCloseModal = A2(
	elm$html$Html$div,
	_List_fromArray(
		[
			elm$html$Html$Events$onClick(
			author$project$GlobalMessage$CModalMsg(author$project$GlobalMessage$CloseCharacterModal)),
			elm$html$Html$Attributes$class('close close-button'),
			A2(elm$html$Html$Attributes$style, 'content', 'url(\"resources/lib/octicons/x.svg\")')
		]),
	_List_Nil);
var author$project$CustomTypes$NoTalent = {$: 'NoTalent'};
var author$project$Study$subjectToString = function (s) {
	switch (s.$) {
		case 'Sword':
			return 'Sword';
		case 'Lance':
			return 'Lance';
		case 'Axe':
			return 'Axe';
		case 'Bow':
			return 'Bow';
		case 'Brawling':
			return 'Brawling';
		case 'Reason':
			return 'Reason';
		case 'Faith':
			return 'Faith';
		case 'Authority':
			return 'Authority';
		case 'HeavyArmor':
			return 'HeavyArmor';
		case 'Riding':
			return 'Riding';
		default:
			return 'Flying';
	}
};
var elm$core$Dict$singleton = F2(
	function (key, value) {
		return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, key, value, elm$core$Dict$RBEmpty_elm_builtin, elm$core$Dict$RBEmpty_elm_builtin);
	});
var author$project$Study$defaultAcademicSkills = A3(
	elm$core$Dict$insert,
	author$project$Study$subjectToString(author$project$CustomTypes$Flying),
	author$project$CustomTypes$NoTalent,
	A3(
		elm$core$Dict$insert,
		author$project$Study$subjectToString(author$project$CustomTypes$Riding),
		author$project$CustomTypes$NoTalent,
		A3(
			elm$core$Dict$insert,
			author$project$Study$subjectToString(author$project$CustomTypes$HeavyArmor),
			author$project$CustomTypes$NoTalent,
			A3(
				elm$core$Dict$insert,
				author$project$Study$subjectToString(author$project$CustomTypes$Authority),
				author$project$CustomTypes$NoTalent,
				A3(
					elm$core$Dict$insert,
					author$project$Study$subjectToString(author$project$CustomTypes$Faith),
					author$project$CustomTypes$NoTalent,
					A3(
						elm$core$Dict$insert,
						author$project$Study$subjectToString(author$project$CustomTypes$Reason),
						author$project$CustomTypes$NoTalent,
						A3(
							elm$core$Dict$insert,
							author$project$Study$subjectToString(author$project$CustomTypes$Brawling),
							author$project$CustomTypes$NoTalent,
							A3(
								elm$core$Dict$insert,
								author$project$Study$subjectToString(author$project$CustomTypes$Bow),
								author$project$CustomTypes$NoTalent,
								A3(
									elm$core$Dict$insert,
									author$project$Study$subjectToString(author$project$CustomTypes$Axe),
									author$project$CustomTypes$NoTalent,
									A3(
										elm$core$Dict$insert,
										author$project$Study$subjectToString(author$project$CustomTypes$Lance),
										author$project$CustomTypes$NoTalent,
										A2(
											elm$core$Dict$singleton,
											author$project$Study$subjectToString(author$project$CustomTypes$Sword),
											author$project$CustomTypes$NoTalent)))))))))));
var author$project$CustomTypes$BuddingTalent = {$: 'BuddingTalent'};
var author$project$CustomTypes$Strength = {$: 'Strength'};
var author$project$CustomTypes$Weakness = {$: 'Weakness'};
var elm$core$Dict$union = F2(
	function (t1, t2) {
		return A3(elm$core$Dict$foldl, elm$core$Dict$insert, t2, t1);
	});
var author$project$Study$setupAcademicSkills = F3(
	function (sc, list, dict) {
		return A2(
			elm$core$Dict$union,
			elm$core$Dict$fromList(
				A2(
					elm$core$List$map,
					function (v) {
						return _Utils_Tuple2(
							author$project$Study$subjectToString(v),
							sc);
					},
					list)),
			dict);
	});
var author$project$Study$initAcademicSkillsList = A3(
	elm$core$Dict$insert,
	34,
	A3(
		author$project$Study$setupAcademicSkills,
		author$project$CustomTypes$Weakness,
		_List_fromArray(
			[author$project$CustomTypes$Reason, author$project$CustomTypes$Faith]),
		A3(
			author$project$Study$setupAcademicSkills,
			author$project$CustomTypes$Strength,
			_List_fromArray(
				[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$Bow, author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
			author$project$Study$defaultAcademicSkills)),
	A3(
		elm$core$Dict$insert,
		33,
		A3(
			author$project$Study$setupAcademicSkills,
			author$project$CustomTypes$Weakness,
			_List_fromArray(
				[author$project$CustomTypes$Faith]),
			A3(
				author$project$Study$setupAcademicSkills,
				author$project$CustomTypes$Strength,
				_List_fromArray(
					[author$project$CustomTypes$Lance, author$project$CustomTypes$Bow]),
				author$project$Study$defaultAcademicSkills)),
		A3(
			elm$core$Dict$insert,
			32,
			A3(
				author$project$Study$setupAcademicSkills,
				author$project$CustomTypes$Weakness,
				_List_fromArray(
					[author$project$CustomTypes$Reason]),
				A3(
					author$project$Study$setupAcademicSkills,
					author$project$CustomTypes$Strength,
					_List_fromArray(
						[author$project$CustomTypes$Sword, author$project$CustomTypes$Brawling]),
					author$project$Study$defaultAcademicSkills)),
			A3(
				elm$core$Dict$insert,
				31,
				A3(
					author$project$Study$setupAcademicSkills,
					author$project$CustomTypes$Weakness,
					_List_fromArray(
						[author$project$CustomTypes$Reason, author$project$CustomTypes$Flying]),
					A3(
						author$project$Study$setupAcademicSkills,
						author$project$CustomTypes$Strength,
						_List_fromArray(
							[author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling, author$project$CustomTypes$HeavyArmor]),
						author$project$Study$defaultAcademicSkills)),
				A3(
					elm$core$Dict$insert,
					30,
					A3(
						author$project$Study$setupAcademicSkills,
						author$project$CustomTypes$Strength,
						_List_fromArray(
							[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Riding]),
						author$project$Study$defaultAcademicSkills),
					A3(
						elm$core$Dict$insert,
						29,
						A3(
							author$project$Study$setupAcademicSkills,
							author$project$CustomTypes$Weakness,
							_List_fromArray(
								[author$project$CustomTypes$Reason]),
							A3(
								author$project$Study$setupAcademicSkills,
								author$project$CustomTypes$Strength,
								_List_fromArray(
									[author$project$CustomTypes$Sword, author$project$CustomTypes$Faith, author$project$CustomTypes$Flying]),
								author$project$Study$defaultAcademicSkills)),
						A3(
							elm$core$Dict$insert,
							28,
							A3(
								author$project$Study$setupAcademicSkills,
								author$project$CustomTypes$Weakness,
								_List_fromArray(
									[author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Flying]),
								A3(
									author$project$Study$setupAcademicSkills,
									author$project$CustomTypes$Strength,
									_List_fromArray(
										[author$project$CustomTypes$Bow, author$project$CustomTypes$Reason, author$project$CustomTypes$Riding]),
									author$project$Study$defaultAcademicSkills)),
							A3(
								elm$core$Dict$insert,
								27,
								A3(
									author$project$Study$setupAcademicSkills,
									author$project$CustomTypes$Weakness,
									_List_fromArray(
										[author$project$CustomTypes$HeavyArmor, author$project$CustomTypes$Riding]),
									A3(
										author$project$Study$setupAcademicSkills,
										author$project$CustomTypes$BuddingTalent,
										_List_fromArray(
											[author$project$CustomTypes$Reason]),
										A3(
											author$project$Study$setupAcademicSkills,
											author$project$CustomTypes$Strength,
											_List_fromArray(
												[author$project$CustomTypes$Lance, author$project$CustomTypes$Faith]),
											author$project$Study$defaultAcademicSkills))),
								A3(
									elm$core$Dict$insert,
									26,
									A3(
										author$project$Study$setupAcademicSkills,
										author$project$CustomTypes$Weakness,
										_List_fromArray(
											[author$project$CustomTypes$Riding]),
										A3(
											author$project$Study$setupAcademicSkills,
											author$project$CustomTypes$Strength,
											_List_fromArray(
												[author$project$CustomTypes$Sword, author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$Authority, author$project$CustomTypes$Flying]),
											author$project$Study$defaultAcademicSkills)),
									A3(
										elm$core$Dict$insert,
										25,
										A3(
											author$project$Study$setupAcademicSkills,
											author$project$CustomTypes$Strength,
											_List_fromArray(
												[author$project$CustomTypes$Lance, author$project$CustomTypes$Bow, author$project$CustomTypes$Riding]),
											author$project$Study$defaultAcademicSkills),
										A3(
											elm$core$Dict$insert,
											24,
											A3(
												author$project$Study$setupAcademicSkills,
												author$project$CustomTypes$Weakness,
												_List_fromArray(
													[author$project$CustomTypes$Faith, author$project$CustomTypes$Authority]),
												A3(
													author$project$Study$setupAcademicSkills,
													author$project$CustomTypes$BuddingTalent,
													_List_fromArray(
														[author$project$CustomTypes$HeavyArmor]),
													A3(
														author$project$Study$setupAcademicSkills,
														author$project$CustomTypes$Strength,
														_List_fromArray(
															[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe]),
														author$project$Study$defaultAcademicSkills))),
											A3(
												elm$core$Dict$insert,
												23,
												A3(
													author$project$Study$setupAcademicSkills,
													author$project$CustomTypes$Weakness,
													_List_fromArray(
														[author$project$CustomTypes$Brawling, author$project$CustomTypes$HeavyArmor]),
													A3(
														author$project$Study$setupAcademicSkills,
														author$project$CustomTypes$BuddingTalent,
														_List_fromArray(
															[author$project$CustomTypes$Lance]),
														A3(
															author$project$Study$setupAcademicSkills,
															author$project$CustomTypes$Strength,
															_List_fromArray(
																[author$project$CustomTypes$Sword, author$project$CustomTypes$Faith, author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
															author$project$Study$defaultAcademicSkills))),
												A3(
													elm$core$Dict$insert,
													22,
													A3(
														author$project$Study$setupAcademicSkills,
														author$project$CustomTypes$Weakness,
														_List_fromArray(
															[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$HeavyArmor]),
														A3(
															author$project$Study$setupAcademicSkills,
															author$project$CustomTypes$BuddingTalent,
															_List_fromArray(
																[author$project$CustomTypes$Sword]),
															A3(
																author$project$Study$setupAcademicSkills,
																author$project$CustomTypes$Strength,
																_List_fromArray(
																	[author$project$CustomTypes$Reason, author$project$CustomTypes$Faith, author$project$CustomTypes$Authority]),
																author$project$Study$defaultAcademicSkills))),
													A3(
														elm$core$Dict$insert,
														21,
														A3(
															author$project$Study$setupAcademicSkills,
															author$project$CustomTypes$Weakness,
															_List_fromArray(
																[author$project$CustomTypes$Flying]),
															A3(
																author$project$Study$setupAcademicSkills,
																author$project$CustomTypes$BuddingTalent,
																_List_fromArray(
																	[author$project$CustomTypes$Reason]),
																A3(
																	author$project$Study$setupAcademicSkills,
																	author$project$CustomTypes$Strength,
																	_List_fromArray(
																		[author$project$CustomTypes$Sword, author$project$CustomTypes$Bow, author$project$CustomTypes$Authority]),
																	author$project$Study$defaultAcademicSkills))),
														A3(
															elm$core$Dict$insert,
															20,
															A3(
																author$project$Study$setupAcademicSkills,
																author$project$CustomTypes$Weakness,
																_List_fromArray(
																	[author$project$CustomTypes$Bow, author$project$CustomTypes$Reason, author$project$CustomTypes$Riding]),
																A3(
																	author$project$Study$setupAcademicSkills,
																	author$project$CustomTypes$Strength,
																	_List_fromArray(
																		[author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling, author$project$CustomTypes$HeavyArmor]),
																	author$project$Study$defaultAcademicSkills)),
															A3(
																elm$core$Dict$insert,
																19,
																A3(
																	author$project$Study$setupAcademicSkills,
																	author$project$CustomTypes$Weakness,
																	_List_fromArray(
																		[author$project$CustomTypes$Brawling]),
																	A3(
																		author$project$Study$setupAcademicSkills,
																		author$project$CustomTypes$Strength,
																		_List_fromArray(
																			[author$project$CustomTypes$Lance, author$project$CustomTypes$Reason, author$project$CustomTypes$Riding]),
																		author$project$Study$defaultAcademicSkills)),
																A3(
																	elm$core$Dict$insert,
																	18,
																	A3(
																		author$project$Study$setupAcademicSkills,
																		author$project$CustomTypes$Weakness,
																		_List_fromArray(
																			[author$project$CustomTypes$Lance, author$project$CustomTypes$Faith]),
																		A3(
																			author$project$Study$setupAcademicSkills,
																			author$project$CustomTypes$BuddingTalent,
																			_List_fromArray(
																				[author$project$CustomTypes$Axe]),
																			A3(
																				author$project$Study$setupAcademicSkills,
																				author$project$CustomTypes$Strength,
																				_List_fromArray(
																					[author$project$CustomTypes$Sword, author$project$CustomTypes$Bow, author$project$CustomTypes$Authority, author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
																				author$project$Study$defaultAcademicSkills))),
																	A3(
																		elm$core$Dict$insert,
																		17,
																		A3(
																			author$project$Study$setupAcademicSkills,
																			author$project$CustomTypes$Strength,
																			_List_fromArray(
																				[author$project$CustomTypes$Sword, author$project$CustomTypes$Lance, author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
																			author$project$Study$defaultAcademicSkills),
																		A3(
																			elm$core$Dict$insert,
																			16,
																			A3(
																				author$project$Study$setupAcademicSkills,
																				author$project$CustomTypes$Weakness,
																				_List_fromArray(
																					[author$project$CustomTypes$Bow, author$project$CustomTypes$HeavyArmor]),
																				A3(
																					author$project$Study$setupAcademicSkills,
																					author$project$CustomTypes$Strength,
																					_List_fromArray(
																						[author$project$CustomTypes$Axe, author$project$CustomTypes$Reason, author$project$CustomTypes$Authority]),
																					author$project$Study$defaultAcademicSkills)),
																			A3(
																				elm$core$Dict$insert,
																				15,
																				A3(
																					author$project$Study$setupAcademicSkills,
																					author$project$CustomTypes$Weakness,
																					_List_fromArray(
																						[author$project$CustomTypes$Sword, author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$HeavyArmor]),
																					A3(
																						author$project$Study$setupAcademicSkills,
																						author$project$CustomTypes$BuddingTalent,
																						_List_fromArray(
																							[author$project$CustomTypes$Bow]),
																						A3(
																							author$project$Study$setupAcademicSkills,
																							author$project$CustomTypes$Strength,
																							_List_fromArray(
																								[author$project$CustomTypes$Reason, author$project$CustomTypes$Faith]),
																							author$project$Study$defaultAcademicSkills))),
																				A3(
																					elm$core$Dict$insert,
																					14,
																					A3(
																						author$project$Study$setupAcademicSkills,
																						author$project$CustomTypes$Weakness,
																						_List_fromArray(
																							[author$project$CustomTypes$Bow]),
																						A3(
																							author$project$Study$setupAcademicSkills,
																							author$project$CustomTypes$BuddingTalent,
																							_List_fromArray(
																								[author$project$CustomTypes$Reason]),
																							A3(
																								author$project$Study$setupAcademicSkills,
																								author$project$CustomTypes$Strength,
																								_List_fromArray(
																									[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$Riding]),
																								author$project$Study$defaultAcademicSkills))),
																					A3(
																						elm$core$Dict$insert,
																						13,
																						A3(
																							author$project$Study$setupAcademicSkills,
																							author$project$CustomTypes$Weakness,
																							_List_fromArray(
																								[author$project$CustomTypes$Reason]),
																							A3(
																								author$project$Study$setupAcademicSkills,
																								author$project$CustomTypes$BuddingTalent,
																								_List_fromArray(
																									[author$project$CustomTypes$Lance]),
																								A3(
																									author$project$Study$setupAcademicSkills,
																									author$project$CustomTypes$Strength,
																									_List_fromArray(
																										[author$project$CustomTypes$Axe, author$project$CustomTypes$Bow]),
																									author$project$Study$defaultAcademicSkills))),
																						A3(
																							elm$core$Dict$insert,
																							12,
																							A3(
																								author$project$Study$setupAcademicSkills,
																								author$project$CustomTypes$Weakness,
																								_List_fromArray(
																									[author$project$CustomTypes$Authority]),
																								A3(
																									author$project$Study$setupAcademicSkills,
																									author$project$CustomTypes$BuddingTalent,
																									_List_fromArray(
																										[author$project$CustomTypes$Faith]),
																									A3(
																										author$project$Study$setupAcademicSkills,
																										author$project$CustomTypes$Strength,
																										_List_fromArray(
																											[author$project$CustomTypes$Sword, author$project$CustomTypes$Bow, author$project$CustomTypes$Brawling]),
																										author$project$Study$defaultAcademicSkills))),
																							A3(
																								elm$core$Dict$insert,
																								11,
																								A3(
																									author$project$Study$setupAcademicSkills,
																									author$project$CustomTypes$Weakness,
																									_List_fromArray(
																										[author$project$CustomTypes$Faith, author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
																									A3(
																										author$project$Study$setupAcademicSkills,
																										author$project$CustomTypes$Strength,
																										_List_fromArray(
																											[author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling, author$project$CustomTypes$HeavyArmor]),
																										author$project$Study$defaultAcademicSkills)),
																								A3(
																									elm$core$Dict$insert,
																									10,
																									A3(
																										author$project$Study$setupAcademicSkills,
																										author$project$CustomTypes$Weakness,
																										_List_fromArray(
																											[author$project$CustomTypes$Axe, author$project$CustomTypes$Reason]),
																										A3(
																											author$project$Study$setupAcademicSkills,
																											author$project$CustomTypes$BuddingTalent,
																											_List_fromArray(
																												[author$project$CustomTypes$Riding]),
																											A3(
																												author$project$Study$setupAcademicSkills,
																												author$project$CustomTypes$Strength,
																												_List_fromArray(
																													[author$project$CustomTypes$Sword, author$project$CustomTypes$Lance, author$project$CustomTypes$Authority]),
																												author$project$Study$defaultAcademicSkills))),
																									A3(
																										elm$core$Dict$insert,
																										9,
																										A3(
																											author$project$Study$setupAcademicSkills,
																											author$project$CustomTypes$Weakness,
																											_List_fromArray(
																												[author$project$CustomTypes$Reason, author$project$CustomTypes$Faith]),
																											A3(
																												author$project$Study$setupAcademicSkills,
																												author$project$CustomTypes$Strength,
																												_List_fromArray(
																													[author$project$CustomTypes$Sword, author$project$CustomTypes$Axe, author$project$CustomTypes$Bow, author$project$CustomTypes$Flying]),
																												author$project$Study$defaultAcademicSkills)),
																										A3(
																											elm$core$Dict$insert,
																											8,
																											A3(
																												author$project$Study$setupAcademicSkills,
																												author$project$CustomTypes$Weakness,
																												_List_fromArray(
																													[author$project$CustomTypes$Riding, author$project$CustomTypes$Flying]),
																												A3(
																													author$project$Study$setupAcademicSkills,
																													author$project$CustomTypes$BuddingTalent,
																													_List_fromArray(
																														[author$project$CustomTypes$Faith]),
																													A3(
																														author$project$Study$setupAcademicSkills,
																														author$project$CustomTypes$Strength,
																														_List_fromArray(
																															[author$project$CustomTypes$Sword, author$project$CustomTypes$Reason]),
																														author$project$Study$defaultAcademicSkills))),
																											A3(
																												elm$core$Dict$insert,
																												7,
																												A3(
																													author$project$Study$setupAcademicSkills,
																													author$project$CustomTypes$Weakness,
																													_List_fromArray(
																														[author$project$CustomTypes$Sword, author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling, author$project$CustomTypes$HeavyArmor]),
																													A3(
																														author$project$Study$setupAcademicSkills,
																														author$project$CustomTypes$BuddingTalent,
																														_List_fromArray(
																															[author$project$CustomTypes$Riding]),
																														A3(
																															author$project$Study$setupAcademicSkills,
																															author$project$CustomTypes$Strength,
																															_List_fromArray(
																																[author$project$CustomTypes$Lance, author$project$CustomTypes$Bow]),
																															author$project$Study$defaultAcademicSkills))),
																												A3(
																													elm$core$Dict$insert,
																													6,
																													A3(
																														author$project$Study$setupAcademicSkills,
																														author$project$CustomTypes$Weakness,
																														_List_fromArray(
																															[author$project$CustomTypes$Bow, author$project$CustomTypes$Reason, author$project$CustomTypes$Authority]),
																														A3(
																															author$project$Study$setupAcademicSkills,
																															author$project$CustomTypes$Strength,
																															_List_fromArray(
																																[author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling]),
																															author$project$Study$defaultAcademicSkills)),
																													A3(
																														elm$core$Dict$insert,
																														5,
																														A3(
																															author$project$Study$setupAcademicSkills,
																															author$project$CustomTypes$Weakness,
																															_List_fromArray(
																																[author$project$CustomTypes$Axe, author$project$CustomTypes$Brawling]),
																															A3(
																																author$project$Study$setupAcademicSkills,
																																author$project$CustomTypes$Strength,
																																_List_fromArray(
																																	[author$project$CustomTypes$Reason, author$project$CustomTypes$Faith]),
																																author$project$Study$defaultAcademicSkills)),
																														A3(
																															elm$core$Dict$insert,
																															4,
																															A3(
																																author$project$Study$setupAcademicSkills,
																																author$project$CustomTypes$BuddingTalent,
																																_List_fromArray(
																																	[author$project$CustomTypes$HeavyArmor]),
																																A3(
																																	author$project$Study$setupAcademicSkills,
																																	author$project$CustomTypes$Strength,
																																	_List_fromArray(
																																		[author$project$CustomTypes$Sword, author$project$CustomTypes$Lance, author$project$CustomTypes$Axe, author$project$CustomTypes$Riding]),
																																	author$project$Study$defaultAcademicSkills)),
																															A3(
																																elm$core$Dict$insert,
																																3,
																																A3(
																																	author$project$Study$setupAcademicSkills,
																																	author$project$CustomTypes$Weakness,
																																	_List_fromArray(
																																		[author$project$CustomTypes$Axe, author$project$CustomTypes$Faith, author$project$CustomTypes$Flying]),
																																	A3(
																																		author$project$Study$setupAcademicSkills,
																																		author$project$CustomTypes$BuddingTalent,
																																		_List_fromArray(
																																			[author$project$CustomTypes$Lance]),
																																		A3(
																																			author$project$Study$setupAcademicSkills,
																																			author$project$CustomTypes$Strength,
																																			_List_fromArray(
																																				[author$project$CustomTypes$Bow, author$project$CustomTypes$Reason, author$project$CustomTypes$Authority]),
																																			author$project$Study$defaultAcademicSkills))),
																																A3(
																																	elm$core$Dict$insert,
																																	2,
																																	A3(
																																		author$project$Study$setupAcademicSkills,
																																		author$project$CustomTypes$Weakness,
																																		_List_fromArray(
																																			[author$project$CustomTypes$Bow, author$project$CustomTypes$Faith]),
																																		A3(
																																			author$project$Study$setupAcademicSkills,
																																			author$project$CustomTypes$BuddingTalent,
																																			_List_fromArray(
																																				[author$project$CustomTypes$Reason]),
																																			A3(
																																				author$project$Study$setupAcademicSkills,
																																				author$project$CustomTypes$Strength,
																																				_List_fromArray(
																																					[author$project$CustomTypes$Sword, author$project$CustomTypes$Axe, author$project$CustomTypes$Authority, author$project$CustomTypes$HeavyArmor]),
																																				author$project$Study$defaultAcademicSkills))),
																																	A3(
																																		elm$core$Dict$insert,
																																		1,
																																		A3(
																																			author$project$Study$setupAcademicSkills,
																																			author$project$CustomTypes$BuddingTalent,
																																			_List_fromArray(
																																				[author$project$CustomTypes$Faith]),
																																			A3(
																																				author$project$Study$setupAcademicSkills,
																																				author$project$CustomTypes$Strength,
																																				_List_fromArray(
																																					[author$project$CustomTypes$Sword, author$project$CustomTypes$Brawling, author$project$CustomTypes$Authority]),
																																				author$project$Study$defaultAcademicSkills)),
																																		A2(
																																			elm$core$Dict$singleton,
																																			0,
																																			A3(
																																				author$project$Study$setupAcademicSkills,
																																				author$project$CustomTypes$BuddingTalent,
																																				_List_fromArray(
																																					[author$project$CustomTypes$Faith]),
																																				A3(
																																					author$project$Study$setupAcademicSkills,
																																					author$project$CustomTypes$Strength,
																																					_List_fromArray(
																																						[author$project$CustomTypes$Sword, author$project$CustomTypes$Brawling, author$project$CustomTypes$Authority]),
																																					author$project$Study$defaultAcademicSkills)))))))))))))))))))))))))))))))))))));
var author$project$Study$getAcademicSkills = function (key) {
	return A2(
		elm$core$Maybe$withDefault,
		author$project$Study$defaultAcademicSkills,
		A2(elm$core$Dict$get, key, author$project$Study$initAcademicSkillsList));
};
var author$project$Study$stringToSubject = function (s) {
	switch (s) {
		case 'Sword':
			return author$project$CustomTypes$Sword;
		case 'Lance':
			return author$project$CustomTypes$Lance;
		case 'Axe':
			return author$project$CustomTypes$Axe;
		case 'Bow':
			return author$project$CustomTypes$Bow;
		case 'Brawling':
			return author$project$CustomTypes$Brawling;
		case 'Reason':
			return author$project$CustomTypes$Reason;
		case 'Faith':
			return author$project$CustomTypes$Faith;
		case 'Authority':
			return author$project$CustomTypes$Authority;
		case 'HeavyArmor':
			return author$project$CustomTypes$HeavyArmor;
		case 'Riding':
			return author$project$CustomTypes$Riding;
		default:
			return author$project$CustomTypes$Flying;
	}
};
var author$project$Study$subjectToId = function (s) {
	switch (s.$) {
		case 'Sword':
			return 0;
		case 'Lance':
			return 1;
		case 'Axe':
			return 2;
		case 'Bow':
			return 3;
		case 'Brawling':
			return 4;
		case 'Reason':
			return 5;
		case 'Faith':
			return 6;
		case 'Authority':
			return 7;
		case 'HeavyArmor':
			return 8;
		case 'Riding':
			return 9;
		default:
			return 10;
	}
};
var author$project$StudyView$getAcademicSkill = function (sc) {
	var studyCapacityName = function () {
		switch (sc.$) {
			case 'Strength':
				return 'strength';
			case 'Weakness':
				return 'weakness';
			case 'BuddingTalent':
				return 'budding_talent';
			default:
				return '';
		}
	}();
	return (elm$core$String$length(studyCapacityName) > 0) ? A2(
		elm$html$Html$img,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('study-picture'),
				elm$html$Html$Attributes$src('resources/img/skills/' + (studyCapacityName + '.png'))
			]),
		_List_Nil) : A2(elm$html$Html$div, _List_Nil, _List_Nil);
};
var author$project$StudyView$getStudyPicture = function (pictureId) {
	return A2(
		elm$html$Html$img,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('study-picture'),
				elm$html$Html$Attributes$src(
				'resources/img/skills/' + (elm$core$String$fromInt(pictureId) + '.png'))
			]),
		_List_Nil);
};
var elm$core$List$sortBy = _List_sortBy;
var elm$core$List$sort = function (xs) {
	return A2(elm$core$List$sortBy, elm$core$Basics$identity, xs);
};
var elm$html$Html$p = _VirtualDom_node('p');
var author$project$CharacterModal$viewAcademicSkillsDetail = function (id) {
	var academicSkills = author$project$Study$getAcademicSkills(id);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('character-description double-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Skill level')
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('study-table')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('study-table-row study-table-header')
							]),
						A2(
							elm$core$List$map,
							author$project$StudyView$getStudyPicture,
							elm$core$List$sort(
								A2(
									elm$core$List$map,
									function (_n0) {
										var k = _n0.a;
										return author$project$Study$subjectToId(
											author$project$Study$stringToSubject(k));
									},
									elm$core$Dict$toList(academicSkills))))),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('study-table-row')
							]),
						A2(
							elm$core$List$map,
							author$project$StudyView$getAcademicSkill,
							elm$core$Dict$values(academicSkills)))
					]))
			]));
};
var author$project$CharacterView$getCrestPicture = function (id) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('crest-picture qs'),
				A2(
				elm$html$Html$Attributes$style,
				'content',
				'url(\"resources/img/crests/' + (elm$core$String$fromInt(id) + '.png\")'))
			]),
		_List_Nil);
};
var author$project$CustomTypes$Crest = F4(
	function (id, pictureId, name, description) {
		return {description: description, id: id, name: name, pictureId: pictureId};
	});
var author$project$Crest$initCrests = _List_fromArray(
	[
		A4(author$project$CustomTypes$Crest, 1, 0, 'Flames', 'Occasionally restores HP equal to 30% of damage dealt. Rarely raises Mt and stops counterattacks.'),
		A4(author$project$CustomTypes$Crest, 2, 3, 'Blaiddyd', 'Occasionally doubles Atk and weapon uses for combat arts.'),
		A4(author$project$CustomTypes$Crest, 3, 1, 'Charon', 'Occasionally raises Mt when using combat arts.'),
		A4(author$project$CustomTypes$Crest, 4, 6, 'Daphnel', 'Sometimes raises Mt when using combat arts.'),
		A4(author$project$CustomTypes$Crest, 5, 7, 'Dominic', 'Occasionally conserves uses of attack magic.'),
		A4(author$project$CustomTypes$Crest, 6, 10, 'Fraldarius', 'Sometimes raises Mt when using a weapon.'),
		A4(author$project$CustomTypes$Crest, 7, 5, 'Gautier', 'Occasionally raises Mt when using combat arts.'),
		A4(author$project$CustomTypes$Crest, 8, 11, 'Gloucester', 'Occasionally raises Mt during magic attacks.'),
		A4(author$project$CustomTypes$Crest, 9, 8, 'Goneril', 'Sometimes allows combat arts to prevent enemy counterattacks.'),
		A4(author$project$CustomTypes$Crest, 10, 12, 'Lamine', 'Occasionally conserves uses of recovery magic.'),
		A4(author$project$CustomTypes$Crest, 11, 4, 'Riegan', 'Sometimes restores HP equal to 30% of damage dealt when using combat arts.'),
		A4(author$project$CustomTypes$Crest, 12, 13, 'Cethleann', 'Sometimes raises Mt when using recovery magic.'),
		A4(author$project$CustomTypes$Crest, 13, 14, 'Cichol', 'Sometimes lets combat arts prevent enemy counterattacks.'),
		A4(author$project$CustomTypes$Crest, 14, 15, 'Indech', 'Occasionally allows weapon attacks to strike twice.'),
		A4(author$project$CustomTypes$Crest, 15, 16, 'Macuil', 'Occasionally raises Mt during magic attacks.'),
		A4(author$project$CustomTypes$Crest, 16, 9, 'Maurice', 'Sometimes raises Mt when using a weapon.'),
		A4(author$project$CustomTypes$Crest, 17, 2, 'Seiros', 'Occasionally raises Mt when using combat arts.')
	]);
var author$project$Crest$getCrest = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$Crest$initCrests));
};
var author$project$NoDataView$viewNoData = A2(
	elm$html$Html$div,
	_List_fromArray(
		[
			elm$html$Html$Attributes$class('no-data')
		]),
	_List_Nil);
var author$project$Popover$viewPopover = F2(
	function (title, description) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('custom-popover above')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-title')
						]),
					_List_fromArray(
						[
							elm$html$Html$text('[' + (title + ']'))
						])),
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-text')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(description)
						]))
				]));
	});
var author$project$CharacterModal$viewCharacterCrestDetail = function (crestId) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('character-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Crest')
					])),
				function () {
				var _n0 = author$project$Crest$getCrest(crestId);
				if (_n0.$ === 'Just') {
					var value = _n0.a;
					return A2(
						elm$html$Html$div,
						_List_Nil,
						_List_fromArray(
							[
								author$project$CharacterView$getCrestPicture(value.pictureId),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(value.name)
									])),
								A2(author$project$Popover$viewPopover, value.name, value.description)
							]));
				} else {
					return author$project$NoDataView$viewNoData;
				}
			}()
			]));
};
var author$project$CustomTypes$CharacterSkill = F4(
	function (id, pictureId, name, description) {
		return {description: description, id: id, name: name, pictureId: pictureId};
	});
var author$project$CharacterSkill$initCharacterSkills = _List_fromArray(
	[
		A4(author$project$CustomTypes$CharacterSkill, 0, 114, 'Professor\'s Guidance', '+20% Experience Gained to user and adjacent ally.'),
		A4(author$project$CustomTypes$CharacterSkill, 1, 115, 'Professor\'s Guidance+', '+20% Experience Gained to user and adjacent ally, +2 Damage Dealt.'),
		A4(author$project$CustomTypes$CharacterSkill, 2, 116, 'Imperial Lineage', '+20% Experience Gained.'),
		A4(author$project$CustomTypes$CharacterSkill, 3, 117, 'Imperial Lineage+', '+20% Experience Gained, If unit takes no action except Wait, grants Res +4 for 1 turn.'),
		A4(author$project$CustomTypes$CharacterSkill, 4, 118, 'Royal Lineage', '+20% Experience Gained.'),
		A4(author$project$CustomTypes$CharacterSkill, 5, 119, 'Royal Lineage+', '+20% Experience Gained, Grants Avo +20 while unit is at full HP.'),
		A4(author$project$CustomTypes$CharacterSkill, 6, 120, 'Leicester Lineage', '+20% Experience Gained.'),
		A4(author$project$CustomTypes$CharacterSkill, 7, 121, 'Leicester Lineage+', '+20% Experience Gained, grants unit effects of Pass.'),
		A4(author$project$CustomTypes$CharacterSkill, 8, 163, 'Officer Duty', 'Boosts Gambit Might by 5.'),
		A4(author$project$CustomTypes$CharacterSkill, 9, 148, 'Songstress', 'At the start of each turn, restores adjacent allies’ HP by 10%.'),
		A4(author$project$CustomTypes$CharacterSkill, 10, 132, 'Confidence', 'When HP is full, unit gains +15 Hit and Avoid.'),
		A4(author$project$CustomTypes$CharacterSkill, 11, 132, 'Persecution Complex', 'When HP is not full, unit gains +5 Damage.'),
		A4(author$project$CustomTypes$CharacterSkill, 12, 165, 'Born Fighter', 'Adjacent foes receive Avoid -10 during combat.'),
		A4(author$project$CustomTypes$CharacterSkill, 13, 149, 'Catnap', 'If unit waits without performing an action, restores 10% HP.'),
		A4(author$project$CustomTypes$CharacterSkill, 14, 132, 'Hunter\'s Boon', 'When foe has less than 50% HP, Critical rate +20.'),
		A4(author$project$CustomTypes$CharacterSkill, 15, 141, 'Live to Serve', 'When healing allies with White Magic, unit is healed by the same amount.'),
		A4(author$project$CustomTypes$CharacterSkill, 16, 132, 'Staunch Shield', 'If user waits without acting, Defense +4 for one turn.'),
		A4(author$project$CustomTypes$CharacterSkill, 17, 132, 'Lone Wolf', 'When a Battalion is not deployed or when battalion health is zero, damage dealt +5.'),
		A4(author$project$CustomTypes$CharacterSkill, 18, 142, 'Lockpick', 'Unit can open locks and chests without keys.'),
		A4(author$project$CustomTypes$CharacterSkill, 19, 104, 'Perseverance', 'When Rally command is used on ally, grants Strength +4.'),
		A4(author$project$CustomTypes$CharacterSkill, 20, 133, 'Philanderer', 'When adjacent to a female ally, damage dealt to foe +2, damage received from foe -2.'),
		A4(author$project$CustomTypes$CharacterSkill, 21, 163, 'Lady Knight', 'When using a Gambit, Might +3 and Hit Rate +5.'),
		A4(author$project$CustomTypes$CharacterSkill, 22, 153, 'Distinguished House', 'When a battalion is deployed, damage dealt +2.'),
		A4(author$project$CustomTypes$CharacterSkill, 23, 134, 'Advocate', 'When an adjacent male ally enters battle, ally’s damage dealt +3.'),
		A4(author$project$CustomTypes$CharacterSkill, 24, 149, 'Goody Basket', 'At the start of a turn, unit has Luck% chance of regaining 10% of HP.'),
		A4(author$project$CustomTypes$CharacterSkill, 25, 143, 'Mastermind', 'Unit gains 2x skill EXP from combat.'),
		A4(author$project$CustomTypes$CharacterSkill, 26, 170, 'Watchful Eye', 'Hit rate +20.'),
		A4(author$project$CustomTypes$CharacterSkill, 27, 149, 'Animal Friend', 'When adjacent to a horseback or flying ally, restores 20% HP at the start of the turn.'),
		A4(author$project$CustomTypes$CharacterSkill, 28, 104, 'Rivalry', 'When adjacent to a male ally, damage dealt to foe +2, damage received from foe -2.'),
		A4(author$project$CustomTypes$CharacterSkill, 29, 149, 'Infirmary Master', 'Adjacent allies gain Crit Avoid +10 during combat.'),
		A4(author$project$CustomTypes$CharacterSkill, 30, 100, 'Crest Scholar', 'Use Rally to grant Mag +4 to an ally.'),
		A4(author$project$CustomTypes$CharacterSkill, 31, 132, 'Fighting Spirit', 'Unit takes 5 less damage when no battalion is assigned or when battalion endurance is 0.'),
		A4(author$project$CustomTypes$CharacterSkill, 32, 107, 'Compassion', 'Use Rally to grant Lck +8 to an ally.'),
		A4(author$project$CustomTypes$CharacterSkill, 33, 134, 'Guardian', 'Adjacent female allies deal 3 extra damage during combat.'),
		A4(author$project$CustomTypes$CharacterSkill, 34, 134, 'Lily\'s Poise', 'Adjacent allies take 3 less damage during combat.'),
		A4(author$project$CustomTypes$CharacterSkill, 35, 153, 'Veteran Knight', 'Unit takes 2 less damage while in formation with a battalion.'),
		A4(author$project$CustomTypes$CharacterSkill, 36, 132, 'Survival Instinct', 'If unit initiates combat and defeats foe, grants Str/Mag/Dex/Spd +4 for one turn.'),
		A4(author$project$CustomTypes$CharacterSkill, 37, 161, 'Aptitude', 'Makes each stat 20% more likely to increase on level up.')
	]);
var author$project$CharacterSkill$getCharacterSkillById = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$CharacterSkill$initCharacterSkills));
};
var author$project$CharacterView$getSkillCharacterPicture = function (pictureId) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('cskill-picture qs'),
				A2(
				elm$html$Html$Attributes$style,
				'content',
				'url(\"resources/img/skills/' + (elm$core$String$fromInt(pictureId) + '.png\")'))
			]),
		_List_Nil);
};
var author$project$CharacterModal$viewCharacterSkillDetail = function (skillId) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('character-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Personnal skill')
					])),
				function () {
				var _n0 = author$project$CharacterSkill$getCharacterSkillById(skillId);
				if (_n0.$ === 'Just') {
					var value = _n0.a;
					return A2(
						elm$html$Html$div,
						_List_Nil,
						_List_fromArray(
							[
								author$project$CharacterView$getSkillCharacterPicture(value.pictureId),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(value.name)
									])),
								A2(author$project$Popover$viewPopover, value.name, value.description)
							]));
				} else {
					return author$project$NoDataView$viewNoData;
				}
			}()
			]));
};
var author$project$CharacterModal$viewContentDetail = function (character) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('detail-content')
			]),
		_List_fromArray(
			[
				author$project$CharacterModal$viewCharacterSkillDetail(character.characterSkillId),
				author$project$CharacterModal$viewCharacterCrestDetail(character.crestId),
				author$project$CharacterModal$viewAcademicSkillsDetail(character.id)
			]));
};
var author$project$CharacterModal$getBannerPicture = function (maybeId) {
	if (maybeId.$ === 'Just') {
		var id = maybeId.a;
		return A2(
			elm$html$Html$img,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('banner-picture'),
					elm$html$Html$Attributes$src(
					'resources/img/banners/' + (elm$core$String$fromInt(id) + '.png'))
				]),
			_List_Nil);
	} else {
		return A2(
			elm$html$Html$img,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('banner-picture'),
					A2(elm$html$Html$Attributes$style, 'opacity', '0'),
					A2(elm$html$Html$Attributes$style, 'height', '3rem'),
					A2(elm$html$Html$Attributes$style, 'width', '3rem')
				]),
			_List_Nil);
	}
};
var author$project$CharacterModal$getFullPortrait = function (id) {
	return A2(
		elm$html$Html$img,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('full-portrait-picutre character-picture'),
				elm$html$Html$Attributes$src(
				'resources/img/portraits/' + (elm$core$String$fromInt(id) + '.png'))
			]),
		_List_Nil);
};
var author$project$CharacterModal$viewFullPortraitDetail = function (character) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('full-portrait-title')
			]),
		_List_fromArray(
			[
				author$project$CharacterModal$getFullPortrait(character.id),
				author$project$CharacterModal$getBannerPicture(character.bannerId),
				A2(
				elm$html$Html$p,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('title-text')
					]),
				_List_fromArray(
					[
						elm$html$Html$text(character.name)
					]))
			]));
};
var author$project$CharacterModal$viewCharacterDetail = function (character) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('character-detail')
			]),
		_List_fromArray(
			[
				author$project$CharacterModal$viewFullPortraitDetail(character),
				author$project$CharacterModal$viewContentDetail(character)
			]));
};
var author$project$CharacterModal$viewSideBar = function (character) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('sidebar')
			]),
		_List_fromArray(
			[
				author$project$CharacterModal$buttonCloseModal,
				author$project$CharacterModal$viewCharacterDetail(character)
			]));
};
var author$project$GlobalMessage$NoOp = {$: 'NoOp'};
var elm$json$Json$Encode$bool = _Json_wrap;
var elm$html$Html$Attributes$boolProperty = F2(
	function (key, bool) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$bool(bool));
	});
var elm$html$Html$Attributes$hidden = elm$html$Html$Attributes$boolProperty('hidden');
var elm$virtual_dom$VirtualDom$MayStopPropagation = function (a) {
	return {$: 'MayStopPropagation', a: a};
};
var elm$html$Html$Events$stopPropagationOn = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$MayStopPropagation(decoder));
	});
var author$project$CharacterModal$modalCharacterPicker = function (model) {
	var _n0 = model.view.characterPicker;
	var idx = _n0.a;
	var maybeCharacter = _n0.b;
	var character = A2(elm$core$Maybe$withDefault, author$project$Character$getCharacterByDefault, maybeCharacter);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('modal-c'),
				elm$html$Html$Attributes$hidden(!model.view.characterModalIsOpen),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$CModalMsg(author$project$GlobalMessage$CloseCharacterModal))
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('modal-content'),
						A2(
						elm$html$Html$Events$stopPropagationOn,
						'click',
						elm$json$Json$Decode$succeed(
							_Utils_Tuple2(author$project$GlobalMessage$NoOp, true)))
					]),
				_List_fromArray(
					[
						A2(author$project$CharacterModal$viewCharacterGrid, model, idx),
						author$project$CharacterModal$viewSideBar(character)
					]))
			]));
};
var author$project$GlobalMessage$CloseJobModal = {$: 'CloseJobModal'};
var author$project$GlobalMessage$JModalMsg = function (a) {
	return {$: 'JModalMsg', a: a};
};
var author$project$GlobalMessage$UpdateCategory = function (a) {
	return {$: 'UpdateCategory', a: a};
};
var author$project$JobModal$viewJobCategoryTile = function (id) {
	var customCss = function () {
		switch (id) {
			case 1:
				return 'beginner';
			case 2:
				return 'intermediate';
			case 3:
				return 'advanced';
			case 4:
				return 'master';
			default:
				return 'unique';
		}
	}() + '-category';
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('category-tile'),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$JModalMsg(
					author$project$GlobalMessage$UpdateCategory(id)))
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('category-picture ' + customCss)
					]),
				_List_Nil)
			]));
};
var author$project$JobModal$viewJobCategoryRow = _List_fromArray(
	[
		A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('jobs-row')
			]),
		A2(
			elm$core$List$map,
			function (jc) {
				return author$project$JobModal$viewJobCategoryTile(jc.id);
			},
			author$project$JobCategory$initJobCategories))
	]);
var author$project$GlobalMessage$DeleteCategory = {$: 'DeleteCategory'};
var author$project$GlobalMessage$UpdateBuild = function (a) {
	return {$: 'UpdateBuild', a: a};
};
var author$project$Job$filterJobsAvailable = F2(
	function (character, listJob) {
		return A2(
			elm$core$List$filter,
			function (j) {
				return A2(
					elm$core$Maybe$withDefault,
					true,
					A2(
						elm$core$Maybe$map,
						function (g) {
							return _Utils_eq(g, character.gender);
						},
						j.gender));
			},
			A2(
				elm$core$List$filter,
				function (j) {
					return (!elm$core$List$length(j.onlyCharacters)) || A2(elm$core$List$member, character.id, j.onlyCharacters);
				},
				listJob));
	});
var author$project$Job$getJobsByCategory = function (categoryId) {
	return A2(
		elm$core$List$filter,
		function (j) {
			return _Utils_eq(j.jobCategoryId, categoryId);
		},
		author$project$Job$initJobs);
};
var author$project$GlobalMessage$UpdateJobPicker = function (a) {
	return {$: 'UpdateJobPicker', a: a};
};
var author$project$JobView$getJobPictureWithBackground = function (job) {
	var categoryId = job.canFly ? 6 : job.jobCategoryId;
	return _List_fromArray(
		[
			A2(
			elm$html$Html$img,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('job-background'),
					elm$html$Html$Attributes$src(
					'resources/img/background/' + (elm$core$String$fromInt(categoryId) + '.png'))
				]),
			_List_Nil),
			A2(
			elm$html$Html$img,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('job-picture'),
					elm$html$Html$Attributes$src(
					'resources/img/jobs/' + (elm$core$String$fromInt(job.idPicture) + '.gif'))
				]),
			_List_Nil)
		]);
};
var author$project$JobView$getJobTile = F2(
	function (customCss, job) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('job-background-tile ' + customCss)
				]),
			author$project$JobView$getJobPictureWithBackground(job));
	});
var elm$core$Tuple$second = function (_n0) {
	var y = _n0.b;
	return y;
};
var author$project$JobModal$viewJobTile = F3(
	function (model, _n0, job) {
		var buildIdx = _n0.a;
		var lockedCss = A2(
			elm$core$List$member,
			job.id,
			elm$core$Dict$values(
				A2(
					elm$core$Dict$map,
					F2(
						function (_n2, v) {
							return v.jobId;
						}),
					A2(
						elm$core$Dict$filter,
						F2(
							function (k, _n1) {
								return _Utils_eq(k, buildIdx);
							}),
						model.team)))) ? 'locked-picture' : '';
		var clickedCss = _Utils_eq(model.view.jobPicker.b, job) ? 'clicked-picture' : '';
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('job-tile ' + (lockedCss + (' ' + clickedCss))),
					elm$html$Html$Events$onClick(
					author$project$GlobalMessage$JModalMsg(
						author$project$GlobalMessage$UpdateJobPicker(
							_Utils_Tuple2(buildIdx, job))))
				]),
			_List_fromArray(
				[
					A2(author$project$JobView$getJobTile, lockedCss, job)
				]));
	});
var author$project$JobModal$viewJobRow = F2(
	function (model, categoryId) {
		var jobsCategorized = function (id) {
			return A3(
				elm$core$List$foldr,
				elm$core$List$cons,
				_List_Nil,
				author$project$Job$getJobsByCategory(id));
		};
		var _n0 = model.view.jobPicker;
		var buildIdx = _n0.a;
		var job = _n0.b;
		var listJob = A2(
			elm$core$Maybe$withDefault,
			_List_Nil,
			A2(
				elm$core$Maybe$andThen,
				function (c) {
					return elm$core$Maybe$Just(
						A2(
							author$project$Job$filterJobsAvailable,
							c,
							jobsCategorized(categoryId)));
				},
				A2(
					elm$core$Maybe$andThen,
					function (id) {
						return author$project$Character$getCharacterById(id);
					},
					A2(
						elm$core$Maybe$map,
						function (b) {
							return b.idCharacter;
						},
						A2(elm$core$Dict$get, buildIdx, model.team)))));
		return _List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('return-button button'),
						elm$html$Html$Events$onClick(
						author$project$GlobalMessage$JModalMsg(author$project$GlobalMessage$DeleteCategory))
					]),
				_List_Nil),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('jobs-row')
					]),
				A2(
					elm$core$List$map,
					function (e) {
						return A3(
							author$project$JobModal$viewJobTile,
							model,
							_Utils_Tuple2(buildIdx, job),
							e);
					},
					listJob)),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('valid-button button'),
						elm$html$Html$Events$onClick(
						author$project$GlobalMessage$JModalMsg(
							author$project$GlobalMessage$UpdateBuild(
								_Utils_Tuple2(buildIdx, job))))
					]),
				_List_Nil)
			]);
	});
var author$project$JobModal$viewJobsGrid = function (model) {
	var rowDiv = function () {
		var _n0 = model.view.categorySelected;
		if (_n0.$ === 'Just') {
			var categoryId = _n0.a;
			return A2(author$project$JobModal$viewJobRow, model, categoryId);
		} else {
			return author$project$JobModal$viewJobCategoryRow;
		}
	}();
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('jobs-grid')
			]),
		rowDiv);
};
var author$project$JobModal$buttonCloseModal = A2(
	elm$html$Html$div,
	_List_fromArray(
		[
			elm$html$Html$Events$onClick(
			author$project$GlobalMessage$JModalMsg(author$project$GlobalMessage$CloseJobModal)),
			elm$html$Html$Attributes$class('close close-button'),
			A2(elm$html$Html$Attributes$style, 'content', 'url(\"resources/lib/octicons/x.svg\")')
		]),
	_List_Nil);
var author$project$ElmUtils$appendMaybeText = F2(
	function (maybeText, maybeOldText) {
		if (maybeOldText.$ === 'Just') {
			var oldText = maybeOldText.a;
			if (maybeText.$ === 'Just') {
				var text = maybeText.a;
				return elm$core$Maybe$Just(oldText + (' / ' + text));
			} else {
				return maybeOldText;
			}
		} else {
			if (maybeText.$ === 'Just') {
				return maybeText;
			} else {
				return elm$core$Maybe$Nothing;
			}
		}
	});
var author$project$Study$getStudyById = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$Study$initStudies));
};
var author$project$Study$rankToId = function (rank) {
	switch (rank.$) {
		case 'E':
			return 0;
		case 'Eplus':
			return 1;
		case 'D':
			return 2;
		case 'Dplus':
			return 3;
		case 'C':
			return 4;
		case 'Cplus':
			return 5;
		case 'B':
			return 6;
		case 'Bplus':
			return 7;
		case 'A':
			return 8;
		case 'Aplus':
			return 9;
		case 'S':
			return 10;
		default:
			return 11;
	}
};
var author$project$StudyView$getRankPicture = function (rank) {
	var pictureId = author$project$Study$rankToId(rank);
	return A2(
		elm$html$Html$img,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('rank-picture'),
				elm$html$Html$Attributes$src(
				'resources/img/ranks/' + (elm$core$String$fromInt(pictureId) + '.png'))
			]),
		_List_Nil);
};
var author$project$StudyView$viewStudy = function (study) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('study-view')
			]),
		_List_fromArray(
			[
				author$project$StudyView$getStudyPicture(
				author$project$Study$subjectToId(study.subject)),
				author$project$StudyView$getRankPicture(study.rank)
			]));
};
var elm_community$maybe_extra$Maybe$Extra$foldrValues = F2(
	function (item, list) {
		if (item.$ === 'Nothing') {
			return list;
		} else {
			var v = item.a;
			return A2(elm$core$List$cons, v, list);
		}
	});
var elm_community$maybe_extra$Maybe$Extra$values = A2(elm$core$List$foldr, elm_community$maybe_extra$Maybe$Extra$foldrValues, _List_Nil);
var author$project$JobModal$viewCertificationRequirement = function (job) {
	var studyList = elm_community$maybe_extra$Maybe$Extra$values(
		A2(elm$core$List$map, author$project$Study$getStudyById, job.studyIdList));
	var studyListDiv = (elm$core$List$length(studyList) > 0) ? A2(elm$core$List$map, author$project$StudyView$viewStudy, studyList) : _List_fromArray(
		[
			A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('no-data')
				]),
			_List_Nil)
		]);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Certificats req.')
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('list-study')
					]),
				studyListDiv)
			]));
};
var author$project$JobSkill$getJobSkillsByJob = function (jobId) {
	return A2(
		elm$core$List$filter,
		function (e) {
			return A2(elm$core$List$member, jobId, e.jobIdList);
		},
		author$project$JobSkill$initJobSkills);
};
var author$project$CustomTypes$JobType = {$: 'JobType'};
var author$project$CustomTypes$Skill = function (id) {
	return function (skillType) {
		return function (combatArt) {
			return function (learnByJob) {
				return function (name) {
					return function (description) {
						return function (pictureId) {
							return function (studyId) {
								return function (jobIdList) {
									return function (charactersOnly) {
										return function (allExcept) {
											return function (durabilityCost) {
												return function (might) {
													return function (hit) {
														return function (avoid) {
															return function (criticalRate) {
																return function (range) {
																	return {allExcept: allExcept, avoid: avoid, charactersOnly: charactersOnly, combatArt: combatArt, criticalRate: criticalRate, description: description, durabilityCost: durabilityCost, hit: hit, id: id, jobIdList: jobIdList, learnByJob: learnByJob, might: might, name: name, pictureId: pictureId, range: range, skillType: skillType, studyId: studyId};
																};
															};
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$ModelUtils$jobSkillToSkill = function (j) {
	return author$project$CustomTypes$Skill(j.id)(author$project$CustomTypes$JobType)(j.combatArt)(false)(j.name)(j.description)(j.pictureId)(elm$core$Maybe$Nothing)(j.jobIdList)(_List_Nil)(false)(j.durabilityCost)(j.might)(j.hit)(j.avoid)(j.criticalRate)(j.range);
};
var author$project$SkillView$viewSkill = function (skill) {
	var cssClass = skill.combatArt ? 'art-picture' : 'skill-picture';
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('qs ' + cssClass),
						A2(
						elm$html$Html$Attributes$style,
						'content',
						'url(\"resources/img/skills/' + (elm$core$String$fromInt(skill.pictureId) + '.png\")'))
					]),
				_List_Nil),
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text(skill.name)
					])),
				A2(author$project$Popover$viewPopover, skill.name, skill.description)
			]));
};
var author$project$JobModal$viewJobSkills = function (job) {
	var skillList = A2(
		elm$core$List$map,
		function (s) {
			return author$project$SkillView$viewSkill(
				author$project$ModelUtils$jobSkillToSkill(s));
		},
		author$project$JobSkill$getJobSkillsByJob(job.id));
	var skillListDiv = (elm$core$List$length(skillList) > 0) ? skillList : _List_fromArray(
		[
			A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('no-data')
				]),
			_List_Nil)
		]);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Job skills')
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('list-jobskill')
					]),
				skillListDiv)
			]));
};
var author$project$MasterySkill$getMasterySkillsForJob = function (id) {
	return A2(
		elm$core$List$filter,
		function (e) {
			return A2(elm$core$List$member, id, e.jobIdList);
		},
		author$project$MasterySkill$initMasterySkills);
};
var author$project$ModelUtils$masterySkillToSkill = function (m) {
	return author$project$CustomTypes$Skill(m.id)(author$project$CustomTypes$MasteryType)(m.combatArt)(true)(m.name)(m.description)(m.pictureId)(elm$core$Maybe$Nothing)(m.jobIdList)(_List_Nil)(false)(m.durabilityCost)(m.might)(m.hit)(m.avoid)(m.criticalRate)(m.range);
};
var author$project$JobModal$viewSkillMastery = function (job) {
	var skillList = A2(
		elm$core$List$map,
		function (s) {
			return author$project$SkillView$viewSkill(
				author$project$ModelUtils$masterySkillToSkill(s));
		},
		author$project$MasterySkill$getMasterySkillsForJob(job.id));
	var skillListDiv = (elm$core$List$length(skillList) > 0) ? skillList : _List_fromArray(
		[
			A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('no-data')
				]),
			_List_Nil)
		]);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Skill learned')
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('list-jobskill')
					]),
				skillListDiv)
			]));
};
var author$project$JobModal$viewTitleDetail = function (job) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-title')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('title-picture'),
						A2(
						elm$html$Html$Attributes$style,
						'content',
						'url(\"resources/img/jobs/' + (elm$core$String$fromInt(job.idPicture) + '.gif\")'))
					]),
				_List_Nil),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('title-text')
					]),
				_List_fromArray(
					[
						elm$html$Html$text(job.name)
					]))
			]));
};
var author$project$ModelUtils$jobCategoryIdToString = function (id) {
	switch (id) {
		case 0:
			return 'Starting';
		case 1:
			return 'Beginner';
		case 2:
			return 'Intermediate';
		case 3:
			return 'Advanced';
		case 4:
			return 'Master';
		default:
			return 'Unique';
	}
};
var author$project$CustomTypes$JobDescription = F6(
	function (level, experience, customExperience, note, gender, magicUsage) {
		return {customExperience: customExperience, experience: experience, gender: gender, level: level, magicUsage: magicUsage, note: note};
	});
var author$project$JobCategory$getJobCategoryById = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (x) {
				return _Utils_eq(x.id, val);
			},
			author$project$JobCategory$initJobCategories));
};
var author$project$ModelUtils$genderToString = function (gender) {
	if (gender.$ === 'Male') {
		return 'Male';
	} else {
		return 'Female';
	}
};
var author$project$ModelUtils$magicUsageToString = function (gender) {
	if (gender.$ === 'CanUseMagic') {
		return 'Can use magic';
	} else {
		return 'Can use some magic';
	}
};
var author$project$ModelUtils$jobToDescription = function (job) {
	var maybeJobCategory = author$project$JobCategory$getJobCategoryById(job.jobCategoryId);
	var magicUsage = A2(
		elm$core$Maybe$map,
		function (e) {
			return author$project$ModelUtils$magicUsageToString(e);
		},
		job.magicUsage);
	var level = A2(
		elm$core$Maybe$map,
		function (e) {
			return elm$core$String$fromInt(e);
		},
		A2(
			elm$core$Maybe$andThen,
			function (e) {
				return e.level;
			},
			maybeJobCategory));
	var gender = A2(
		elm$core$Maybe$map,
		function (e) {
			return author$project$ModelUtils$genderToString(e);
		},
		job.gender);
	var experience = A2(
		elm$core$Maybe$map,
		function (e) {
			return elm$core$String$fromInt(e);
		},
		A2(
			elm$core$Maybe$andThen,
			function (e) {
				return e.experience;
			},
			maybeJobCategory));
	var customExperience = A2(
		elm$core$Maybe$map,
		function (e) {
			return elm$core$String$fromInt(e);
		},
		job.customExperience);
	return A6(author$project$CustomTypes$JobDescription, level, experience, customExperience, job.note, gender, magicUsage);
};
var elm$core$Basics$neq = _Utils_notEqual;
var author$project$JobModal$viewJobDetail = function (model) {
	var currentJob = model.view.jobPicker.b;
	var description = author$project$ModelUtils$jobToDescription(currentJob);
	var maybeExperience = (!_Utils_eq(description.experience, elm$core$Maybe$Nothing)) ? description.experience : description.customExperience;
	var noteText = A2(
		author$project$ElmUtils$appendMaybeText,
		description.magicUsage,
		A2(author$project$ElmUtils$appendMaybeText, description.note, elm$core$Maybe$Nothing));
	var category = author$project$ModelUtils$jobCategoryIdToString(currentJob.jobCategoryId);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-menu')
			]),
		_List_fromArray(
			[
				author$project$JobModal$viewTitleDetail(currentJob),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('job-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Category')
							])),
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text(category)
							]))
					])),
				author$project$JobModal$viewJobSkills(currentJob),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('job-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Level minimum')
							])),
						A2(
						elm$core$Maybe$withDefault,
						author$project$NoDataView$viewNoData,
						A2(
							elm$core$Maybe$map,
							function (l) {
								return A2(
									elm$html$Html$p,
									_List_Nil,
									_List_fromArray(
										[
											elm$html$Html$text('Available at level ' + l)
										]));
							},
							description.level))
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('job-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Note')
							])),
						A2(
						elm$core$Maybe$withDefault,
						author$project$NoDataView$viewNoData,
						A2(
							elm$core$Maybe$map,
							function (n) {
								return A2(
									elm$html$Html$p,
									_List_Nil,
									_List_fromArray(
										[
											elm$html$Html$text(n)
										]));
							},
							noteText))
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('job-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Gender restriction')
							])),
						A2(
						elm$core$Maybe$withDefault,
						author$project$NoDataView$viewNoData,
						A2(
							elm$core$Maybe$map,
							function (g) {
								return A2(
									elm$html$Html$p,
									_List_Nil,
									_List_fromArray(
										[
											elm$html$Html$text(g + ' only')
										]));
							},
							description.gender))
					])),
				author$project$JobModal$viewCertificationRequirement(currentJob),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('job-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Experience to master')
							])),
						A2(
						elm$core$Maybe$withDefault,
						author$project$NoDataView$viewNoData,
						A2(
							elm$core$Maybe$map,
							function (e) {
								return A2(
									elm$html$Html$p,
									_List_Nil,
									_List_fromArray(
										[
											elm$html$Html$text(e + ' class xp')
										]));
							},
							maybeExperience))
					])),
				author$project$JobModal$viewSkillMastery(currentJob)
			]));
};
var author$project$JobModal$viewSideBar = function (model) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('sidebar')
			]),
		_List_fromArray(
			[
				author$project$JobModal$buttonCloseModal,
				author$project$JobModal$viewJobDetail(model)
			]));
};
var author$project$JobModal$modalJobPicker = function (model) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('modal-j'),
				elm$html$Html$Attributes$hidden(!model.view.jobModalIsOpen),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$JModalMsg(author$project$GlobalMessage$CloseJobModal))
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('modal-content'),
						A2(
						elm$html$Html$Events$stopPropagationOn,
						'click',
						elm$json$Json$Decode$succeed(
							_Utils_Tuple2(author$project$GlobalMessage$NoOp, true)))
					]),
				_List_fromArray(
					[
						author$project$JobModal$viewSideBar(model),
						author$project$JobModal$viewJobsGrid(model)
					]))
			]));
};
var author$project$GlobalMessage$CloseSkillModal = {$: 'CloseSkillModal'};
var author$project$GlobalMessage$SModalMsg = function (a) {
	return {$: 'SModalMsg', a: a};
};
var author$project$GlobalMessage$CleanSearchSkillFilter = {$: 'CleanSearchSkillFilter'};
var author$project$GlobalMessage$UpdateSkillFilter = function (a) {
	return {$: 'UpdateSkillFilter', a: a};
};
var elm$html$Html$input = _VirtualDom_node('input');
var elm$html$Html$Attributes$placeholder = elm$html$Html$Attributes$stringProperty('placeholder');
var elm$html$Html$Attributes$value = elm$html$Html$Attributes$stringProperty('value');
var elm$html$Html$Events$alwaysStop = function (x) {
	return _Utils_Tuple2(x, true);
};
var elm$json$Json$Decode$field = _Json_decodeField;
var elm$json$Json$Decode$at = F2(
	function (fields, decoder) {
		return A3(elm$core$List$foldr, elm$json$Json$Decode$field, decoder, fields);
	});
var elm$json$Json$Decode$string = _Json_decodeString;
var elm$html$Html$Events$targetValue = A2(
	elm$json$Json$Decode$at,
	_List_fromArray(
		['target', 'value']),
	elm$json$Json$Decode$string);
var elm$html$Html$Events$onInput = function (tagger) {
	return A2(
		elm$html$Html$Events$stopPropagationOn,
		'input',
		A2(
			elm$json$Json$Decode$map,
			elm$html$Html$Events$alwaysStop,
			A2(elm$json$Json$Decode$map, tagger, elm$html$Html$Events$targetValue)));
};
var author$project$SkillModal$viewSearchFilter = function (model) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('filter search-filter')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Search :')
					])),
				A2(
				elm$html$Html$input,
				_List_fromArray(
					[
						elm$html$Html$Attributes$placeholder('Skill name'),
						elm$html$Html$Attributes$value(model.view.skillSearch),
						elm$html$Html$Events$onInput(
						function (msg) {
							return author$project$GlobalMessage$SModalMsg(
								author$project$GlobalMessage$UpdateSkillFilter(msg));
						})
					]),
				_List_Nil),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Events$onClick(
						author$project$GlobalMessage$SModalMsg(author$project$GlobalMessage$CleanSearchSkillFilter)),
						elm$html$Html$Attributes$class('close close-button'),
						A2(elm$html$Html$Attributes$style, 'content', 'url(\"resources/lib/octicons/x.svg\")')
					]),
				_List_Nil)
			]));
};
var author$project$Job$getJobById = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (x) {
				return _Utils_eq(x.id, val);
			},
			author$project$Job$initJobs));
};
var author$project$ModelHandler$characterIsLegit = F2(
	function (characterId, skill) {
		return (elm$core$List$length(skill.jobIdList) > 0) ? (elm$core$List$length(
			A2(
				elm$core$List$filter,
				function (j) {
					return (!elm$core$List$length(j.onlyCharacters)) || A2(elm$core$List$member, characterId, j.onlyCharacters);
				},
				elm_community$maybe_extra$Maybe$Extra$values(
					A2(
						elm$core$List$map,
						function (id) {
							return author$project$Job$getJobById(id);
						},
						skill.jobIdList)))) > 0) : true;
	});
var author$project$ModelHandler$genderIsLegit = F2(
	function (gender, skill) {
		return (elm$core$List$length(skill.jobIdList) > 0) ? (elm$core$List$length(
			A2(
				elm$core$List$filter,
				function (j) {
					return _Utils_eq(
						A2(elm$core$Maybe$withDefault, gender, j.gender),
						gender);
				},
				elm_community$maybe_extra$Maybe$Extra$values(
					A2(
						elm$core$List$map,
						function (id) {
							return author$project$Job$getJobById(id);
						},
						skill.jobIdList)))) > 0) : true;
	});
var author$project$ModelHandler$shouldCollectSkill = F2(
	function (idChar, skill) {
		var genderIsOk = A2(
			elm$core$Maybe$withDefault,
			false,
			A2(
				elm$core$Maybe$map,
				function (c) {
					return A2(author$project$ModelHandler$genderIsLegit, c.gender, skill);
				},
				author$project$Character$getCharacterById(idChar)));
		var characterIsOk = A2(author$project$ModelHandler$characterIsLegit, idChar, skill);
		var skillIsOk = genderIsOk && characterIsOk;
		return (elm$core$List$length(skill.charactersOnly) > 0) ? (skill.allExcept ? (A2(elm$core$List$member, idChar, skill.charactersOnly) ? false : skillIsOk) : (A2(elm$core$List$member, idChar, skill.charactersOnly) ? skillIsOk : false)) : skillIsOk;
	});
var author$project$ModelUtils$standardSkillToSkill = function (s) {
	return author$project$CustomTypes$Skill(s.id)(author$project$CustomTypes$StandardType)(s.combatArt)(false)(s.name)(s.description)(s.pictureId)(
		elm$core$Maybe$Just(s.studyId))(_List_Nil)(s.charactersOnly)(s.allExcept)(s.durabilityCost)(s.might)(s.hit)(s.avoid)(s.criticalRate)(s.range);
};
var elm$core$List$append = F2(
	function (xs, ys) {
		if (!ys.b) {
			return xs;
		} else {
			return A3(elm$core$List$foldr, elm$core$List$cons, ys, xs);
		}
	});
var author$project$ModelHandler$getSkillList = F3(
	function (idChar, isCombatArt, dataModel) {
		var listSkills = A2(
			elm$core$List$map,
			function (s) {
				return elm$core$Maybe$Just(
					author$project$ModelUtils$standardSkillToSkill(s));
			},
			A2(
				elm$core$List$filter,
				function (s) {
					return _Utils_eq(s.combatArt, isCombatArt);
				},
				dataModel.standardSkills));
		return A2(
			elm$core$List$filter,
			function (s) {
				return A2(author$project$ModelHandler$shouldCollectSkill, idChar, s);
			},
			elm_community$maybe_extra$Maybe$Extra$values(
				A2(
					elm$core$List$append,
					listSkills,
					A2(
						elm$core$List$map,
						function (m) {
							return elm$core$Maybe$Just(
								author$project$ModelUtils$masterySkillToSkill(m));
						},
						A2(
							elm$core$List$filter,
							function (m) {
								return _Utils_eq(m.combatArt, isCombatArt);
							},
							dataModel.masterySkills)))));
	});
var author$project$ElmUtils$boolToInt = function (bool) {
	return bool ? 1 : 0;
};
var author$project$ModelUtils$skillTypeToString = function (skillType) {
	switch (skillType.$) {
		case 'MasteryType':
			return 'MasteryType';
		case 'StandardType':
			return 'StandardType';
		case 'JobType':
			return 'JobType';
		case 'CharacterType':
			return 'CharacterType';
		default:
			return 'NoType';
	}
};
var author$project$SkillModal$listSortBy = F2(
	function (model, list) {
		var _n0 = model.view.skillListSortBy;
		if (_n0.$ === 'SortByType') {
			return A2(
				elm$core$List$sortBy,
				function (e) {
					return author$project$ElmUtils$boolToInt(e.learnByJob);
				},
				A2(
					elm$core$List$sortBy,
					function (e) {
						return author$project$ModelUtils$skillTypeToString(e.skillType);
					},
					list));
		} else {
			return A2(
				elm$core$List$sortBy,
				function ($) {
					return $.name;
				},
				list);
		}
	});
var elm$core$String$toLower = _String_toLower;
var elm$core$String$trim = _String_trim;
var author$project$SkillModal$searchTermInList = F2(
	function (term, list) {
		return (elm$core$String$length(
			elm$core$String$trim(term)) > 0) ? A2(
			elm$core$List$filter,
			function (s) {
				return A2(
					elm$core$String$contains,
					elm$core$String$toLower(term),
					elm$core$String$toLower(s.name));
			},
			list) : list;
	});
var author$project$GlobalMessage$UpdateBuildWithSkill = function (a) {
	return {$: 'UpdateBuildWithSkill', a: a};
};
var author$project$GlobalMessage$UpdateSkillPicker = function (a) {
	return {$: 'UpdateSkillPicker', a: a};
};
var author$project$SkillModal$viewSkillTile = F2(
	function (model, skill) {
		var _n0 = model.view.skillPicker;
		var _n1 = _n0.a;
		var buildIdx = _n1.a;
		var skillIdx = _n1.b;
		var isCombatArt = _n0.c;
		var lockedCss = (elm$core$List$length(
			A2(
				elm$core$List$filter,
				function (_n2) {
					var skillId = _n2.b;
					var skillType = _n2.c;
					return _Utils_eq(skill.id, skillId) && _Utils_eq(skill.skillType, skillType);
				},
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					A2(
						elm$core$Maybe$map,
						function (build) {
							return isCombatArt ? build.listActiveSkill : build.listPassiveSkill;
						},
						A2(elm$core$Dict$get, buildIdx, model.team))))) > 0) ? 'locked-picture' : '';
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('tile ' + lockedCss),
					elm$html$Html$Events$onMouseOver(
					author$project$GlobalMessage$SModalMsg(
						author$project$GlobalMessage$UpdateSkillPicker(
							_Utils_Tuple3(
								_Utils_Tuple2(buildIdx, skillIdx),
								elm$core$Maybe$Just(skill),
								isCombatArt)))),
					elm$html$Html$Events$onClick(
					author$project$GlobalMessage$SModalMsg(
						author$project$GlobalMessage$UpdateBuildWithSkill(
							_Utils_Tuple3(
								_Utils_Tuple2(buildIdx, skillIdx),
								skill,
								isCombatArt))))
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$img,
					_List_fromArray(
						[
							elm$html$Html$Attributes$src(
							'resources/img/skills/' + (elm$core$String$fromInt(skill.pictureId) + '.png')),
							elm$html$Html$Attributes$class(lockedCss)
						]),
					_List_Nil),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text(skill.name)
						])),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('tile-overlay ')
						]),
					_List_Nil)
				]));
	});
var author$project$SkillModal$viewSkillGrid = function (model) {
	var _n0 = model.view.skillPicker;
	var _n1 = _n0.a;
	var buildIdx = _n1.a;
	var isCombatArt = _n0.c;
	var listSkill = A2(
		elm$core$List$map,
		function (s) {
			return A2(author$project$SkillModal$viewSkillTile, model, s);
		},
		A2(
			author$project$SkillModal$searchTermInList,
			model.view.skillSearch,
			A2(
				author$project$SkillModal$listSortBy,
				model,
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					A2(
						elm$core$Maybe$andThen,
						function (build) {
							return elm$core$Maybe$Just(
								A3(author$project$ModelHandler$getSkillList, build.idCharacter, isCombatArt, model.data));
						},
						A2(elm$core$Dict$get, buildIdx, model.team))))));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skills-grid')
			]),
		listSkill);
};
var author$project$GlobalMessage$ChangeSortType = function (a) {
	return {$: 'ChangeSortType', a: a};
};
var author$project$ModelUtils$listSortType = _List_fromArray(
	[author$project$CustomTypes$SortByType, author$project$CustomTypes$SortByName]);
var author$project$ModelUtils$sortTypeToKeyValue = function (sortType) {
	if (sortType.$ === 'SortByType') {
		return _Utils_Tuple2('SortByType', 'Type');
	} else {
		return _Utils_Tuple2('SortByName', 'Name');
	}
};
var elm$html$Html$option = _VirtualDom_node('option');
var elm$html$Html$select = _VirtualDom_node('select');
var author$project$SkillModal$viewSortFilter = A2(
	elm$html$Html$div,
	_List_fromArray(
		[
			elm$html$Html$Attributes$class('filter sort-filter')
		]),
	_List_fromArray(
		[
			A2(
			elm$html$Html$p,
			_List_Nil,
			_List_fromArray(
				[
					elm$html$Html$text('Sort by :')
				])),
			A2(
			elm$html$Html$select,
			_List_fromArray(
				[
					elm$html$Html$Events$onInput(
					function (e) {
						return author$project$GlobalMessage$SModalMsg(
							author$project$GlobalMessage$ChangeSortType(e));
					})
				]),
			A2(
				elm$core$List$map,
				function (_n0) {
					var v = _n0.a;
					var t = _n0.b;
					return A2(
						elm$html$Html$option,
						_List_fromArray(
							[
								elm$html$Html$Attributes$value(v)
							]),
						_List_fromArray(
							[
								elm$html$Html$text(t)
							]));
				},
				A2(
					elm$core$List$map,
					function (e) {
						return author$project$ModelUtils$sortTypeToKeyValue(e);
					},
					author$project$ModelUtils$listSortType)))
		]));
var author$project$SkillModal$viewModalContent = function (model) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('modal-table')
			]),
		_List_fromArray(
			[
				author$project$SkillModal$viewSearchFilter(model),
				author$project$SkillModal$viewSortFilter,
				author$project$SkillModal$viewSkillGrid(model)
			]));
};
var author$project$ModelHandler$getActiveSkillByDefault = A2(
	elm$core$Maybe$withDefault,
	author$project$CustomTypes$Skill(-1)(author$project$CustomTypes$MasteryType)(true)(true)('')('')(-1)(elm$core$Maybe$Nothing)(_List_Nil)(_List_Nil)(false)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
	A2(
		elm$core$Maybe$map,
		function (s) {
			return author$project$ModelUtils$masterySkillToSkill(s);
		},
		elm$core$List$head(
			A2(
				elm$core$List$filter,
				function (s) {
					return s.id === 3;
				},
				author$project$MasterySkill$initMasterySkills))));
var author$project$ModelHandler$getPassiveSkillByDefault = A2(
	elm$core$Maybe$withDefault,
	author$project$CustomTypes$Skill(-1)(author$project$CustomTypes$MasteryType)(false)(true)('')('')(-1)(elm$core$Maybe$Nothing)(_List_Nil)(_List_Nil)(false)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing)(elm$core$Maybe$Nothing),
	A2(
		elm$core$Maybe$map,
		function (s) {
			return author$project$ModelUtils$masterySkillToSkill(s);
		},
		elm$core$List$head(
			A2(
				elm$core$List$filter,
				function (s) {
					return !s.id;
				},
				author$project$MasterySkill$initMasterySkills))));
var author$project$SkillModal$buttonCloseModal = A2(
	elm$html$Html$div,
	_List_fromArray(
		[
			elm$html$Html$Events$onClick(
			author$project$GlobalMessage$SModalMsg(author$project$GlobalMessage$CloseSkillModal)),
			elm$html$Html$Attributes$class('close close-button'),
			A2(elm$html$Html$Attributes$style, 'content', 'url(\"resources/lib/octicons/x.svg\")')
		]),
	_List_Nil);
var author$project$SkillModal$viewCombatArtDescription = function (skill) {
	var rangeInString = function (_n0) {
		var start = _n0.a;
		var end = _n0.b;
		return _Utils_eq(start, end) ? elm$core$String$fromInt(start) : (elm$core$String$fromInt(start) + ('~' + elm$core$String$fromInt(end)));
	};
	var range = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return rangeInString(e);
			},
			skill.range));
	var might = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return elm$core$String$fromInt(e);
			},
			skill.might));
	var hit = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return elm$core$String$fromInt(e);
			},
			skill.hit));
	var durabilityCost = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return '-' + elm$core$String$fromInt(e);
			},
			skill.durabilityCost));
	var criticalRate = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return elm$core$String$fromInt(e);
			},
			skill.criticalRate));
	var avoid = A2(
		elm$core$Maybe$withDefault,
		'-',
		A2(
			elm$core$Maybe$map,
			function (e) {
				return elm$core$String$fromInt(e);
			},
			skill.avoid));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-description art-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Art')
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('art-table')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('art-table-row art-table-header')
							]),
						_List_fromArray(
							[
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Cost')
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Mt')
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Hit')
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Avo')
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Crit')
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text('Range')
									]))
							])),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('art-table-row')
							]),
						_List_fromArray(
							[
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(durabilityCost)
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(might)
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(hit)
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(avoid)
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(criticalRate)
									])),
								A2(
								elm$html$Html$p,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(range)
									]))
							]))
					]))
			]));
};
var author$project$JobView$getJobPicture = function (id) {
	return A2(
		elm$html$Html$img,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-picture'),
				elm$html$Html$Attributes$src(
				'resources/img/jobs/' + (elm$core$String$fromInt(id) + '.gif'))
			]),
		_List_Nil);
};
var author$project$JobView$viewJob = function (job) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-view')
			]),
		_List_fromArray(
			[
				author$project$JobView$getJobPicture(job.idPicture),
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text(job.name)
					]))
			]));
};
var author$project$SkillModal$viewJobToMaster = function (skill) {
	var maybeJobs = elm_community$maybe_extra$Maybe$Extra$values(
		A2(
			elm$core$List$map,
			function (id) {
				return author$project$Job$getJobById(id);
			},
			skill.jobIdList));
	return (elm$core$List$length(maybeJobs) > 0) ? A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-description job-description')
			]),
		A2(
			elm$core$List$cons,
			A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Class to master')
					])),
			A2(
				elm$core$List$map,
				function (j) {
					return author$project$JobView$viewJob(j);
				},
				maybeJobs))) : A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-description job-description')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Class to master')
					])),
				author$project$NoDataView$viewNoData
			]));
};
var elm_community$maybe_extra$Maybe$Extra$traverse = function (f) {
	var step = F2(
		function (e, acc) {
			var _n0 = f(e);
			if (_n0.$ === 'Nothing') {
				return elm$core$Maybe$Nothing;
			} else {
				var x = _n0.a;
				return A2(
					elm$core$Maybe$map,
					elm$core$List$cons(x),
					acc);
			}
		});
	return A2(
		elm$core$List$foldr,
		step,
		elm$core$Maybe$Just(_List_Nil));
};
var elm_community$maybe_extra$Maybe$Extra$combine = elm_community$maybe_extra$Maybe$Extra$traverse(elm$core$Basics$identity);
var author$project$SkillModal$viewJobDescription = function (maybeJob) {
	var listStudyToReach = A2(
		elm$core$Maybe$withDefault,
		_List_Nil,
		elm_community$maybe_extra$Maybe$Extra$combine(
			A2(
				elm$core$List$map,
				function (id) {
					return author$project$Study$getStudyById(id);
				},
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					A2(
						elm$core$Maybe$map,
						function (e) {
							return e.studyIdList;
						},
						maybeJob)))));
	return A2(
		elm$core$List$map,
		function (s) {
			return author$project$StudyView$viewStudy(s);
		},
		listStudyToReach);
};
var elm$core$List$concat = function (lists) {
	return A3(elm$core$List$foldr, elm$core$List$append, _List_Nil, lists);
};
var author$project$SkillModal$viewJobsDescription = function (skill) {
	var jobToMasterList = elm$core$List$concat(
		A2(
			elm$core$List$map,
			function (mj) {
				return author$project$SkillModal$viewJobDescription(mj);
			},
			A2(
				elm$core$List$map,
				function (id) {
					return author$project$Job$getJobById(id);
				},
				skill.jobIdList)));
	return (elm$core$List$length(jobToMasterList) > 0) ? A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-description list-study')
			]),
		A2(
			elm$core$List$cons,
			A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Class\'s certif.')
					])),
			jobToMasterList)) : A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-description list-study')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text('Class\'s certif.')
					])),
				author$project$NoDataView$viewNoData
			]));
};
var author$project$SkillModal$viewStudyDescription = function (skill) {
	var maybeStudy = A2(elm$core$Maybe$andThen, author$project$Study$getStudyById, skill.studyId);
	if (maybeStudy.$ === 'Just') {
		var study = maybeStudy.a;
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('skill-description list-study')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text('Certificats req.')
						])),
					author$project$StudyView$viewStudy(study)
				]));
	} else {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('skill-description list-study')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text('Certificats req.')
						])),
					author$project$NoDataView$viewNoData
				]));
	}
};
var author$project$SkillModal$viewActiveSkillDescription = function (skill) {
	var description = (elm$core$String$length(
		elm$core$String$trim(skill.description)) > 0) ? A2(
		elm$html$Html$p,
		_List_Nil,
		_List_fromArray(
			[
				elm$html$Html$text(skill.description)
			])) : author$project$NoDataView$viewNoData;
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				author$project$SkillModal$viewCombatArtDescription(skill),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('skill-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Effect')
							])),
						description
					])),
				author$project$SkillModal$viewStudyDescription(skill),
				author$project$SkillModal$viewJobToMaster(skill),
				author$project$SkillModal$viewJobsDescription(skill)
			]));
};
var author$project$SkillModal$viewPassiveSkillDescription = function (skill) {
	var description = (elm$core$String$length(
		elm$core$String$trim(skill.description)) > 0) ? A2(
		elm$html$Html$p,
		_List_Nil,
		_List_fromArray(
			[
				elm$html$Html$text(skill.description)
			])) : author$project$NoDataView$viewNoData;
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('skill-description')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text('Effect')
							])),
						description
					])),
				author$project$SkillModal$viewStudyDescription(skill),
				author$project$SkillModal$viewJobToMaster(skill),
				author$project$SkillModal$viewJobsDescription(skill)
			]));
};
var author$project$SkillModal$viewSkillDetail = function (skill) {
	var viewDescription = skill.combatArt ? author$project$SkillModal$viewActiveSkillDescription : author$project$SkillModal$viewPassiveSkillDescription;
	var cssClass = skill.combatArt ? 'combat-art' : '';
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-detail ' + cssClass)
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('skill-title')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('title-picture'),
								A2(
								elm$html$Html$Attributes$style,
								'content',
								'url(\"resources/img/skills/' + (elm$core$String$fromInt(skill.pictureId) + '.png\")'))
							]),
						_List_Nil),
						A2(
						elm$html$Html$p,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('title-text')
							]),
						_List_fromArray(
							[
								elm$html$Html$text(skill.name)
							]))
					])),
				viewDescription(skill)
			]));
};
var author$project$SkillModal$viewSideBar = function (model) {
	var _n0 = model.view.skillPicker;
	var _n1 = _n0.a;
	var maybeSkill = _n0.b;
	var isCombatArt = _n0.c;
	var getSkillByDefault = isCombatArt ? author$project$ModelHandler$getActiveSkillByDefault : author$project$ModelHandler$getPassiveSkillByDefault;
	if (maybeSkill.$ === 'Just') {
		var skill = maybeSkill.a;
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('sidebar')
				]),
			_List_fromArray(
				[
					author$project$SkillModal$buttonCloseModal,
					author$project$SkillModal$viewSkillDetail(skill)
				]));
	} else {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('sidebar')
				]),
			_List_fromArray(
				[
					author$project$SkillModal$buttonCloseModal,
					author$project$SkillModal$viewSkillDetail(getSkillByDefault)
				]));
	}
};
var author$project$SkillModal$modalSkillPicker = function (model) {
	var _n0 = model.view.skillPicker;
	var _n1 = _n0.a;
	var isCombatArt = _n0.c;
	var modalCss = isCombatArt ? 'active-skill-modal' : 'passive-skill-modal';
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('modal-s'),
				elm$html$Html$Attributes$hidden(!model.view.skillModalIsOpen),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$SModalMsg(author$project$GlobalMessage$CloseSkillModal))
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('modal-content ' + modalCss),
						A2(
						elm$html$Html$Events$stopPropagationOn,
						'click',
						elm$json$Json$Decode$succeed(
							_Utils_Tuple2(author$project$GlobalMessage$NoOp, true)))
					]),
				_List_fromArray(
					[
						author$project$SkillModal$viewModalContent(model),
						author$project$SkillModal$viewSideBar(model)
					]))
			]));
};
var author$project$GlobalMessage$AddBuild = {$: 'AddBuild'};
var author$project$GlobalMessage$BuildMsg = function (a) {
	return {$: 'BuildMsg', a: a};
};
var author$project$MasterySkill$getMasterySkill = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$MasterySkill$initMasterySkills));
};
var author$project$StandardSkill$getStandardSkill = function (val) {
	return elm$core$List$head(
		A2(
			elm$core$List$filter,
			function (e) {
				return _Utils_eq(e.id, val);
			},
			author$project$StandardSkill$initStandardSkills));
};
var elm$core$List$singleton = function (value) {
	return _List_fromArray(
		[value]);
};
var author$project$BuildInfoView$sectionActiveSkill = function (build) {
	var skillIdToView = F2(
		function (skillId, skillType) {
			if (_Utils_eq(skillType, author$project$CustomTypes$MasteryType)) {
				var thirdDiv = A2(
					elm$core$Maybe$withDefault,
					author$project$NoDataView$viewNoData,
					A2(
						elm$core$Maybe$map,
						author$project$JobView$viewJob,
						A2(
							elm$core$Maybe$andThen,
							function (m) {
								return author$project$Job$getJobById(
									A2(
										elm$core$Maybe$withDefault,
										0,
										elm$core$List$head(m.jobIdList)));
							},
							author$project$MasterySkill$getMasterySkill(skillId))));
				var secondDiv = A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('arrow-down')
						]),
					_List_Nil);
				var firstDiv = A2(
					elm$core$List$map,
					function (s) {
						return A2(
							elm$core$Maybe$withDefault,
							author$project$NoDataView$viewNoData,
							A2(elm$core$Maybe$map, author$project$StudyView$viewStudy, s));
					},
					A2(
						elm$core$List$map,
						author$project$Study$getStudyById,
						A2(
							elm$core$Maybe$withDefault,
							_List_Nil,
							A2(
								elm$core$Maybe$map,
								function (j) {
									return j.studyIdList;
								},
								A2(
									elm$core$Maybe$andThen,
									function (m) {
										return author$project$Job$getJobById(
											A2(
												elm$core$Maybe$withDefault,
												0,
												elm$core$List$head(m.jobIdList)));
									},
									author$project$MasterySkill$getMasterySkill(skillId))))));
				return _Utils_ap(
					firstDiv,
					_List_fromArray(
						[secondDiv, thirdDiv]));
			} else {
				if (_Utils_eq(skillType, author$project$CustomTypes$StandardType)) {
					return elm$core$List$singleton(
						A2(
							elm$core$Maybe$withDefault,
							author$project$NoDataView$viewNoData,
							A2(
								elm$core$Maybe$map,
								author$project$StudyView$viewStudy,
								A2(
									elm$core$Maybe$andThen,
									function (s) {
										return author$project$Study$getStudyById(s.studyId);
									},
									author$project$StandardSkill$getStandardSkill(skillId)))));
				} else {
					return elm$core$List$singleton(
						A2(elm$html$Html$p, _List_Nil, _List_Nil));
				}
			}
		});
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('active-skill-section')
			]),
		A2(
			elm$core$List$map,
			function (_n0) {
				var skillId = _n0.b;
				var skillType = _n0.c;
				return A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('skill-info')
						]),
					A2(skillIdToView, skillId, skillType));
			},
			build.listActiveSkill));
};
var author$project$BuildInfoView$sectionCharacter = function (character) {
	var academicSkills = author$project$Study$getAcademicSkills(character.id);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('character-section')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('study-table')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('study-table-row study-table-header')
							]),
						A2(
							elm$core$List$map,
							author$project$StudyView$getStudyPicture,
							elm$core$List$sort(
								A2(
									elm$core$List$map,
									function (_n0) {
										var k = _n0.a;
										return author$project$Study$subjectToId(
											author$project$Study$stringToSubject(k));
									},
									elm$core$Dict$toList(academicSkills))))),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('study-table-row')
							]),
						A2(
							elm$core$List$map,
							author$project$StudyView$getAcademicSkill,
							elm$core$Dict$values(academicSkills)))
					]))
			]));
};
var author$project$BuildInfoView$sectionJob = function (build) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('job-section')
			]),
		A2(
			elm$core$List$map,
			function (s) {
				return A2(
					elm$core$Maybe$withDefault,
					author$project$NoDataView$viewNoData,
					A2(elm$core$Maybe$map, author$project$StudyView$viewStudy, s));
			},
			A2(
				elm$core$List$map,
				author$project$Study$getStudyById,
				A2(
					elm$core$Maybe$withDefault,
					_List_Nil,
					A2(
						elm$core$Maybe$map,
						function (j) {
							return j.studyIdList;
						},
						author$project$Job$getJobById(build.jobId))))));
};
var author$project$BuildInfoView$sectionPassiveSkill = function (build) {
	var skillIdToView = F2(
		function (skillId, skillType) {
			if (_Utils_eq(skillType, author$project$CustomTypes$MasteryType)) {
				var thirdDiv = A2(
					elm$core$Maybe$withDefault,
					author$project$NoDataView$viewNoData,
					A2(
						elm$core$Maybe$map,
						author$project$JobView$viewJob,
						A2(
							elm$core$Maybe$andThen,
							function (m) {
								return author$project$Job$getJobById(
									A2(
										elm$core$Maybe$withDefault,
										0,
										elm$core$List$head(m.jobIdList)));
							},
							author$project$MasterySkill$getMasterySkill(skillId))));
				var secondDiv = A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('arrow-down')
						]),
					_List_Nil);
				var firstDiv = A2(
					elm$core$List$map,
					function (s) {
						return A2(
							elm$core$Maybe$withDefault,
							author$project$NoDataView$viewNoData,
							A2(elm$core$Maybe$map, author$project$StudyView$viewStudy, s));
					},
					A2(
						elm$core$List$map,
						author$project$Study$getStudyById,
						A2(
							elm$core$Maybe$withDefault,
							_List_Nil,
							A2(
								elm$core$Maybe$map,
								function (j) {
									return j.studyIdList;
								},
								A2(
									elm$core$Maybe$andThen,
									function (m) {
										return author$project$Job$getJobById(
											A2(
												elm$core$Maybe$withDefault,
												0,
												elm$core$List$head(m.jobIdList)));
									},
									author$project$MasterySkill$getMasterySkill(skillId))))));
				return _Utils_ap(
					firstDiv,
					_List_fromArray(
						[secondDiv, thirdDiv]));
			} else {
				if (_Utils_eq(skillType, author$project$CustomTypes$StandardType)) {
					return elm$core$List$singleton(
						A2(
							elm$core$Maybe$withDefault,
							author$project$NoDataView$viewNoData,
							A2(
								elm$core$Maybe$map,
								author$project$StudyView$viewStudy,
								A2(
									elm$core$Maybe$andThen,
									function (s) {
										return author$project$Study$getStudyById(s.studyId);
									},
									author$project$StandardSkill$getStandardSkill(skillId)))));
				} else {
					return elm$core$List$singleton(
						A2(elm$html$Html$p, _List_Nil, _List_Nil));
				}
			}
		});
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('passive-skill-section')
			]),
		A2(
			elm$core$List$map,
			function (_n0) {
				var skillId = _n0.b;
				var skillType = _n0.c;
				return A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('skill-info')
						]),
					A2(skillIdToView, skillId, skillType));
			},
			build.listPassiveSkill));
};
var elm$html$Html$Attributes$id = elm$html$Html$Attributes$stringProperty('id');
var author$project$BuildInfoView$sectionBuildInfo = function (build) {
	var character = A2(
		elm$core$Maybe$withDefault,
		author$project$Character$getCharacterByDefault,
		author$project$Character$getCharacterById(build.idCharacter));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('item-b2 build-info'),
				elm$html$Html$Attributes$hidden(build.hiddenInfo),
				elm$html$Html$Attributes$id(
				'info-' + elm$core$String$fromInt(build.idCharacter))
			]),
		_List_fromArray(
			[
				author$project$BuildInfoView$sectionCharacter(character),
				author$project$BuildInfoView$sectionPassiveSkill(build),
				author$project$BuildInfoView$sectionActiveSkill(build),
				author$project$BuildInfoView$sectionJob(build)
			]));
};
var author$project$GlobalMessage$DeleteBuild = function (a) {
	return {$: 'DeleteBuild', a: a};
};
var author$project$GlobalMessage$DownBuild = function (a) {
	return {$: 'DownBuild', a: a};
};
var author$project$GlobalMessage$UpBuild = function (a) {
	return {$: 'UpBuild', a: a};
};
var author$project$BuildView$controlPanel = F2(
	function (model, idx) {
		var upCustomCss = (idx > 0) ? 'button-clickable' : 'locked-controller';
		var removeCustomCss = (elm$core$Dict$size(model.team) > 1) ? 'button-clickable' : 'locked-controller';
		var downCustomCss = (_Utils_cmp(
			idx,
			elm$core$Dict$size(model.team) - 1) < 0) ? 'button-clickable' : 'locked-controller';
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('c-panel')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('up-controller ' + upCustomCss),
							elm$html$Html$Events$onClick(
							author$project$GlobalMessage$BuildMsg(
								author$project$GlobalMessage$UpBuild(idx)))
						]),
					_List_Nil),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('remove-controller ' + removeCustomCss),
							elm$html$Html$Events$onClick(
							author$project$GlobalMessage$BuildMsg(
								author$project$GlobalMessage$DeleteBuild(idx)))
						]),
					_List_Nil),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('down-controller ' + downCustomCss),
							elm$html$Html$Events$onClick(
							author$project$GlobalMessage$BuildMsg(
								author$project$GlobalMessage$DownBuild(idx)))
						]),
					_List_Nil)
				]));
	});
var author$project$GlobalMessage$ToggleBuildInfo = function (a) {
	return {$: 'ToggleBuildInfo', a: a};
};
var author$project$BuildView$buttonBuildInfo = function (build) {
	var htmlAttribute = build.hiddenInfo ? elm$html$Html$Attributes$src('resources/lib/octicons/chevron-down.svg') : elm$html$Html$Attributes$src('resources/lib/octicons/chevron-up.svg');
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$ToggleBuildInfo(build.idCharacter)),
				elm$html$Html$Attributes$class('item-b1')
			]),
		_List_fromArray(
			[
				A2(
				elm$html$Html$img,
				_List_fromArray(
					[htmlAttribute]),
				_List_Nil)
			]));
};
var author$project$ModelHandler$getSkillByType = F2(
	function (idSkill, skillType) {
		switch (skillType.$) {
			case 'MasteryType':
				return A2(
					elm$core$Maybe$andThen,
					function (e) {
						return elm$core$Maybe$Just(
							author$project$ModelUtils$masterySkillToSkill(e));
					},
					author$project$MasterySkill$getMasterySkill(idSkill));
			case 'StandardType':
				return A2(
					elm$core$Maybe$andThen,
					function (e) {
						return elm$core$Maybe$Just(
							author$project$ModelUtils$standardSkillToSkill(e));
					},
					author$project$StandardSkill$getStandardSkill(idSkill));
			default:
				return elm$core$Maybe$Nothing;
		}
	});
var author$project$GlobalMessage$OpenSkillModal = function (a) {
	return {$: 'OpenSkillModal', a: a};
};
var author$project$Popover$viewPopoverClickable = F3(
	function (title, description, instruction) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('custom-popover above')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-title')
						]),
					_List_fromArray(
						[
							elm$html$Html$text('[' + (title + ']'))
						])),
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-text')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(description)
						])),
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-instruction')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(instruction)
						]))
				]));
	});
var author$project$SkillView$getSkillTile = F3(
	function (pictureId, isCombatArt, onClickEvent) {
		var cssClass = isCombatArt ? 'art-picture' : 'skill-picture';
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('button-clickable qs ' + cssClass),
					A2(
					elm$html$Html$Attributes$style,
					'content',
					'url(\"resources/img/skills/' + (elm$core$String$fromInt(pictureId) + '.png\")')),
					onClickEvent
				]),
			_List_Nil);
	});
var author$project$SkillView$skillButton = function (_n0) {
	var positions = _n0.a;
	var maybeSkill = _n0.b;
	var isCombatArt = _n0.c;
	var onClickEvent = elm$html$Html$Events$onClick(
		author$project$GlobalMessage$SModalMsg(
			author$project$GlobalMessage$OpenSkillModal(
				_Utils_Tuple3(positions, maybeSkill, isCombatArt))));
	if (maybeSkill.$ === 'Just') {
		var value = maybeSkill.a;
		return A2(
			elm$html$Html$div,
			_List_Nil,
			_List_fromArray(
				[
					A3(author$project$SkillView$getSkillTile, value.pictureId, value.combatArt, onClickEvent),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text(value.name)
						])),
					A3(author$project$Popover$viewPopoverClickable, value.name, value.description, 'Click to change')
				]));
	} else {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('add-skill')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[onClickEvent]),
					_List_Nil)
				]));
	}
};
var author$project$BuildView$sectionActiveSkills = function (_n0) {
	var buildIdx = _n0.a;
	var build = _n0.b;
	var listActiveSkill = A2(
		elm$core$List$take,
		3,
		A2(
			elm$core$List$map,
			function (_n2) {
				var id = _n2.a;
				var _n3 = _n2.b;
				var maybeSkill = _n3.c;
				return _Utils_Tuple3(
					_Utils_Tuple2(buildIdx, id),
					maybeSkill,
					true);
			},
			A2(
				elm$core$List$indexedMap,
				elm$core$Tuple$pair,
				A2(
					elm$core$List$map,
					function (_n1) {
						var idx = _n1.a;
						var skillId = _n1.b;
						var skillType = _n1.c;
						return _Utils_Tuple3(
							idx,
							skillId,
							A2(author$project$ModelHandler$getSkillByType, skillId, skillType));
					},
					build.listActiveSkill))));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('item-a3')
			]),
		A2(
			elm$core$List$map,
			function (e) {
				return author$project$SkillView$skillButton(e);
			},
			listActiveSkill));
};
var author$project$ElmUtils$appendMaybe = F2(
	function (maybe, list) {
		return _Utils_ap(
			list,
			A2(
				elm$core$Maybe$withDefault,
				_List_Nil,
				A2(elm$core$Maybe$map, elm$core$List$singleton, maybe)));
	});
var author$project$GlobalMessage$OpenJobModal = function (a) {
	return {$: 'OpenJobModal', a: a};
};
var author$project$JobView$addJobButton = function (onClickEvent) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('add-job'),
				onClickEvent
			]),
		_List_Nil);
};
var author$project$JobView$getJobButton = F2(
	function (onClickEvent, id) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('job-picture job-button qs button-clickable'),
					A2(
					elm$html$Html$Attributes$style,
					'content',
					'url(\"resources/img/jobs/' + (elm$core$String$fromInt(id) + '.gif\")')),
					onClickEvent
				]),
			_List_Nil);
	});
var elm$core$List$intersperse = F2(
	function (sep, xs) {
		if (!xs.b) {
			return _List_Nil;
		} else {
			var hd = xs.a;
			var tl = xs.b;
			var step = F2(
				function (x, rest) {
					return A2(
						elm$core$List$cons,
						sep,
						A2(elm$core$List$cons, x, rest));
				});
			var spersed = A3(elm$core$List$foldr, step, _List_Nil, tl);
			return A2(elm$core$List$cons, hd, spersed);
		}
	});
var elm$html$Html$br = _VirtualDom_node('br');
var author$project$Popover$viewPopoverMultiline = F3(
	function (title, descriptionMultiline, instruction) {
		var textMultiline = A2(
			elm$core$List$intersperse,
			A2(elm$html$Html$br, _List_Nil, _List_Nil),
			A2(
				elm$core$List$map,
				function (e) {
					return elm$html$Html$text(e);
				},
				descriptionMultiline));
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('custom-popover above')
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-title')
						]),
					_List_fromArray(
						[
							elm$html$Html$text('[' + (title + ']'))
						])),
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-text')
						]),
					textMultiline),
					A2(
					elm$html$Html$p,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('popover-instruction')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(instruction)
						]))
				]));
	});
var author$project$JobView$buttonJob = F2(
	function (buildIdx, maybeJob) {
		var jobOrDefault = A2(elm$core$Maybe$withDefault, author$project$Job$getJobByDefault, maybeJob);
		var onClickEvent = elm$html$Html$Events$onClick(
			author$project$GlobalMessage$JModalMsg(
				author$project$GlobalMessage$OpenJobModal(
					_Utils_Tuple2(buildIdx, jobOrDefault))));
		if (maybeJob.$ === 'Just') {
			var job = maybeJob.a;
			var jobDescription = author$project$ModelUtils$jobToDescription(job);
			var descriptionMultiline = A2(
				author$project$ElmUtils$appendMaybe,
				jobDescription.magicUsage,
				A2(
					author$project$ElmUtils$appendMaybe,
					A2(
						elm$core$Maybe$map,
						function (t) {
							return t + ' only';
						},
						jobDescription.gender),
					A2(
						author$project$ElmUtils$appendMaybe,
						jobDescription.note,
						A2(
							author$project$ElmUtils$appendMaybe,
							A2(
								elm$core$Maybe$map,
								function (e) {
									return 'Exp req. ' + e;
								},
								jobDescription.experience),
							A2(
								author$project$ElmUtils$appendMaybe,
								A2(
									elm$core$Maybe$map,
									function (e) {
										return 'Exp req. ' + e;
									},
									jobDescription.customExperience),
								A2(
									author$project$ElmUtils$appendMaybe,
									A2(
										elm$core$Maybe$map,
										function (e) {
											return 'Lvl req. ' + e;
										},
										jobDescription.level),
									_List_Nil))))));
			return A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('item-a4a')
					]),
				_List_fromArray(
					[
						A2(author$project$JobView$getJobButton, onClickEvent, job.idPicture),
						A2(
						elm$html$Html$p,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text(job.name)
							])),
						A3(author$project$Popover$viewPopoverMultiline, job.name, descriptionMultiline, 'Click to change')
					]));
		} else {
			return A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('item-a4a')
					]),
				_List_fromArray(
					[
						author$project$JobView$addJobButton(onClickEvent)
					]));
		}
	});
var author$project$JobView$getSkillJobActivePicture = function (id) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('art-picture qs'),
				A2(
				elm$html$Html$Attributes$style,
				'content',
				'url(\"resources/img/skills/' + (elm$core$String$fromInt(id) + '.png\"'))
			]),
		_List_Nil);
};
var author$project$JobView$getSkillJobPassivePicture = function (id) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('skill-picture qs'),
				A2(
				elm$html$Html$Attributes$style,
				'content',
				'url(\"resources/img/skills/' + (elm$core$String$fromInt(id) + '.png\"'))
			]),
		_List_Nil);
};
var author$project$JobView$viewJobSkill = function (skill) {
	var getSkillPicture = skill.combatArt ? author$project$JobView$getSkillJobActivePicture : author$project$JobView$getSkillJobPassivePicture;
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				getSkillPicture(skill.pictureId),
				A2(
				elm$html$Html$p,
				_List_Nil,
				_List_fromArray(
					[
						elm$html$Html$text(skill.name)
					])),
				A2(author$project$Popover$viewPopover, skill.name, skill.description)
			]));
};
var author$project$BuildView$sectionJob = function (_n0) {
	var buildIdx = _n0.a;
	var build = _n0.b;
	var job = author$project$Job$getJobById(build.jobId);
	var listJobSkill = A2(
		elm$core$Maybe$withDefault,
		_List_Nil,
		A2(
			elm$core$Maybe$map,
			function (e) {
				return author$project$JobSkill$getJobSkillsByJob(e.id);
			},
			job));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('item-a4')
			]),
		_List_fromArray(
			[
				A2(author$project$JobView$buttonJob, buildIdx, job),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('item-a4b')
					]),
				A2(
					elm$core$List$map,
					function (e) {
						return author$project$JobView$viewJobSkill(e);
					},
					listJobSkill))
			]));
};
var author$project$BuildView$sectionPassiveSkills = function (_n0) {
	var buildIdx = _n0.a;
	var build = _n0.b;
	var listPassiveSkill = A2(
		elm$core$List$take,
		5,
		A2(
			elm$core$List$map,
			function (_n2) {
				var id = _n2.a;
				var _n3 = _n2.b;
				var maybeSkill = _n3.c;
				return _Utils_Tuple3(
					_Utils_Tuple2(buildIdx, id),
					maybeSkill,
					false);
			},
			A2(
				elm$core$List$indexedMap,
				elm$core$Tuple$pair,
				A2(
					elm$core$List$map,
					function (_n1) {
						var idx = _n1.a;
						var skillId = _n1.b;
						var skillType = _n1.c;
						return _Utils_Tuple3(
							idx,
							skillId,
							A2(author$project$ModelHandler$getSkillByType, skillId, skillType));
					},
					build.listPassiveSkill))));
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('item-a2')
			]),
		A2(
			elm$core$List$map,
			function (e) {
				return author$project$SkillView$skillButton(e);
			},
			listPassiveSkill));
};
var author$project$GlobalMessage$OpenCharacterModal = function (a) {
	return {$: 'OpenCharacterModal', a: a};
};
var author$project$CharacterView$addCharacter = function (idx) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('add-character'),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$CModalMsg(
					author$project$GlobalMessage$OpenCharacterModal(idx)))
			]),
		_List_Nil);
};
var author$project$CharacterView$getCharacterPicture = F2(
	function (pictureId, onClickEvent) {
		return A2(
			elm$html$Html$img,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('portrait-picture button-clickable'),
					elm$html$Html$Attributes$src(
					'resources/img/portraits/' + (elm$core$String$fromInt(pictureId) + '.png')),
					onClickEvent
				]),
			_List_Nil);
	});
var author$project$CharacterView$buttonCharacter = F2(
	function (idx, character) {
		var onClickEvent = elm$html$Html$Events$onClick(
			author$project$GlobalMessage$CModalMsg(
				author$project$GlobalMessage$OpenCharacterModal(idx)));
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('item-a1a')
				]),
			_List_fromArray(
				[
					A2(author$project$CharacterView$getCharacterPicture, character.id, onClickEvent),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text(character.name)
						]))
				]));
	});
var author$project$CharacterView$viewCharacterSkillTile = function (id) {
	var characterSkill = author$project$CharacterSkill$getCharacterSkillById(id);
	if (characterSkill.$ === 'Just') {
		var value = characterSkill.a;
		return A2(
			elm$html$Html$div,
			_List_Nil,
			_List_fromArray(
				[
					author$project$CharacterView$getSkillCharacterPicture(value.pictureId),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text(value.name)
						])),
					A2(author$project$Popover$viewPopover, value.name, value.description)
				]));
	} else {
		return A2(
			elm$html$Html$p,
			_List_Nil,
			_List_fromArray(
				[
					elm$html$Html$text('Character not found')
				]));
	}
};
var author$project$CharacterView$viewCrestTile = function (crestId) {
	var maybeCrest = author$project$Crest$getCrest(crestId);
	if (maybeCrest.$ === 'Just') {
		var crest = maybeCrest.a;
		return A2(
			elm$html$Html$div,
			_List_Nil,
			_List_fromArray(
				[
					author$project$CharacterView$getCrestPicture(crest.pictureId),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text(crest.name)
						])),
					A2(author$project$Popover$viewPopover, crest.name, crest.description)
				]));
	} else {
		return A2(
			elm$html$Html$div,
			_List_Nil,
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class('crest-picture no-crest')
						]),
					_List_Nil),
					A2(
					elm$html$Html$p,
					_List_Nil,
					_List_fromArray(
						[
							elm$html$Html$text('No crest')
						]))
				]));
	}
};
var author$project$CharacterView$sectionCharacter = F2(
	function (idx, maybeCharacter) {
		if (maybeCharacter.$ === 'Just') {
			var character = maybeCharacter.a;
			return A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('item-a1')
					]),
				_List_fromArray(
					[
						A2(author$project$CharacterView$buttonCharacter, idx, character),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								elm$html$Html$Attributes$class('item-a1b')
							]),
						_List_fromArray(
							[
								author$project$CharacterView$viewCharacterSkillTile(character.characterSkillId),
								author$project$CharacterView$viewCrestTile(character.crestId)
							]))
					]));
		} else {
			return A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('item-a1')
					]),
				_List_fromArray(
					[
						author$project$CharacterView$addCharacter(idx)
					]));
		}
	});
var author$project$BuildView$viewBuild = function (_n0) {
	var idx = _n0.a;
	var build = _n0.b;
	var maybeCharacter = author$project$Character$getCharacterById(build.idCharacter);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('item-a')
			]),
		_List_fromArray(
			[
				A2(author$project$CharacterView$sectionCharacter, idx, maybeCharacter),
				author$project$BuildView$sectionPassiveSkills(
				_Utils_Tuple2(idx, build)),
				author$project$BuildView$sectionActiveSkills(
				_Utils_Tuple2(idx, build)),
				author$project$BuildView$sectionJob(
				_Utils_Tuple2(idx, build)),
				author$project$BuildView$buttonBuildInfo(build)
			]));
};
var author$project$TeamBuilder$viewRow = F2(
	function (model, _n0) {
		var idx = _n0.a;
		var build = _n0.b;
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class('c-container')
				]),
			_List_fromArray(
				[
					author$project$BuildView$viewBuild(
					_Utils_Tuple2(idx, build)),
					author$project$BuildInfoView$sectionBuildInfo(build),
					A2(author$project$BuildView$controlPanel, model, idx)
				]));
	});
var elm$core$List$sortWith = _List_sortWith;
var author$project$TeamBuilder$viewTeam = function (model) {
	var addBuildButton = (elm$core$Dict$size(model.team) < 12) ? A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('add-build'),
				elm$html$Html$Events$onClick(
				author$project$GlobalMessage$BuildMsg(author$project$GlobalMessage$AddBuild))
			]),
		_List_Nil) : A2(elm$html$Html$div, _List_Nil, _List_Nil);
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class('c-table')
			]),
		_Utils_ap(
			A2(
				elm$core$List$map,
				function (e) {
					return A2(author$project$TeamBuilder$viewRow, model, e);
				},
				A2(
					elm$core$List$sortWith,
					F2(
						function (t1, t2) {
							return A2(elm$core$Basics$compare, t1.a, t2.a);
						}),
					elm$core$Dict$toList(model.team))),
			_List_fromArray(
				[addBuildButton])));
};
var author$project$TeamBuilder$viewBuilder = function (model) {
	return A2(
		elm$html$Html$div,
		_List_Nil,
		_List_fromArray(
			[
				A2(
				elm$html$Html$h3,
				_List_fromArray(
					[
						elm$html$Html$Attributes$class('text-light')
					]),
				_List_fromArray(
					[
						elm$html$Html$text('Fire Emblem Three Houses - Team Builder!')
					])),
				author$project$TeamBuilder$viewTeam(model),
				author$project$CharacterModal$modalCharacterPicker(model),
				author$project$SkillModal$modalSkillPicker(model),
				author$project$JobModal$modalJobPicker(model)
			]));
};
var author$project$Main$view = function (model) {
	return {
		body: function () {
			var _n0 = model.errorMessage;
			if (_n0.$ === 'Just') {
				var message = _n0.a;
				return _List_fromArray(
					[
						author$project$ErrorHandler$viewError(message)
					]);
			} else {
				return _List_fromArray(
					[
						author$project$TeamBuilder$viewBuilder(model)
					]);
			}
		}(),
		title: 'FE3H-TEAM-BUILDER'
	};
};
var elm$browser$Browser$application = _Browser_application;
var elm$core$Platform$Sub$batch = _Platform_batch;
var elm$core$Platform$Sub$none = elm$core$Platform$Sub$batch(_List_Nil);
var author$project$Main$main = elm$browser$Browser$application(
	{
		init: author$project$Main$init,
		onUrlChange: author$project$GlobalMessage$UrlChanged,
		onUrlRequest: author$project$GlobalMessage$LinkClicked,
		subscriptions: function (_n0) {
			return elm$core$Platform$Sub$none;
		},
		update: author$project$Main$update,
		view: author$project$Main$view
	});
_Platform_export({'Main':{'init':author$project$Main$main(
	elm$json$Json$Decode$succeed(_Utils_Tuple0))(0)}});}(this));