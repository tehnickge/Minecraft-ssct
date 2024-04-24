local monitor = peripheral.wrap("top")
local tank = peripheral.wrap("create_target_1")

while true do
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.setTextColor(colors.yellow)
    monitor.setTextScale(5)
    monitor.write(os.date("%T"))
    monitor.setCursorPos(1, 2)
    monitor.write("aboba")
    monitor.setCursorPos(1, 3)
    
    local number = string.match(tank.getLine(1), "%d+")
    monitor.write(number) 
    
    sleep(0.5)
end
