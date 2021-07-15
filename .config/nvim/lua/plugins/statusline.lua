local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {
    "LuaTree", "vista", "dbui", "startify", "term", "nerdtree", "fugitive", "fugitiveblame", "plug"
}

local colors = {
    bg = "#282c34",
    line_bg = "#353644",
    fg = "#8FBCBB",
    fg_green = "#65a380",
    yellow = "#fabd2f",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#afd700",
    orange = "#FF8800",
    purple = "#5d4d7a",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67"
}

local function has_file_type() return not (not vim.bo.filetype or vim.bo.filetype == "") end

local function buffer_not_empty() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end

local function trailing_whitespace() return vim.fn.search("\\s$", "nw") ~= 0 and " " or nil end

local checkwidth = function() return vim.fn.winwidth(0) / 2 > 40 end

gls.left[1] = {
    FirstElement = {
        provider = function() return " " end,
        highlight = { colors.blue, colors.line_bg }
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
                R = colors.yellow,
                Rv = colors.purple,
                S = colors.orange,
                V = colors.blue,
                [""] = colors.orange,
                [""] = colors.blue,
                ["!"] = colors.green,
                ["r?"] = colors.red,
                c = colors.red,
                ce = colors.red,
                cv = colors.red,
                i = colors.blue,
                ic = colors.yellow,
                n = colors.green,
                no = colors.magenta,
                r = colors.cyan,
                rm = colors.red,
                s = colors.orange,
                t = colors.green,
                v = colors.magenta
            }

            local vim_mode = vim.fn.mode()
            vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
            return alias[vim_mode] .. "   "
        end,
        highlight = { colors.red, colors.line_bg, "bold" }
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg }
    }
}

gls.left[4] = {
    FileName = {
        provider = { "FileName", "FileSize" },
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.line_bg, "bold" }
    }
}

gls.left[5] = {
    GitIcon = {
        provider = function() return "  " end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = { colors.orange, colors.line_bg }
    }
}

gls.left[6] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = { "#8FBCBB", colors.line_bg, "bold" }
    }
}

gls.left[7] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.green, colors.line_bg }
    }
}
gls.left[8] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.orange, colors.line_bg }
    }
}
gls.left[9] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.red, colors.line_bg }
    }
}

gls.left[10] = {
    LeftEnd = {
        provider = function() return "" end,
        separator = "",
        separator_highlight = { colors.bg, colors.line_bg },
        highlight = { colors.line_bg, colors.line_bg }
    }
}

gls.left[11] = {
    TrailingWhiteSpace = {
        provider = trailing_whitespace,
        icon = "  ",
        highlight = { colors.yellow, colors.bg }
    }
}

gls.left[12] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.bg }
    }
}

gls.left[13] = { Space = { provider = function() return " " end } }

gls.left[14] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.yellow, colors.bg }
    }
}

gls.right[1] = {
    FileFormat = {
        provider = "FileFormat",
        separator = " ",
        separator_highlight = { colors.bg, colors.line_bg },
        highlight = { colors.fg, colors.line_bg, "bold" }
    }
}

gls.right[4] = {
    LineInfo = {
        provider = "LineColumn",
        separator = " | ",
        separator_highlight = { colors.blue, colors.line_bg },
        highlight = { colors.fg, colors.line_bg }
    }
}

gls.right[5] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = { colors.line_bg, colors.line_bg },
        highlight = { colors.cyan, colors.darkblue, "bold" }
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = "FileTypeName",
        separator = "",
        condition = has_file_type,
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.fg, colors.purple }
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = "BufferIcon",
        separator = "",
        condition = has_file_type,
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.fg, colors.purple }
    }
}
