-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Install the color scheme you want to use
  "catppuccin/nvim",  -- Example color scheme

  config = function()
    -- Set up MyColor function
    function MyColor(color)
      color = color or "catppuccin"
      vim.cmd.colorscheme(color)

      -- Customize highlighting
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    -- Call MyColor to apply the color scheme and highlight settings
    MyColor()
  end
}
