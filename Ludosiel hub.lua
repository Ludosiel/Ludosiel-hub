getgenv().autoTap = false
getgenv().autoegg = false
getgenv().autorebirth = false


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Ludosiel HUB", "RJTheme3")

local Tab = Window:NewTab("Фарм (farming)")

local Section = Tab:NewSection("Основной фарм")
Section:NewToggle("Авто-яйца (auto-egg)","ПОН", function(state)
        getgenv().autoegg = state
        print('яички теребём', state)
        if state then
            autoegg1()
    end
end)

Section:NewToggle("Авто перерождения (auto rebirth)", "чоооо", function(state)
    getgenv().autorebirth = state
    print('Перерождайся хуйлан', state)
    if state then
        autorebirth1()
end
end)

Section:NewToggle("Автокликер (autoclick)", "Заебись штука", function(state)
    getgenv().autoTap = state
    print('Автокликер включён', state)
    if state then
        autotap1()
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
    while getgenv().autorebirth == true do
        if not getgenv.autoegg then break end
        local args = {[1] = {},[2] = "Starter",[3] = 1}
        remotePath.HatchEgg:InvokeServer(unpack(args))
        wait()
    end
  end)
end

function autorebirth1()
spawn(function()
while autorebirth == true do
    local args = {[1] = 10}
    remotePath.Rebirth:FireServer(unpack(args))
    wait()
    end
  end) 
end
