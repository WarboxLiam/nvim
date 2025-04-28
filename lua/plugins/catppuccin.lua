return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin"

        -- Set transparency of BG to none, so the terminals options are respected in ghostty
        vim.api.nvim_command('hi Normal guibg=NONE ctermbg=NONE')
        vim.api.nvim_command('hi NonText guibg=NONE ctermbg=NONE')
        vim.api.nvim_command('hi EndOfBuffer guibg=NONE ctermbg=NONE')
    end
}
