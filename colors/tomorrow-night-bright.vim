" Tomorrow Night Bright - Full Colour and 256 Colour
" http://chriskempson.com
"
" Hex colour conversion functions borrowed from the theme "Desert256""

" Default GUI Colours
let s:foreground = "eaeaea"
let s:background = "000000"
let s:selection = "424242"
let s:line = "2a2a2a"
let s:comment = "969896"
let s:red = "d54e53"
let s:orange = "e78c45"
let s:yellow = "e7c547"
let s:green = "b9ca4a"
let s:aqua = "70c0b1"
let s:blue = "7aa6da"
let s:purple = "c397d8"
let s:window = "4d5057"

hi clear
syntax reset

let g:colors_name = "Tomorrow-Night-Bright"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun! s:grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun! s:grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun! s:grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun! s:rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun! s:rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun! s:rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun! s:colour(r, g, b)
		" Get the closest grey
		let l:gx = s:grey_number(a:r)
		let l:gy = s:grey_number(a:g)
		let l:gz = s:grey_number(a:b)

		" Get the closest colour
		let l:x = s:rgb_number(a:r)
		let l:y = s:rgb_number(a:g)
		let l:z = s:rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = s:grey_level(l:gx) - a:r
			let l:dgg = s:grey_level(l:gy) - a:g
			let l:dgb = s:grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = s:rgb_level(l:gx) - a:r
			let l:dg = s:rgb_level(l:gy) - a:g
			let l:db = s:rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return s:grey_colour(l:gx)
			else
				" Use the colour
				return s:rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return s:rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun! s:rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return s:colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun! s:X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . s:rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . s:rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

  " This is broken for some reason:
	" call s:X("Normal", s:foreground, s:background, "")

	" Vim Highlighting
	call s:X("LineNr", s:selection, "", "")
	call s:X("NonText", s:selection, "", "bold")
	call s:X("SpecialKey", s:selection, "", "")
	call s:X("Search", s:background, s:yellow, "")
	call s:X("TabLine", s:window, s:foreground, "reverse")
	call s:X("TabLineFill", s:window, s:foreground, "reverse")
	call s:X("StatusLine", s:window, s:yellow, "bold,reverse")
	call s:X("StatusLineNC", s:window, s:foreground, "reverse")
	call s:X("VertSplit", s:window, s:window, "none")
	call s:X("Visual", "", s:selection, "")
	call s:X("Directory", s:blue, "", "")
	call s:X("ModeMsg", s:green, "", "")
	call s:X("MoreMsg", s:green, "", "")
	call s:X("Question", s:green, "", "")
	call s:X("WarningMsg", s:red, "", "")
	call s:X("MatchParen", "", s:selection, "")
	call s:X("Folded", s:comment, s:background, "")
	call s:X("FoldColumn", "", s:background, "")
	if version >= 700
		call s:X("CursorLine", "", s:line, "none")
		call s:X("CursorColumn", "", s:line, "none")
		call s:X("PMenu", s:foreground, s:selection, "none")
		call s:X("PMenuSel", s:foreground, s:selection, "reverse")
		call s:X("SignColumn", "", s:background, "none")
	end
	if version >= 703
		call s:X("ColorColumn", "", s:line, "none")
	end
  call s:X("SpellBad", s:red, s:background, "underline")


	" Standard Highlighting
	call s:X("Comment", s:comment, "", "italic")
	call s:X("TODO", s:comment, s:background, "bold")
	call s:X("XXX", s:comment, s:background, "bold")
	call s:X("Title", s:aqua, "", "")
	call s:X("Identifier", s:yellow, "", "none")
	call s:X("Statement", s:foreground, "", "bold")
	call s:X("Conditional", s:foreground, "", "")
	call s:X("Repeat", s:foreground, "", "")
	call s:X("Structure", s:purple, "", "")
	call s:X("Function", s:blue, "", "")
	call s:X("Constant", s:orange, "", "")
	call s:X("Keyword", s:orange, "", "")
	call s:X("String", s:green, "", "")
	call s:X("Special", s:foreground, "", "")
	call s:X("PreProc", s:purple, "", "")
	call s:X("Operator", s:aqua, "", "none")
	call s:X("Type", s:blue, "", "none")
	call s:X("Define", s:purple, "", "none")
	call s:X("Include", s:blue, "", "")
	call s:X("Ignore", "666666", "", "")

	" Vim Highlighting
	call s:X("vimCommand", s:red, "", "none")

	" C Highlighting
	call s:X("cType", s:yellow, "", "")
	call s:X("cStorageClass", s:purple, "", "")
	call s:X("cConditional", s:purple, "", "")
	call s:X("cRepeat", s:purple, "", "")

	" PHP Highlighting
	call s:X("phpVarSelector", s:red, "", "")
	call s:X("phpKeyword", s:purple, "", "")
	call s:X("phpRepeat", s:purple, "", "")
	call s:X("phpConditional", s:purple, "", "")
	call s:X("phpStatement", s:purple, "", "")
	call s:X("phpMemberSelector", s:foreground, "", "")

	" Ruby Highlighting
	call s:X("rubySymbol", s:green, "", "")
	call s:X("rubyConstant", s:yellow, "", "")
	call s:X("rubyAccess", s:yellow, "", "")
	call s:X("rubyAttribute", s:blue, "", "")
	call s:X("rubyInclude", s:blue, "", "")
	call s:X("rubyLocalVariableOrMethod", s:orange, "", "")
	call s:X("rubyCurlyBlock", s:orange, "", "")
	call s:X("rubyStringDelimiter", s:green, "", "")
	call s:X("rubyInterpolationDelimiter", s:orange, "", "")
	call s:X("rubyConditional", s:purple, "", "")
	call s:X("rubyRepeat", s:purple, "", "")
	call s:X("rubyControl", s:purple, "", "")
	call s:X("rubyException", s:purple, "", "")

	" Python Highlighting
	call s:X("pythonInclude", s:purple, "", "")
	call s:X("pythonStatement", s:purple, "", "")
	call s:X("pythonConditional", s:purple, "", "")
	call s:X("pythonRepeat", s:purple, "", "")
	call s:X("pythonException", s:purple, "", "")
	call s:X("pythonFunction", s:blue, "", "")
	call s:X("pythonPreCondit", s:purple, "", "")
	call s:X("pythonRepeat", s:aqua, "", "")
	call s:X("pythonExClass", s:orange, "", "")

	" JavaScript Highlighting
	call s:X("javaScriptBraces", s:foreground, "", "")
	call s:X("javaScriptFunction", s:purple, "", "")
	call s:X("javaScriptConditional", s:purple, "", "")
	call s:X("javaScriptRepeat", s:purple, "", "")
	call s:X("javaScriptNumber", s:orange, "", "")
	call s:X("javaScriptMember", s:orange, "", "")
	call s:X("javascriptNull", s:orange, "", "")
	call s:X("javascriptGlobal", s:blue, "", "")
	call s:X("javascriptStatement", s:red, "", "")

	" CoffeeScript Highlighting
	call s:X("coffeeRepeat", s:purple, "", "")
	call s:X("coffeeConditional", s:purple, "", "")
	call s:X("coffeeKeyword", s:purple, "", "")
	call s:X("coffeeObject", s:yellow, "", "")

	" HTML Highlighting
	call s:X("htmlTag", s:red, "", "")
	call s:X("htmlTagName", s:red, "", "")
	call s:X("htmlArg", s:red, "", "")
	call s:X("htmlScriptTag", s:red, "", "")

	" Diff Highlighting
	call s:X("diffAdd", "", "4c4e39", "")
	call s:X("diffDelete", s:background, s:red, "")
	call s:X("diffChange", "", "2B5B77", "")
	call s:X("diffText", s:line, s:blue, "")

	" ShowMarks Highlighting
	call s:X("ShowMarksHLl", s:orange, s:background, "none")
	call s:X("ShowMarksHLo", s:purple, s:background, "none")
	call s:X("ShowMarksHLu", s:yellow, s:background, "none")
	call s:X("ShowMarksHLm", s:aqua, s:background, "none")

	" Lua Highlighting
	call s:X("luaStatement", s:purple, "", "")
	call s:X("luaRepeat", s:purple, "", "")
	call s:X("luaCondStart", s:purple, "", "")
	call s:X("luaCondElseif", s:purple, "", "")
	call s:X("luaCond", s:purple, "", "")
	call s:X("luaCondEnd", s:purple, "", "")

	" Cucumber Highlighting
	call s:X("cucumberGiven", s:blue, "", "")
	call s:X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call s:X("goDirective", s:purple, "", "")
	call s:X("goDeclaration", s:purple, "", "")
	call s:X("goStatement", s:purple, "", "")
	call s:X("goConditional", s:purple, "", "")
	call s:X("goConstants", s:orange, "", "")
	call s:X("goTodo", s:yellow, "", "")
	call s:X("goDeclType", s:blue, "", "")
	call s:X("goBuiltins", s:purple, "", "")
	call s:X("goRepeat", s:purple, "", "")
	call s:X("goLabel", s:purple, "", "")

	" Clojure Highlighting
	call s:X("clojureConstant", s:orange, "", "")
	call s:X("clojureBoolean", s:orange, "", "")
	call s:X("clojureCharacter", s:orange, "", "")
	call s:X("clojureKeyword", s:green, "", "")
	call s:X("clojureNumber", s:orange, "", "")
	call s:X("clojureString", s:green, "", "")
	call s:X("clojureRegexp", s:green, "", "")
	call s:X("clojureParen", s:aqua, "", "")
	call s:X("clojureVariable", s:yellow, "", "")
	call s:X("clojureCond", s:blue, "", "")
	call s:X("clojureDefine", s:purple, "", "")
	call s:X("clojureException", s:red, "", "")
	call s:X("clojureFunc", s:blue, "", "")
	call s:X("clojureMacro", s:blue, "", "")
	call s:X("clojureRepeat", s:blue, "", "")
	call s:X("clojureSpecial", s:purple, "", "")
	call s:X("clojureQuote", s:blue, "", "")
	call s:X("clojureUnquote", s:blue, "", "")
	call s:X("clojureMeta", s:blue, "", "")
	call s:X("clojureDeref", s:blue, "", "")
	call s:X("clojureAnonArg", s:blue, "", "")
	call s:X("clojureRepeat", s:blue, "", "")
	call s:X("clojureDispatch", s:blue, "", "")

	" Scala Highlighting
	call s:X("scalaKeyword", s:purple, "", "")
	call s:X("scalaKeywordModifier", s:purple, "", "")
	call s:X("scalaOperator", s:blue, "", "")
	call s:X("scalaPackage", s:red, "", "")
	call s:X("scalaFqn", s:foreground, "", "")
	call s:X("scalaFqnSet", s:foreground, "", "")
	call s:X("scalaImport", s:purple, "", "")
	call s:X("scalaBoolean", s:orange, "", "")
	call s:X("scalaDef", s:purple, "", "")
	call s:X("scalaVal", s:purple, "", "")
	call s:X("scalaVar", s:aqua, "", "")
	call s:X("scalaClass", s:purple, "", "")
	call s:X("scalaObject", s:purple, "", "")
	call s:X("scalaTrait", s:purple, "", "")
	call s:X("scalaDefName", s:blue, "", "")
	call s:X("scalaValName", s:foreground, "", "")
	call s:X("scalaVarName", s:foreground, "", "")
	call s:X("scalaClassName", s:foreground, "", "")
	call s:X("scalaType", s:yellow, "", "")
	call s:X("scalaTypeSpecializer", s:yellow, "", "")
	call s:X("scalaAnnotation", s:orange, "", "")
	call s:X("scalaNumber", s:orange, "", "")
	call s:X("scalaDefSpecializer", s:yellow, "", "")
	call s:X("scalaClassSpecializer", s:yellow, "", "")
	call s:X("scalaBackTick", s:green, "", "")
	call s:X("scalaRoot", s:foreground, "", "")
	call s:X("scalaMethodCall", s:blue, "", "")
	call s:X("scalaCaseType", s:yellow, "", "")
	call s:X("scalaLineComment", s:comment, "", "")
	call s:X("scalaComment", s:comment, "", "")
	call s:X("scalaDocComment", s:comment, "", "")
	call s:X("scalaDocTags", s:comment, "", "")
	call s:X("scalaEmptyString", s:green, "", "")
	call s:X("scalaMultiLineString", s:green, "", "")
	call s:X("scalaUnicode", s:orange, "", "")
	call s:X("scalaString", s:green, "", "")
	call s:X("scalaStringEscape", s:green, "", "")
	call s:X("scalaSymbol", s:orange, "", "")
	call s:X("scalaChar", s:orange, "", "")
	call s:X("scalaXml", s:green, "", "")
	call s:X("scalaConstructorSpecializer", s:yellow, "", "")
	call s:X("scalaBackTick", s:blue, "", "")

	" Git
	call s:X("diffAdded", s:green, "", "")
	call s:X("diffRemoved", s:red, "", "")
	call s:X("gitcommitSummary", "", "", "bold")

  " Status line
  call s:X("sbNormal", s:foreground, s:window, "")
  call s:X("sbError", s:foreground, s:red, "bold")
  call s:X("sbWarning", s:orange, s:window, "")
  call s:X("sbNotify", s:yellow, s:window, "")
  call s:X("sbOk", s:green, s:window, "")

	" Delete Functions
	delf s:X
	delf s:rgb
	delf s:colour
	delf s:rgb_colour
	delf s:rgb_level
	delf s:rgb_number
	delf s:grey_colour
	delf s:grey_level
	delf s:grey_number
endif

set background=dark
