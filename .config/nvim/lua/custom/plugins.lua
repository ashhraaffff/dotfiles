local plugins = {
  {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',

  opts = {
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',
    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } } 
    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
    }
  },

  --{
  --  "jose-elias-alvarez/null-ls.nvim",
  --  event = "VeryLazy",
  --  opts = function()
  --    return require "custom.configs.null-ls"
  --  end,
  --},
  {
    "declancm/cinnamon.nvim",
    version = "*", -- use latest release
    opts = {
      -- change default options here
      -- Enable all provided keymaps
      keymaps = {
        basic = true,
        extra = true,
      },
      -- Custom scroll options
      options = {
        mode = "cursor",  -- Animate cursor and window scrolling for any movement
        delay = 5,        -- Delay between each movement step (in ms)
        step_size = {
          vertical = 1,   -- Number of cursor/window lines moved per step
          horizontal = 2, -- Number of cursor/window columns moved per step
        },
        max_delta = {
          line = false,   -- Maximum distance for line movements before scroll animation is skipped
          column = false, -- Maximum distance for column movements before scroll animation is skipped
          time = 1000,    -- Maximum duration for a movement (in ms)
        },
        -- Optional post-movement callback
        callback = function()
          -- print("Scrolling done!")
        end,
      },
  
    },
    keys = {
      { '<c-d>', '<cmd>lua require("cinnamon").scroll("<C-d>zz")<cr>', mode = 'n', },
      { '<c-u>', '<cmd>lua require("cinnamon").scroll("<C-u>zz")<cr>', mode = 'n', },
      { '<c-f>', '<cmd>lua require("cinnamon").scroll("<C-f>zz")<cr>', mode = 'n', },
      { '<c-b>', '<cmd>lua require("cinnamon").scroll("<C-b>zz")<cr>', mode = 'n', },
      { 'zz',    '<cmd>lua require("cinnamon").scroll("zz")<cr>',      mode = 'n', },
      { 'zt',    '<cmd>lua require("cinnamon").scroll("zt")<cr>',      mode = 'n', },
      { 'zb',    '<cmd>lua require("cinnamon").scroll("zb")<cr>',      mode = 'n', },
      { 'gg',    '<cmd>lua require("cinnamon").scroll("gg")<cr>',      mode = 'n', },
      { 'G',    '<cmd>lua require("cinnamon").scroll("G")<cr>',      mode = 'n', },
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "clang-format",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}

return plugins
