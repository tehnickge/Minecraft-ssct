local signal = require("buttonSignal")

local gpu = peripheral.find("monitor")

local SECRET_CODE = {"2","2","8"} --your password
local secretCode = {"*","*","*"} -- current char in string line
local ButtonItem = {"1","2","3","4","5","6","7","8","9","0","clr"} --all keys

local screenWidth, screenHeight = gpu.getSize()

local coordinate = {} --all keys with coordinate

function arrayEqual(a1, a2)
    -- Check length, or else the loop isn't valid.
    if #a1 ~= #a2 then
      return false
    end
  
    -- Check each element.
    for i, v in ipairs(a1) do
      if v ~= a2[i] then
        return false
      end
    end
    
    -- We've checked everything.
    return true
end

function PrintCode(spacing)
    local currentPos = 2 -- start value by x coordinate
    if(arrayEqual(secretCode, SECRET_CODE)) then
        gpu.setTextColour(colors.lightBlue)
        gpu.setBackgroundColor(colors.lightGray)
        signal.get()
    else
        gpu.setTextColour(colors.red)
    end
    
    
    gpu.setCursorPos(2,1)
    for i, x in ipairs(secretCode) do
        gpu.write(tostring(x))
        currentPos = currentPos + spacing + 1
        gpu.setCursorPos(currentPos, 1)
    end
    gpu.setBackgroundColor(colors.black)
    gpu.setTextColour(colors.white)
end

function PrintButtonOnScreen(buttons, spacing, screenWidth, screenHeight)
    gpu.setTextColour(colors.white)
    gpu.setTextColour(colors.white)
    gpu.clear()
    coordinate = {}

    local iterator = 1
    local row, col = 2,2
    local flagWork = true

    PrintCode(spacing)

    while(flagWork) do
        if iterator >= #buttons then
            flagWork = false
        end
        if(row >= screenWidth) then
            row = 2
            col = col + 1
        end

        gpu.setCursorPos(row, col)
        gpu.write(buttons[iterator])
        local tabletmp = {
            x = row,
            y = col,
            symb = buttons[iterator]
        }
        table.insert(coordinate, tabletmp)

        if(row <= screenWidth) then
            row = row + 1 + spacing
        end
        iterator = iterator + 1
    end
end

PrintButtonOnScreen(ButtonItem, 1, screenWidth, screenHeight)
local secretIterator = 1
while true do
    local event, side, x, y = os.pullEvent("monitor_touch")
    -- print("The monitor on side " .. side .. " was touched at (" .. x .. ", " .. y .. ")")
    for i, str in ipairs(coordinate) do
        if(((x >= str.x) and (x < str.x + string.len(str.symb))) and ((y >= str.y) and (y < str.y + 1))) then

            print(str.symb)

            if(str.symb ~= "clr") then
                secretCode[secretIterator] = str.symb
            end
            if(str.symb == "clr") then
                secretCode = {"H", "U", "I"}
                secretIterator = 0
            end
            
            PrintButtonOnScreen(ButtonItem, 1, screenWidth, screenHeight)
            if(secretIterator >= #secretCode) then
                secretCode = {"H", "U", "I"}
                secretIterator = 1
            else 
                secretIterator = secretIterator + 1
            end
        end
    end
end