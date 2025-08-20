local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/Simple-KeySystem-Roblox/refs/heads/main/Library.lua"))()

local KeyWindow = Library:CreateWindow("黄脚本卡密系统", UDim2.fromOffset(300, 180))

local KeyBox = KeyWindow:AddTextBox("请输入卡密...", UDim2.new(0.1, 0, 0.15, 0))
local RememberToggle = KeyWindow:AddToggle("记住卡密", UDim2.new(0.1, 0, 0.36, 0), false)

local KeyPath = "DisabledHubConfigs/Key"
local FileName = "SavedKey.lua"

local SavedKey = Library:LoadKey(KeyPath, FileName)
if SavedKey then
    KeyBox.Text = SavedKey
    RememberToggle.SetState(true)
end

local SubmitButton = KeyWindow:AddButton("验证卡密", UDim2.new(0.1, 0, 0.65, 0), function()
    if KeyBox.Text == "hyjnb" then
        if RememberToggle.GetState() then
            Library:SaveKey(KeyPath, FileName, KeyBox.Text)
        end
        KeyWindow:Close()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Peter-loveanna/-peter-love-anan-usa/refs/heads/main/%E9%BB%84%E8%84%9A%E6%9C%AC.lua"))()
        end)
        if not success then
            warn("加载远程脚本时出错: ", err)
        end
    else
        local player = cloneref(game:GetService("Players")).LocalPlayer
        player:Kick("卡密错误")
        if player then
            player:Destroy()
        end
    end
end)

local GetKeyButton = KeyWindow:AddButton("获取卡密", UDim2.new(0.55, 0, 0.65, 0), function()
    if setclipboard then
        setclipboard("请加入腾讯频道：pd43735421")
    else
        warn("setclipboard is not available.")
    end
end)
