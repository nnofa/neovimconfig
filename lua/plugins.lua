vim.g.coc_global_extensions = {'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver'}
vim.env.FZF_DEFAULT_COMMAND = 'rg --files'
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You can alias plugin names
  use 'morhetz/gruvbox'

  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'

  use { 'junegunn/fzf', run = './install --bin', }
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'

  use 'tpope/vim-surround'

  use 'easymotion/vim-easymotion' 

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '<', right = '>'},
          section_separators = { left = '<', right = '>'},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  }

  use { 'ibhagwan/fzf-lua', -- consider telescope as well
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
        -- If lualine is installed tabline will use separators configured in lualine by default.
        -- These options can be used to override those settings.
          section_separators = {'<', '>'},
          component_separators = {'<', '>'},
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd[[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  use 'MattesGroeger/vim-bookmarks'

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use 'mhinz/vim-startify'
    
end)
