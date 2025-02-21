local copas = require("copas")

local function async_task(name, duration)
    copas.sleep(duration) -- Simulates an async task
    print(name .. " completed after " .. duration .. " seconds.")
end

local function run_async_tasks()
    copas.addthread(async_task, "Task 1", 2)
    copas.addthread(async_task, "Task 2", 4)
    copas.addthread(async_task, "Task 3", 3)
    copas.loop() -- Runs all tasks asynchronously
end

return { run_async_tasks = run_async_tasks }
