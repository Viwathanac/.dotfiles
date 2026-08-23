local M = {}

---@param direction string
---@return HL.Dispatcher|nil
function M.move(direction)
    local current_window = hl.get_active_window()
    if not current_window then
        return
    end

    local current_group = current_window.group
    if current_group then
        if direction == "right" and current_group.current_index ~= current_group.size then
            return hl.dispatch(hl.dsp.group.next())
        elseif direction == "left" and current_group.current_index ~= 1 then
            return hl.dispatch(hl.dsp.group.prev())
        end
    end

    hl.dispatch(hl.dsp.focus({ direction = direction }))
    local next_window = hl.get_active_window()
    if not next_window then
        return
    end

    local index = 0
    if next_window.group then
        if direction == "left" then
            index = next_window.group.size
        elseif direction == "right" then
            index = 1
        end
    end
    return hl.dispatch(hl.dsp.group.active({ index = index }))
end

return M
