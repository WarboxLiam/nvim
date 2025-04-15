return {
  'stevearc/conform.nvim',
  config = function()
    -- Set XDG_RUNTIME_DIR to a writable location
    vim.env.XDG_RUNTIME_DIR = vim.fn.expand('~/.cache/prettierd')

    require('conform').setup({
      formatters_by_ft = {
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        lua = { 'stylua' },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    })

    -- Optional: Add keybinding for manual formatting
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end, { desc = 'Format file or range (in visual mode)' })
  end,
} 
