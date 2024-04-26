local pretty = require "cc.pretty"
local gpu = peripheral.find("monitor")
local capositors = { peripheral.find("capacitor_hv") }

local energyStatusModule = {}

function energyStatusModule.Print(startX,startY,endX,endY)
    local mexEnergy, currentEnergy = energyStatusModule.getEnergy()
    pretty.pretty_print(mexEnergy)
    pretty.pretty_print(currentEnergy)
    --#region DrawOnScreen
    screenWidth, screenHeight = gpu.getSize()
    gpu.clear()
    energyStatusModule.Drow(startX,startY,endX,endY, colors.red)
    local procent = (currentEnergy / mexEnergy)
    local y = math.ceil(endY * procent)
    energyStatusModule.Drow(startX,startY,endX,y, colors.green)
    energyStatusModule.DrowText(mexEnergy,currentEnergy)
    
    --#endregion
end

function energyStatusModule.Drow(startX,startY,endX,endY,color)
    gpu.setBackgroundColor(colors.black)
    local flagStart = true
    local currentX, currentY = startX, startY
    gpu.setBackgroundColor(color)
    while flagStart do
        gpu.setCursorPos(currentX, currentY)
        gpu.write("*")
        if currentX <= endX then
            currentX = currentX + 1
        end
        if (currentY <= endY and currentX >= endX) then
            currentY = currentY + 1
            currentX = startX
        end
        if((currentX >= endX) and (currentY >= endY)) then
            flagStart = false
            gpu.setBackgroundColor(colors.black)
        end
    end
end

function energyStatusModule.DrowText(mexEnergy, currentEnergy)
    local w,h = gpu.getSize()
    gpu.setTextColor(colors.purple)
    gpu.setCursorPos((w-14),math.ceil(h/2 - 2))
    gpu.write("MAX: "..mexEnergy.."W")
    gpu.setTextColor(colors.blue)
    gpu.setCursorPos((w-14),math.ceil(h/2))
    gpu.write("CUR: "..currentEnergy.."W")
    gpu.setTextColor(colors.yellow)
    gpu.setCursorPos((w-12),math.ceil(h/2 + 2))
    gpu.write("count: "..tostring(#capositors))
    gpu.setTextColor(colors.white)
end

function energyStatusModule.getEnergy()
    local mexEnergy, currentEnergy
    for _,cap in ipairs(capositors) do 
        mexEnergy = (mexEnergy or 0) + cap.getMaxEnergyStored()
        currentEnergy = (currentEnergy or 0) + cap.getEnergyStored()
    end

    return mexEnergy, currentEnergy
end

return energyStatusModule