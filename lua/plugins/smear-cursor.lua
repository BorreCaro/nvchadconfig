local platform = require "utils.platform"

-- smear-cursor may have issues on Windows terminals without proper support
-- Disable on Windows by default, users can re-enable if their terminal supports it

return {
  "sphamba/smear-cursor.nvim",
  lazy = false,
  opts = {
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    distance_stop_animating = 0.5,
    cursor_color = "#fe4e9f",
    enabled = true,
  },
}
