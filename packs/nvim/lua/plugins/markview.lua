-- Config inspiration from: https://github.com/l00sed/nvim-lua-config/blob/master/lua/plugins/markview.lua

local headings = {
  enable = true,
  shift_width = 0,
  heading_1 = {
    style = "label",
    padding_left = " 󰉫 ─ ",
    padding_left_hl = "MarkviewHeading1",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading1",
    icon = "",
    sign = "",
  },
  heading_2 = {
    style = "label",
    padding_left = " 󰉬 ─ ",
    padding_left_hl = "MarkviewHeading2",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading2",
    icon = "",
    sign = "",
  },
  heading_3 = {
    style = "label",
    padding_left = " 󰉭 ─ ",
    padding_left_hl = "MarkviewHeading3",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading3",
    icon = "",
    sign = "",
  },
  heading_4 = {
    style = "label",
    padding_left = " 󰉮 ─ ",
    padding_left_hl = "MarkviewHeading4",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading4",
    icon = "",
    sign = "",
  },
  heading_5 = {
    style = "label",
    padding_left = " 󰉯 ─ ",
    padding_left_hl = "MarkviewHeading5",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading5",
    icon = "",
    sign = "",
  },
  heading_6 = {
    style = "label",
    padding_left = " 󰉰 ─ ",
    padding_left_hl = "MarkviewHeading6",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading6",
    icon = "",
    sign = "",
  },
}

local code_blocks = {
  enable = true,
  icons = "devicons",
  style = "language",
  border_hl = "MarkviewCode",
  info_hl = "MarkviewCodeInfo",
  min_width = 40,
  pad_amount = 3,
  pad_char = " ",
  language_names = nil,
  language_direction = "right",
  sign = false,
  sign_hl = nil,
}

local horizontal_rules = {
  enable = true,
  parts = {
    {
      type = "repeating",
      --- Amount of time to repeat the text
      --- Can be an integer or a function.
      --- If the value is a function the "buffer" ID
      --- is provided as the parameter.
      ---@type integer | fun(buffer: integer): nil
      repeat_amount = function(buffer)
        local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff
        return math.floor((vim.o.columns - textoff - 3) / 2)
      end,
      --- Text to repeat.
      ---@type string
      text = "─",
      --- Highlight group for this part.
      --- Can be a string(for solid color) or a
      --- list of string(for gradient)
      ---@type string[] | string
      hl = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent9",
        "IndentBlanklineIndent11",
        "IndentBlanklineIndent13",
        "IndentBlanklineIndent15",
        "IndentBlanklineIndent17",
        "IndentBlanklineIndent20",
      },
      --- Placement direction of the gradient.
      ---@type "left" | "right"
      direction = "left",
    },
    {
      type = "text",
      text = "─",
      ---@type string?
      hl = "IndentBlanklineIndent23",
    },
    {
      type = "repeating",
      --- Amount of time to repeat the text
      --- Can be an integer or a function.
      --- If the value is a function the "buffer" ID
      --- is provided as the parameter.
      ---@type integer | fun(buffer: integer): nil
      repeat_amount = function(buffer)
        local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff
        return math.floor((vim.o.columns - textoff - 3) / 2)
      end,
      --- Text to repeat.
      ---@type string
      text = "─",
      --- Highlight group for this part.
      --- Can be a string(for solid color) or a
      --- list of string(for gradient)
      ---@type string[] | string
      hl = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent9",
        "IndentBlanklineIndent11",
        "IndentBlanklineIndent13",
        "IndentBlanklineIndent15",
        "IndentBlanklineIndent17",
        "IndentBlanklineIndent20",
      },
      --- Placement direction of the gradient.
      ---@type "left" | "right"
      direction = "right",
    },
  },
}

return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
  config = function()
    local markview = require("markview")
    local presets = require("markview.presets").headings
    --
    markview.setup({
      markdown = {
        enable = true,
        headings = headings,
        horizontal_rules = horizontal_rules,
      },
      code_blocks = code_blocks,
      renderers = {
        markdown_atx_heading = function(ns, buffer, item)
          local level = item.level or vim.fn.strlen(item.marker)
          local hl_group = "MarkviewHeading" .. level

          -- Apply highlight to the entire line
          vim.api.nvim_buf_add_highlight(
            buffer,
            ns,
            hl_group,
            item.range.row_start,
            0, -- Start from beginning of line
            -1 -- To end of line
          )

          -- Add extra padding to extend the highlight
          local win = vim.fn.bufwinid(buffer)
          if win ~= -1 then
            local width = vim.api.nvim_win_get_width(win)
            local line = vim.api.nvim_buf_get_lines(buffer, item.range.row_start, item.range.row_start + 1, false)[1]
            local line_width = vim.fn.strdisplaywidth(line or "")
            local padding = width - line_width

            if padding > 0 then
              vim.api.nvim_buf_set_extmark(buffer, ns, item.range.row_start, item.range.col_end, {
                virt_text = { { string.rep(" ", padding), hl_group } },
                virt_text_pos = "inline",
                priority = 10,
              })
            end
          end
        end,
      },
      highlight_groups = {
        -- Use string keys for each highlight group
        MarkviewHeading1 = {
          bg = "#f1c232",
          fg = "#f38ba8",
        },
        MarkviewHeading2 = {
          bg = "#363a4f",
          fg = "#f9b387",
        },
        MarkviewHeading3 = {
          bg = "#414559",
          fg = "#f9e2af",
        },
        -- ... and so on
      },
    })

    -- vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<CR>", { desc = "Toggle Markview" })
    -- vim.cmd("Markview Enable")
  end,
}
