local bollers = { peripheral.find("create:fluid_tank") }

local perfNames = peripheral.getNames()

for _, m in ipairs(perfNames) do
    print(m .. "\tjopa")
end
