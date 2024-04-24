


comand_str = ""
password = "123"
pas_msg = "Enter password"
while comand_str ~= "exit"  do 
    sleep(0.5)
    print("Enter comand: ")
    print("/help - see all comand")
    comand_str = read()
    if(comand_str == "open door") then
        print(pas_msg)
        local temp_pass = read()
        if(temp_pass == password) then 
            redstone.setOutput("bottom", not redstone.getOutput("bottom"))
        end
    end  
    if(comand_str == "close door") then
        redstone.setOutput("bottom", false)  
    end    
end    
