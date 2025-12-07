\\ criar arquivo de config: nvim ~/.config/nvim/init.lua




-----------------------------------------------------------
--  Inicialização do Lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup({

  ---------------------------------------------------------
  -- Tema Tokyonight (modo claro)
  ---------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-day]])
    end
  },

  ---------------------------------------------------------
  -- Lualine (barra inferior)
  ---------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "tokyonight-day" }
      })
    end
  },

  ---------------------------------------------------------
  -- Árvore de arquivos (nvim-tree)
  ---------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  ---------------------------------------------------------
  -- Treesitter (sintaxe turbinada)
  ---------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  ---------------------------------------------------------
  -- Telescope (busca moderna)
  ---------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

-----------------------------------------------------------
--  Configurações gerais de editor
-----------------------------------------------------------
vim.opt.number = true                -- número de linha
vim.opt.relativenumber = false        -- números relativos
vim.opt.cursorline = true            -- destaca linha atual
vim.opt.termguicolors = true         -- cores 24-bit
vim.opt.signcolumn = "yes"           -- coluna do lado
vim.opt.wrap = false                 -- não quebrar linhas
vim.opt.scrolloff = 8                -- margem vertical
vim.opt.sidescrolloff = 8            -- margem horizontal
vim.opt.expandtab = true             -- usa espaços
vim.opt.shiftwidth = 2               -- indentação
vim.opt.tabstop = 2                  -- tab = 2 espaços
vim.opt.clipboard = "unnamedplus"    -- usa clipboard do sistema
vim.g.mapleader = " "                -- líder = espaço

-----------------------------------------------------------
--  Keymaps úteis
-----------------------------------------------------------

-- Abrir árvore de arquivos
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope: buscar arquivos
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")

-- Telescope: buscar texto
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>")

-- Salvar rápido
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Fechar buffer
vim.keymap.set("n", "<leader>q", ":q<CR>")

-----------------------------------------------------------
-- Atalhos do Telescope no padrão Space
-----------------------------------------------------------

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Buscar arquivos" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Buscar texto" })

vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Listar buffers" })

vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Ajuda" })




