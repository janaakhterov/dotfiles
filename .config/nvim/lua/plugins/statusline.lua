local galaxyline = require("galaxyline")

galaxyline.short_line_list = {
    "NvimTree",
}

local colors = {
    normal = {
        black = "#282828",
        red = "#cc241d",
        green = "#98971a",
        yellow = "#d79921",
        blue = "#458588",
        magenta = "#b16286",
        cyan = "#689d6a",
        white = "#a89984",
    },
    bright = {
        black = "#928374",
        red = "#fb4934",
        green = "#b8bb26",
        yellow = "#fabd2f",
        blue = "#83a598",
        magenta = "#d3869b",
        cyan = "#8ec07c",
        white = "#ebdbb2",
    }
}

local mode_alias = {
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

local ViMode = {
    ViMode = {
        provider = function()
            local bg = mode_color[vim.fn.mode()]
            local fg = colors.normal.black
             vim.api.nvim_command("hi GalaxyViMode gui=bold guifg=" .. fg .. " guibg=" .. bg)

            -- For Some reason two spaces are needed in the beginning?
            return "  " .. mode_alias[vim.fn.mode()] .. " "
        end,
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        -- highlight = This function is **NOT** recomputed each time the mode changes
    }
}

local FileName = {
    FileName = {
        provider = function()
            return vim.fn.expand("%")
        end,
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        highlight = { colors.bright.white, colors.normal.black, "bold" }
    }
}

local GitBranch = {
    GitBranch = {
        provider = "GitBranch",
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = { colors.bright.yellow, colors.normal.black, "bold" }
    }
}

local FileFormat = {
    FileFormat = {
        provider = "FileFormat",
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        highlight = { colors.bright.white, colors.normal.black, "bold" }
    }
}

local Column = {
    Column = {
        provider = function()
            return vim.fn.col(".")
        end,
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        highlight = { colors.bright.white, colors.normal.black }
    }
}

local Percent = {
    Percent = {
        provider = function()
          local current_line = vim.fn.line(".")
          local total_line = vim.fn.line("$")
          if current_line == 1 then
                return "Top"
          elseif current_line == vim.fn.line("$") then
            return "Bot"
          end
          local result,_ = math.modf((current_line/total_line)*100)
          return result .. "%"
        end,
        separator = " ",
        separator_highlight = { colors.normal.black, colors.normal.black },
        highlight = { colors.bright.cyan, colors.normal.black, "bold" }
    }
}

table.insert(galaxyline.section.left, ViMode)
table.insert(galaxyline.section.left, FileName)
table.insert(galaxyline.section.left, GitBranch)

table.insert(galaxyline.section.right, FileFormat)
table.insert(galaxyline.section.right, Column)
table.insert(galaxyline.section.right, Percent)
