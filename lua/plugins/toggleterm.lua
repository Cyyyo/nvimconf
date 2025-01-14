return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-/>]],
      direction = "float",
      float_opts = {
        border = "curved",
        width = 80,
        height = 20,
      },
    })
  end
}
