local options = {
	background = "dark",
	backup = false,
	cmdheight = 1,
	completeopt = "menu,menuone,noinsert,noselect,preview",
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	laststatus = 3,
	mouse = "a",
	number = true,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 5,
	shiftround = true,
	shiftwidth = 2,
	showmode = false,
	sidescrolloff = 5,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 1000,
	undodir = "/tmp/.nvimdid",
	undofile = true,
	updatetime = 250,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.filetype.add({
	filename = {
		sketchybarrc = "sh",
		skhdrc = "sh",
		yabairc = "sh",
	},
	pattern = {
		["+..env.?"] = "sh",
		["~/.config/zsh/.*"] = "sh",
	},
})
