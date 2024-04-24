local moveTitileModule = {}
local displayLink = peripheral.wrap("Create_DisplayLink")

function moveTitileModule.run(title)

    local text = title
    local xSize, ySize = displayLink.size()
    displayLink.clear()
    displayLink.setCursorPos(1,1)
    displayLink.write(text)
    displayLink.update()
    while true do
        for i = 1, xSize+1 do 
            displayLink.clear()
            displayLink.setCursorPos(i, 1)
            displayLink.write(text)
            displayLink.update()
            sleep(0.5)
        end
        for i = 15, xSize+1, -1 do 
        print(i)
            displayLink.clear()
            displayLink.setCursorPos(i, 1)
            displayLink.write(text)
            displayLink.update()
            sleep(0.5)
        end
    end
end

return moveTitileModule