local cloneref: (Instance) -> (Instance) = (cloneref or clonereference or function(instance: Instance): Instance
	return instance
end)

local Players: Players = cloneref(game:GetService("Players"))
local TweenService: TweenService = cloneref(game:GetService("TweenService"))
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local function New(ClassName: string, Info: { [string]: any }): Instance?
    if typeof(ClassName) ~= "string" or typeof(Info) ~= "table" then
        return
    end

    local instance = Instance.new(ClassName)

    local success, err = pcall(function()
        for Property, Value in pairs(Info) do
            instance[Property] = Value
        end
    end)

    if success then
        return instance
    else
        instance:Destroy()
        warn(err, 3)
        return
    end
end

function Validate(Table: { [string]: any }, Template: { [string]: any }): { [string]: any }
    if typeof(Table) ~= "table" then
        return Template
    end

    for k, v in pairs(Template) do
        if typeof(k) == "number" then
            continue
        end

        if typeof(v) == "table" then
            Table[k] = Validate(Table[k] or {}, v)
        elseif Table[k] == nil then
            Table[k] = v
        end
    end

    return Table
end

local ScreenGui = New("ScreenGui", {
	Parent = PlayerGui,
	ResetOnSpawn = false,
	ClipToDeviceSafeArea = false,
	DisplayOrder = 1,
	ZIndexBehavior = Enum.ZIndexBehavior.Global
})

local Notification = {}

local Template = {
	Title = "No Title",
	Description = "No Description",
	Reason = "No Reason",
	SubTitle = "NOTIFICATION",
	Image = 6023426923,
	Time = 5,
	Color = Color3.new(1, 1, 1)
}

function Notification:SetContainer(New)
	self.Container = New
end

function Notification.CreateAchievementBase(Parent: GuiObject | Instance): GuiObject
    local AchievementsHolder = New("Frame", {
        Name = "AchievementsHolder",
        AnchorPoint = Vector2.new(0.95, 0),
        BackgroundColor3 = Color3.fromRGB(38, 25, 25),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(1, 0.05),
        Size = UDim2.new(0.25, 200, 0.25, 200),
        Visible = true,
        Parent = Parent
    })
    
    New("UIAspectRatioConstraint", {
        AspectRatio = 1,
        Parent = AchievementsHolder
    })
    
    New("UIScale", {
        Scale = 1,
        Parent = AchievementsHolder
    })
    
    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding = UDim.new(0.1, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = AchievementsHolder
    })
    
    return AchievementsHolder
end

Notification.Container = Notification.CreateAchievementBase(ScreenGui)

function Notification.NewTemplate(Parent: GuiObject): GuiObject
	local Template = New("Frame", {
        Name = "Achievement",
        AnchorPoint = Vector2.new(0.95, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(1, 0.201),
        Size = UDim2.fromScale(1, 0.2),
        Visible = false,
        ZIndex = 2000,
        Parent = Parent
    })
    
    local Sound = New("Sound", {
        SoundId = "rbxassetid://70583589091532",
        Volume = 0.575,
        Parent = Template
    })
    
	local Frame = New("Frame", {
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Color3.fromRGB(38, 25, 25),
        BackgroundTransparency = 0.3,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromScale(1, 1),
        ZIndex = 2000,
        Visible = true,
        Parent = Template
    })
        
    local Outline = New("UIStroke", {
        Color = Color3.fromRGB(255, 222, 189),
        Thickness = 3,
        Transparency = 0,
        Parent = Frame
    })
    
    New("UIPadding", {
        PaddingBottom = UDim.new(0.05, 0),
        PaddingLeft = UDim.new(0.015, 0),
        PaddingRight = UDim.new(0.05, 0),
        PaddingTop = UDim.new(0.05, 0),
        Parent = Frame
    })
    
    New("UICorner", {
        CornerRadius = UDim.new(0.1, 0),
        Parent = Frame
    })
    
    local Glow = New("ImageLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://61997378",
        ImageColor3 = Color3.fromRGB(255, 222, 189),
        ImageTransparency = 0,
        Position = UDim2.fromScale(-0.5, 0.5),
        Size = UDim2.fromScale(2, 4),
        ZIndex = 1999,
        Parent = Frame
    })
    
    local Details = New("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.78, 1),
        ZIndex = 2000,
        Parent = Frame
    })
    
    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = Details
    })
    
    local Title = New("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.Oswald,
        RichText = false,
        Size = UDim2.fromScale(1, 0.4),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 222, 189),
        TextScaled = true,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 2000,
        Parent = Details
    })
    
    local Description = New("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.Oswald,
        RichText = false,
        Size = UDim2.fromScale(1, 0.3),
        Text = "",
        TextColor3 = Color3.fromRGB(221, 180, 151),
        TextScaled = true,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 2000,
        Parent = Details
    })

    local Reason = New("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.Oswald,
        RichText = false,
        Size = UDim2.fromScale(1, 0.3),
        Text = "",
        TextColor3 = Color3.fromRGB(221, 180, 151),
        TextScaled = true,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 2000,
        Parent = Details
    })

    local SubTitle = New("TextLabel", {
        AnchorPoint = Vector2.new(0, 1),
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Heavy),
        Position = UDim2.fromScale(0, -0.14),
        Size = UDim2.new(1, 0, 0.2, 5),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 222, 189),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 2000,
        Parent = Frame
    })

    local Icon = New("ImageLabel", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.7,
        ScaleType = Enum.ScaleType.Stretch,
        ZIndex = 2000,
        Parent = Frame
    })

    New("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = Icon
    })
    
    New("UIAspectRatioConstraint", {
        AspectRatio = 1,
        Parent = Icon
    })
    
    return Template, {
    	Title = Title, 
    	Description = Description, 
    	SubTitle = SubTitle,
    	Details = Details,
    	Reason = Reason,
    	Sound = Sound,
    	Outline = Outline,
    	Icon = Icon,
    	Glow = Glow
    }
end

function Notification:Notify(Info)
	if not Notification.Container then
		return
	end
	
	task.spawn(function()
		Info = Validate(Info, Template)

		local Achievement, Objects = Notification.NewTemplate(Notification.Container)
		Achievement.Size = UDim2.new(0, 0, 0, 0)
		Achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
		Achievement.Visible = true

		Objects.Title.Text = Info.Title
		Objects.Description.Text = Info.Description
		Objects.SubTitle.Text = Info.SubTitle
		Objects.Reason.Text = Info.Reason
		Objects.Icon.Image = `rbxassetid://{Info.Image}`

		Objects.Outline.Color = Info.Color
		Objects.Glow.ImageColor3 = Info.Color
		Objects.Title.TextColor3 = Info.Color

		if Objects.Sound then
			Objects.Sound:Play()
		end

		Achievement:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
		task.wait(0.8)
		Achievement.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)

		TweenService:Create(Objects.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			ImageTransparency = 1
		}):Play()

		task.wait(Info.Time)
		
		Achievement.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
		task.wait(0.5)
		Achievement:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
		task.wait(0.5)
		
		Achievement:Destroy()
	end)
end

return Notification
