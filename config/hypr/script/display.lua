local M = {}

---@param monitor string
---@return nil
function M.setup(monitor)
    local connected = hl.get_monitor(monitor)
    if not connected then
        return
    end

    if monitor == Monitor then
        return hl.config({
            hl.monitor({
                output = Monitor,
                mode = "1920x1080@144",
                position = "0x0",
                scale = "1",
            }),
            hl.monitor({ --Disable Laptop
                output = Laptop,
                disabled = true,
            }),
            hl.workspace_rule({ workspace = "r[1-5]", monitor = Monitor })
        })
    else
        return hl.config({
            hl.monitor({
                output = Laptop,
                disabled = false,
                mode = "1920x1080@144",
                position = "0x0",
                scale = "1",
            }),
            hl.workspace_rule({ workspace = "r[1-5]", monitor = Laptop })
        })
    end
end

return M
