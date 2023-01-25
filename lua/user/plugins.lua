local fn = vim.fn

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-tree/nvim-web-devicons"
  use "lewis6991/impatient.nvim" -- Speeds up startup time of Neovim
  use "goolord/alpha-nvim" -- This is the welcome window when starting nvim
  use "folke/which-key.nvim" -- Helpful popup window to remember keybinds
  use "nvim-treesitter/nvim-treesitter" -- Vim treesitter a better syntax highlighter
  use "windwp/nvim-ts-autotag" -- Autotags for react
  use "windwp/nvim-autopairs" -- Auto close brackets
  use "akinsho/bufferline.nvim" -- Tabs

  -- Lsp Configs
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"

  -- Lsp Saga
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require('lspsaga').setup({})
    end,
  })

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim'
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim'
  }

  -- Colorschemes
  use "morhetz/gruvbox" -- My flavor of the moment 

  -- Git
  use "lewis6991/gitsigns.nvim" -- Nice colored lines to show changes to files

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
