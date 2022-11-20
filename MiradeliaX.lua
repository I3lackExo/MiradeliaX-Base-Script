--  ____    ____   _                        __        __    _          ____  ____ 
-- |_   \  /   _| (_)                      |  ]      [  |  (_)        |_  _||_  _|
--   |   \/   |   __   _ .--.  ,--.    .--.| | .---.  | |  __   ,--.    \ \  / /  
--   | |\  /| |  [  | [ `/'`\]`'_\ : / /'`\' |/ /__\\ | | [  | `'_\ :    > `' <   
--  _| |_\/_| |_  | |  | |    // | |,| \__/  || \__., | |  | | // | |, _/ /'`\ \_ 
-- |_____||_____|[___][___]   \'-;__/ '.__.;__]'.__.'[___][___]\'-;__/|____||____| 
----------------------------------------------------------------------------------------------------------
-- Welcome to "MiradeliaX"! Dont copy or use it as your script.
-- Warning: Codes were taken from other scripts and are therefore not my codes. DO NOT PUBLISH THE SCRIPT!
-- Required: "C:\Users\<Username>\AppData\Roaming\Stand\Lua Scripts\lib\MiradeliaX\Resource_Pack.ytd"
-- Creater: xX-LulzSecC4t-Xx
----------------------------------------------------------------------------------------------------------

-- [[MiradeliaX Script]]
	local MXName = "MiradeliaX"
	local MXVersion = 1.3
	-- {Update Script}
		local response = false
			async_http.init("raw.githubusercontent.com", "/xX-LulzSecC4t-Xx/MiradeliaX/main/MiradeliaXVersion.lua", function(output)
				currentVer = tonumber(output)
				response = true
				if MXVersion ~= currentVer then
					util.show_corner_help("~h~~p~New MiradeliaX version is available!!!")
					--util.toast("New MiradeliaX version is available!!!")
					menu.action(menu.my_root(), "Update MiradeliaX", {}, "", function()
						async_http.init("raw.githubusercontent.com","/xX-LulzSecC4t-Xx/MiradeliaX/main/MiradeliaX.lua",function(a)
							local err = select(2,load(a))
							if err then
								util.show_corner_help("~r~Script failed to download. Please try again later. If this continues to happen then manually update via github.")
								--util.toast("Script failed to download. Please try again later. If this continues to happen then manually update via github.")
							return end
							local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
							f:write(a)
							f:close()
							util.show_corner_help("~g~Successfully updated MiradeliaX.")
							--util.toast("Successfully updated MiradeliaX. Restarting Script...")
							util.yield(1250)
							util.restart_script()
						end)
						async_http.dispatch()
					end)
				end
			end, function() response = true end)
			async_http.dispatch()
			repeat 
				util.yield()
			until response
	-- {Locals}	
		local debug = false
		util.keep_running()
		-- (All Locals)
			local MX = menu
			require("lib/C4tScripts/NativesMX")
			-- Translater
				local whitelisted_langs = {}
				local language_codes_by_enum = {
					[0]= "en",
					[1]= "fr",
					[2]= "de",
					[3]= "it",
					[4]= "es",
					[5]= "pt",
					[6]= "pl",
					[7]= "ru",
					[8]= "ko",
					[9]= "zh",
					[10] = "ja",
					[11] = "es",
					[12] = "zh"}
				for _, iso_code in pairs(language_codes_by_enum) do
					whitelisted_langs[iso_code] = true end
				local language_display_names_by_enum = {
					[0] = "English",
					[1] = "French",
					[2] = "German",
					[3] = "Italian",
					[4] = "Spanish",
					[5] = "Portuguese",
					[6] = "Polish",
					[7] = "Russian",
					[8] = "Korean",
					[9] = "Chinese (Traditional)",
					[10] = "Japanese",
					[11] = "Mexican",
					[12] = "Chinese (Simplified)"}
				local my_lang = lang.get_current()
					if my_lang == "en-us" then 
						my_lang = "en" end
				local do_translate = false
				local only_translate_foreign = true
				local players_on_cooldown = {}
			-- Color
				local colors = {
					green = 184, 
					red = 6,
					orange = 15,
					yellow = 190,
					black = 2,
					white = 1,
					gray = 3,
					pink = 24,
					purple = 21,
					blue = 11,
					lightblue = 10,
					cyan = 9}
				local colorcodes = {
					red = "~r~",
					blue = "~b~",
					green = "~g~",
					yellow = "~y~",
					purple = "~p~",
					pink = "~q~",
					orange = "~o~",
					grey = "~c~",
					grey2 = "~t~",
					black = "~u~",
					black2 = "~l~",
					white = "~w~",
					white2 = "~s~",
					boldtext = "~h~",
					italics = "<i>",
					logo = "~ex_r*~",
					small = "<font size='10'>",
					middle = "<font size='12'>"}
			-- Sonstiges
				local player = players.user_ped()
				local agroup = "missfbi3ig_0"
				local anim1 = "shit_loop_trev"
				local particleName = "ent_anim_dog_peeing"
				local mshit = util.joaat("prop_big_shit_02")
				local rshit = util.joaat("prop_big_shit_01")
				local ashit = util.joaat("ng_proc_sodacan_01a")
				local mshit2 = util.joaat("ex_prop_crate_money_bc")

				local SessionBrokenAlteredSHQueue = false
				local SessionBrokenBadScriptEvent = false
				local SessionBrokenAlteredSHMigration = false
				local SessionBrokenModifiedEntityState = false
				local SessionBrokenOutOfRangeWorldRender = false
				local InvalidPickupPlacement = false
				local SessionBrokenGameServerModify = false
				local SessionBrokenModifiedWeather = false
				local all_session_flags = ""
				local all_session_flags_count = 0
				local altered_sh_queue = false
				local missing_session_host = false
				local missing_script_host = false
				local bad_script_event = false
				local altered_sh_migration = false
				local modified_entity_state = false
				local out_of_range_world_render = false
				local invalid_pickup_placement = false
				local game_server_modify = false
				local modified_weather = false

				local players_car = entities.get_user_vehicle_as_handle()
				local carSettings carSettings = {}
				local kills_ptr = memory.alloc_int()
				local deaths_ptr = memory.alloc_int()

				local Int_PTR = memory.alloc_int()

				local thrust_offset = 0x8
				local better_heli_handling_offsets = {
					["fYawMult"] = 0x18, -- dont remember
					["fYawStabilise"] = 0x20, --minor stabalization
					["fSideSlipMult"] = 0x24, --minor stabalizaztion
					["fRollStabilise"] = 0x30, --minor stabalization
					["fAttackLiftMult"] = 0x48, --disables most of it
					["fAttackDiveMult"] = 0x4C, --disables most of the other axis
					["fWindMult"] = 0x58, --helps with removing some jitter
					["fPitchStabilise"] = 0x3C}--idk what it does but it seems to help
			-- Weapon Attachments
				local last_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
				local attachments_table = {
					---------------------PISTOLS--------------------------------------
					["0xFED0FD71"] = "Default Clip", --Default Clip
					["0xED265A1C"] = "Extended Clip", --Extended Clip
					["0x359B7AAE"] = "Flashlight", --Flashlight
					["0x65EA7EBB"] = "Suppressor", --Suppressor
					["0xD7391086"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
					["0x721B079"] = "Default Clip", --Default Clip
					["0xD67B4F2D"] = "Extended Clip", --Extended Clip
					["0xC304849A"] = "Suppressor", --Suppressor
					["0xC6654D72"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
					["0x31C4B22A"] = "Default Clip", --Default Clip
					["0x249A17D5"] = "Extended Clip", --Extended Clip
					["0x9B76C72C"] = "Gilded Gun Metal Finish", --Gilded Gun Metal Finish
					["0x2297BE19"] = "Default Clip", --Default Clip
					["0xD9D3AC92"] = "Extended Clip", --Extended Clip
					["0xA73D4664"] = "Suppressor", --Suppressor
					["0x77B8AB2F"] = "Platinum Pearl Deluxe Finish", --Platinum Pearl Deluxe Finish
					["0x16EE3040"] = "VIP Variant", --VIP Variant
					["0x9493B80D"] = "Bodyguard Variant", --Bodyguard Variant
					["0xE9867CE3"] = "Default Clip", --Default Clip
					["0xF8802ED9"] = "Default Clip", --Default Clip
					["0x7B0033B3"] = "Extended Clip", --Extended Clip
					["0x8033ECAF"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
					["0xD4A969A"] = "Default Clip", --Default Clip
					["0x64F9C62B"] = "Extended Clip", --Extended Clip
					["0x7A6A7B7B"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
					["0xBA23D8BE"] = "Default Rounds", --Default Rounds
					["0xC6D8E476"] = "Tracer Rounds", --Tracer Rounds
					["0xEFBF25"] = "Incendiary Rounds", --Incendiary Rounds
					["0x10F42E8F"] = "Hollow Point Rounds", --Hollow Point Rounds
					["0xDC8BA3F"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
					["0x420FD713"] = "Holographic Sight", --Holographic Sight
					["0x49B2945"] = "Small Scope", --Small Scope
					["0x27077CCB"] = "Compensator", --Compensator
					["0xC03FED9F"] = "Digital Camo", --Digital Camo
					["0xB5DE24"] = "Brushstroke Camo", --Brushstroke Camo
					["0xA7FF1B8"] = "Woodland Camo", --Woodland Camo
					["0xF2E24289"] = "Skull", --Skull
					["0x11317F27"] = "Sessanta Nove", --Sessanta Nove
					["0x17C30C42"] = "Perseus", --Perseus
					["0x257927AE"] = "Leopard", --Leopard
					["0x37304B1C"] = "Zebra", --Zebra
					["0x48DAEE71"] = "Geometric", --Geometric
					["0x20ED9B5B"] = "Boom!", --Boom!
					["0xD951E867"] = "Patriotic", --Patriotic
					["0x1466CE6"] = "Default Clip", --Default Clip
					["0xCE8C0772"] = "Extended Clip", --Extended Clip
					["0x902DA26E"] = "Tracer Rounds", --Tracer Rounds
					["0xE6AD5F79"] = "Incendiary Rounds", --Incendiary Rounds
					["0x8D107402"] = "Hollow Point Rounds", --Hollow Point Rounds
					["0xC111EB26"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
					["0x4A4965F3"] = "Flashlight", --Flashlight
					["0x47DE9258"] = "Mounted Scope", --Mounted Scope
					["0xAA8283BF"] = "Compensator", --Compensator
					["0xF7BEEDD"] = "Digital Camo", --Digital Camo
					["0x8A612EF6"] = "Brushstroke Camo", --Brushstroke Camo
					["0x76FA8829"] = "Woodland Camo", --Woodland Camo
					["0xA93C6CAC"] = "Skull", --Skull
					["0x9C905354"] = "Sessanta Nove", --Sessanta Nove
					["0x4DFA3621"] = "Perseus", --Perseus
					["0x42E91FFF"] = "Leopard", --Leopard
					["0x54A8437D"] = "Zebra", --Zebra
					["0x68C2746"] = "Geometric", --Geometric
					["0x2366E467"] = "Boom!", --Boom!
					["0x441882E6"] = "Boom!", --Boom!
					["0xE7EE68EA"] = "Digital Camo", --Digital Camo
					["0x29366D21"] = "Brushstroke Camo", --Brushstroke Camo
					["0x3ADE514B"] = "Woodland Camo", --Woodland Camo
					["0xE64513E9"] = "Skull", --Skull
					["0xCD7AEB9A"] = "Sessanta Nove", --Sessanta Nove
					["0xFA7B27A6"] = "Perseus", --Perseus
					["0xE285CA9A"] = "Leopard", --Leopard
					["0x2B904B19"] = "Zebra", --Zebra
					["0x22C24F9C"] = "Geometric", --Geometric
					["0x8D0D5ECD"] = "Boom!", --Boom!
					["0x1F07150A"] = "Patriotic", --Patriotic
					["0x94F42D62"] = "Default Clip", --Default Clip
					["0x5ED6C128"] = "Extended Clip", --Extended Clip
					["0x25CAAEAF"] = "Tracer Rounds", --Tracer Rounds
					["0x2BBD7A3A"] = "Incendiary Rounds", --Incendiary Rounds
					["0x85FEA109"] = "Hollow Point Rounds", --Hollow Point Rounds
					["0x4F37DF2A"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
					["0x8ED4BB70"] = "Mounted Scope", --Mounted Scope
					["0x43FD595B"] = "Flashlight", --Flashlight
					["0x21E34793"] = "Compensator", --Compensator
					["0x5C6C749C"] = "Digital Camo", --Digital Camo
					["0x15F7A390"] = "Brushstroke Camo", --Brushstroke Camo
					["0x968E24DB"] = "Woodland Camo", --Woodland Camo
					["0x17BFA99"] = "Skull", --Skull
					["0xF2685C72"] = "Sessanta Nove", --Sessanta Nove
					["0xDD2231E6"] = "0xDD2231E6", --Perseus
					["0xBB43EE76"] = "Leopard", --Leopard
					["0x4D901310"] = "Zebra", --Zebra
					["0x5F31B653"] = "Geometric", --Geometric
					["0x697E19A0"] = "Boom!", --Boom!
					["0x930CB951"] = "Patriotic", --Patriotic
					["0xB4FC92B0"] = "Digital Camo", --Digital Camo
					["0x1A1F1260"] = "Digital Camo", --Digital Camo
					["0xE4E00B70"] = "Digital Camo",
					["0x2C298B2B"] = "Digital Camo",
					["0xDFB79725"] = "Digital Camo",
					["0x6BD7228C"] = "Digital Camo",
					["0x9DDBCF8C"] = "Digital Camo",
					["0xB319A52C"] = "Digital Camo",
					["0xC6836E12"] = "Digital Camo",
					["0x43B1B173"] = "Digital Camo",
					["0x4ABDA3FA"] = "Patriotic", --Patriotic
					["0x45A3B6BB"] = "Default Clip", --Default Clip
					["0x33BA12E8"] = "Extended Clip", --Extended Clip
					["0xD7DBF707"] = "Festive tint", --Festive tint
					["0x54D41361"] = "Default Clip", --Default Clip
					["0x81786CA9"] = "Extended Clip", --Extended Clip
					["0x9307D6FA"] = "Suppressor", --Suppressor
					----------------SUBMACHINE-GUNS------------------------
					["0xCB48AEF0"] = "Default Clip",
					["0x10E6BA2B"] = "Extended Clip",
					["0x359B7AAE"] = "Flashlight",
					["0x9D2FBF29"] = "Scope",
					["0x487AAE09"] = "Yusuf Amir Luxury Finish",
					["0x26574997"] = "Default Clip",
					["0x350966FB"] = "Extended Clip",
					["0x79C77076"] = "Drum Magazine",
					["0x7BC4CDDC"] = "Flashlight",
					["0x3CC6BA57"] = "Scope",
					["0x27872C90"] = "Yusuf Amir Luxury Finish",
					["0x8D1307B0"] = "Default Clip",
					["0xBB46E417"] = "Extended Clip",
					["0x278C78AF"] = "Yusuf Amir Luxury Finish",
					["0x84C8B2D3"] = "Default Clip",
					["0x937ED0B7"] = "Extended Clip",
					["0x4C24806E"] = "Default Clip",
					["0xB9835B2E"] = "Extended Clip",
					["0x7FEA36EC"] = "Tracer Rounds",
					["0xD99222E5"] = "Incendiary Rounds",
					["0x3A1BD6FA"] = "Hollow Point Rounds",
					["0xB5A715F"] = "Full Metal Jacket Rounds",
					["0x9FDB5652"] = "Holographic Sight",
					["0xE502AB6B"] = "Small Scope",
					["0x3DECC7DA"] = "Medium Scope",
					["0xB99402D4"] = "Flat Muzzle Brake",
					["0xC867A07B"] = "Tactical Muzzle Brake",
					["0xDE11CBCF"] = "Fat-End Muzzle Brake",
					["0xEC9068CC"] = "Precision Muzzle Brake",
					["0x2E7957A"] = "Heavy Duty Muzzle Brake",
					["0x347EF8AC"] = "Slanted Muzzle Brake",
					["0x4DB62ABE"] = "Split-End Muzzle Brake",
					["0xD9103EE1"] = "Default Barrel",
					["0xA564D78B"] = "Heavy Barrel",
					["0xC4979067"] = "Digital Camo",
					["0x3815A945"] = "Brushstroke Camo",
					["0x4B4B4FB0"] = "Woodland Camo",
					["0xEC729200"] = "Skull",
					["0x48F64B22"] = "Sessanta Nove",
					["0x35992468"] = "Perseus",
					["0x24B782A5"] = "Leopard",
					["0xA2E67F01"] = "Zebra",
					["0x2218FD68"] = "Geometric",
					["0x45C5C3C5"] = "Boom!",
					["0x399D558F"] = "Patriotic",
					["0x476E85FF"] = "Default Clip",
					["0xB92C6979"] = "Extended Clip",
					["0xA9E9CAF4"] = "Drum Magazine",
					["0x4317F19E"] = "Default Clip",
					["0x334A5203"] = "Extended Clip",
					["0x6EB8C8DB"] = "Drum Magazine",
					["0xC164F53"] = "Grip",
					["0xAA2C45B4"] = "Scope",
					------------Shotguns-------------
					["0xE608B35E"] = "Suppressor",
					["0xA2D79DDB"] = "Yusuf Amir Luxury Finish",
					["0x85A64DF9"] = "Gilded Gun Metal Finish",
					["0x94E81BC7"] = "Default Clip",
					["0x86BD7F72"] = "Extended Clip",
					["0x837445AA"] = "Suppressor",
					["0xCD940141"] = "Default Shells",
					["0x9F8A1BF5"] = "Dragon's Breath Shells",
					["0x4E65B425"] = "Steel Buckshot Shells",
					["0xE9582927"] = "Flechette Shells",
					["0x3BE4465D"] = "Explosive Slugs",
					["0x3F3C8181"] = "Medium Scope",
					["0xAC42DF71"] = "Suppressor",
					["0x5F7DCE4D"] = "Squared Muzzle Brake	",
					["0xE3BD9E44"] = "Digital Camo",
					["0x17148F9B"] = "Brushstroke Camo",
					["0x24D22B16"] = "Woodland Camo",
					["0xF2BEC6F0"] = "Skull",
					["0x85627D"] = "Sessanta Nove",
					["0xDC2919C5"] = "Perseus",
					["0xE184247B"] = "Leopard",
					["0xD8EF9356"] = "Zebra",
					["0xEF29BFCA"] = "Geometric",
					["0x67AEB165"] = "Boom!",
					["0x46411A1D"] = "Patriotic",
					["0x324F2D5F"] = "Default Clip",
					["0x971CF6FD"] = "Extended Clip",
					["0x88C7DA53"] = "Drum Magazine",
					---------Rifles-------------------------------
					["0xBE5EEA16"] = "Default Clip",
					["0xB1214F9B"] = "Extended Clip",
					["0xDBF0A53D"] = "Drum Magazine",
					["0x4EAD7533"] = "Yusuf Amir Luxury Finish",
					["0x9FBE33EC"] = "Default Clip",
					["0x91109691"] = "Extended Clip",
					["0xBA62E935"] = "Box Magazine",
					["0xA0D89C42"] = "Scope",
					["0xD89B9658"] = "Yusuf Amir Luxury Finish",
					["0xFA8FA10F"] = "Default Clip",
					["0x8EC1C979"] = "Extended Clip",
					["0x377CD377"] = "Gilded Gun Metal Finish",
					["0xC6C7E581"] = "Default Clip",
					["0x7C8BD10E"] = "Extended Clip",
					["0x6B59AEAA"] = "Drum Magazine",
					["0x730154F2"] = "Etched Gun Metal Finish",
					["0xC5A12F80"] = "Default Clip",
					["0xB3688B0F"] = "Extended Clip",
					["0xA857BC78"] = "Gilded Gun Metal Finish",
					["0x18929DA"] = "Default Clip",
					["0xEFB00628"] = "Extended Clip",
					["0x822060A9"] = "Tracer Rounds",
					["0xA99CF95A"] = "Incendiary Rounds",
					["0xFAA7F5ED"] = "Armor Piercing Rounds",
					["0x43621710"] = "Full Metal Jacket Rounds",
					["0xC7ADD105"] = "Small Scope",
					["0x659AC11B"] = "Default Barrel",
					["0x3BF26DC7"] = "Heavy Barrel",
					["0x9D65907A"] = "Grip",
					["0xAE4055B7"] = "Digital Camo",
					["0xB905ED6B"] = "Brushstroke Camo",
					["0xA6C448E8"] = "Woodland Camo",
					["0x9486246C"] = "Skull",
					["0x8A390FD2"] = "Sessanta Nove",
					["0x2337FC5"] = "Perseus",
					["0xEFFFDB5E"] = "Leopard",
					["0xDDBDB6DA"] = "Zebra",
					["0xCB631225"] = "Geometric",
					["0xA87D541E"] = "Boom!",
					["0xC5E9AE52"] = "Patriotic",
					["0x16C69281"] = "Default Clip",
					["0xDE1FA12C"] = "Extended Clip",
					["0x8765C68A"] = "Tracer Rounds",
					["0xDE011286"] = "Incendiary Rounds",
					["0x51351635"] = "Armor Piercing Rounds",
					["0x503DEA90"] = "Full Metal Jacket Rounds",
					["0xC66B6542"] = "Large Scope",
					["0xE73653A9"] = "Default Barrel",
					["0xF97F783B"] = "Heavy Barrel",
					["0xD40BB53B"] = "Digital Camo",
					["0x431B238B"] = "Brushstroke Camo",
					["0x34CF86F4"] = "Woodland Camo",
					["0xB4C306DD"] = "Skull",
					["0xEE677A25"] = "Sessanta Nove",
					["0xDF90DC78"] = "Perseus",
					["0xA4C31EE"] = "Leopard",
					["0x89CFB0F7"] = "Zebra",
					["0x7B82145C"] = "Geometric",
					["0x899CAF75"] = "Boom!",
					["0x5218C819"] = "Patriotic",
					["0x8610343F"] = "Default Clip",
					["0xD12ACA6F"] = "Extended Clip",
					["0xEF2C78C1"] = "Tracer Rounds",
					["0xFB70D853"] = "Incendiary Rounds",
					["0xA7DD1E58"] = "Armor Piercing Rounds",
					["0x63E0A098"] = "Full Metal Jacket Rounds",
					["0x43A49D26"] = "Default Barrel",
					["0x5646C26A"] = "Heavy Barrel",
					["0x911B24AF"] = "Digital Camo",
					["0x37E5444B"] = "Brushstroke Camo",
					["0x538B7B97"] = "Woodland Camo",
					["0x25789F72"] = "Skull",
					["0xC5495F2D"] = "Sessanta Nove",
					["0xCF8B73B1"] = "Perseus",
					["0xA9BB2811"] = "Leopard",
					["0xFC674D54"] = "Zebra",
					["0x7C7FCD9B"] = "Geometric",
					["0xA5C38392"] = "Boom!",
					["0xB9B15DB0"] = "Patriotic",
					["0x4C7A391E"] = "Default Clip",
					["0x5DD5DBD5"] = "Extended Clip",
					["0x1757F566"] = "Tracer Rounds",
					["0x3D25C2A7"] = "Incendiary Rounds",
					["0x255D5D57"] = "Armor Piercing Rounds",
					["0x44032F11"] = "Full Metal Jacket Rounds",
					["0x833637FF"] = "Default Barrel",
					["0x8B3C480B"] = "Heavy Barrel",
					["0x4BDD6F16"] = "Digital Camo",
					["0x406A7908"] = "Brushstroke Camo",
					["0x2F3856A4"] = "Woodland Camo",
					["0xE50C424D"] = "Skull",
					["0xD37D1F2F"] = "Sessanta Nove	",
					["0x86268483"] = "Perseus",
					["0xF420E076"] = "Leopard",
					["0xAAE14DF8"] = "Zebra",
					["0x9893A95D"] = "Geometric",
					["0x6B13CD3E"] = "Boom!",
					["0xDA55CD3F"] = "Patriotic",
					["0x513F0A63"] = "Default Clip",
					["0x59FF9BF8"] = "Extended Clip",
					["0xC607740E"] = "Drum Magazine",
					["0x2D46D83B"] = "Default Clip",
					["0x684ACE42"] = "Extended Clip",
					["0x6B82F395"] = "Iron Sights",
					-------------Machine-Guns-----------
					["0xF434EF84"] = "Default Clip",
					["0x82158B47"] = "Extended Clip",
					["0x3C00AFED"] = "Scope",
					["0xD6DABABE"] = "Yusuf Amir Luxury Finish",
					["0xE1FFB34A"] = "Default Clip",
					["0xD6C59CD6"] = "Extended Clip",
					["0x92FECCDD"] = "Etched Gun Metal Finish",
					["0x492B257C"] = "Default Clip",
					["0x17DF42E9"] = "Extended Clip",
					["0xF6649745"] = "Tracer Rounds",
					["0xC326BDBA"] = "Incendiary Rounds",
					["0x29882423"] = "Armor Piercing Rounds",
					["0x57EF1CC8"] = "Full Metal Jacket Rounds",
					["0xC34EF234"] = "Default Barrel",
					["0xB5E2575B"] = "Heavy Barrel",
					["0x4A768CB5"] = "Digital Camo",
					["0xCCE06BBD"] = "Brushstroke Camo",
					["0xBE94CF26"] = "Woodland Camo",
					["0x7609BE11"] = "Skull",
					["0x48AF6351"] = "Sessanta Nove",
					["0x9186750A"] = "Perseus",
					["0x84555AA8"] = "Leopard",
					["0x1B4C088B"] = "Zebra",
					["0xE046DFC"] = "Geometric",
					["0x28B536E"] = "Boom!",
					["0xD703C94D"] = "Patriotic",
					["0x1CE5A6A5"] = "Default Clip",
					["0xEAC8C270"] = "Extended Clip",
					--------------Sniper---------------
					["0x9BC64089"] = "Default Clip",
					["0xD2443DDC"] = "Scope",
					["0xBC54DA77"] = "Advanced Scope",
					["0x4032B5E7"] = "Etched Wood Grip Finish",
					["0x476F52F4"] = "Default Clip",
					["0x94E12DCE"] = "Default Clip",
					["0xE6CFD1AA"] = "Extended Clip",
					["0xD77A22D2"] = "Tracer Rounds",
					["0x6DD7A86E"] = "Incendiary Rounds",
					["0xF46FD079"] = "Armor Piercing Rounds",
					["0xE14A9ED3"] = "Full Metal Jacket Rounds",
					["0x5B1C713C"] = "Zoom Scope",
					["0x381B5D89"] = "Default Barrel",
					["0x68373DDC"] = "Heavy Barrel",
					["0x9094FBA0"] = "Digital Camo",
					["0x7320F4B2"] = "Brushstroke Camo",
					["0x60CF500F"] = "Woodland Camo",
					["0xFE668B3F"] = "Skull",
					["0xF3757559"] = "Sessanta Nove",
					["0x193B40E8"] = "Perseus",
					["0x107D2F6C"] = "Leopard",
					["0xC4E91841"] = "Zebra",
					["0x9BB1C5D3"] = "Geometric",
					["0x3B61040B"] = "Boom!",
					["0xB7A316DA"] = "Boom!",
					["0xFA1E1A28"] = "Default Clip",
					["0x2CD8FF9D"] = "Extended Clip",
					["0xEC0F617"] = "Incendiary Rounds",
					["0xF835D6D4"] = "Armor Piercing Rounds",
					["0x3BE948F6"] = "Full Metal Jacket Rounds",
					["0x89EBDAA7"] = "Explosive Rounds",
					["0x82C10383"] = "Zoom Scope",
					["0xB68010B0"] = "Night Vision Scope",
					["0x2E43DA41"] = "Thermal Scope",
					["0x5F7DCE4D"] = "Squared Muzzle Brake",
					["0x6927E1A1"] = "Bell-End Muzzle Brake",
					["0x909630B7"] = "Default Barrel",
					["0x108AB09E"] = "Heavy Barrel",
					["0xF8337D02"] = "Digital Camo",
					["0xC5BEDD65"] = "Brushstroke Camo",
					["0xE9712475"] = "Woodland Camo",
					["0x13AA78E7"] = "Skull",
					["0x26591E50"] = "Sessanta Nove",
					["0x302731EC"] = "Perseus",
					["0xAC722A78"] = "Leopard",
					["0xBEA4CEDD"] = "Zebra",
					["0xCD776C82"] = "Geometric",
					["0xABC5ACC7"] = "Boom!",
					["0x6C32D2EB"] = "Patriotic",
					["0xD83B4141"] = "Default Clip",
					["0xCCFD2AC5"] = "Extended Clip",
					["0x1C221B1A"] = "Scope",
					["0x161E9241"] = "Yusuf Amir Luxury Finish",
					--------Heavy-Weapons---------
					["0x11AE5C97"] = "Default Clip"}
			-- Admin Spoting
				local bailOnAdminJoin = false
					if bailOnAdminJoin then
						if players.is_marked_as_admin(pid) then
							AssistantRAC("> I have spotted an admin. Launch protective countermeasures.\n(Admin: "..players.get_name(pid)..")", colors.red)
							util.yield(1000)
							PT.trigger_commands("quickbail")
							return
						end end

	-- {Notification Code}
		local scriptdir = filesystem.scripts_dir()
				local racDir = scriptdir .. "lib\\C4tScripts\\"
					if not filesystem.exists(racDir) then
						filesystem.mkdir(racDir)
					end
					if not filesystem.exists(racDir) then
						util.toast("resource directory not found")
					else
						util.register_file(racDir .. "Resource_Pack.ytd")
					end
		function Developer(message, color) -- Main picture
			HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
				local picture
					if not filesystem.exists(racDir) then
						picture = "CHAR_SOCIAL_CLUB"
					else
						picture = "Resource_Pack"
					end
			GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
				while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
					util.yield()
				end
			util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
				if color == colors.green or color == colors.red then
					subtitle = colorcodes.small.."~w~> [MiradeliaX Dev.]"
				elseif color == colors.black then
					subtitle = colorcodes.small.."~w~> [MiradeliaX Dev.]"
				else
					subtitle = colorcodes.small.."~w~> [MiradeliaX Dev.]"
				end
			HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Developer", true, 1, colorcodes.middle.."xX-LulzSecC4t-Xx", subtitle)

			HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)end
		function Assistant(message, color) -- Mira picture
			HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
				local picture
					if not filesystem.exists(racDir) then
						picture = "CHAR_SOCIAL_CLUB"
					else
						picture = "Resource_Pack"
					end
			GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
				while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
					util.yield()
				end
			util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
				if color == colors.green or color == colors.red then
					subtitle = colorcodes.small.."~w~> [MiradeliaX Assistant]"
				elseif color == colors.black then
					subtitle = colorcodes.small.."~w~> [MiradeliaX Assistant]"
				else
					subtitle = colorcodes.small.."~w~> [MiradeliaX Assistant]"
				end
			HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Mira", true, 1, colorcodes.middle.."Mira", subtitle)

			HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)end
		function AssistantRAC(message, color) -- Mira picture
			HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
				local picture
					if not filesystem.exists(racDir) then
						picture = "CHAR_SOCIAL_CLUB"
					else
						picture = "Resource_Pack"
					end
			GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
				while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
					util.yield()
				end
			util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
				if color == colors.green or color == colors.red then
					subtitle = colorcodes.small.."~w~> [Rockstar Protection]"
				elseif color == colors.black then
					subtitle = colorcodes.small.."~w~> [Rockstar Protection]"
				else
					subtitle = colorcodes.small.."~w~> [Rockstar Protection]"
				end
			HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Mira", true, 1, colorcodes.middle.."Mira", subtitle)

			HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)end
		function GoogleAPI(message, color) --> GoogleAPI logo
		    HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
				local picture
					if not filesystem.exists(racDir) then
						picture = "CHAR_SOCIAL_CLUB"
					else
						picture = "Resource_Pack"
					end
		    GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
				while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
					util.yield()
				end
		    util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
				if color == colors.green or color == colors.red then
					subtitle = colorcodes.small.."~u~GoogleAPI Translater"
				elseif color == colors.black then
					subtitle = colorcodes.small.."~c~GoogleAPI Translater"
				else
					subtitle = colorcodes.small.."~c~GoogleAPI Translater"
				end
		    HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "GoogleAPI", true, 4, colorcodes.middle.."GoogleAPI", subtitle)

		    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false) end
		function Multigaming(message, color) --> Multigaming logo
		    HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
				local picture
					if not filesystem.exists(racDir) then
						picture = "CHAR_SOCIAL_CLUB"
					else
						picture = "Resource_Pack"
					end
		    GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
				while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
					util.yield()
				end
		    util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
				if color == colors.green or color == colors.red then
					subtitle = colorcodes.small.."~w~> [Multigaming Discord]"
				elseif color == colors.black then
					subtitle = colorcodes.small.."~w~> [Multigaming Discord]"
				else
					subtitle = colorcodes.small.."~w~> [Multigaming Discord]"
				end
		    HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Multigaming", true, 4, colorcodes.middle.."Discord Invite", subtitle)

		    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false) end
		-- Functions
			function RequestControlOfEnt(entity)
				local tick = 0
				local tries = 0
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
				while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 1000 do
					NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
					tick = tick + 1
					tries = tries + 1
					if tries == 50 then 
						util.yield()
						tries = 0
					end
				end
				return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)end
			function get_player_veh(pid,with_access)
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)	
				if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
					if not with_access then
						return vehicle
					end
					if RequestControlOfEnt(vehicle) then
						return vehicle
					end
				end
				return 0 end	
			local function BlockSyncs(pid, callback)
				for _, i in ipairs(players.list(false, true, true)) do
					if i ~= pid then
						local outSync = MX.ref_by_rel_path(MX.player_root(i), "Outgoing Syncs>Block")
						MX.trigger_command(outSync, "on")
					end
				end
				util.yield(10)
				callback()
					for _, i in ipairs(players.list(false, true, true)) do
					if i ~= pid then
						local outSync = MX.ref_by_rel_path(MX.player_root(i), "Outgoing Syncs>Block")
						MX.trigger_command(outSync, "off")
					end
				end end
			local function get_friend_count()
				native_invoker.begin_call();native_invoker.end_call("203F1CFD823B27A4");
				return native_invoker.get_return_value_int();end
			local function get_frined_name(friendIndex)
				native_invoker.begin_call();native_invoker.push_arg_int(friendIndex);native_invoker.end_call("4164F227D052E293");return native_invoker.get_return_value_string();end
			local function gen_fren_funcs(name)
				balls = MX.list(friendlist, name, {"friend "..name}, "", function(); end)
					MX.divider(balls, "---> "..name.. " <---")
					MX.action(balls,"Join", {"jf "..name}, "",function()
						MX.trigger_commands("join "..name)
					end)
					MX.action(balls,"Spectate", {"sf "..name}, "",function()
						MX.trigger_commands("namespectate "..name)
					end)
					MX.action(balls,"Invite", {"if "..name}, "",function()
						MX.trigger_commands("invite "..name)
					end)
					MX.action(balls,"Open Profile", {"pf "..name}, "",function()
						MX.trigger_commands("nameprofile "..name)
					end)
					MX.action(balls,"Add to History", {"ath "..name}, "",function()
						MX.trigger_commands("historyadd "..name)
					end)end
			function PlayerlistFeatures(pid)
				MX.divider(MX.player_root(pid), "~~~> PsyxhoTxolling <~~~")
				end
				for pid = 0,30 do
					if players.exists(pid) then
							PlayerlistFeatures(pid)
						end
					end
				players.on_join(PlayerlistFeatures)
				if PLAYER.GET_PLAYER_NAME(pid) then
						playerrid = players.get_rockstar_id(players.user())
				end
				if PLAYER.GET_PLAYER_NAME(pid) then
					playerid = PLAYER.GET_PLAYER_NAME(players.user())
				end
			local function setCarOptions(toggle)
				for k, option in pairs(carSettings) do
					if option.on then option.setOption(toggle) end
				end end
			local function custom_alert(l1)
				poptime = os.time()
				while true do
					if PAD.IS_CONTROL_JUST_RELEASED(18, 18) then
						if os.time() - poptime > 0.1 then
							break
						end
					end
					native_invoker.begin_call()
					native_invoker.push_arg_string("ALERT")
					native_invoker.push_arg_string("JL_INVITE_ND")
					native_invoker.push_arg_int(2)
					native_invoker.push_arg_string("")
					native_invoker.push_arg_bool(true)
					native_invoker.push_arg_int(-1)
					native_invoker.push_arg_int(-1)
					native_invoker.push_arg_string(l1)
					native_invoker.push_arg_int(0)
					native_invoker.push_arg_bool(true)
					native_invoker.push_arg_int(0)
					native_invoker.end_call("701919482C74B5AB")
					util.yield()
				end end
			local function isHelpMessageBeingDisplayed(label)
				HUD.BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(label)
				return HUD.END_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(0)
				end
			function MP_INDEX()
				return "MP" .. util.get_char_slot() .. "_" end
			function IS_MPPLY(Stat)
				local Stats = {
					"MP_PLAYING_TIME",
				}

				for i = 1, #Stats do
					if Stat == Stats[i] then
						return true
					end
				end

				if string.find(Stat, "MPPLY_") then
					return true
				else
					return false
				end end
			function ADD_MP_INDEX(Stat)
				if not IS_MPPLY(Stat) then
					Stat = MP_INDEX() .. Stat
				end
				return Stat end
			function SET_INT_GLOBAL(Global, Value)
				memory.write_int(memory.script_global(Global), Value)end
			function STAT_SET_INT(Stat, Value)
				STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)end
			local function getMPX()
				return 'MP'.. util.get_char_slot() ..'_' end
			local function STAT_GET_INT(Stat)
				STATS.STAT_GET_INT(util.joaat(getMPX() .. Stat), Int_PTR, -1)
				return memory.read_int(Int_PTR)end
			local function int_to_uint(int)
				if int >= 0 then
					return int
				end
				return (1 << 32) + int end
			function request_ptfx_asset(asset)
				local request_time = os.time()
				STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
				while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
					if os.time() - request_time >= 10 then
						break
					end
					util.yield()
				end end
			local function encode_for_web(text)
				return string.gsub(text, "%s", "+")end
			local function web_decode(text)
				return string.gsub(text, "+", " ")end
			local function google_translate(text, to_lang, pid, outgoing)
				if players_on_cooldown[pid] == nil then
					local encoded_text = encode_for_web(text)
					async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl=" .. to_lang .."&dt=t&q=".. encoded_text, function(data)
						translation, original, langs = data:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
						local decoded_text = web_decode(translation)
						if langs == nil then
							Assistant("Sorry, i cant translate this message.", colors.black)
							return
						end
						langs = string.split(langs, '_')
						if #langs < 2 then
							-- source and dest lang are the same (in like 90% of cases)
							return 
						end
						local from_lang = langs[1]
						local dest_lang = langs[2]
						-- dont translate non-whitelisted languages
						if not whitelisted_langs[from_lang] then
							return
						end
						if from_lang ~= to_lang then
							if not outgoing then
								Assistant(players.get_name(pid).." said:\n\n"..decoded_text, colors.black)
								players_on_cooldown[pid] = true
								util.yield(1000)
								players_on_cooldown[pid] = nil
							else
							chat.send_message(decoded_text, false, true, true)
							end
						end
					end, function()
						util.toast("Failed to translate : Issue reaching Google API. If you think you are blocked, turn on a VPN or switch VPN servers.")
					end)
					async_http.dispatch()
				else
					util.toast(players.get_name(pid) .. " sent a message, but is on cooldown from translations. Consider kicking this player if they are spamming the chat to prevent a possible temporary ban from Google translate.")
				end end
			get_vtable_entry_pointer = function(address, index)
				 return memory.read_long(memory.read_long(address) + (8 * index))end
			get_sub_handling_types = function(vehicle, type)
				local veh_handling_address = memory.read_long(entities.handle_to_pointer(vehicle) + 0x918)
				local sub_handling_array = memory.read_long(veh_handling_address + 0x0158)
				local sub_handling_count = memory.read_ushort(veh_handling_address + 0x0160)
				local types = {registerd = sub_handling_count, found = 0}
				for i = 0, sub_handling_count - 1, 1 do
					local sub_handling_data = memory.read_long(sub_handling_array + 8 * i)
					if sub_handling_data ~= 0 then
						local GetSubHandlingType_address = get_vtable_entry_pointer(sub_handling_data, 2)
						local result = util.call_foreign_function(GetSubHandlingType_address, sub_handling_data)
						if type and type == result then return sub_handling_data end
						types[#types+1] = {type = result, address = sub_handling_data}
						types.found = types.found + 1
					end
				end
				if type then return nil else return types end end
			entity = {
				get_entity_model_hash = function (veh)
				return int_to_uint(ENTITY.GET_ENTITY_MODEL(veh))end}
	
	-- {Main Script Code}
		MX.divider(MX.my_root(), "~~~> "..MXName.." <~~~")
		selfoptions = MX.list(MX.my_root(), "> Self Options", {}, "", function(); end)
			MX.divider(selfoptions, "---> Self Options <---")
			pvpoptions = MX.list(selfoptions, "> PVP Options", {}, "", function(); end)
				MX.divider(pvpoptions, "---> PVP Options <---")
				MX.toggle_loop(pvpoptions, "Reload when rolling", {}, "Reloads your weapon when doing a roll.", function()
					if TASK.GET_IS_TASK_ACTIVE(players.user_ped(), 4) and PAD.IS_CONTROL_PRESSED(22, 22) and not PED.IS_PED_SHOOTING(players.user_ped())  then --checking if player is rolling
						util.yield(900)
						WEAPON.REFILL_AMMO_INSTANTLY(players.user_ped())
					end end)
				MX.toggle_loop(pvpoptions, "Refill Snacks & Armours Automatically", {}, "", function(toggled)
					STAT_SET_INT("NO_BOUGHT_YUM_SNACKS", 30)
					STAT_SET_INT("NO_BOUGHT_HEALTH_SNACKS", 15)
					STAT_SET_INT("NO_BOUGHT_EPIC_SNACKS", 15)
					STAT_SET_INT("NUMBER_OF_ORANGE_BOUGHT", 10)
					STAT_SET_INT("NUMBER_OF_BOURGE_BOUGHT", 10)
					STAT_SET_INT("CIGARETTES_BOUGHT", 10)
					STAT_SET_INT("MP_CHAR_ARMOUR_1_COUNT", 10)
					STAT_SET_INT("MP_CHAR_ARMOUR_2_COUNT", 10)
					STAT_SET_INT("MP_CHAR_ARMOUR_3_COUNT", 10)
					STAT_SET_INT("MP_CHAR_ARMOUR_4_COUNT", 10)
					STAT_SET_INT("MP_CHAR_ARMOUR_5_COUNT", 10)end)
				MX.toggle_loop(pvpoptions, "Increase Kosatka Missile Range", {}, "You can use it anywhere in the map now", function()
					if util.is_session_started() then
					memory.write_float(memory.script_global(262145 + 30176), 200000.0)
					end end)
				MX.toggle_loop(pvpoptions, "Max Auto-Aim Range", {""}, "", function()
					PLAYER.SET_PLAYER_LOCKON_RANGE_OVERRIDE(players.user(), 99999999.0)end)
				MX.divider(pvpoptions, "---> Weapon Buffs <---")
				MX.toggle(pvpoptions, "Better Precision Rifle", {}, "", function(on_toggle)
					if on_toggle then
						MX.trigger_commands("damagemultiplier".." ".."1.60")
						MX.trigger_commands("rangemultiplier".." ".."1.50")
					else
						MX.trigger_commands("damagemultiplier".." ".."1.00")
						MX.trigger_commands("rangemultiplier".." ".."1.00")
					end end)
				MX.divider(pvpoptions, "---> Request's <---")
				MX.action(pvpoptions, "Ballistic Armor", {}, "", function(on)
					 SET_INT_GLOBAL(2815059 + 884, 1)end)
			animation = MX.list(selfoptions, "> Animation", {}, "", function(); end)
				MX.divider(animation, "---> Animation <---")
				MX.action(animation, "Stop Animation", {}, "", function()
						TASK.CLEAR_PED_TASKS(players.user_ped())end)
				MX.action(animation, "Test", {}, "", function()
					local dict = "anim@temp_trailer@"
					local name = "p3_ver1_amanda"
					while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
						STREAMING.REQUEST_ANIM_DICT(dict)
						util.yield()
					end
					WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
					TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animfav = MX.list(animation, "> Favorites", {}, "", function(); end)
					MX.action(animfav, "Arm Crossing", {}, "", function()
						local dict = "anim_heist@arcade_combined@"
						local name = "ped_female@_stand@_03a@_base_base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animfav, "Crossing", {}, "", function()
						local dict = "anim@amb@business@bgen@bgen_no_work@"
						local name = "stand_phone_phoneputdown_idle_nowork"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animfav, "Dance Main", {}, "", function()
						local dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@"
						local name = "med_center"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animfav, "Main", {}, "", function()
						local dict = "anim@amb@casino@peds@"
						local name = "amb_world_human_hang_out_street_male_c_base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animfav, "Shy Girl", {}, "", function()
						local dict = "low_fun_mcs1-3"
						local name = "mp_m_g_vagfun_01^12_dual-3"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animfav, "Shy Girl 2", {}, "", function()
						local dict = "low_fun_mcs1-3"
						local name = "mp_m_g_vagfun_01^13_dual-3"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				MX.divider(animation, "---> More Animations <---")
				animground = MX.list(animation, "> Ground Sitting", {}, "", function(); end)
					MX.action(animground, "Ground Sitting 1", {}, "", function()
						local dict = "anim@amb@casino@out_of_money@ped_male@02b@idles"
						local name = "idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)		
					MX.action(animground, "Ground Sitting 2", {}, "", function()
						local dict = "anim@heists@fleeca_bank@ig_7_jetski_owner"
						local name = "owner_idle"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animground, "Ground Sitting 3", {}, "", function()
						local dict = "anim@amb@business@bgen@bgen_no_work@"
						local name = "sit_phone_idle_01-noworkfemale"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animground, "Ground Sitting 4", {}, "", function()
						local dict = "anim@amb@business@bgen@bgen_no_work@"
						local name = "sit_phone_phoneputdown_idle-noworkfemale"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animground, "Ground Sitting 5", {}, "", function()
						local dict = "anim@amb@business@bgen@bgen_no_work@"
						local name = "sit_phone_phoneputdown_idle_nowork"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animground, "Sitting 1", {}, "", function()
						local dict = "anim_heist@arcade_combined@"
						local name = "jimmy@_smoking_base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animspoiler = MX.list(animation, "> Spoiler Sitting", {}, "", function(); end)
					MX.action(animspoiler, "Spoiler Sitting 1", {}, "", function()
						local dict = "mpcas3_mcs1-15"
						local name = "csb_agatha_dual-15"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 2", {}, "", function()
						local dict = "anim@amb@casino@brawl@reacts@hr_blackjack@bg_blackjack_breakout_t02@bg_blackjack_breakout_t02_s01_s03@"
						local name = "playing_loop_female_01"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 3", {}, "", function()
						local dict = "iaaj_int-9"
						local name = "mp_m_freemode_01^1_dual-9"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 4", {}, "", function()
						local dict = "anim@amb@office@boardroom@boss@female@"
						local name = "base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 5", {}, "", function()
						local dict = "anim@amb@office@boardroom@crew@female@var_a@base@"
						local name = "idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 6", {}, "", function()
						local dict = "amb@world_human_seat_steps@female@hands_by_sides@idle_a"
						local name = "idle_c"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animspoiler, "Spoiler Sitting 7", {}, "", function()
						local dict = "amb@world_human_seat_steps@female@hands_by_sides@idle_b"
						local name = "idle_d"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animhood = MX.list(animation, "> Hood Sitting", {}, "", function(); end)
					MX.action(animhood, "Hood Sitting 1", {}, "", function()
						local dict = "amb@world_human_seat_steps@male@elbows_on_knees@idle_a"
						local name = "idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animhood, "Hood Sitting 2", {}, "", function()
						local dict = "anim@amb@business@cfm@cfm_machine_no_work@"
						local name = "transition_sleep_v1_operator"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animleaning = MX.list(animation, "> Car Leaning", {}, "", function(); end)
					MX.action(animleaning, "Car Leaning 1", {}, "", function()
						local dict = "amb@world_human_leaning@male@wall@back@foot_up@idle_a"
						local name = "idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 2", {}, "", function()
						local dict = "amb@world_human_leaning@female@coffee@base"
						local name = "base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 3", {}, "", function()
						local dict = "rcmnigel1aig_1"
						local name = "base_02_willie"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 4", {}, "", function()
						local dict = "anim@amb@nightclub@peds@"
						local name = "amb_world_human_leaning_male_wall_back_smoking_idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 5", {}, "", function()
						local dict = "anim_heist@arcade_combined@"
						local name = "stand_phone_lookaround_nowork"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 6", {}, "", function()
						local dict = "anim_heist@arcade_combined@"
						local name = "amb@world_human_leaning@male@wall@back@mobile@idle_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animleaning, "Car Leaning 7", {}, "", function()
						local dict = "anim@amb@business@bgen@bgen_no_work@"
						local name = "stand_phone_lookaround_nowork"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animsleep = MX.list(animation, "> Sleeping", {}, "", function(); end)
					MX.action(animsleep, "Slepping left", {}, "", function()
						local dict = "anim@mp_bedmid@left_var_02"
						local name = "f_sleep_l_loop_bighouse"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animsleep, "Sleeping right", {}, "", function()
						local dict = "anim@mp_bedmid@right_var_02"
						local name = "f_sleep_r_loop_bighouse"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animdance = MX.list(animation, "> Dances", {}, "", function(); end)
					MX.action(animdance, "Dance 1", {}, "", function()
						local dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@"
						local name = "low_center"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
				animother = MX.list(animation, "> Other Animations", {}, "", function(); end)
					MX.action(animother, "Coffee Drinking", {}, "", function()
						local dict = "amb@world_human_drinking@coffee@female@enter"
						local name = "enter"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)	
					MX.action(animother, "Female Arm Crossing", {}, "", function()
						local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
						local name = "base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)
					MX.action(animother, "Lead in out", {}, "", function()
						local dict = "missfbi4leadinoutfbi_4_int"
						local name = "agents_idle_b_andreas"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)
					MX.action(animother, "Standing", {}, "", function()
						local dict = "mpcas6_ext-14"
						local name = "csb_agatha_dual-14"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)
					MX.action(animother, "Hangout", {}, "", function()
						local dict = "anim@amb@casino@hangout@ped_female@stand@02a@base"
						local name = "base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false) end)
					MX.action(animother, "Calling", {}, "", function()
						local dict = "amb@code_human_wander_mobile@female@base"
						local name = "static"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animother, "Guard Standing", {}, "", function()
						local dict = "amb@world_human_stand_guard@male@base"
						local name = "base"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animother, "Texting", {}, "", function()
						local dict = "move_characters@sandy@texting"
						local name = "sandy_text_loop_a"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
					MX.action(animother, "Mime", {}, "", function()
						local dict = "anim@temp_trailer@"
						local name = "p3_ver1_amanda"
						while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do 
							STREAMING.REQUEST_ANIM_DICT(dict)
							util.yield()
						end
						WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(players.user_ped(), dict, name, 8.0, 8.0, -1, 1, 0, false, false, false)end)
			MX.divider(selfoptions, "---> Bounty Remover <---")
			MX.action(selfoptions, "Remove Bounty", {"rbounty"}, "", function(on)
				if memory.read_int(memory.script_global(1835502 + 4 + 1 + (players.user() * 3))) == 1 then 
					memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
					memory.write_int(memory.script_global(2359296 + 1 + 5149 + 13), 2880000)
					util.yield(1000)
					Assistant("I have removed your bounty.", colors.black)
				else
					Assistant("Sorry, but you don't have a bounty right now which I could remove.", colors.red)
				end end)
		onlineoptions = MX.list(MX.my_root(), "> Online Options", {}, "", function(); end)
			MX.divider(onlineoptions, "---> Online Options <---")
			translater = MX.list(onlineoptions, "> Translater", {}, "", function(); end)
				MX.divider(translater, "---> Translater <---")
				MX.toggle(translater, "On", {}, "Turns translating on/off", function(on)
					do_translate = on end, false)
				MX.toggle(translater, "Only translate foreign game lang", {}, "Only translates messages from users with a different game language, thus saving API calls. You should leave this on to prevent the chance of Google temporarily blocking your requests.", function(on)
					only_translate_foreign = on end, true)
				local outgoing_list = MX.list(translater, "Send translation", {"nexttranslateout"}, "Send a translated, outgoing chat")
					outgoing_list:divider("Select lang to translate to")
					for lang_index, lang in pairs(language_display_names_by_enum) do
						local cmd = "translateto" .. string.lower(lang):gsub(' ', ''):gsub('%(', ''):gsub('%)', '')
						outgoing_list:action(lang, {cmd}, "", function()
							util.toast("Enter text to translate")
							MX.show_command_box(cmd .. " ")
						end, function(entry)
							if string.len(entry) > 254 then 
								util.toast("That text is too long to be sent in chat, nerd")
								return 
							end
							util.toast("Translating...")
							google_translate(entry, language_codes_by_enum[lang_index], players.user(), true)
						end)end
						local whitelist_list = MX.list(translater, "Translation whitelist", {}, "Only translate languages toggled on in this list")
						for id, iso_code in pairs(language_codes_by_enum) do
							whitelist_list:toggle(language_display_names_by_enum[id], {}, "", function(on)
								whitelisted_langs[iso_code] = on
							end, true)end
					chat.on_message(function(sender, reserved, text, team_chat, networked, is_auto)
						if do_translate and networked then
							local encoded_text = encode_for_web(text)
							local player_lang = language_codes_by_enum[players.get_language(sender)]
							if (only_translate_foreign and player_lang == my_lang) then
								return
							end
							if not debug then 
								if players.user() == sender then 
									return 
								end
							end
							-- credit to the original chat translator for the api code
							google_translate(encoded_text, my_lang, sender, false)
						end end)
			friendlist = MX.list(onlineoptions, "> Friendlist", {}, "", function(); end)
				MX.divider(friendlist, "---> Friendlist <---")
					for i = 0 , get_friend_count() do
						local name = get_frined_name(i)
						if name == "*****" then goto yes end
						gen_fren_funcs(name)
						::yes::
					end
			requestoptions = MX.list(onlineoptions, "> Request's", {}, "", function(); end)
				MX.divider(requestoptions, "---> Request's <---")
					MX.action(requestoptions, "MOC", {}, "", function(on)
						SET_INT_GLOBAL(2815059 + 913, 1)end)
					MX.action(requestoptions, "Avenger", {}, "", function(on)
						SET_INT_GLOBAL(2815059 + 921, 1)end)
					MX.action(requestoptions, "Terrorbyte", {}, "", function(on)
						SET_INT_GLOBAL(2815059 + 925, 1)end)
					MX.action(requestoptions, "Kosatka", {}, "", function(on)
						SET_INT_GLOBAL(2815059 + 933, 1)end)
			MX.toggle_loop(onlineoptions, "Disable Text Chat", {}, "", function(toggled)
				HUD._MULTIPLAYER_CHAT_SET_DISABLED(true)end)
			MX.divider(onlineoptions, "---> Nightclub Options <---")
			MX.toggle_loop(onlineoptions, "Nightclub Popularity", {}, "Keeps the Nightclub Popularity at max", function ()
				if util.is_session_started() then
					local ncpop = math.floor(STAT_GET_INT("CLUB_POPULARITY") / 10)
					if ncpop < 100 then
						MX.trigger_commands("clubpopularity 100")
						util.yield(250)
					end
				end end)
			MX.divider(onlineoptions, "---> Modder Detection <---")
			MX.action(onlineoptions,"Check Stats", {}, "Lobby check",function(on)
					for pid = 0, 32 do
						local rp = players.get_rank(pid)
						local money = players.get_money(pid)
						local kd = players.get_kd(pid)
						if rp == 120 or rp == 720 or rp >= 1000 then
							Assistant("I think "..PLAYER.GET_PLAYER_NAME(pid) .. " have a modded account.\n\nReason: Modded RP Level", colors.red)
						end
						if money >= 500000000 then
							Assistant("I think "..PLAYER.GET_PLAYER_NAME(pid) .. " have a modded account.\n\nReason: Modded Money", colors.red)
						end
						if kd <= -1 or kd >= 50 then
							Assistant("I think "..PLAYER.GET_PLAYER_NAME(pid) .. " have a modded account.\n\nReason: Modded KD", colors.red)
						end
					end end)
			MX.divider(onlineoptions, "---> IP Tracker <---")
			MX.hyperlink(onlineoptions, "Open NordVPN API", filesystem.scripts_dir().."lib\\C4tScripts\\Addons\\NordVPN\\NordVPN IP API", "")
		weaponsoptions = MX.list(MX.my_root(), "> Weapon Options", {}, "", function(); end)
			MX.divider(weaponsoptions, "---> Weapon Options <---")
			weaponattachments = MX.list(weaponsoptions, "> Weapon Attachment Manager", {}, "", function(); end)
				MX.divider(weaponattachments, "---> Weapon Attachment Manager <---")
				MX.action(weaponattachments, "Give Ammo", {}, "(Not working with special ammo)", function(on_click)
					local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
						WEAPON.ADD_AMMO_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, 10)end)	
				MX.action(weaponattachments, "Give All Attachments", {}, "Give all attachments from your current weapon", function(on_click)
					local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
					for key, value in pairs(attachments_table) do
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
					end end)
				MX.action(weaponattachments, "Remove All Attachments", {}, "Removes all attachments from your current weapon", function(on_click)
					local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
					for key, value in pairs(attachments_table) do
						WEAPON.REMOVE_WEAPON_COMPONENT_FROM_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
					end end)
				attachment_tab = MX.list(weaponattachments, "Add Attachments", {}, "Add attachments to your current weapon")
					for key, value in pairs(attachments_table) do
						local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
						if WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(curr_equipped_weapon, key) == true then --done
							--util.toast(curr_equipped_weapon .. " takes " .. key .. " as attachment") --done
							MX.action(attachment_tab,value,{value},"Attach " .. value .. "to your current weapon",function(on_click)
								WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key) --done
								--util.toast("Your Weapon '" .. curr_equipped_weapon .. "' should now have the attachment '" .. key) --done
							end)
						end
					end
		vehicleoptions = MX.list(MX.my_root(), "> Vehicle Options", {}, "", function(); end)
			MX.divider(vehicleoptions, "---> Zeromenu Drifting <---")
			MX.action(vehicleoptions, "Drift", {}, "", function(toggle)
					if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entities.get_user_vehicle_as_handle(pid)) then
						NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entities.get_user_vehicle_as_handle(pid))  
					end
					ENTITY.SET_ENTITY_MAX_SPEED(entities.get_user_vehicle_as_handle(), 30)
					VEHICLE.MODIFY_VEHICLE_TOP_SPEED(entities.get_user_vehicle_as_handle(), 200)end)
					MX.toggle(vehicleoptions, "Stance [Only LS Tuners]", {}, "", function(toggle)
						VEHICLE._SET_REDUCE_DRIFT_VEHICLE_SUSPENSION(players_car, toggle)end)
					MX.toggle_loop(vehicleoptions, "Keep car clean", {}, "", function(toggled)
						VEHICLE.SET_VEHICLE_DIRT_LEVEL(entities.get_user_vehicle_as_handle(), 0.0)end)			
			MX.divider(vehicleoptions, "---> VStancer [Reloaded] <---")
			MX.click_slider_float(vehicleoptions, "Suspension Height", {}, "", -100, 100, 0, 1, function(value)
				value/=100
				local player = players.user_ped()
				local pos = ENTITY.GET_ENTITY_COORDS(player, false)
				local VehicleHandle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
				if VehicleHandle == 0 then return end
				local CAutomobile = entities.handle_to_pointer(VehicleHandle)
				local CHandlingData = memory.read_long(CAutomobile + 0x0938)
				memory.write_float(CHandlingData + 0x00D0, value)
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(VehicleHandle, pos.x, pos.y, pos.z + 2.8, false, false, false)end)
			MX.divider(vehicleoptions, "---> Other Options <---")
			MX.toggle_loop(vehicleoptions, "Stealth Vehicle Godmode", {}, "Won't be detected as vehicle godmode by most menus", function(toggled)
					ENTITY.SET_ENTITY_PROOFS(players_car, true, true, true, true, true, 0, 0, true)
					end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(player), false, false, false, false, false, 0, 0, false)end)
			MX.toggle_loop(vehicleoptions, "Indicator Lights", {}, "", function()
					if(PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false)) then
						local vehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
						local left = PAD.IS_CONTROL_PRESSED(34, 34)
						local right = PAD.IS_CONTROL_PRESSED(35, 35)
						local rear = PAD.IS_CONTROL_PRESSED(130, 130)
						if left and not right and not rear then
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, true)
						elseif right and not left and not rear then
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, true)
						elseif rear and not left and not right then
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, true)
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, true)
						else
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, false)
							VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, false)
						end
					end end)
			MX.toggle_loop(vehicleoptions, "Hands Up on Bike", {}, "", function(toggled)
				if PAD.IS_CONTROL_PRESSED(1, 323) then
					while not STREAMING.HAS_ANIM_DICT_LOADED("random@mugging3") do
						STREAMING.REQUEST_ANIM_DICT("random@mugging3")
						util.yield(100)
					end
					if not ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
						--WEAPON.SET_CURRENT_PED_WEAPON(PLAYER.PLAYER_PED_ID(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
						TASK.TASK_PLAY_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3, 3, -1, 51, 0, false, false, false)
						STREAMING.REMOVE_ANIM_DICT("random@mugging3")
						PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), true)
					end
				end
				if PAD.IS_CONTROL_RELEASED(1, 323) and ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
					TASK.CLEAR_PED_SECONDARY_TASK(PLAYER.PLAYER_PED_ID())
					PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), false)
				end
				util.yield()end)
			MX.slider(vehicleoptions, "Change seat", {"switchseat"}, "DriverSeat = -1 Passenger = 0 Left Rear = 1 RightRear = 2", -1, 2, -1, 1, function(seatnumber)
					local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
					local vehicle = entities.get_user_vehicle_as_handle()
					PED.SET_PED_INTO_VEHICLE(ped, vehicle, seatnumber)end)
			MX.divider(vehicleoptions, "---> Helicopter Options <---")
			MX.action(vehicleoptions, "Disable Auto-Stablization", {}, "", function ()
					local CflyingHandling = get_sub_handling_types(entities.get_user_vehicle_as_handle(), 1)
					if CflyingHandling then
						for _, offset in pairs(better_heli_handling_offsets) do
							memory.write_float(CflyingHandling + offset, 0)
						end
						util.toast("Auto-Stablization off.")
					end end)
		cameraoptions = MX.list(MX.my_root(), "> Camera Options", {}, "", function(); end)
			MX.divider(cameraoptions, "---> Camera Options <---")
			MX.toggle(cameraoptions, "FOV Tryhard", {}, "", function(on_toggle)
					if on_toggle then
						MX.trigger_commands("fovfponfoot".." ".."75")
					else
						MX.trigger_commands("fovfponfoot".." ".."-1")
					end end)
			MX.toggle(cameraoptions, "FOV Dogfight", {}, "", function(on_toggle)
					if on_toggle then
						MX.trigger_commands("fovfpinveh".." ".."75")
					else
						MX.trigger_commands("fovfpinveh".." ".."-1")
					end end)
		miscoptions = MX.list(MX.my_root(), "> Misc Options", {}, "", function(); end)
			MX.divider(miscoptions, "---> Misc Options <---")
			funnyoptions = MX.list(miscoptions, "> Funny Options", {}, "", function(); end)
				MX.divider(funnyoptions, "---> Funny Options <---")
				MX.action(funnyoptions, "Cum", {}, "", function()
					local ptfx_asset = "scr_indep_fireworks"
					local effect_name = "scr_indep_firework_trailburst"
					request_ptfx_asset(ptfx_asset)
					GRAPHICS.USE_PARTICLE_FX_ASSET(ptfx_asset)
					GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY(effect_name, players.user_ped(), 0.0, 0.0, -0.3, 90.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0)
					for i=1, 10 do 
						local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0.0, i, 0.0)
						FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 67, 0.0, false, false, 0.0, true)
					end end)
				MX.action(funnyoptions, "Massive shit", {"mshit"}, "Make a massive shit", function()
					local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
					c.z = c.z -1
					while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
						STREAMING.REQUEST_ANIM_DICT(agroup)
						util.yield()
					end
					TASK.TASK_PLAY_ANIM(player, agroup, anim1, 8.0, 8.0, 3000, 0, 0, false, false, false)
					util.yield(1000)
					entities.create_object(mshit, c)end)
				MX.action(funnyoptions, "Normal shit", {"nshit"}, "Make a normale sized shit", function()
					local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
					c.z = c.z -1
					while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
						STREAMING.REQUEST_ANIM_DICT(agroup)
						util.yield()
					end
					TASK.TASK_PLAY_ANIM(player, agroup, anim1, 8.0, 8.0, 3000, 0, 0, false, false, false)
					util.yield(1000)
					entities.create_object(rshit, c)end)
				MX.action(funnyoptions, "Big Money Drop", {}, "", function()
					local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
					c.z = c.z -1
					while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
						STREAMING.REQUEST_ANIM_DICT(agroup)
						util.yield()
					end
					TASK.TASK_PLAY_ANIM(player, agroup, anim1, 8.0, 8.0, 3000, 0, 0, false, false, false)
					util.yield(1000)
					entities.create_object(mshit2, c)end)
				MX.action(funnyoptions, "SoMe sOdA?", {"ashit"}, "", function()
					local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
					c.z = c.z -1
					while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
						STREAMING.REQUEST_ANIM_DICT(agroup)
						util.yield()
					end
					TASK.TASK_PLAY_ANIM(player, agroup, anim1, 8.0, 8.0, 3000, 0, 0, false, false, false)
					util.yield(1000)
					entities.create_object(ashit, c)end)
			MX.action(miscoptions, "Custom Fake Banner", {"banner"}, "", function(on_click) MX.show_command_box("banner ") end, function(text)
				custom_alert(text)end)
			MX.divider(miscoptions, "---> Casino <---")
			MX.toggle_loop(miscoptions, "Auto Black Jack", {}, "", function()
				if not (isHelpMessageBeingDisplayed('BJACK_BET') or isHelpMessageBeingDisplayed('BJACK_TURN') or isHelpMessageBeingDisplayed('BJACK_TURN_D') or isHelpMessageBeingDisplayed('BJACK_TURN_S')) then return end
				if isHelpMessageBeingDisplayed('BJACK_BET') then
					PAD._SET_CONTROL_NORMAL(2, 204, 1) --max bet
					PAD._SET_CONTROL_NORMAL(2, 201, 1) --bet
				else
					PAD._SET_CONTROL_NORMAL(2, 203, 1) --pass
				end end)
			MX.divider(miscoptions, "---> Lobby Settings <---")	
			menu.list_action(miscoptions, "Clear All...", {}, "", {"Peds", "Vehicles", "Objects", "Pickups", "Ropes", "Projectiles", "Sounds"}, function(index, name)
				util.toast("Clearing "..name:lower().."...")
				local counter = 0
				pluto_switch index do
					case 1:
						for _, ped in ipairs(entities.get_all_peds_as_handles()) do
							if ped ~= players.user_ped() and not PED.IS_PED_A_PLAYER(ped) then
								entities.delete_by_handle(ped)
								counter += 1
								util.yield()
							end
						end
						break
					case 2:
						for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
							if vehicle ~= PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false) and DECORATOR.DECOR_GET_INT(vehicle, "Player_Vehicle") == 0 and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
								entities.delete_by_handle(vehicle)
								counter += 1
							end
							util.yield()
						end
						break
					case 3:
						for _, object in ipairs(entities.get_all_objects_as_handles()) do
							entities.delete_by_handle(object)
							counter += 1
							util.yield()
						end
						break
					case 4:
						for _, pickup in ipairs(entities.get_all_pickups_as_handles()) do
							entities.delete_by_handle(pickup)
							counter += 1
							util.yield()
						end
						break
					case 5:
						local temp = memory.alloc(4)
						for i = 0, 101 do
							memory.write_int(temp, i)
							if PHYSICS.DOES_ROPE_EXIST(temp) then
								PHYSICS.DELETE_ROPE(temp)
								counter += 1
							end
							util.yield()
						end
						break
					case 6:
						local coords = players.get_position(players.user())
						MISC.CLEAR_AREA_OF_PROJECTILES(coords.x, coords.y, coords.z, 1000, 0)
						counter = "all"
						break
					case 4:
						for i = 0, 99 do
							AUDIO.STOP_SOUND(i)
							util.yield()
						end
					break
				end
				util.toast("Cleared "..tostring(counter).." "..name:lower()..".")end)
			MX.action(miscoptions, "Clear Everything", {"cleanse"}, "Warning: It really clears everything.", function()
				local cleanse_entitycount = 0
				for _, ped in pairs(entities.get_all_peds_as_handles()) do
					if ped ~= players.user_ped() and not PED.IS_PED_A_PLAYER(ped) then
						entities.delete_by_handle(ped)
						cleanse_entitycount += 1
					end
				end
				--util.toast("Cleared " .. cleanse_entitycount .. " Peds")
				cleanse_entitycount = 0
				for _, veh in ipairs(entities.get_all_vehicles_as_handles()) do
					entities.delete_by_handle(veh)
					cleanse_entitycount += 1
					util.yield()
				end
				--util.toast("Cleared ".. cleanse_entitycount .." Vehicles")
				cleanse_entitycount = 0
				for _, object in pairs(entities.get_all_objects_as_handles()) do
					entities.delete_by_handle(object)
					cleanse_entitycount += 1
				end
				--util.toast("Cleared " .. cleanse_entitycount .. " Objects")
				cleanse_entitycount = 0
				for _, pickup in pairs(entities.get_all_pickups_as_handles()) do
					entities.delete_by_handle(pickup)
					cleanse_entitycount += 1
				end
				--util.toast("Cleared " .. cleanse_entitycount .. " Pickups")
				local temp = memory.alloc(4)
				for i = 0, 100 do
					memory.write_int(temp, i)
					PHYSICS.DELETE_ROPE(temp)
				end
				--util.toast("Cleared All Ropes")
				local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
				MISC.CLEAR_AREA_OF_PROJECTILES(pos.x, pos.y, pos.z, 400, 0)
				Assistant("> I have removed everything from your area.",colors.green)
				end)
			MX.action(miscoptions, "Check Lobby", {}, "", function(on)
				if NETWORK.NETWORK_IS_SESSION_STARTED() then
					for pid = 0, 31 do
						if players.exists(pid) then
							if players.get_host_token(pid) == 0 then
								SessionBrokenAlteredSHQueue = true
							end
						end
					end
					if SessionBrokenAlteredSHQueue then
						if not altered_sh_queue then
							all_session_flags = all_session_flags .. "Host Token 0 lesss go"
						end
						altered_sh_queue = true
						all_session_flags_count = all_session_flags_count + 1
					end
					local has_session_host = false
					for pid = 0, 31 do
						if players.exists(pid) then
							if players.get_host_token(pid) then
								has_session_host = true
							end
						end
					end
					if not has_session_host then
						if not missing_session_host then
							all_session_flags = all_session_flags .. "Where is your session host bitch?"
						end
						missing_session_host = true
						all_session_flags_count = all_session_flags_count + 1
					end
					local has_script_host = false
					for pid = 0, 31 do
						if players.exists(pid) then
							if players.get_script_host() == pid then
								has_script_host = true
							end
						end
					end
					if not has_script_host then
						if not missing_script_host then
							all_session_flags = all_session_flags .. "Where is your script host bitch?"
						end
						missing_script_host = true
						all_session_flags_count = all_session_flags_count + 1
					end
					if SessionBrokenBadScriptEvent then
						if not bad_script_event then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Don't use SEs To break lobbies"
							else
								all_session_flags = all_session_flags .. "Don't use SEs to break lobbies"
							end
							bad_script_event = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					if SessionBrokenAlteredSHMigration then
						if not altered_sh_migration then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Force Script Host goes Brrrrrr"
							else
								all_session_flags = all_session_flags .. "Force Script Host goes Brrrrrr"
							end
							altered_sh_migration = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					for pid = 0, 31 do
						if players.exists(pid) then
							if entity.get_entity_model_hash(players.user_ped(pid)) ~= 2627665880 and entity.get_entity_model_hash(players.user_ped(pid)) ~= 1885233650 then
								SessionBrokenModifiedEntityState = true
							end
						end
					end
					if SessionBrokenModifiedEntityState then
						if not modified_entity_state then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Don't do weird interacts mf"
							else
								all_session_flags = all_session_flags .. "Don't do weird interacts mf"
							end
							modified_entity_state = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					if SessionBrokenOutOfRangeWorldRender then
						if not out_of_range_world_render then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Someone swam too far away"
							else
								all_session_flags = all_session_flags .. "Someone swam too far away"
							end
							out_of_range_world_render = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					if InvalidPickupPlacement then
						if not invalid_pickup_placement then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Yeah don't create scripted pickups"
							else
								all_session_flags = all_session_flags .. "Yeah don't create scripted pickups"
							end
							invalid_pickup_placement = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					for pid = 0, 31 do
						if players.exists(pid) then
							if HUD.IS_MISSION_CREATOR_BLIP(HUD.GET_BLIP_FROM_ENTITY(players.user_ped(pid))) then
								SessionBrokenGameServerModify = true
							end
						end
					end
					if SessionBrokenGameServerModify then
						if not game_server_modify then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Messing with the game server is a bad idea"
							else
								all_session_flags = all_session_flags .. "Messing with the game server is a bad idea"
							end
							game_server_modify = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					if SessionBrokenModifiedWeather then
						if not modified_weather then
							if all_session_flags_count > 0 then
								all_session_flags = all_session_flags .. ", " .. "Some fucker messed with the weather"
							else
								all_session_flags = all_session_flags .. "Some fucker messed with the weather"
							end
							modified_weather = true
							all_session_flags_count = all_session_flags_count + 1
						end
					end
					if all_session_flags_count == 0 then
						Assistant("> Current Session Status:\n\nSession Broken: False\nFlags: None", colors.black)
					else
						Assistant("> Current Session Status:\n\nSession Broken: True\nFlags: " .. all_session_flags .. "", colors.red)
					end
				else
					Assistant("> Current Session Status:\n\nSession Broken: False\nFlags: None", colors.black)
				end	end)
		settings = MX.list(MX.my_root(), "> Settings", {}, "", function(); end)
			MX.divider(settings, "---> Settings <---")
			MX.action(settings, "Restart Script", {}, "Restarts the script to clean the errors", function()
				util.restart_script()end)
		credits = MX.list(MX.my_root(), "> Credits", {}, "", function(); end)
			MX.divider(credits, "---> xX-LulzSecC4t-Xx <---")
			MX.hyperlink(credits, "GitHub", "https://github.com/xX-LulzSecC4t-Xx")
			MX.hyperlink(credits, "Discord", "https://discord.gg/bHpvhazv7T")
			MX.hyperlink(credits, "Instagram", "https://www.instagram.com/theskillcat/")
			MX.hyperlink(credits, "Youtube", "https://www.youtube.com/channel/UC3VLV_wgIwbikbVbdT9SCqg?view_as=subscriber")
			MX.hyperlink(credits, "GTA5Mods", "https://de.gta5-mods.com/users/Th3Sk1llC4tHD")
		MX.toggle(MX.my_root(), "Bail On Admin Join", {}, "", function(on)
				if on then
					bailOnAdminJoin = on
					AssistantRAC("> Okay, I will notify you when I see an admin.",colors.green)
				else
					bailOnAdminJoin = off
					AssistantRAC("> Warning: If you meet an admin the risk of being banned is high.",colors.red)
				end end)

-----------------------------------------------------------------------------------------------------------------
		--[[<Anim dict="anim@amb@clubhouse@boardroom@crew@male@var_c@base@" name="idle_a" />
		<Anim dict="anim@amb@clubhouse@boardroom@crew@female@var_c@base_r@" name="base" />
		<Anim dict="anim@amb@office@boardroom@crew@female@var_b@base@" name="base" />
		<Anim dict="amb@world_human_leaning@female@wall@back@holding_elbow@base" name="base" />
		<Anim dict="anim@amb@office@seating@female@var_a@base@" name="idle_b" />
		<Anim dict="anim@amb@office@seating@female@var_b@base@" name="idle_a" />
		<Anim dict="anim_heist@arcade_combined@" name="world_human_hang_out_street@_male_a@_idle_a_idle_c" />
		<Anim dict="anim@amb@office@seating@male@var_c@base@" name="idle_c" />
		<Anim dict="anim@amb@clubhouse@mini@darts@" name="wait_idle" />
		<Anim dict="club_intro-100" name="csb_tonyprince_dual-100" />
		<Anim dict="club_intro-101" name="mp_m_freemode_01_dual-101" />
		<Anim dict="missheistdockssetup1ig_10@idle_b" name="talk_pipe_b_worker2" />
		<Anim dict="missheistdockssetup1ig_10@idle_d" name="talk_pipe_d_worker2" />
		<Anim dict="missheist_jewel_setup" name="idle_storeclerk" />
		<Anim dict="amb@world_human_hang_out_street@female_hold_arm@idle_a" name="idle_a" />
		<Anim dict="amb@world_human_hang_out_street@female_hold_arm@idle_a" name="idle_b" />
		<Anim dict="amb@world_human_hang_out_street@female_hold_arm@idle_a" name="idle_c" />
		<Anim dict="amb@world_human_leaning@female@smoke@idle_a" name="idle_c" />
		<Anim dict="amb@world_human_leaning@female@smoke@idle_a" name="idle_a" />
		<Anim dict="amb@world_human_leaning@female@wall@back@holding_elbow@idle_a" name="idle_a" />
		<Anim dict="amb@world_human_picnic@female@idle_a" name="idle_b" />
		<Anim dict="amb@world_human_picnic@female@idle_a" name="idle_c" />
		<Anim dict="amb@world_human_seat_steps@female@hands_by_sides@idle_a" name="idle_a" />
		<Anim dict="amb@world_human_seat_wall@female@hands_by_sides@idle_a" name="idle_c" />
		<Anim dict="anim@amb@nightclub@dancers@crowddance_groups@" name="hi_dance_crowd_09_v1_female^3" />
		<Anim dict="anim@amb@nightclub@peds@" name="mini_strip_club_lap_dance_ld_girl_a_song_a_p1" />
		<Anim dict="anim@mp_yacht@shower@female@" name="shower_idle_a" />
		<Anim dict="anim_casino_a@amb@casino@peds@" name="amb_world_human_hang_out_street_female_hold_arm_idle_b" />
		<Anim dict="random@street_race" name="_car_a_flirt_girl" />
		<Anim dict="bs_2a_mcs_10-2" name="csb_stripper_01_dual-2" />
		<Anim dict="move_f@sexy@a" name="idle" />
		<Anim dict="switch@michael@sitting_on_car_bonnet" name="sitting_on_car_bonnet_loop" />
		<Anim dict="amb@world_human_hang_out_street@female_hold_arm@base" name="base" />
		<Anim dict="anim@amb@casino@hangout@ped_female@stand@03a@base" name="base" />
		<Anim dict="anim@amb@casino@hangout@ped_female@stand@03b@base" name="base" />
		<Anim dict="amb@world_human_seat_wall@male@hands_in_lap@base" name="base" />
		<Anim dict="amb@world_human_seat_wall_eating@female@sandwich_right_hand@base" name="base" />
		<Anim dict="amb@world_human_seat_wall_eating@female@sandwich_right_hand@idle_a" name="idle_a" />
		<Anim dict="amb@world_human_prostitute@crackhooker@idle_a" name="idle_b" />
		<Anim dict="anim@amb@business@bgen@bgen_no_work@" name="sit_phone_phonepickup-noworkfemale" />
		<Anim dict="anim@amb@business@bgen@bgen_no_work@" name="sit_phone_phonepickup_nowork" />
		<Anim dict="anim@amb@business@bgen@bgen_no_work@" name="sit_phone_phoneputdown_fallasleep_nowork" />
		<Anim dict="cellphone@self@franklin@" name="peace" />
		<Anim dict="armenian_1_int-0" name="a_f_y_beach_01^2-0" />
		<Anim dict="armenian_1_int-0" name="a_m_y_surfer_01-0" />
		<Anim dict="armenian_1_int-0" name="cs_drfriedlander_dual-0" />
		<Anim dict="amb@world_human_prostitute@cokehead@base" name="base" />
		<Anim dict="amb@world_human_prostitute@french@base" name="base" />
		<Anim dict="amb@world_human_prostitute@hooker@base" name="base" />
		<Anim dict="mp_move@prostitute@f@cokehead" name="idle" />
		<Anim dict="mp_move@prostitute@f@hooker" name="idle" />
		<Anim dict="mp_move@prostitute@m@hooker" name="idle" />]]
-----------------------------------------------------------------------------------------------------------------

	-- {Playerlist}
		GenerateFeatures = function(pid)
			MX.toggle_loop(MX.player_root(pid), "Give Stealth Vehicle Godmode", {}, "Won't be detected as vehicle godmode by most menus", function(toggled)
				ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)), true, true, true, true, true, 0, 0, true)
				end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)), false, false, false, false, false, 0, 0, false)
				end)
			MX.toggle_loop(MX.player_root(pid), "Remove Vehicle Godmode", {}, "", function()
				local vehicle = get_player_veh(pid,true)
				if vehicle then	
					ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false) 
				end end)
			MX.toggle_loop(MX.player_root(pid), "Remove Godmode", {"removegm"}, "removes the players godmode by forcing camera forward. blocked by most menus", function()
				if not players.exists(pid) then
					util.stop_thread()
				end
				util.trigger_script_event(1 << pid, {801199324, pid, 869796886, math.random(0, 9999)})end)
			MX.action(MX.player_root(pid), "Remove Player Godmode", {}, "Blocked By Most menus", function()
				local playerpos = ENTITY.GET_ENTITY_COORDS(id)
				playerpos.z = playerpos.z + 3

				local khanjali = util.joaat("khanjali")
				STREAMING.REQUEST_MODEL(khanjali)
				while not STREAMING.HAS_MODEL_LOADED(khanjali) do
					util.yield()
				end

				local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
				local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
				local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
				local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

				ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
				ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
				ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
				ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
				util.yield(7500)
				entities.delete_by_handle(vehicle1)end)
			
				main = MX.list(MX.player_root(pid), "> Developer Options", {}, "", function(); end)
				MX.divider(main, "---> Account Boosting <---")
				MX.action(main, "All Collectibles", {"racboost"}, "", function(on)
						MX.trigger_commands("givecollectibles"..PLAYER.GET_PLAYER_NAME(pid))end)
				MX.action(main, "Rank Them Up", {"rankboost"}, "Gives them ~175k RP. Can boost a lvl 1 ~25 levels.", function()
						util.trigger_script_event(1 << pid, {-1178972880, pid, 5, 0, 1, 1, 1})
						for i = 0, 9 do
							util.trigger_script_event(1 << pid, {-1178972880, pid, 0, i, 1, 1, 1})
							util.trigger_script_event(1 << pid, {-1178972880, pid, 1, i, 1, 1, 1})
							util.trigger_script_event(1 << pid, {-1178972880, pid, 3, i, 1, 1, 1})
							util.trigger_script_event(1 << pid, {-1178972880, pid, 10, i, 1, 1, 1})
						end
						for i = 0, 1 do
							util.trigger_script_event(1 << pid, {-1178972880, pid, 2, i, 1, 1, 1})
							util.trigger_script_event(1 << pid, {-1178972880, pid, 6, i, 1, 1, 1})
						end
						for i = 0, 19 do
							util.trigger_script_event(1 << pid, {-1178972880, pid, 4, i, 1, 1, 1})
						end
						for i = 0, 99 do
							util.trigger_script_event(1 << pid, {-1178972880, pid, 9, i, 1, 1, 1})
							util.yield()
						end end)
				MX.divider(main, "---> "..PLAYER.GET_PLAYER_NAME(pid).." | RID: "..players.get_rockstar_id(pid).." <---")
			phistory = MX.list(MX.player_root(pid), "> Player History", {}, "", function(); end)
				MX.divider(phistory, "---> Add to Player History <---")
				MX.action(phistory, "Add to Friendlist", {"addfriend"}, "", function(on)
					if players.exists(pid) then
						MX.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." > Friendlist")
						util.toast(PLAYER.GET_PLAYER_NAME(pid).." added to your friendlist.")
					else
						util.toast("Failed.")
					end end)
				MX.action(phistory, "Add to Flaggedlist", {"addflagged"}, "", function(on)
					MX.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." > Flaggedlist")
					MX.trigger_commands("track"..PLAYER.GET_PLAYER_NAME(pid).." on")
					util.toast(PLAYER.GET_PLAYER_NAME(pid).." added to your Flagged list.")end)
				MX.action(phistory, "Add to Whitelist", {"addwhitelist"}, "", function(on)
					MX.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." > Whitelist")
					util.toast(PLAYER.GET_PLAYER_NAME(pid).." added to your Whitelist.")end)
				MX.action(phistory, "Add to Blocklist", {"addblocklist"}, "", function(on)
					MX.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." > Blocklist")
					MX.trigger_commands("track"..PLAYER.GET_PLAYER_NAME(pid).." on")
					MX.trigger_commands("historyblock"..PLAYER.GET_PLAYER_NAME(pid).." on")
					util.toast(PLAYER.GET_PLAYER_NAME(pid).." added to your blocklist.")end)
				MX.divider(phistory, "---> Delete from Player History <---")
				MX.action(phistory, "Delete Note", {"deletenote"}, "", function(on)
					MX.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).."")
					util.toast(PLAYER.GET_PLAYER_NAME(pid).." delete from your list.")end)
				MX.divider(phistory, "---> "..PLAYER.GET_PLAYER_NAME(pid).." | RID: "..players.get_rockstar_id(pid).." <---")
			protherstuff = MX.list(MX.player_root(pid), "> Weapon Options", {}, "", function(); end)
				MX.divider(protherstuff, "---> Give/Remove Weapons <---")
				giveweapons = MX.list(protherstuff, "Give Weapons", {}, "", function(); end)
					givemelee = MX.list(giveweapons, "> Melee", {}, "", function(); end)
						MX.action(givemelee, "Antique Cavalry Dagger", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x92A27487)end)
						MX.action(givemelee, "Baseball Bat", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x958A4A8F)end)
						MX.action(givemelee, "Broken Bottle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xF9E6AA4B)end)
						MX.action(givemelee, "Crowbar", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x84BD7BFD)end)
						MX.action(givemelee, "Flashlight", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x8BB05FD7)end)
						MX.action(givemelee, "Golf Club", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x440E4788)end)
						MX.action(givemelee, "Hammer", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x4E875F73)end)
						MX.action(givemelee, "Hatchet", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xF9DCBF2D)end)
						MX.action(givemelee, "Brass Knuckles", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xD8DF3C3C)end)
						MX.action(givemelee, "Knife", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x99B507EA)end)
						MX.action(givemelee, "Machete", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDD5DF8D9)end)
						MX.action(givemelee, "Switchblade", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDFE37640)end)
						MX.action(givemelee, "Nightstick", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x678B81B1)end)
						MX.action(givemelee, "Pipe Wrench", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x19044EE0)end)
						MX.action(givemelee, "Battle Axe", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xCD274149)end)
						MX.action(givemelee, "Pool Cue", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x94117305)end)
						MX.action(givemelee, "Stone Hatchet", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x3813FC08)end)
					givehandguns = MX.list(giveweapons, "> Handguns", {}, "", function(); end)
						MX.action(givehandguns, "Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x1B06D571)end)
						MX.action(givehandguns, "Pistol Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBFE256D4)end)
						MX.action(givehandguns, "Combat Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x5EF9FEC4)end)
						MX.action(givehandguns, "AP Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x22D8FE39)end)
						MX.action(givehandguns, "Stun Gun [SP]", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x3656C8C1)end)
						MX.action(givehandguns, "Pistol .50", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x99AEEB3B)end)
						MX.action(givehandguns, "SNS Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBFD21232)end)
						MX.action(givehandguns, "SNS Pistol Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x88374054)end)
						MX.action(givehandguns, "Heavy Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xD205520E)end)
						MX.action(givehandguns, "Vintage Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x83839C4)end)
						MX.action(givehandguns, "Flare Gun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x47757124)end)
						MX.action(givehandguns, "Marksman Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDC4DB296)end)
						MX.action(givehandguns, "Heavy Revolver", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xC1B3C3D1)end)
						MX.action(givehandguns, "Heavy Revolver Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xCB96392F)end)
						MX.action(givehandguns, "Double Action Revolver", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x97EA20B8)end)
						MX.action(givehandguns, "Up-n-Atomizer", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xAF3696A1)end)
						MX.action(givehandguns, "Ceramic Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x2B5EF5EC)end)
						MX.action(givehandguns, "Navy Revolver", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x917F6C8C)end)
						MX.action(givehandguns, "Perico Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x57A4368C)end)
						MX.action(givehandguns, "Stun Gun [MP]", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x45CD9CF3)end)
					givesubguns = MX.list(giveweapons, "> Submachine Guns", {}, "", function(); end)
						MX.action(givesubguns, "Micro SMG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x13532244)end)
						MX.action(givesubguns, "SMG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x2BE6766B)end)
						MX.action(givesubguns, "SMG Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x78A97CD0)end)
						MX.action(givesubguns, "Assault SMG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xEFE7E2DF)end)
						MX.action(givesubguns, "Combat PDW", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x0A3D4D34)end)
						MX.action(givesubguns, "Machine Pistol", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDB1AA450)end)
						MX.action(givesubguns, "Mini SMG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBD248B55)end)
						MX.action(givesubguns, "Unholy Hellbringer", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x476BF155)end)
					givesg = MX.list(giveweapons, "> Shotguns", {}, "", function(); end)
						MX.action(givesg, "Pump Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x1D073A89)end)
						MX.action(givesg, "Pump Shotgun Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x555AF99A)end)
						MX.action(givesg, "Sawed-Off Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x7846A318)end)
						MX.action(givesg, "Assault Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xE284C527)end)
						MX.action(givesg, "Bullpup Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x9D61E50F)end)
						MX.action(givesg, "Musket", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA89CB99E)end)
						MX.action(givesg, "Heavy Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x3AABBBAA)end)
						MX.action(givesg, "Double Barrel Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xEF951FBB)end)
						MX.action(givesg, "Sweeper Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x12E82D3D)end)
						MX.action(givesg, "Combat Shotgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x5A96BA4)end)
					giveAssRifles = MX.list(giveweapons, "> Assault Rifles", {}, "", function(); end)
						MX.action(giveAssRifles, "Assault Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBFEFFF6D)end)
						MX.action(giveAssRifles, "Assault Rifle Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x394F415C)end)
						MX.action(giveAssRifles, "Carbine Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x83BF0278)end)
						MX.action(giveAssRifles, "Carbine Rifle Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xFAD1F1C9)end)
						MX.action(giveAssRifles, "Advanced Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xAF113F99)end)
						MX.action(giveAssRifles, "Special Carbine", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xC0A3098D)end)
						MX.action(giveAssRifles, "Special Carbine Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x969C3D67)end)
						MX.action(giveAssRifles, "Bullpup Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x7F229F94)end)
						MX.action(giveAssRifles, "Bullpup Rifle Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x84D6FAFD)end)
						MX.action(giveAssRifles, "Compact Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x624FE830)end)
						MX.action(giveAssRifles, "Military Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x9D1F17E6)end)
						MX.action(giveAssRifles, "Heavy Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xC78D71B4)end)
						MX.action(giveAssRifles, "Tactical Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xD1D5F52B)end)
					givelmg = MX.list(giveweapons, "> Light Machine Guns", {}, "", function(); end)
						MX.action(givelmg, "MG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x9D07F764)end)
						MX.action(givelmg, "Combat MG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x7FD62962)end)
						MX.action(givelmg, "Combat MG Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDBBD7280)end)
						MX.action(givelmg, "Gusenberg Sweeper", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x61012683)end)
					givesr = MX.list(giveweapons, "> Sniper Rifles", {}, "", function(); end)
						MX.action(givesr, "Sniper Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x05FC3C11)end)
						MX.action(givesr, "Heavy Sniper", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x0C472FE2)end)
						MX.action(givesr, "Heavy Sniper Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA914799)end)
						MX.action(givesr, "Marksman Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xC734385A)end)
						MX.action(givesr, "Marksman Rifle Mk II", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x6A6C02E0)end)
						MX.action(givesr, "Precision Rifle", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x6E7DDDEC)end)
					givehw = MX.list(giveweapons, "> Heavy Weapons", {}, "", function(); end)
						MX.action(givehw, "RPG", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xB1CA77B1)end)
						MX.action(givehw, "Grenade Launcher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA284510B)end)
						MX.action(givehw, "Grenade Launcher Smoke", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x4DD2DC56)end)
						MX.action(givehw, "Minigun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x42BF8A85)end)
						MX.action(givehw, "Firework Launcher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x7F7497E5)end)
						MX.action(givehw, "Railgun", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x6D544C99)end)
						MX.action(givehw, "Homing Launcher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x63AB0442)end)
						MX.action(givehw, "Compact Grenade Launcher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x0781FE4A)end)
						MX.action(givehw, "Widowmaker", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xB62D1F67)end)
						MX.action(givehw, "Compact EMP Launcher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xDB26713A)end)
					givethrowmisc = MX.list(giveweapons, "> Throwables/Miscellaneous", {}, "", function(); end)
						MX.action(givethrowmisc, "Grenade", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x93E220BD)end)
						MX.action(givethrowmisc, "BZ Gas", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA0973D5E)end)
						MX.action(givethrowmisc, "Molotov Cocktail", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x24B17070)end)
						MX.action(givethrowmisc, "Sticky Bomb", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x2C3731D9)end)
						MX.action(givethrowmisc, "Proximity Mines", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xAB564B93)end)
						MX.action(givethrowmisc, "Snowballs", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x787F0BB)end)
						MX.action(givethrowmisc, "Pipe Bombs", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBA45E8B8)end)
						MX.action(givethrowmisc, "Baseball", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x23C9F95C)end)
						MX.action(givethrowmisc, "Tear Gas", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xFDBC8A50)end)
						MX.action(givethrowmisc, "Flare", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x497FACC3)end)
						MX.action(givethrowmisc, "Jerry Can", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x34A67B97)end)
						MX.action(givethrowmisc, "Parachute", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xFBAB5776)end)
						MX.action(givethrowmisc, "Fire Extinguisher", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x060EC506)end)
						MX.action(givethrowmisc, "Hazardous Jerry Can", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xBA536372)end)
						MX.action(givethrowmisc, "Fertilizer Can", {}, "", function(on)
							WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0x184140A1)end)
				delweapons = MX.list(protherstuff, "Delete Weapons", {}, "", function(); end)
					delmelee = MX.list(delweapons, "> Melee", {}, "", function(); end)
					delhandguns = MX.list(delweapons, "> Handguns", {}, "", function(); end)
					delsubguns = MX.list(delweapons, "> Submachine Guns", {}, "", function(); end)
					delAssRifles = MX.list(delweapons, "> Assault Rifles", {}, "", function(); end)
					dellmg = MX.list(delweapons, "> Light Machine Guns", {}, "", function(); end)
					delsr = MX.list(delweapons, "> Sniper Rifles", {}, "", function(); end)
					delhw = MX.list(delweapons, "> Heavy Weapons", {}, "", function(); end)
					delthrowmisc = MX.list(delweapons, "> Throwables/Miscellaneous", {}, "", function(); end)
			trolling = MX.list(MX.player_root(pid), "> Trolling Options", {}, "", function(); end)
				MX.divider(trolling, "---> Trolling Options <---")
				MX.toggle_loop(trolling, "Black Screen", {}, "", function()
					util.trigger_script_event(1 << pid, {-555356783, pid, math.random(1, 32), 32, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
					util.yield(1000)end)	
				soundspam = MX.list(trolling, "> Sound Spam", {}, "")
					MX.toggle_loop(soundspam, "SMS Spam", {}, "", function()
						util.trigger_script_event(1 << pid, {1670832796, pid, math.random(-2147483647, 2147483647)})end)
					MX.toggle_loop(soundspam, "Interior Invite", {}, "", function()
						util.trigger_script_event(1 << pid, {1111927333, pid, math.random(1, 6)})end)
					MX.toggle_loop(soundspam, "Invite Notification", {}, "", function()
						util.trigger_script_event(1 << pid, {-668341698, pid, math.random(1, 150), -1, -1})end)
					MX.toggle_loop(soundspam, "Collected Checkpoint", {}, "", function()
						util.trigger_script_event(1 << pid, {-1529596656, pid, -547323955, 0, 0, 0, 0, 0, 0, 0, pid, 0, 0, 0})
						util.yield(25)end)
					MX.toggle_loop(soundspam, "Character Notification", {}, "", function()
						util.trigger_script_event(1 << pid, {-634789188, pid, math.random(0, 178), 0, 0, 0})end)
					MX.toggle_loop(soundspam, "Error Notification", {}, "", function()
						util.trigger_script_event(1 << pid, {-1251171789, pid, math.random(-2147483647, 2147483647)})end)
				MX.divider(trolling, "---> PVP Options <---")
				MX.action(trolling, "Disable Ghost", {"disghost"}, "", function(on)
					Assistant("> Please wait, while I transfer the bounty.\n\n> Target: "..PLAYER.GET_PLAYER_NAME(pid), colors.blue)
					MX.trigger_commands("bounty"..PLAYER.GET_PLAYER_NAME(pid).." 1337")
					util.yield(10500)
					Assistant("> Transfer completed.\n\n> Target: "..PLAYER.GET_PLAYER_NAME(pid), colors.blue)end)
				MX.divider(trolling, "---> Tryharder Trolling <---")
				MX.action(trolling, "Remove Explosive Sniper", {}, "", function(on)
					WEAPON.REMOVE_WEAPON_FROM_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA914799)
					WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0xA914799)
					Assistant("> I removed explosive sniper from " .. PLAYER.GET_PLAYER_NAME(pid), colors.green)end)
			crash = MX.list(MX.player_root(pid), "> Kicks & Crashes", {}, "", function(); end)
				MX.divider(crash, "---> Basic Kicks <---")
				MX.action(crash, "Host-Kick", {"pthost"}, "Host Kick. Command: pthost", function()
					if NETWORK.NETWORK_IS_HOST() then
						NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
					end end)
				MX.action(crash, "Network Bail", {"ptbail"}, "Network Bail. Command: ptbail", function()
					util.trigger_script_event(1 << pid, {1674887089, players.user(), memory.read_int(memory.script_global(1892703 + 1 + (pid * 599) + 510))})end)
				MX.divider(crash, "---> Another Kicks/Crashes <---")
				MX.action(crash, "Kick", {"ptkick"}, "Normal kick. Command: ptkick", function()
					util.trigger_script_event(1 << pid, {111242367, pid, -210634234})end)
				MX.action(crash, "UwU Crash", {"ptuwu"}, "D0 Crash prevented by Stand. (Blocked by most PTs) Command: ptuwu", function()
					local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
					local hakuchou = util.joaat("hakuchou2")
    
					STREAMING.REQUEST_MODEL(hakuchou)
					while not STREAMING.HAS_MODEL_LOADED(hakuchou) do
						util.yield()
					end
    
					local vehicle = entities.create_vehicle(hakuchou, pos, 0)
					VEHICLE.SET_VEHICLE_MOD(vehicle, 34, 3, false)
					util.yield(1000)
					entities.delete_by_handle(vehicle)end)
				MX.divider(crash, "---> OP Kicks/Crashes <---")
				MX.action(crash, "Mother Nature Crash", {"ptmncrash"}, "Can crash 2Take1, Cherax etc. ptmncrash", function()
					local user = PLAYER.GET_PLAYER_PED(players.user())
					local model = util.joaat("h4_prop_bush_mang_ad")
					local pos = players.get_position(pid)
					local oldPos = players.get_position(players.user())
					BlockSyncs(pid, function() -- blocking outgoing syncs to prevent the lobby from crashing :5head:
						util.yield(100)
						ENTITY.SET_ENTITY_VISIBLE(user, false)
						ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
						PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
						PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
						util.yield(500)
						PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
						util.yield(2500)
						TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
						for i = 1, 5 do
							util.spoof_script("freemode", SYSTEM.WAIT) -- preventing wasted screen
						end
						ENTITY.SET_ENTITY_HEALTH(user, 0) -- killing ped because it will still crash others until you die (clearing tasks doesnt seem to do much)
						NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
						ENTITY.SET_ENTITY_VISIBLE(user, true)
					end)end) end

		-- (Playerlist Code)
			local InitialPlayersList = players.list(true, true, true)
				for i=1, #InitialPlayersList do
    				GenerateFeatures(InitialPlayersList[i])
				end
			InitialPlayersList = nil
				players.on_join(GenerateFeatures)

	-- {Starting Script Message}
		Assistant("Hello "..SOCIALCLUB._SC_GET_NICKNAME().."!!!", colors.pink)
		Assistant("I'm Mira, your "..MXName.." assistant. I will support you so that you can play safely in GTA Online. Have fun and see you later. ;)", colors.pink)

	-- {Script End Message}
		util.on_stop(function()
			Assistant("Bye "..SOCIALCLUB._SC_GET_NICKNAME().."!!!", colors.pink)end)
		-- (Buttom Text)
			MX.divider(MX.my_root(), "---> Version: "..MXVersion.." <---")

	-- {End Script}
		util.create_tick_handler(function()
			if TASK.GET_IS_TASK_ACTIVE(players.user_ped(), 2) then --when exiting a car
				setCarOptions(false)
			end
			local carCheck = entities.get_user_vehicle_as_handle()
			if players_car != carCheck then
				players_car = carCheck
				setCarOptions(true)
			end end)	
	    while true do
			if MX.is_open() == true then
				local current_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
					if current_equipped_weapon == last_equipped_weapon then
					else
						last_equipped_weapon = current_equipped_weapon
						MX.delete(attachment_tab)
						attachment_tab = MX.list(weaponattachments,"Attachments",{},"See available attachments for your equipped weapon")
						for key, value in pairs(attachments_table) do
							local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
							if WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(curr_equipped_weapon, key) == true then
								MX.action(attachment_tab,value,{value},"Attach " .. value .. "to your current weapon",function(on_click)
										WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()),curr_equipped_weapon,key)
								end)
							end
						end
					end
			end
		    util.yield() end