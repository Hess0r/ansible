-- SETS
vim.opt.number = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 20
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.shortmess = vim.o.shortmess .. 'c'
vim.opt.updatetime = 50
vim.opt.wildignore = vim.o.wildignore .. '*/tmp/*'
vim.opt.wildignore = vim.o.wildignore .. '*/vendor/*'
vim.opt.wildignore = vim.o.wildignore .. '*/node_modules/*'
vim.opt.wildignore = vim.o.wildignore .. '*/.git/*'
vim.opt.wildmenu = true
vim.opt.list = true
-- this makes go really noisy
-- vim.opt.listchars = 'tab:» ,eol:↲'
vim.opt.listchars = 'tab:  ,eol:↲'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"

-- PLUGINS
local vim_plug_path = vim.fn.stdpath'data' .. '/site/autoload/plug.vim'

if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
  vim.fn.execute('!curl -fLo ' .. vim_plug_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'navarasu/onedark.nvim'
  Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'tpope/vim-commentary'
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd(':TSUpdate') end})
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'b0o/schemastore.nvim'
  Plug 'onsails/lspkind-nvim'
  Plug 'sbdchd/neoformat'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'windwp/nvim-autopairs'
  Plug 'luukvbaal/nnn.nvim'
  Plug('phpactor/phpactor', {['for'] = 'php', ['tag'] = '*', ['do'] = 'composer install --no-dev -o'})
  Plug 'jwalton512/vim-blade'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'liuchengxu/graphviz.vim'
  Plug('iamcco/markdown-preview.nvim', {
    ['do'] = function() vim.call('mkdp#util#install') end,
  })
  Plug 'stephpy/vim-php-cs-fixer'
vim.call('plug#end')

-- COLORS
vim.cmd('colorscheme onedark')
vim.g.airline_theme = 'onedark'

-- ICONS
require'nvim-web-devicons'.setup{}

-- KEYMAPPINGS
vim.g.mapleader=" "

local opts = { noremap = true, silent = true }
local optsNoSilent = { noremap = true, silent = false }

vim.api.nvim_set_keymap('n', '<leader>ve', [[<cmd>e $MYVIMRC<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>vt', [[<cmd>e $HOME/.tmux.conf<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader><CR>', [[<cmd>source $MYVIMRC<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>', [[<cmd>WhichKey '<Space>'<CR>]], opts)
vim.api.nvim_set_keymap('v', '<leader>', [[<cmd>WhichKeyVisual '<Space>'<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sw', [[<cmd>lua require('telescope.builtin').spell_suggest()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>Neoformat<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>Gdiffsplit<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader>mp', [[<Plug>MarkdownPreview<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ms', [[<Plug>MarkdownPreviewStop<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>mt', [[<Plug>MarkdownPreviewToggle<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader>ts', [[<cmd>set spell!<CR>]], opts)

vim.api.nvim_set_keymap('n', '<C-A-n>', [[<cmd>NnnExplorer %:p:h<CR>]], opts)
vim.api.nvim_set_keymap('t', '<C-A-n>', [[<cmd>NnnExplorer %:p:h<CR>]], opts)
vim.api.nvim_set_keymap('n', '<C-A-p>', [[<cmd>NnnPicker<CR>]], opts)
vim.api.nvim_set_keymap('t', '<C-A-p>', [[<cmd>NnnPicker<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd>NnnPicker<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader>rr', [[:s/<C-r><C-w>/]], optsNoSilent)

vim.api.nvim_set_keymap('t', '<ESC><ESC>', [[<C-\><C-n>]], opts)

-- TREESITTER
local nvim_treesitter = require'nvim-treesitter.configs'
nvim_treesitter.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  ensure_installed = "all",
}

-- LSP
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>wq', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<CR>', opts)

end

local sumneko_root_path = vim.fn.stdpath'data' .. "/site/lua-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }, _config or {})
end

nvim_lsp.tsserver.setup(config())

nvim_lsp.bashls.setup(config())

nvim_lsp.dockerls.setup(config())

nvim_lsp.gopls.setup(config())

nvim_lsp.yamlls.setup(config())

-- nvim_lsp.intelephense.setup(config())

nvim_lsp.cssls.setup(config())

nvim_lsp.eslint.setup(config())

nvim_lsp.html.setup(config())

nvim_lsp.prismals.setup(config())

nvim_lsp.hls.setup(config())

nvim_lsp.phpactor.setup(config({
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = false,
  }
}))

nvim_lsp.tailwindcss.setup(config())

nvim_lsp.jsonls.setup(config({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  }
}))

-- nvim_lsp.sumneko_lua.setup(config({
--   cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
--   settings = {
--     Lua = {
--       runtime = {
--         version = "LuaJIT",
--         path = vim.split(package.path, ";"),
--       },
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--         },
--         preloadFileSize = 200,
--         checkThirdParty = false,
--       },
--     },
--   },
-- }))

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup(config({
  on_attach = on_attach,
  cmd = { vim.env.HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver", "--hostPID", tostring(pid) };
}))

-- AUTOCOMPLETE
local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- SNIPPETS
require("luasnip").filetype_extend("blade", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()

-- WHICHKEY
vim.g.which_key_map = {
  s = {
    name = '+search',
    b = 'cur buf fuzzy find',
    d = 'grep string',
    f = 'find files',
    g = 'find git files',
    h = 'help tags',
    m = 'marks',
    o = 'document symbols',
    p = 'live grep',
    t = 'tags',
    w = 'spell suggestions',
  },
  g = {
    name = '+git',
    c = 'commits',
    d = 'buffer history',
    s = 'status',
    b = 'branches',
  },
  h = {
    name = '+git-hunks',
    p = 'preview hunk',
    s = 'stage hunk',
    u = 'undo hunl',
  },
  t = {
    name = '+toggle',
    s = 'spell',
  },
  e = 'show line diagnostic',
  q = 'show current buffer diagnostics',
  f = 'format',
  D = 'jump to type definition',
  ['?'] = 'show previously open files',
  ['ve'] = 'edit vimrc',
  ['v'] = {name = 'which_key_ignore'},
  ['rn'] = 'rename',
  ['r'] = {name = 'which_key_ignore'},
  ['ca'] = 'coda action',
  ['c'] = {name = 'which_key_ignore'},
  ['n'] = 'open explorer',
  ['<CR>'] = 'reload config',
}

vim.call('which_key#register', '<Space>', 'g:which_key_map')

-- NETRW
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- TELESCOPE
local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-r>"] = actions.delete_buffer,
        },
        n = {
          ["<c-r>"] = actions.delete_buffer,
        }
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}

require("telescope").load_extension("ui-select")

-- AUTOPAIRS
require("nvim-autopairs").setup{}

-- NNN.NVIM
require("nnn").setup{}

-- COMMANDS
vim.api.nvim_create_user_command('T', 'vsp | terminal <args>', { nargs = "*" })

-- PHP-CS-FIXER
vim.g.php_cs_fixer_rules = "@PSR12"

-- NEOFORMAT
vim.g.neoformat_php_laravelpint = { ['exe'] = './vendor/bin/pint', ['replace'] = 1 }
vim.g.neoformat_enabled_php = {'laravelpint', 'phpcsfixer'}
