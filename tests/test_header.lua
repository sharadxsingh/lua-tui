local header = require("lib.header")

describe("Header Module", function()
    it("should print a header with correct length", function()
        -- Capture the output by running Lua in a subprocess
        local command = "lua -e 'require(\"lib.header\").create(\"Test Header\")'"
        local handle = io.popen(command, "r")
        local printed_output = handle:read("*a")
        handle:close()

        -- Dynamically get the terminal width
        local term_width = io.popen("tput cols", "r"):read("*n") or 80
        local expected_output = string.rep("=", term_width) .. "\nTest Header\n" .. string.rep("=", term_width) .. "\n"

        -- Debugging: Print the captured output (remove this if not needed)
        print("Captured Output:\n" .. printed_output)

        -- Compare captured output with expected output
        assert.are.equal(expected_output, printed_output)
    end)
end)
