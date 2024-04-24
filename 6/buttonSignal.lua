local ButtonSignal = {}

function ButtonSignal.get()
    redstone.setOutput("bottom", true)
    sleep(1)
    redstone.setOutput("bottom", false)
end

return ButtonSignal
