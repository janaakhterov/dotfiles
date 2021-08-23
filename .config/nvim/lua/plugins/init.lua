local use = require"packer".use

require"packer".init {
    display = { open_fn = function() return require"packer.util".float { border = "single" } end },
    git = { clone_timeout = 600 }
}

vim.cmd [[packadd packer.nvim]]

return require"packer".startup(function()
    use "wbthomason/packer.nvim"
    use "morhetz/gruvbox"
    use "tpope/vim-abolish"
    use "tpope/vim-fugitive"

    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } }
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function() require"plugins.treesitter".config() end
    }

    use { "kabouzeid/nvim-lspinstall", event = "BufRead" }

    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function() require"plugins.lspconfig".config() end
    }

    use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function() require "plugins.statusline" end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use { "terrortylor/nvim-comment", config = function() require"nvim_comment".setup() end }

    use {
        "onsails/lspkind-nvim",
        event = "BufRead",
        config = function() require("lspkind").init() end
    }

    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function() require("plugins.compe").config() end
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require"gitsigns".setup() end
    }
end)
