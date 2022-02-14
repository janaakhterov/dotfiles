local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {
    "LuaTree", "vista", "dbui", "startify", "term", "nerdtree", "fugitive", "fugitiveblame", "plug"
}

local colors = {
    normal = {
        black = '0xfbf1c7',
        red = '0x9d0006',
        green = '0x79740e',
        yellow = '0xb57614',
        blue = '0x076678',
        magenta = '0x8f3f71',
        cyan = '0x427b58',
        white = '0x504945'
    },
    bright = {
        black = '0xbdae93',
        red = '0x9d0006',
        green = '0x79740e',
        yellow = '0xb57614',
        blue = '0x076678',
        magenta = '0x8f3f71',
        cyan = '0x427b58',
        white = '0x282828'
    }
}

local function has_file_type() return not (not vim.bo.filetype or vim.bo.filetype == "") end

local function buffer_not_empty() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end

local function trailing_whitespace() return vim.fn.search("\\s$", "nw") ~= 0 and " " or nil end

local checkwidth = function() return vim.fn.winwidth(0) / 2 > 40 end

gls.left[1] = {
    FirstElement = {
        provider = function() return " " end,
        highlight = { colors.bright.blue, colors.bright.white }
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                R = "REPLACE",
                Rv = "VIRTUAL",
                S = "SELECT",
                V = "VISUAL",
                [""] = "SELECT",
                [""] = "VISUAL",
                ["!"] = "SHELL",
                ["r"] = "HIT-ENTER",
                ["r?"] = ":CONFIRM",
                c = "COMMAND",
                i = "INSERT",
                n = "NORMAL",
                rm = "--MORE",
                s = "SELECT",
                t = "TERMINAL",
                v = "VISUAL"
            }

            local mode_color = {
                R = colors.bright.yellow,
                Rv = colors.bright.magenta,
                S = colors.bright.blue,
                V = colors.bright.blue,
                [""] = colors.bright.blue,
                [""] = colors.bright.blue,
                ["!"] = colors.bright.green,
                ["r?"] = colors.bright.red,
                c = colors.bright.red,
                ce = colors.bright.red,
                cv = colors.bright.red,
                i = colors.bright.blue,
                ic = colors.bright.yellow,
                n = colors.bright.green,
                no = colors.bright.magenta,
                r = colors.bright.cyan,
                rm = colors.bright.red,
                s = colors.bright.blue,
                t = colors.bright.green,
                v = colors.bright.magenta
            }

            local vim_mode = vim.fn.mode()
            vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
            return alias[vim_mode] .. "   "
        end,
        highlight = { colors.bright.red, colors.bright.white, "bold" }
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bright.white }
    }
}

gls.left[4] = {
    FileName = {
        provider = { "FileName", "FileSize" },
        condition = buffer_not_empty,
        highlight = { colors.normal.black, colors.bright.white, "bold" }
    }
}

gls.left[5] = {
    GitIcon = {
        provider = function() return "  " end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = { colors.bright.blue, colors.bright.white }
    }
}

gls.left[6] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = { "#8FBCBB", colors.bright.white, "bold" }
    }
}

gls.left[7] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.bright.green, colors.bright.white }
    }
}
gls.left[8] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.bright.blue, colors.bright.white }
    }
}
gls.left[9] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.bright.red, colors.bright.white }
    }
}

gls.left[10] = {
    LeftEnd = {
        provider = function() return "" end,
        separator = "",
        separator_highlight = { colors.bright.white, colors.bright.white },
        highlight = { colors.bright.white, colors.bright.white }
    }
}

gls.left[11] = {
    TrailingWhiteSpace = {
        provider = trailing_whitespace,
        icon = "  ",
        highlight = { colors.bright.yellow, colors.bright.white }
    }
}

gls.left[12] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.bright.red, colors.bright.white }
    }
}

gls.left[13] = { Space = { provider = function() return " " end } }

gls.left[14] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.bright.yellow, colors.bright.white }
    }
}

gls.right[1] = {
    FileFormat = {
        provider = "FileFormat",
        separator = " ",
        separator_highlight = { colors.bright.white, colors.bright.white },
        highlight = { colors.normal.black, colors.bright.white, "bold" }
    }
}

gls.right[4] = {
    LineInfo = {
        provider = "LineColumn",
        separator = " | ",
        separator_highlight = { colors.bright.blue, colors.bright.white },
        highlight = { colors.normal.black, colors.bright.white }
    }
}

gls.right[5] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = { colors.bright.white, colors.bright.white },
        highlight = { colors.bright.cyan, colors.normal.blue, "bold" }
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = "FileTypeName",
        separator = "",
        condition = has_file_type,
        separator_highlight = { colors.bright.magenta, colors.bright.white },
        highlight = { colors.normal.black, colors.bright.magenta }
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = "BufferIcon",
        separator = "",
        condition = has_file_type,
        separator_highlight = { colors.bright.magenta, colors.bright.white },
        highlight = { colors.normal.black, colors.bright.magenta }
    }
}
