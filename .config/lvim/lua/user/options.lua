-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true              -- maintain indent when wrapping indented lines
vim.opt.list = true                     -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.mouse = 'a'                     -- enable mouse for all modes
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = 'unnamedplus'      -- Use Linux system clipboard
vim.opt.confirm = true                 -- ask for confirmation instead of erroring
vim.opt.undofile = true                -- persistent undo
vim.opt.backup = true                  -- automatically save a backup file
vim.opt.backupdir:remove('.')          -- keep backups out of the current directory
vim.opt.shortmess:append({ I = true }) -- disable the splash screen
vim.opt.wildmode =
'longest:full,full'                    -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.signcolumn = 'yes:2'
-- vim.opt.showmode = false
vim.opt.updatetime = 4001  -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files

-- general

lvim.log.level = "warn"
-- lvim.format_on_save = true
lvim.format_on_save.enabled = true

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "ruby",
    "yaml",
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    ".git",
    "package-lock.json",
    "yarn.lock",
    "package.json",
    "requirements.txt",
}

vim.opt.shell = "/bin/bash"
lvim.format_on_save = true

vim.o.linebreak = true
vim.o.wrap = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lvim.builtin.telescope.defaults.path_display = {
    shorten = 4,
}


-- colorscheme
lvim.transparent_window = false
lvim.colorscheme = 'tokyonight-moon'
