local sys = require("system") -- Load LuaSystem

local function get_terminal_size()
  -- Attempt to get terminal size using LuaSystem
  if sys.termsize then
    local rows, cols = sys.termsize()
    if rows and cols then
      return cols, rows
    end
  end

  -- Fallback: Try 'tput' command (Linux/macOS)
  local handle = io.popen("tput cols 2>/dev/null && tput lines 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    local cols, rows = result:match("(%d+)%s+(%d+)")
    if cols and rows then
      return tonumber(cols), tonumber(rows)
    end
  end

  -- Fallback: Try 'mode con' (Windows)
  local handle = io.popen("mode con")
  if handle then
    for line in handle:lines() do
      local cols = line:match("Columns:%s*(%d+)")
      local rows = line:match("Lines:%s*(%d+)")
      if cols and rows then
        handle:close()
        return tonumber(cols), tonumber(rows)
      end
    end
    handle:close()
  end

  -- Default fallback values
  return 80, 24
end

local function create(text)
  -- Get terminal dimensions
  local width, height = get_terminal_size()

  -- Print bordered header
  local border = string.rep("=", width)
  print(border)
  print(text)
  print(border)
end

return { create = create }

