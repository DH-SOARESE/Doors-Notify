_G.Notification = _G.Notification or loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-SOARESE/Doors-Notify/main/Library.luau"))()

-- ALERT
_G.Notification:Notify({
    Title = "ENTITY DETECTED",
    SubTitle = "ALERT",
    Description = "Something unknown has appeared in the shadows of the server.",
    Reason = "Stay alert and avoid contact.",
    Image = 12436809127,
    Time = 6,
    Color = Color3.fromRGB(255, 0, 0)
})

task.wait(1)

-- ACHIEVEMENT
_G.Notification:Notify({
    Title = "ACHIEVEMENT UNLOCKED",
    SubTitle = "PROGRESS",
    Description = "You survived the forbidden dimension.",
    Reason = "Only 3% of players reach this far.",
    Image = 14127349974,
    Time = 7,
    Color = Color3.fromRGB(255, 215, 0)
})

task.wait(1)

-- WARNING
_G.Notification:Notify({
    Title = "SYSTEM UNSTABLE",
    SubTitle = "WARNING",
    Description = "The server is experiencing critical failures.",
    Reason = "Restart recommended.",
    Image = 12493754210,
    Time = 5,
    Color = Color3.fromRGB(255, 140, 0)
})

task.wait(1)

-- INFO
_G.Notification:Notify({
    Title = "TIP",
    SubTitle = "INFO",
    Description = "Rare items only spawn at night.",
    Reason = "Keep an eye on the environment.",
    Image = 108984542249016,
    Time = 5,
    Color = Color3.fromRGB(0, 180, 255)
})
