local platform = require "utils.platform"

-- smear-cursor may have issues on Windows terminals without proper support
-- Disable on Windows by default, users can re-enable if their terminal supports it
local enabled = not platform.is_windows

return {
  "sphamba/smear-cursor.nvim",
  lazy = false,
  cond = enabled,
  opts = {
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    distance_stop_animating = 0.5,
    cursor_color = "#fe4e9f",
    enabled = true,
  },
}
