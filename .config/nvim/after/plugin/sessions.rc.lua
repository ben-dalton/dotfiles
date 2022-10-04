local status, sessions = pcall(require, "sessions")
if (not status) then return end

sessions.setup()

