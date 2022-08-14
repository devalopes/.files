require("auto-save").setup {
  enabled = true,
  execution_message = {
    message = function() return '' end,
    },
  trigger_events = {"InsertLeave", "TextChanged"},
  debounce_delay = 500
}
