return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
            auto_install = true,
        	highlight = { ensure = true }, 
		indent = { ensure = true },
	    })
    end
}
