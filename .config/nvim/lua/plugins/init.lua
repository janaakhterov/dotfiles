local use = require"packer".use

require"packer".init {
    display = { open_fn = function() return require"packer.util".float { border = "single" } end },
    git = { clone_timeout = 600 }
}

vim.cmd [[packadd packer.nvim]]

return require"packer".startup(function()
    use {
        "wbthomason/packer.nvim"
    }

    use {
        "ellisonleao/gruvbox.nvim",
        commit = "cb7a8a867cfaa7f0e8ded57eb931da88635e7007",
    }

    use {
        "tpope/vim-abolish",
    }

    use {
        "tpope/vim-fugitive",
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        tag = "nightly",
        config = function() require"nvim-tree".setup() end,
    }

    use { 
        "nvim-treesitter/nvim-treesitter",
        config =  function() require "plugins.treesitter".config() end,
    }

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
    }

    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    }

    use {
        "neovim/nvim-lspconfig",
        after = "coq_nvim",
        config = function() require"plugins.lspconfig".config() end,
    }

    use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function() require "plugins.statusline" end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }

    use {
        "terrortylor/nvim-comment",
        config = function() require"nvim_comment".setup() end,
    }

    use {
        "onsails/lspkind-nvim",
        event = "BufRead",
        config = function() require("lspkind").init() end,
    }

    use {
        "mfussenegger/nvim-jdtls"
    }
end)
