//
//  ________  ________          ________   ________  _________        _________  ________  ___  ___  ________  ___  ___     
// |\   ___ \|\   __  \        |\   ___  \|\   __  \|\___   ___\     |\___   ___\\   __  \|\  \|\  \|\   ____\|\  \|\  \    
// \ \  \_|\ \ \  \|\  \       \ \  \\ \  \ \  \|\  \|___ \  \_|     \|___ \  \_\ \  \|\  \ \  \\\  \ \  \___|\ \  \\\  \   
//  \ \  \ \\ \ \  \\\  \       \ \  \\ \  \ \  \\\  \   \ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \    \ \   __  \  
//   \ \  \_\\ \ \  \\\  \       \ \  \\ \  \ \  \\\  \   \ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \____\ \  \ \  \ 
//    \ \_______\ \_______\       \ \__\\ \__\ \_______\   \ \__\           \ \__\ \ \_______\ \_______\ \_______\ \__\ \__\
//     \|_______|\|_______|        \|__| \|__|\|_______|    \|__|            \|__|  \|_______|\|_______|\|_______|\|__|\|__|
//

local function RespW(w)
    return ScrW() * (w / 1920)
end

local function RespH(h)
    return ScrH() * (h / 1080)
end

function ShowSpawnMenu(ply)

    local spawnMenu = vgui.Create("DFrame")
    spawnMenu:SetSize(RespW(1920), RespH(1080))
    spawnMenu:Center()
    spawnMenu:SetTitle("")
    spawnMenu:SetDraggable(false)
    spawnMenu:ShowCloseButton(false)
    spawnMenu:MakePopup()
    spawnMenu.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 0))
        Derma_DrawBackgroundBlur(self, self.m_fCreateTime)
        draw.SimpleText(SmenuWelcome.Config["Name Server"], "SmenuWelcomeText", RespW(960), RespH(100), Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    
local showLogo = SmenuWelcome.Config["Imgur image"] -- Modifier la valeur de cette variable pour activer ou désactiver l'affichage de l'image

if showLogo then
    logo = vgui.Create("DHTML", spawnMenu)
    logo:SetSize(RespW(550), RespH(350))
    logo:SetPos(RespW(670), RespH(0))
    logo:SetHTML("<style> body, html { height: 100%; margin: 0; } .icon { background-image: url(https://i.imgur.com/" ..SmenuWelcome.Config["ID Imgur"].. ".jpg); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; overflow: hidden;} </style> <body> <div class=\"icon\"></div> </body>")
end

    local spawnButton = vgui.Create("DButton", spawnMenu)
    spawnButton:SetSize(RespW(350), RespH(100))
    spawnButton:Center()
    spawnButton:SetText("Jouer")
    spawnButton:SetFont("SmenuWelcomeButton")
    spawnButton:SetTextColor(Color(255, 255, 255))
    spawnButton.Paint = function(self, w, h)
        draw.RoundedBox(20, RespW(0), RespH(0), w, h, SmenuWelcome.Config["Color Button"])
    end

    spawnButton.DoClick = function()
        spawnMenu:Close()
        hook.Remove("HUDPaint", "SmenuWelcome")
        hook.Run("SmenuWelcome")
        net.Start("Welcome:Start")
        net.SendToServer()
    end
    
    local linkbutton = SmenuWelcome.Config["Button 1"]

	if linkbutton then
    
    local linkbutton = vgui.Create("DButton", spawnMenu)
    linkbutton:SetSize(RespW(150), RespH(50))
    linkbutton:SetPos(RespW(800), RespH(600))
    linkbutton:SetText("Discord")
    linkbutton:SetFont("SmenuWelcomeLinkButton")
    linkbutton:SetTextColor(Color(255, 255, 255))
    linkbutton.Paint = function(self, w, h)
        draw.RoundedBox(5, RespW(0), RespH(0), w, h, SmenuWelcome.Config["Color Button 1"])
end

linkbutton.DoClick = function()
    gui.OpenURL(SmenuWelcome.Config["Link Button 1"])
	end
end
    
    local linkbutton2 = SmenuWelcome.Config["Button 2"]

	if linkbutton2 then
    
    local linkbutton2 = vgui.Create("DButton", spawnMenu)
    linkbutton2:SetSize(RespW(150), RespH(50))
    linkbutton2:SetPos(RespW(970), RespH(600))
    linkbutton2:SetText("Collection")
    linkbutton2:SetFont("SmenuWelcomeLinkButton")
    linkbutton2:SetTextColor(Color(255, 255, 255))
    linkbutton2.Paint = function(self, w, h)
        draw.RoundedBox(5, RespW(0), RespH(0), w, h, SmenuWelcome.Config["Color Button 2"])
end

linkbutton2.DoClick = function()
    gui.OpenURL(SmenuWelcome.Config["Link Button 2"])
	end
end
    
    local linkbutton3 = SmenuWelcome.Config["Button 3"] -- Modifier la valeur de cette variable pour activer ou désactiver l'affichage de l'image

	if linkbutton3 then
    
    local linkbutton3 = vgui.Create("DButton", spawnMenu)
    linkbutton3:SetSize(RespW(322), RespH(50))
    linkbutton3:SetPos(RespW(800), RespH(660))
    linkbutton3:SetText("Boutique")
    linkbutton3:SetFont("SmenuWelcomeLinkButton")
    linkbutton3:SetTextColor(Color(255, 255, 255))
    linkbutton3.Paint = function(self, w, h)
        draw.RoundedBox(5, RespW(0), RespH(0), w, h, SmenuWelcome.Config["Color Button 3"])
end

linkbutton3.DoClick = function()
    gui.OpenURL(SmenuWelcome.Config["Link Button 3"])
	end
end
    
    local linkbutton4 = SmenuWelcome.Config["Button 4"] -- Modifier la valeur de cette variable pour activer ou désactiver l'affichage de l'image

	if linkbutton4 then
    
local linkbutton4 = vgui.Create("DButton", spawnMenu)
linkbutton4:SetSize(RespW(322), RespH(100))
linkbutton4:SetPos(RespW(800), RespH(800))
linkbutton4:SetText("Tutoriel")
linkbutton4:SetFont("SmenuWelcomeLinkButton")
linkbutton4:SetTextColor(Color(255, 255, 255))
linkbutton4.Paint = function(self, w, h)
    draw.RoundedBox(5, RespW(0), RespH(0), w, h, (SmenuWelcome.Config["Color Button 4"]))
    draw.SimpleText("SentroRP - DarkRP", "SmenuWelcomeLinkButton", RespW(960), RespH(100), Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

linkbutton4.DoClick = function()
    gui.OpenURL(SmenuWelcome.Config["Link Button 4"])
		end
	end
end

concommand.Add( "spawnmenu", ShowSpawnMenu )

hook.Add("InitPostEntity", "SWelcomeMenuHook", function()
    timer.Simple(1, function()
        ShowSpawnMenu(1)
    end)
end)

surface.CreateFont("SmenuWelcome", {
    font = "Circular Std Medium", 
    extended = false,
    size = 20,
    weight = 400,
})

surface.CreateFont("SmenuWelcomeText", {
    font = "Circular Std Medium", 
    extended = false,
    size = 100,
    weight = 400,
})

surface.CreateFont("SmenuWelcomeButton", {
    font = "Circular Std Medium", 
    extended = false,
    size = 30,
    weight = 400,
})

surface.CreateFont("SmenuWelcomeLinkButton", {
    font = "Circular Std Medium", 
    extended = false,
    size = 25,
    weight = 400,
})