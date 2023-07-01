local Library = {}

function Library:CreateWindow(title, size)
    local Window = {}
    Window.Title = title or "Window"
    Window.Size = size or UDim2.new(0, 200, 0, 200)
    Window.Buttons = {}
    Window.DropDowns = {}
    Window.Toggles = {}
    
    -- Create the main window frame
    Window.Frame = Instance.new("Frame")
    Window.Frame.Size = Window.Size
    Window.Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    Window.Frame.BackgroundTransparency = 0.5
    Window.Frame.BorderSizePixel = 0
    Window.Frame.Active = true
    
    -- Create the title label
    Window.TitleLabel = Instance.new("TextLabel")
    Window.TitleLabel.Size = UDim2.new(1, 0, 0, 20)
    Window.TitleLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    Window.TitleLabel.BorderSizePixel = 0
    Window.TitleLabel.Text = Window.Title
    Window.TitleLabel.Parent = Window.Frame
    
    -- Add a button to the window
    function Window:AddButton(text, callback)
        local Button = {}
        Button.Text = text or "Button"
        Button.Callback = callback or function() end
        
        Button.Frame = Instance.new("TextButton")
        Button.Frame.Size = UDim2.new(1, 0, 0, 30)
        Button.Frame.BackgroundColor3 = Color3.new(0, 0, 0)
        Button.Frame.BorderSizePixel = 0
        Button.Frame.Text = Button.Text
        Button.Frame.TextColor3 = Color3.new(1, 1, 1)
        Button.Frame.Parent = Window.Frame
        
        Button.Frame.MouseButton1Click:Connect(function()
            Button.Callback()
        end)
        
        table.insert(Window.Buttons, Button)
    end
    
    -- Add a drop down to the window
    function Window:AddDropDown(options, callback)
        local DropDown = {}
        DropDown.Options = options or {}
        DropDown.Callback = callback or function() end
        
        DropDown.Frame = Instance.new("TextButton")
        DropDown.Frame.Size = UDim2.new(1, 0, 0, 30)
        DropDown.Frame.BackgroundColor3 = Color3.new(0, 0, 0)
        DropDown.Frame.BorderSizePixel = 0
        DropDown.Frame.Text = DropDown.Options[1] or "Option"
        DropDown.Frame.TextColor3 = Color3.new(1, 1, 1)
        DropDown.Frame.Parent = Window.Frame
        
        DropDown.Frame.MouseButton1Click:Connect(function()
            -- Open drop down menu
        end)
        
        table.insert(Window.DropDowns, DropDown)
    end
    
    -- Add a toggle to the window
    function Window:AddToggle(text, callback)
        local Toggle = {}
        Toggle.Text = text or "Toggle"
        Toggle.Callback = callback or function() end
        Toggle.Enabled = false
        
        Toggle.Frame = Instance.new("TextButton")
        Toggle.Frame.Size = UDim2.new(1, 0, 0, 30)
        Toggle.Frame.BackgroundColor3 = Color3.new(0, 0, 0)
        Toggle.Frame.BorderSizePixel = 0
        Toggle.Frame.Text = Toggle.Text
        Toggle.Frame.TextColor3 = Color3.new(1, 1, 1)
        Toggle.Frame.Parent = Window.Frame
        
        Toggle.Frame.MouseButton1Click:Connect(function()
            Toggle.Enabled = not Toggle.Enabled
            Toggle.Callback(Toggle.Enabled)
        end)
        
        table.insert(Window.Toggles, Toggle)
    end
    
    return Window
end

return Library
