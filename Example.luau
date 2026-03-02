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

task.wait(3)

-- ACHIEVEMENT
_G.Notification:Notify({
	SubTitle = "PROGRESS",
    Title = "ACHIEVEMENT UNLOCKED",
    Description = "You survived the forbidden dimension.",
    Reason = "Only 3% of players reach this far.",
    Image = 14127349974,
    Time = 7,
    Color = Color3.fromRGB(255, 215, 0)
})

task.wait(3.5)

-- WARNING
_G.Notification:Notify({
	SubTitle = "WARNING",
    Title = "SYSTEM UNSTABLE",
    Description = "The server is experiencing critical failures.",
    Reason = "Restart recommended.",
    Image = 12493754210,
    Time = 5,
    Color = Color3.fromRGB(255, 90, 0)
})

task.wait(2.5)

-- INFO
_G.Notification:Notify({
    SubTitle = "INFO",
    Title = "Nighttime Secrets",
    Description = "Rare items emerge only after the sun sets. Stay sharp!",
    Reason = "Observe the environment and plan accordingly.",
    Image = 108984542249016,
    Time = 5,
    Color = Color3.fromRGB(255, 222, 189)
})
