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
  -- Tema Gruvbox (escuro padrão)
  ---------------------------------------------------------
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- garante o modo escuro
      require("gruvbox").setup({})
      vim.cmd([[colorscheme gruvbox]])
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
        options = { theme = "gruvbox" }
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
  -- Treesitter (sintaxe avançada)
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
  -- Telescope (buscas modernas)
  ---------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

-----------------------------------------------------------
--  Configurações gerais do editor
-----------------------------------------------------------
vim.opt.number = true                
vim.opt.relativenumber = false       
vim.opt.cursorline = true            
vim.opt.termguicolors = true         
vim.opt.signcolumn = "yes"           
vim.opt.wrap = false                 
vim.opt.scrolloff = 8                
vim.opt.sidescrolloff = 8            
vim.opt.expandtab = true             
vim.opt.shiftwidth = 2               
vim.opt.tabstop = 2                  
vim.opt.clipboard = "unnamedplus"    
vim.g.mapleader = " "                

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
-- Atalhos do Telescope usando <leader>
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







