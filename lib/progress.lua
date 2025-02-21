local function progress_bar(current, total, width)
    width = width or 40 -- Default width if not provided
    local percent = current / total
    local filled = math.floor(percent * width)
    local empty = width - filled
    local bar = "[" .. string.rep("█", filled) .. string.rep("-", empty) .. "]"
    return bar .. string.format(" %d%%", math.floor(percent * 100))
end

local function show_progress(duration, steps)
    steps = steps or 20
    local interval = duration / steps
    for i = 1, steps do
        io.write("\r" .. progress_bar(i, steps, 40)) -- Overwrite line
        io.flush()
        os.execute("sleep " .. (interval)) -- Pause for effect
    end
    io.write("\n")
end

return { progress_bar = progress_bar, show_progress = show_progress }
