//
//  ________  ________          ________   ________  _________        _________  ________  ___  ___  ________  ___  ___     
// |\   ___ \|\   __  \        |\   ___  \|\   __  \|\___   ___\     |\___   ___\\   __  \|\  \|\  \|\   ____\|\  \|\  \    
// \ \  \_|\ \ \  \|\  \       \ \  \\ \  \ \  \|\  \|___ \  \_|     \|___ \  \_\ \  \|\  \ \  \\\  \ \  \___|\ \  \\\  \   
//  \ \  \ \\ \ \  \\\  \       \ \  \\ \  \ \  \\\  \   \ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \    \ \   __  \  
//   \ \  \_\\ \ \  \\\  \       \ \  \\ \  \ \  \\\  \   \ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \____\ \  \ \  \ 
//    \ \_______\ \_______\       \ \__\\ \__\ \_______\   \ \__\           \ \__\ \ \_______\ \_______\ \_______\ \__\ \__\
//     \|_______|\|_______|        \|__| \|__|\|_______|    \|__|            \|__|  \|_______|\|_______|\|_______|\|__|\|__|
//

util.AddNetworkString("Welcome:Start")

net.Receive("Welcome:Start", function(len, ply)
    ply:UnSpectate()
    ply:GodDisable()
    ply:Spawn()
end)

hook.Add("PlayerInitialSpawn", "PlayerInitialSpawn", function(ply)
    timer.Simple(1, function()
        ply:Spectate(OBS_MODE_FIXED)
        ply:SetModel("models/player/alyx.mdl")
        ply:StripWeapons()
        ply:Give("gmod_camera")
        ply:SetPos(SmenuWelcome.Config['Position'])
        ply:SetEyeAngles(SmenuWelcome.Config['Angle'])
        ply:PhysicsDestroy()
        ply:SetNoDraw(true)
        ply:GodEnable()
        ply:SetNotSolid(true)
	end)
end)