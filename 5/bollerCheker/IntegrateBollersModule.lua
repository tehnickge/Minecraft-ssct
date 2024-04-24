local IntegrateBollersModule = {}
local getMonitros = require "IntegrationMonitorsModule"
local MAX_PIXEL_PER_BLOCK = 5

function IntegrateBollersModule.integrateBollers(sizeX, sizeY)
    local maxCountBlocksPerLine = print( math.ceil(sizeX/MAX_PIXEL_PER_BLOCK) )
end

function IntegrateBollersModule.getBollers()
    local bollers = { peripheral.find("create:fluid_tank") }
end

return IntegrateBollersModule