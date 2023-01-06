getgenv().autoTap = false
getgenv().autoegg = false
getgenv().autorebirth = false


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("DARK HUB", "RJTheme3")

local Tab = Window:NewTab("Фарм (farming)")

local Section = Tab:NewSection("Основной фарм")


Section:NewToggle("Авто-яйца (auto-egg)","ПОН", function(aboba)
        getgenv().autoegg = aboba
        print('яички теребём', aboba)
        if aboba then
            autoegg1()
    end
end)


Section:NewToggle("Автокликер (autoclick)", "Заебись штука", function(state)
    getgenv().autoTap = state
    print('Автокликер включён', state)
    if state then
        autotap1()
end
end)


local Tab = Window:NewTab("Перерождения")
local Section = Tab:NewSection("Основной фарм")

local selectedrebirtho

Section:NewDropdown("Rebirth(перерождения)", "DropdownInf", {"1", "5", "10","20", "100", "500"}, function(state)
  selectedrebirtho = state
  print(selectedrebirtho)
end)
Section:NewToggle("Авто перерождения (auto rebirth)", "чоооо", function(state)
    getgenv().autorebirth = state
    print('Перерождайся хуйлан', state)
    if state and selectedrebirtho then
        autorebirth1(selectedrebirtho)
end
end)









local remotePath = game:GetService("ReplicatedStorage").Events

function autotap1()
spawn(function()
while autoTap == true do
    wait(0.1)
    local args = {[1] = "Main"}
    remotePath.Tap:FireServer(unpack(args))
    wait()
    end
  end)
end

function autoegg1()
spawn(function()
    while getgenv().autoegg == true do
        local args = {[1] = {},[2] = "Starter",[3] = 1}
        remotePath.HatchEgg:InvokeServer(unpack(args))
        wait()
    end
  end)
end

function autorebirth1()
spawn(function()
while autorebirth == true do
  local args = {selectedrebirtho}
    remotePath.Rebirth:FireServer(unpack(args))
    wait()
    end
  end) 
end
-- // join discord for key https://discord.gg/QBdvJ5QymP \\ --
