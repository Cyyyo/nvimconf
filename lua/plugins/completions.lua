return {
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',       -- 缓冲区补全源
      'hrsh7th/cmp-path',         -- 路径补全源
      'hrsh7th/cmp-nvim-lsp',     -- LSP 补全源
      'hrsh7th/cmp-nvim-lua',     -- Neovim Lua API 补全源
      'L3MON4D3/LuaSnip',         -- 片段引擎
      'saadparwaiz1/cmp_luasnip', -- LuaSnip 补全源
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require 'cmp'
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- 补全菜单可见时，选择下一个补全项
            elseif require('luasnip').expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>vsnip-expand-or-jump', true, true, true), '')
            else
              fallback()      -- 补全菜单不可见时，插入制表符
            end
          end, { 'i', 's' }), -- 在插入模式和片段模式中生效

          ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- 补全菜单可见时，选择上一个补全项
            elseif require('luasnip').jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>vsnip-expand-or-jump-prev', true, true, true), '')
            else
              fallback()      -- 补全菜单不可见时，执行默认行为
            end
          end, { 'i', 's' }), -- 在插入模式和片段模式中生效
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      }
    end,
  },
}
