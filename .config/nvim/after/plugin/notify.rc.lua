local status, notify = pcall(require, "nvim-notify")
if (not status) then return end

notify.setup()
