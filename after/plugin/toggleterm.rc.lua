local status, toggle_term = pcall(require, "toggleterm")
if (not status) then return end

toggle_term.setup()
