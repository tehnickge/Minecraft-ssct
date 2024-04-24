local IntegrationMonitorsModule = {}

function IntegrationMonitorsModule.IntegrationMonitors()
    local monitors = { peripheral.find("monitor") }
    return monitors
end

return IntegrationMonitorsModule