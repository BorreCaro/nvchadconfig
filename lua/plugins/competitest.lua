local platform = require "utils.platform"
local km = require("mappings").competitest

return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",

    keys = {
      { km.run.key, "<cmd>CompetiTest run<cr>", desc = km.run.desc },
      { km.add.key, "<cmd>CompetiTest add_testcase<cr>", desc = km.add.desc },
      { km.edit.key, "<cmd>CompetiTest edit_testcase<cr>", desc = km.edit.desc },
      { km.recv.key, "<cmd>CompetiTest receive problem<cr>", desc = km.recv.desc },
    },

    config = function()
      local home = vim.fn.expand "~"
      local path_sep = platform.path_sep
      local exe_suffix = platform.is_windows and ".exe" or ""

      -- Build output path based on platform
      local cpp_output = platform.is_windows and "$(ABSDIR)\\bin\\$(FNOEXT)" .. exe_suffix or "$(ABSDIR)/bin/$(FNOEXT)"

      local rust_output = platform.is_windows and "$(ABSDIR)\\bin\\$(FNOEXT)" .. exe_suffix or "$(ABSDIR)/bin/$(FNOEXT)"

      -- Python command: use "python" on Windows, "python3" on Unix
      local python_cmd = platform.is_windows and "python" or "python3"

      require("competitest").setup {
        host = "0.0.0.0",
        port = 10042,
        testcases_use_single_file = true,
        testcases_directory = "testcases",
        compile_directory = "bin",

        problem_format = "$(PROBLEM)_$(INDEX)",

        received_problems_path = "$(JAVA_TASK_CLASS).$(FEXT)",
        received_contests_problems_path = "$(JAVA_TASK_CLASS).$(FEXT)",

        compile_command = {
          cpp = {
            exec = "g++",
            args = {
              -- CORRECCIÓN 2: Usar $(FABSPATH) para la ruta completa del archivo fuente
              "$(FABSPATH)",
              "-o",
              -- Use platform-appropriate path separator
              cpp_output,
            },
          },
          rust = { exec = "rustc", args = { "$(FABSPATH)", "-o", rust_output } },
        },

        run_command = {
          -- Use platform-appropriate executable path
          cpp = { exec = cpp_output },
          rust = { exec = rust_output },
          python = { exec = python_cmd, args = { "$(FABSPATH)" } },
        },
        runner_ui = {
          interface = "popup",
        },

        template_file = {
          cpp = home
            .. path_sep
            .. "source"
            .. path_sep
            .. "comp"
            .. path_sep
            .. "templates"
            .. path_sep
            .. "template.cpp",
          py = home
            .. path_sep
            .. "source"
            .. path_sep
            .. "comp"
            .. path_sep
            .. "templates"
            .. path_sep
            .. "template.py",
          rust = home
            .. path_sep
            .. "source"
            .. path_sep
            .. "comp"
            .. path_sep
            .. "templates"
            .. path_sep
            .. "template.rs",
        },
      }
    end,
  },
}
