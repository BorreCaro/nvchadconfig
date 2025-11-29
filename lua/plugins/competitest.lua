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
              -- CORRECCIÓN 3: Usar $(ABSDIR) para ruta absoluta de la carpeta de salida
              "$(ABSDIR)/bin/$(FNOEXT)",
            },
          },
          rust = { exec = "rustc", args = { "$(FABSPATH)" } },
        },

        run_command = {
          -- CORRECCIÓN 4: Usar la ruta absoluta del ejecutable
          cpp = { exec = "$(ABSDIR)/bin/$(FNOEXT)" },
          rust = { exec = "$(ABSDIR)/bin/$(FNOEXT)" },
          python = { exec = "python3", args = { "$(FABSPATH)" } }, -- También mejor con ruta absoluta
        },
        runner_ui = {
          interface = "popup",
        },

        template_file = {
          cpp = home .. "/source/comp/templates/template.cpp",
          py = home .. "/source/comp/templates/template.py",
          rust = home .. "/source/comp/templates/template.rs",
        },
      }
    end,
  },
}
