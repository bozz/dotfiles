return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    -- { "<leader>ai", ":CodeCompanion<cr>", mode = "n", desc = "Inline Assistant" },
    -- { "<leader>ai", ":'<,'>CodeCompanion<cr>", mode = "v", desc = "Inline Assistant (selected)" },
    -- { "<leader>af", ":'<,'>CodeCompanion /fix<cr>", mode = "v", desc = "Fix selected code" },
    -- { "<leader>ae", ":'<,'>CodeCompanion /explain<cr>", mode = "v", desc = "Explain selected code" },

    -- Other useful keymaps
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>ag", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat" },
    { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Chat" },
  },
  opts = {
    -- Configure the MCP extension
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true, -- Create variables from MCP
          make_slash_commands = true, -- Create slash commands from MCP
          show_result_in_chat = true, -- Show MCP results in chat
        },
      },
    },
    strategies = {
      chat = {
        adapter = "githubmodels",
        roles = {
          -- Show model in chat header
          llm = function(adapter)
            local model = adapter.model
            if type(model) == "table" then
              model = model.name or model.id or vim.inspect(model)
            end
            if not model and type(adapter.schema.model.default) == "table" then
              model = adapter.schema.model.default.name
                or adapter.schema.model.default.id
                or vim.inspect(adapter.schema.model.default)
            end
            model = model or adapter.schema.model.default or "unknown"

            -- local model = adapter.model or adapter.schema.model.default
            return string.format("CodeCompanion (%s - %s)", adapter.formatted_name, model)
          end,
        },
        keymaps = {
          send = {
            modes = { n = "<C-r>", i = "<C-r>" },
          },
          close = {
            modes = { n = "<C-d>", i = "<C-d>" },
          },
        },
      },
      inline = {
        adapter = "githubmodels",
      },
    },
    adapters = {
      githubmodels = function()
        local success, adapter = pcall(require, "codecompanion.adapters")
        if not success then
          vim.notify("Failed to load codecompanion.adapters", vim.log.levels.ERROR)
          return
        end
        return adapter.extend("githubmodels", {
          schema = {
            model = {
              default = "gpt-4.1", -- Use global variable or fallback
              -- default = vim.g.codecompanion_model or "gpt-4.1", -- Use global variable or fallback
              -- Available models:
              -- "gpt-4o" - Optimized GPT-4
              -- "gpt-4" - Standard GPT-4
              -- "gpt-3.5-turbo" - Lightweight GPT-3.5
              -- "claude-3.5-sonnet" - Claude AI model
              -- "claude-3.7-sonnet" - Advanced Claude AI
              -- "gemini-2.0-flash" - Gemini AI model
            },
          },
        })
      end,
    },
    display = {
      chat = {
        intro_message = "How can I help you ✨? (Press ? for options)",
        show_header_separator = false,
        separator = "─",
        show_references = true,
        show_settings = false,
        show_token_count = true,
        start_in_insert_mode = false,
      },
      inline = {
        layout = "vertical", -- vertical|horizontal|buffer
      },
    },
  },
}
