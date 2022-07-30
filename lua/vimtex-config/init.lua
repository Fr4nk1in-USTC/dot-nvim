local g = vim.g
local set = vim.opt

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

set.conceallevel = 2
g.tex_conceal = "abdmg"
