return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
        	ensure_installed = { "lua", "c", "cpp" },
        	highlight = { ensure = true }, 
		indent = { ensure = true },
	    })
    end
}
