function create_option(_index,_name,_icon,_files,_optifine=false, _conflicts=[]){
	//conflicts will be an array with the size of 0, so check size above 0 for if option has conflicts
	
	
	//option struct data
	option = {
		my_id : 0,
		index : _index,
		icon : _icon,
		str_name : _name,
		files : _files,
		is_optifine : _optifine,
		conflicts : _conflicts,
		
		//settings for option object
		settings : {
			is_enabled : false,
			is_conflicted : false
		}
	};
	
	//add options to list index to get array position later
	var option_name = string_replace(_name,"\n"," ");
	ds_list_set(global.options_index,_index,option_name);
	
	//returns built struct
	return(option);
}

function create_global_options_array(){

var i = 0;
global.options_array[i] =	create_option(i,	"Datapack Assets",					spr_datapack,			["_datapack\\"],									true);
global.options_array[++i] = create_option(i+1,	"Plugin Assets",					spr_plugin_assets,		["_plugin\\"],										true);
global.options_array[++i] = create_option(i+1,	"Optifine Colors"+"\n"+"Helper",	spr_opt_color_helper,	["_Optifine options\\optifine colors helper\\"],	true);
global.options_array[++i] = create_option(i+1,	"Lang assets",						spr_evanski_lang,		["gui\\evanski lang\\"],);
global.options_array[++i] = create_option(i+1,	"Entity Fire"+"\n"+"Patch",			spr_entity_fire,		["patches\\entity fire\\"], false, ["Black Fire"]);
										  
global.options_array[++i] = create_option(i+1,	"Vanilla Memes",					spr_vanillia_meme,		["vanilla memes\\"],);
global.options_array[++i] = create_option(i+1,	"Infestation"+"\n"+"Vision",		spr_silverfish_vision,	["helpful\\infestation vision\\"],);
global.options_array[++i] = create_option(i+1,	"Inverted Grass",					spr_inverted_grass,		["helpful\\inverted grass\\"],						true);
global.options_array[++i] = create_option(i+1,	"Inverted Plants",					spr_inverted_plants,	["helpful\\inverted plants\\"],);
global.options_array[++i] = create_option(i+1,	"Lightning Water",					spr_lighning_water,		["helpful\\lightning water\\"],						true);
										  
global.options_array[++i] = create_option(i+1,	"Evanski Loading"+"\n"+"screen",	spr_evanski_loading,	["gui\\evanski loading screen\\"],);
global.options_array[++i] = create_option(i+1,	"Chaos Title"+"\n"+"screen",		spr_title_screen,		["gui\\chaos title screen\\"],);
global.options_array[++i] = create_option(i+1,	"Splish Splash",					spr_splash,				["gui\\splish splash\\"],);
global.options_array[++i] = create_option(i+1,	"Background Option",				spr_background_option,	["gui\\background option\\"],);
global.options_array[++i] = create_option(i+1,	"Red Boss Bars",					spr_red_bar,			["_Optifine options\\red boss bars\\"],);										  
global.options_array[++i] = create_option(i+1,	"Rainbow XP",						spr_rainbow_xp,			["_Optifine options\\rainbow xp\\"],);
global.options_array[++i] = create_option(i+1,	"yrotnevnI",						spr_inven,				["gui\\yrotnevni\\"],);
global.options_array[++i] = create_option(i+1,	"Pumpkin UI",						spr_pumpkin_ui,			["gui\\pumpkin ui\\"],);
global.options_array[++i] = create_option(i+1,	"Teletubby Sun",					spr_sun,				["retextures\\teletubby sun\\"],);
global.options_array[++i] = create_option(i+1,	"Meme Moon",						spr_moon,				["retextures\\moon faces\\"],);
global.options_array[++i] = create_option(i+1,	"Nic Cage Rain",					spr_rain,				["retextures\\nic cage rain\\"],);
global.options_array[++i] = create_option(i+1,	"Pikachu Shadows",					spr_pikachu_shadows,	["gui\\pikachu_shadows"],);

global.options_array[++i] = create_option(i+1,	"True Iron"+"\n"+"Crafting",		spr_true_iron,			["retextures\\true iron crafting\\"],);
global.options_array[++i] = create_option(i+1,	"Wacky items",						spr_wacky_item,			["retextures\\wacky items\\"],);
global.options_array[++i] = create_option(i+1,	"MC Armory",						spr_mc_armory,			["_Optifine options\\mc armory\\"], true);
global.options_array[++i] = create_option(i+1,	"Rubies",							spr_rubies,				["retextures\\rubies\\"],);
global.options_array[++i] = create_option(i+1,	"Wooden Buckets",					spr_wooden_bucket,		["retextures\\wooden buckets\\"],);
global.options_array[++i] = create_option(i+1,	"Iron bowls",						spr_iron_bowls,			["retextures\\iron bowls\\"],);
global.options_array[++i] = create_option(i+1,	"Bluestone",						spr_bluestone,			["retextures\\bluestone\\"], false, ["RGB Gamer Lamp"]);
global.options_array[++i] = create_option(i+1,	"RGB Gamer Lamp",					spr_gamerlamp,			["retextures\\gamer Lamp\\"], false, ["Bluestone"]);
global.options_array[++i] = create_option(i+1,	"Green lantern",					spr_lantern,			["retextures\\green lantern\\"],);										  
global.options_array[++i] = create_option(i+1,	"Paintings",						spr_paintings,			["retextures\\paintings\\"],);
global.options_array[++i] = create_option(i+1,	"Rick Break",						spr_rick_break,			["retextures\\rick break\\"],);
global.options_array[++i] = create_option(i+1,	"Reverse Uno",						spr_uno,				["retextures\\reverse uno\\"],);
global.options_array[++i] = create_option(i+1,	"Pumpkomelon",						spr_pumpmelon,			["retextures\\pumkomelon\\"],);
global.options_array[++i] = create_option(i+1,	"Anime beds",						spr_anime_beds,			["retextures\\anime beds\\"],);										  
global.options_array[++i] = create_option(i+1,	"Evanski Banner",					spr_evanski_banner,		["retextures\\evanski banner\\"],);
global.options_array[++i] = create_option(i+1,	"Glitched Grass",					spr_glitched_grass,		["retextures\\glitched grass\\"],);
global.options_array[++i] = create_option(i+1,	"Glitched Moss",					spr_glitched_moss,		["retextures\\glitched moss\\"],);
global.options_array[++i] = create_option(i+1,	"Black Nether"+"\n"+"Portal",		spr_black_portal,		["retextures\\black nether portal\\"],);
global.options_array[++i] = create_option(i+1,	"Black Lava",						spr_black_lava,			["retextures\\black lava\\"],);										  
global.options_array[++i] = create_option(i+1,	"Black Fire",						spr_black_fire,			["retextures\\black fire\\"], false, ["Entity Fire Patch"]);
global.options_array[++i] = create_option(i+1,	"White Fire",						spr_white_fire,			["retextures\\white soul fire\\"],);
global.options_array[++i] = create_option(i+1,	"leather armor",					spr_leather_armor,		["retextures\\leather armor\\"],);
global.options_array[++i] = create_option(i+1,	"Gay Cobblestone",					spr_gay_cobble,			["retextures\\gay cobble stone\\"],);
global.options_array[++i] = create_option(i+1,	"Craftfurnace",						spr_craftfurnace,		["retextures\\crafting furnace\\"],);
global.options_array[++i] = create_option(i+1,	"Moving Grass",						spr_moving_grass,		["retextures\\moving grass\\"],);
global.options_array[++i] = create_option(i+1,	"Upside down"+"\n"+"torches",		spr_torch,				["retextures\\torch\\"],);
global.options_array[++i] = create_option(i+1,	"Steve Boats",						spr_steveboat,			["_Optifine options\\steve boat\\"],);
										  
global.options_array[++i] = create_option(i+1,	"Berry Bee Benson",					spr_berrybeebenson,		["mobs\\barry bee benson\\"],);
global.options_array[++i] = create_option(i+1,	"Freddy",							spr_freddy,				["mobs\\freddy\\"],);
global.options_array[++i] = create_option(i+1,	"Swole villager",					spr_swole,				["mobs\\swole villager\\"],);
global.options_array[++i] = create_option(i+1,	"Vexing Merc",						spr_vex,				["mobs\\vexing merc\\"],);
										  
global.options_array[++i] = create_option(i+1,	"Beta Pigs",						spr_beta_pigs,			["_Optifine options\\mobs\\beta pigs\\"],				true);
global.options_array[++i] = create_option(i+1,	"Boats with Legs",					spr_boat_with_legs,		["_Optifine options\\mobs\\boats with legs\\"],			true);
global.options_array[++i] = create_option(i+1,	"Creeper Bird",						spr_creeper_bird,		["_Optifine options\\mobs\\creeper bird\\"],			true);
global.options_array[++i] = create_option(i+1,	"Creeper"+"\n"+"Girlfriend",		spr_creeper_gf,			["_Optifine options\\mobs\\creeper girlfriend\\"],		true);
global.options_array[++i] = create_option(i+1,	"Evanski Ghasts",					spr_evanski_ghast,		["_Optifine options\\mobs\\evanski ghasts\\"],			true);										  
global.options_array[++i] = create_option(i+1,	"Gangsters",						spr_gangsters,			["_Optifine options\\mobs\\gangsters\\"],				true);
global.options_array[++i] = create_option(i+1,	"Hoppers",							spr_hoppers,			["_Optifine options\\mobs\\hoppers\\"],					true);
global.options_array[++i] = create_option(i+1,	"Infernos",							spr_infernos,			["_Optifine options\\mobs\\infernos\\"],				true);
global.options_array[++i] = create_option(i+1,	"llama traders",					spr_llama_traders,		["_Optifine options\\mobs\\llama traders\\"],			true);
global.options_array[++i] = create_option(i+1,	"Lost Souls",						spr_lost_souls,			["_Optifine options\\mobs\\lost souls\\"],				true);										  
global.options_array[++i] = create_option(i+1,	"Piglin Girls",						spr_piglin_girls,		["_Optifine options\\mobs\\piglin girls\\"],			true);
global.options_array[++i] = create_option(i+1,	"Vector",							spr_vector,				["_Optifine options\\mobs\\vector\\"],					true);
global.options_array[++i] = create_option(i+1,	"Zombi-me",							spr_zombie_me,			["_Optifine options\\mobs\\zomb-me-s\\"],				true);
										  
										  
global.options_array[++i] = create_option(i+1,	"Big Smoke Swords",					spr_bigsmoke,			["sounds\\big smoke swords\\"],		false);
global.options_array[++i] = create_option(i+1,	"Cat sounds",						spr_catsounds,			["sounds\\cat sounds\\"],			false);																																			 
global.options_array[++i] = create_option(i+1,	"Edgy Enderman",					spr_edgy_enderman,		["sounds\\edgy endermen\\"],		false);
global.options_array[++i] = create_option(i+1,	"Endereye Pew",						spr_endereye_pew,		["sounds\\endereye pew\\"],			false);
global.options_array[++i] = create_option(i+1,	"Evanski Records",					spr_evanski_records,	["sounds\\evanski records\\"],		false);
global.options_array[++i] = create_option(i+1,	"gilbert parrots",					spr_gilbert_parrots,	["sounds\\gilbert parrots\\"],		false);
global.options_array[++i] = create_option(i+1,	"Gordon Dragon",					spr_gordon_dragon,		["sounds\\gordon dragon\\"],		false);
global.options_array[++i] = create_option(i+1,	"HaHa Anvils",						spr_haha_anvils,		["sounds\\haha anvils\\"],			false);																																				
global.options_array[++i] = create_option(i+1,	"Kaboom",							spr_kaboom,				["sounds\\kaboom\\"],				false);
global.options_array[++i] = create_option(i+1,	"Lemon Fuse",						spr_lemon_fuse,			["sounds\\lemon grab fuse\\"],		false);
global.options_array[++i] = create_option(i+1,	"Lightning Sounds",					spr_lighting_sounds,	["sounds\\lightning sounds\\"],		false);
global.options_array[++i] = create_option(i+1,	"Nyan Wings",						spr_nyan_wings,			["sounds\\nyan wings\\"],			false);
global.options_array[++i] = create_option(i+1,	"Punch Dragon",						spr_punch_dragon,		["sounds\\punch the dragon\\"],		false);																																			 
global.options_array[++i] = create_option(i+1,	"Raid"+"\n"+"Shadow Legends",		spr_raid,				["sounds\\raid shadow legends\\"],	false);
global.options_array[++i] = create_option(i+1,	"Rimmy Speak",						spr_rimmy,				["sounds\\rimmy speak\\"],			false);
global.options_array[++i] = create_option(i+1,	"Rip-Tide",							spr_riptide,			["sounds\\rip tide\\"],				false);
global.options_array[++i] = create_option(i+1,	"Tardis Portal",					spr_tardis_portal,		["sounds\\tardis portal\\"],		false);
global.options_array[++i] = create_option(i+1,	"The Illaging",						spr_the_illaging,		["sounds\\the illaging\\"],			false);																																			
global.options_array[++i] = create_option(i+1,	"Trap Chests",						spr_trap_chests,		["sounds\\trap chests\\"],			false);
global.options_array[++i] = create_option(i+1,	"Call an Ambulance",				spr_undying,			["sounds\\undying\\"],				false);
global.options_array[++i] = create_option(i+1,	"Wood Moans",						spr_wood_moans,			["sounds\\wood moans\\"],			false);
global.options_array[++i] = create_option(i+1,	"Pufferfish Augh",					spr_pufferfish,			["sounds\\pufferfish augh\\"],		false);
global.options_array[++i] = create_option(i+1,	"Sploosh Splash",					spr_sploosh,			["sounds\\sploosh splash\\"],		false);
}
