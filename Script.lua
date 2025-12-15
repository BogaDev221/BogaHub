-- carrega syde
local syde = loadstring(game:HttpGet("https://raw.githubusercontent.com/essencejs/syde/refs/heads/main/source", true))()

-- configurações iniciais (mantive a sua configuração, só limpei Socials)
syde:Load({
	Logo = '9980452590',
	Name = 'Boga Hub',
	Status = 'Stable',
	Accent = Color3.fromRGB(106, 187, 255),
	HitBox = Color3.fromRGB(123, 230, 255),
	AutoLoad = false,
	Socials = {
		{
			Name = 'GitHub';
			Style = 'GitHub';
			Size = "Large";
			CopyToClip = true
		}
	},
	ConfigurationSaving = {
		Enabled = true,
		FolderName = 'BogaHub',
		FileName = "BogaHub"
	},
})

local Window = syde:Init({
	Title = 'Boga Hub';
	SubText = 'Made With 💓 By @boda_Grande'
})

local MainTab  = Window:InitTab({ Title = 'Main' })
local GameTab  = Window:InitTab({ Title = 'Game' })

-- conteúdo da aba Main (usando o mesmo nome)
MainTab:Section('Github')
MainTab:Paragraph({
	Title = 'Welcome to Boga Hub',
	Content = 'Boga Hub was made for Roblox exploiting, developed by @boda_Grande, and is open-source on GitHub.'
})
MainTab:Paragraph({
	Title = 'Link',
	Content = 'https://github.com/BogaDev221/BogaHub'
})

-- seção de inputs na aba Game
local InputsSection = GameTab:Section('Scripts')

-- debug: mostra qual é o PlaceId real
local PID = game.PlaceId
print("DEBUG: PlaceId =", PID)

-- substitua esse número pelo PlaceId correto do Slap se necessário
if PID == 79137923166591 then -- Slap
	InputsSection:Dropdown({
		Title = '[UPD] Slap',
		Options = {'Insta Dodge (PC)', 'Soon', 'Soon', 'Soon'},
		PlaceHolder = 'Select a script...',
		CallBack = function(option)
			print('Script selected:', option)

			if option == "Insta Dodge (PC)" then
				-- tenta carregar o script com pcall para não quebrar a UI
				local ok, err = pcall(function()
					loadstring(game:HttpGet("https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium", true))()
				end)
				if not ok then
					warn("Failed to load script:", err)
					syde:Notify({
						Title = 'Error',
						Content = 'Falha ao carregar o script',
						Duration = 3
					})
					return
				end
			end

			syde:Notify({
				Title = 'Loading Script',
				Content = 'Selected: ' .. option,
				Duration = 2
			})
		end,
	})
else
	-- mensagem útil enquanto estiver testando em outro jogo
	InputsSection:Paragraph({
		Title = 'Game not supported',
		Content = 'This script only runs in Slap. PlaceId detected: ' .. tostring(PID)
	})
end

syde:LoadSaveConfig()
