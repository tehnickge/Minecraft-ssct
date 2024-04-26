local text = "jopa"

local moduleMoveTitle = require "anyFunc"
local sss = peripheral.find("Create_DisplayLink")
local mee = peripheral.getMethods("monitor")
for _, met in ipairs(mee) do
    print(met) 
end

moduleMoveTitle.run(text, size)
print(res)
local perf = peripheral.getNames()
for k,v in ipairs(perf) do 
    print(v)
end
