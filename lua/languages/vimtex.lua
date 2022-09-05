local g = vim.g

g.tex_flavor = "latex"
g.vimtex_quickfix_mode = 0
g.vimtex_view_general_viewer = "zathura"
g.vimtex_view_method = "zathura"
g.Tex_CompileRule_pdf = "xelatex -synctex=1 -interaction=nonstopmode %f"
g.vimtex_compiler_latexmk_engines = {
	["_"] = "-xelatex",
}
g.vimtex_compiler_latexrun_engines = {
	["_"] = "xelatex",
}
g.vimtex_toc_config = {
	["name"] = "TOC",
	["layers"] = {
		"content",
		"todo",
		"include",
	},
	["split_width"] = 25,
	["todo_sorted"] = 0,
	["show_help"] = 1,
	["show_numbers"] = 1,
	["split_pos"] = "vert rightbelow",
}

-- Enable conceal only in latex
g.vimtex_syntax_conceal = {
	["accents"] = 1,
	["cites"] = 1,
	["fancy"] = 1,
	["greek"] = 1,
	["math_bounds"] = 0,
	["math_delimiters"] = 1,
	["math_fracs"] = 1,
	["math_super_sub"] = 0,
	["math_symbols"] = 1,
	["sections"] = 0,
	["styles"] = 1,
}
