/*
------------------------------------------------------------------------------
						Script Developed by Sean McElholm
					Based on MySQL R41-4 Cache Login Registration

* 3rd Party Credits:
	Y_Less - Foreach and YSI
	Incognito - Streamer
	YourShadow - Pawn.CMD
	d0 - mSelection
	_Emmet - Callbacks
	BlueG - MySQL Plugin
	Gammix - Attachments
	Maddinat0r - Discord Connector
	Zeex - CrashDetect
	RogueDrifter - Anticheat Pack
------------------------------------------------------------------------------
*/
#include 	<a_samp>

// Check if IsValidVehicle exists, if not then define it.
#if !defined IsValidVehicle
    native IsValidVehicle(vehicleid);
#endif

// Check if gpci exists, if not then define it.
#if !defined gpci
    native gpci(playerid, serial[], len);
#endif

// No need to touch this, as it does nothing really.
#define		SERVER_GM_TEXT		"UG-RP"

// Server Info
#define		SERVER_WEBSITE		"ug-rp.com"
#define		SERVER_TEAMSPEAK	"ug-rp.com"
#define		SERVER_DISCORD		"www.sa-mp.com"

#define function%0(%1) forward%0(%1); public%0(%1)

// change MAX_PLAYERS to the amount of players (slots) you want
// It is by default 1000 (as of 0.3.7)
#undef	  	MAX_PLAYERS
#define	 	MAX_PLAYERS			100

#undef INVALID_TEXT_DRAW
#define INVALID_TEXT_DRAW (Text:0xFFFF)

#define     ManualUse // Do not remove this, it's required for the AntiCheat.
#define		PROFILE_BUILD
//#define		DEBUG_BUILD

// Fixes
#define 	FIXES_ServerVarMsg 	0
#include 	<fixes>

// Plugin Headers
#include 	<a_mysql>
#include 	<crashdetect>
#include 	<streamer>
#include 	<Pawn.CMD>
#include 	<sscanf2>
#include 	<discord-connector>
#include 	<samp_bcrypt>

#if defined PROFILE_BUILD
	#include <plugin_profiler>
#endif

// Non Plugin Headers
#include 	<YSI_Coding\y_timers>
#include 	<YSI_Coding\y_hooks>
#include 	<Rogue-AC.inc>
#include 	<mSelection>
#include 	<callbacks>
#include 	<attachments>
#include 	<evi>
#include 	<mapandreas>

#include 	<libdcrp>

// Do not change the include order as it may cause compiling errors.
#include 	"./Source/Utility/defines.pwn"
#include 	"./Source/Utility/timefunc.pwn"
#include 	"./Source/Utility/number.pwn"
#include 	"./Source/Core/variables.pwn"
#include 	"./Source/Chat/announce.pwn"
#include 	"./Source/Properties/rental.pwn"
#include 	"./Source/Core/vehicle.pwn"
#include 	"./Source/Core/modshop.pwn"
#include 	"./Source/Core/mysql.pwn"

#include 	"./Source/Core/proxy.pwn"
#include 	"./Source/Core/fire.pwn"
#include 	"./Source/Core/damages.pwn"
#include 	"./Source/Core/camp_fire.pwn"
#include 	"./Source/Character/nametag.pwn"

#include 	"./Source/Properties/House.pwn"
#include 	"./Source/Properties/furniture.pwn"
#include 	"./Source/Properties/business.pwn"

#include 	"./Source/Boombox/boombox.pwn"
#include 	"./Source/Boombox/xmr.pwn"

#include 	"./Source/Core/gaspumps.pwn"
#include 	"./Source/Properties/entrance.pwn"
#include 	"./Source/Properties/doors.pwn"
#include 	"./Source/Properties/dealership.pwn"
#include 	"./Source/Properties/complex.pwn"
#include 	"./Source/mapping/payphones.pwn"
#include 	"./Source/Core/drugs.pwn"
#include 	"./Source/Character/inventory.pwn"
#include 	"./Source/Properties/atm.pwn"
#include 	"./Source/Core/labels.pwn"
#include 	"./Source/Core/trash.pwn"

#include 	"./Source/Jobs/fishing.pwn"

#include 	"./Source/mapping/CoreMap.pwn"
#include 	"./Source/mapping/police.pwn"
#include 	"./Source/mapping/street.pwn"

#include 	"./Source/Utility/message.pwn"
#include 	"./Source/Utility/name.pwn"
#include 	"./Source/Utility/FileHandle.pwn"
#include 	"./Source/Utility/logging.pwn"

#include 	"./Source/Character/anim.pwn"

#include 	"./Source/Core/phone.pwn"

#include 	"./Source/Faction/Faction.pwn"
#include 	"./Source/Faction/blackmarket.pwn"
#include 	"./Source/Faction/locker_wep.pwn"
#include 	"./Source/Faction/locker_skins.pwn"
#include 	"./Source/Faction/Government.pwn"
#include 	"./Source/Faction/Police.pwn"
#include 	"./Source/Faction/mdc.pwn"
#include 	"./Source/Faction/bolo.pwn"
#include 	"./Source/Faction/roadblocks.pwn"
#include 	"./Source/Faction/spikes.pwn"
#include 	"./Source/Faction/jailpos.pwn"
#include 	"./Source/Faction/news.pwn"
#include 	"./Source/Faction/illegal.pwn"

#include 	"./Source/Core/timers.pwn"
#include 	"./Source/Character/CharacterCreation.pwn"
#include 	"./Source/Core/callbacks.pwn"
#include 	"./Source/Core/gamemode.pwn"
#include 	"./Source/Core/login.pwn"
#include 	"./Source/Core/weapon.pwn"

#include 	"./Source/Advertising/advertisement.pwn"

#include 	"./Source/Chat/chat.pwn"
#include 	"./Source/Chat/emote.pwn"
#include 	"./Source/Chat/ooc.pwn"

#include 	"./Source/Core/general.pwn"
#include 	"./Source/Core/setplayer.pwn"

#include 	"./Source/Character/damages.pwn"

#include 	"./Source/Admin/mapper.pwn"
#include 	"./Source/Admin/tester.pwn"
#include 	"./Source/Admin/staff.pwn"
#include 	"./Source/Admin/spectate.pwn"
#include 	"./Source/Admin/ajail.pwn"
#include 	"./Source/Admin/admin.pwn"
#include 	"./Source/Admin/report.pwn"
#include 	"./Source/Admin/ban.pwn"
#include 	"./Source/Admin/helper.pwn"
#include 	"./Source/Admin/helpme.pwn"
#include 	"./Source/Weapons/weapondrop.pwn"
#include 	"./Source/Core/discord.pwn"

#include 	"./Source/AntiCheat/anticheat.pwn"

#include 	"./Source/Core/payday.pwn"

#include 	"./Source/Character/LoadCharacter.pwn"
#include 	"./Source/Core/location.pwn"
#include 	"./Source/Character/clothing.pwn"

#include 	"./Source/Core/radio.pwn"

#include 	"./Source/Interiors/HouseInts.pwn"
#include 	"./Source/Interiors/Nightclub.pwn"
#include 	"./Source/Interiors/Apartment.pwn"
#include 	"./Source/Interiors/MobInterior.pwn"

#include 	"./Source/Jobs/JobCore.pwn"
#include 	"./Source/Jobs/taxi.pwn"
#include 	"./Source/Jobs/trucker.pwn"
#include 	"./Source/Jobs/mechanic.pwn"
#include 	"./Source/Admin/mapping.pwn"
#include 	"./Source/Core/donate.pwn"
#include 	"./Source/Jobs/sweeper.pwn"
#include 	"./Source/Jobs/farmer.pwn"
#include 	"./Source/Jobs/trash.pwn"
#include 	"./Source/Jobs/miner.pwn"
#include 	"./Source/Jobs/bus_driver.pwn"

#include 	"./Source/Core/teleports.pwn"
#include 	"./Source/Core/restaurant.pwn"


main() 
{
	print("-------------------------------------------");
	print("United Gaming Roleplay");
	print("Copyright (C) 2019 United Gaming LLC");
	print("All Rights Reserved");
	printf("Compiled: %s %s", __date, __time);
	print("-------------------------------------------");
}

public OnGameModeInit()
{
    new initTick = GetTickCount();
    print("[SERVER]: Starting Gamemode...");
    print("==========================================================");
    
    print("[SYSTEM]: Initializing MapAndreas...");
    MapAndreas_Init(MAP_ANDREAS_MODE_MINIMAL);
    print("[SYSTEM]: MapAndreas initialized successfully.");
	
    print("[SYSTEM]: Connecting to MySQL database...");
    SQL_Init();

    print("[SYSTEM]: Setting gamemode configuration...");
    SetGameModeText(SERVER_GM_TEXT);
    ShowNameTags(false);
    DisableInteriorEnterExits();
    EnableStuntBonusForAll(false);
    print("[SYSTEM]: Gamemode configuration finished.");

    print("[SYSTEM]: Configuring streamer and vehicle settings...");
    Streamer_TickRate(100);
    ManualVehicleEngineAndLights();
    print("[SYSTEM]: Streamer and vehicle settings configured.");

    print("[SYSTEM]: Setting server time and weather...");
    gettime(ServerInfo[CurrentHour], ServerInfo[CurrentMinute], ServerInfo[CurrentSecond]);
    RandomWeather();
    print("[SYSTEM]: Server time and weather set.");

    print("[SYSTEM]: Loading skin selection menus...");
    maleList   = LoadModelSelectionMenu("males.skn");
    femaleList = LoadModelSelectionMenu("females.skn");
    BuyList    = LoadModelSelectionMenu("buy.skn");
    print("[SYSTEM]: Skin selection menus loaded successfully.");

    print("[SYSTEM]: Resetting vehicle parameters...");
    for (new x = 0; x < MAX_VEHICLES; x++)
    {
        LightPwr[x] = 1;
        Flasher[x] = 0;
        FlasherState[x] = 0;
        SetVehicleParamsCarWindows(x, 1, 1, 1, 1);
        SetVehicleParamsEx(x, 0, 0, 0, 0, 0, 0, 0);
        CoreVehicle[x][VehicleFuel] = 100.0;
        CoreVehicle[x][TrashAmount] = 0;
        CoreVehicle[x][RadioURL][0] = 0;
    }
    print("[SYSTEM]: Vehicle parameters reset successfully.");

    print("[SYSTEM]: Loading pickups and 3D text labels...");
    for(new i; i < sizeof(SprayShop); i++)
    {
        CreateDynamic3DTextLabel("Pay & Spray\n{FFFFFF}Type {33AA33}/enter{FFFFFF} to enter", 0x33AA33FF, SprayShop[i][0], SprayShop[i][1], SprayShop[i][2] + 0.50, 50.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0, -1, 50.0);
        CreateDynamicPickup(1318, 1, SprayShop[i][0], SprayShop[i][1], SprayShop[i][2]);
    }
    CreateDynamic3DTextLabel("Fort Carson Town Hall\n{FFFFFF}/payfine, /signcheque", 0x33AA33FF, 1346.8292, 1571.4750, -13.5820 + 0.50, 20.0);
    CreateDynamicPickup(1239, 1, 1346.8292, 1571.4750, -13.5820);
    print("[SYSTEM]: Pickups and 3D text labels loaded successfully.");

    print("[SYSTEM]: Loading payphones...");
    InitPayphones();
    print("[SYSTEM]: Payphones loaded successfully.");

    print("[SYSTEM]: Loading static maps and interiors...");
    LoadStaticMaps();
    LoadBlankHouseInteriors();
    print("[SYSTEM]: Static maps and interiors loaded successfully.");

    print("[SYSTEM]: Setting up player classes and textdraws...");
    AddPlayerClass(1, DEFAULT_POS_X, DEFAULT_POS_Y, DEFAULT_POS_Z, DEFAULT_POS_A, 0, 0, 0, 0, 0, 0);

    AnimText = TextDrawCreate(435.0, 426.0, "Press ~r~~k~~PED_SPRINT~~w~ to stop animation");
    TextDrawBackgroundColor(AnimText, 255);
    TextDrawFont(AnimText, 2);
    TextDrawLetterSize(AnimText, 0.26, 1.3);
    TextDrawColor(AnimText, -1);
    TextDrawSetOutline(AnimText, 1);
    TextDrawSetProportional(AnimText, true);
    print("[SYSTEM]: Player classes and textdraws setup completed.");

    print("[SYSTEM]: Configuring server commands...");
    SendRconCommand("conncookies 1");
    SendRconCommand("cookielogging 1");
    SendRconCommand("chatlogging 0");
    print("[SYSTEM]: Server commands configured.");

    print("[SYSTEM]: Loading fishing pier and jobs...");
    LoadFishingPier();
    Init_Jobs();
    print("[SYSTEM]: Fishing pier and jobs loaded successfully.");

    print("[SYSTEM]: Enabling anticheat system...");
    gAnticheat = true;
    print("[SYSTEM]: Anticheat system enabled.");

    print("[SYSTEM]: Configuring streamer settings...");
    Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 1000);
    Streamer_SetTickRate(20);
    print("[SYSTEM]: Streamer settings configured.");

    print("[SYSTEM]: Configuring server properties...");
    new str[128];
    SendRconCommand("mapname Bone County");
    format(str, sizeof str, "weburl %s", ServerInfo[ServerWebsite]);
    SendRconCommand(str);
    SendRconCommand("language English");
    format(str, sizeof str, "hostname %s", ServerInfo[ServerName]);
    SendRconCommand(str);

    gettime(.hour = ServerInfo[CurrentHour], .minute = ServerInfo[CurrentMinute], .second = ServerInfo[CurrentSecond]);
    SetWorldTime(ServerInfo[CurrentHour]);

    if(strlen(SERVER_PASSWORD) > 0)
    {
        format(str, sizeof str, "password %s", SERVER_PASSWORD);
        SendRconCommand(str);
    }
    else SendRconCommand("password 0");

    if(strlen(ServerInfo[ServerRevision]) > 0)
    {
        format(str, sizeof str, "DC-RP %s", ServerInfo[ServerRevision]);
        SetGameModeText(str);
    }
    else SetGameModeText("DC-RP");
    print("[SYSTEM]: Server properties configured successfully.");

    print("==========================================================");
    printf("Gamemode Round Started: %s (Tick: %d)", GetDateTime(), GetTickCount()-initTick);
    print("==========================================================");
	return 1;
}

forward OnSQLConnected();
public OnSQLConnected()
{
    print("==========================================================");
    print("[MYSQL]: Connection established, loading database data...");
    print("==========================================================");

    print("[SYSTEM]: Setting up player table...");
    SetupPlayerTable();
    print("[SYSTEM]: Player table setup completed.");

    print("[SYSTEM]: Loading server settings...");
    LoadSettings();
    print("[SYSTEM]: Server settings loaded.");

    print("[SYSTEM]: Loading factions...");
    LoadFactions();
    printf("[SYSTEM]: Factions loaded successfully.");

    print("[SYSTEM]: Loading vehicles...");
    LoadVehicles();
    printf("[SYSTEM]: Vehicles loaded successfully.");

    print("[SYSTEM]: Loading mapping objects...");
    LoadMapping();
    print("[SYSTEM]: Mapping objects loaded.");

    print("[SYSTEM]: Loading houses...");
    LoadHouses();
    printf("[SYSTEM]: Houses loaded successfully.");

    print("[SYSTEM]: Loading businesses...");
    LoadBusinesses();
    printf("[SYSTEM]: Businesses loaded successfully.");

    print("[SYSTEM]: Loading entrances...");
    LoadEntrance();
    printf("[SYSTEM]: Entrances loaded successfully.");

    print("[SYSTEM]: Loading gates...");
    LoadGates();
    printf("[SYSTEM]: Gates loaded successfully.");

    print("[SYSTEM]: Loading jails...");
    LoadJails();
    printf("[SYSTEM]: Jails loaded successfully.");

    print("[SYSTEM]: Loading dealership...");
    LoadDealership();
    printf("[SYSTEM]: Dealership loaded successfully.");

    print("[SYSTEM]: Loading gas pumps...");
    LoadGasPumps();
    printf("[SYSTEM]: Gas pumps loaded successfully.");

    print("[SYSTEM]: Loading streets...");
    LoadStreets();
    printf("[SYSTEM]: Streets loaded successfully.");

    print("[SYSTEM]: Loading graffiti...");
    LoadGraffiti();
    printf("[SYSTEM]: Graffiti loaded successfully.");

    print("[SYSTEM]: Loading complexes...");
    LoadComplexes();
    printf("[SYSTEM]: Complexes loaded successfully.");

    print("[SYSTEM]: Loading teleports...");
    LoadTeleports();
    printf("[SYSTEM]: Teleports loaded successfully.");

    print("[SYSTEM]: Loading weed plants...");
    LoadWeeds();
    printf("[SYSTEM]: Weed plants loaded successfully.");

    print("[SYSTEM]: Loading ATMs...");
    LoadATMs();
    printf("[SYSTEM]: ATMs loaded successfully.");

    print("[SYSTEM]: Loading rental vehicles...");
    LoadRentalVehicles();
    printf("[SYSTEM]: Rental vehicles loaded successfully.");

    print("[SYSTEM]: Loading trucker positions...");
    LoadTruckerPositions();
    printf("[SYSTEM]: Trucker positions loaded successfully.");

    print("[SYSTEM]: Loading economy data...");
    LoadEconomy();
    printf("[SYSTEM]: Economy data loaded successfully.");

    print("[SYSTEM]: Loading sweeper vehicles...");
    LoadSweeperVehicles();
    printf("[SYSTEM]: Sweeper vehicles loaded successfully.");

    print("[SYSTEM]: Loading player BOLOs...");
    LoadPBolos();
    printf("[SYSTEM]: Player BOLOs loaded successfully.");

    print("[SYSTEM]: Loading vehicle BOLOs...");
    LoadVBolos();
    printf("[SYSTEM]: Vehicle BOLOs loaded successfully.");

    print("[SYSTEM]: Loading garbage locations...");
    LoadGarbages();
    printf("[SYSTEM]: Garbage locations loaded successfully.");

    print("[SYSTEM]: Loading faction weapons...");
    LoadFactionWeapons();
    printf("[SYSTEM]: Faction weapons loaded successfully.");

    print("[SYSTEM]: Loading black markets...");
    LoadBlackMarkets();
    printf("[SYSTEM]: Black markets loaded successfully.");

    print("[SYSTEM]: Loading faction skins...");
    LoadFactionSkins();
    printf("[SYSTEM]: Faction skins loaded successfully.");

    print("[SYSTEM]: Loading furniture...");
    LoadFurniture();
    printf("[SYSTEM]: Furniture loaded successfully.");

    print("[SYSTEM]: Loading radio stations...");
    LoadRadioStations();

    print("===============================================");
    print("[MYSQL]: All database data loaded successfully.");
    return 1;
}

stock RandomWeather()
{
	new randWeather = random(21);
	switch(randWeather)
	{
		case 0, 1, 2, 3, 4:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Clear Skies with temperatures of 40 celcius / 100 farenheit.");
			ServerInfo[GlobalWeather] = 0;
		}
		case 5, 6, 7, 8:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Clear Skies with temperatures of 20 celcius / 70 farenheit.");
			ServerInfo[GlobalWeather] = 1;
		}
		case 9, 10, 11, 12:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Slight Clouds, Temperatures of 30 celcius / 85 farenheit.");
			ServerInfo[GlobalWeather] = 2;
		}
		case 13, 14, 15, 16:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Slight Clouds, Temperatures of 20 celcius / 70 farenheit.");
			ServerInfo[GlobalWeather] = 3;
		}
		case 17, 18:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Sand Storm, take extra precaution.");
			ServerInfo[GlobalWeather] = 19;
		}
		case 19:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Heavy Fog, take extra precaution.");
			ServerInfo[GlobalWeather] = 9;
		}
		case 20:
		{
			SendClientMessageToAllEx(COLOR_ORANGE, "[Weather Report] Heavy Rain, take extra precaution.");
			ServerInfo[GlobalWeather] = 8;
		}
	}
	foreach(new i: Player)
	{
		if(GetPlayerInterior(i) == 0)
		{
			SetPlayerWeather(i, ServerInfo[GlobalWeather]);
		}
	}
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

//----------------------------------------------------

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
    printf("[DEBUG] OnPlayerCommandReceived: Player %d used /%s %s", playerid, cmd, params);

    if(!Player[playerid][IsLoggedIn] && strcmp(cmd, "starttest", true))
    {
        SendClientMessage(playerid, -1, "You are not logged in.");
        return 0;
    }

    if(strfind(params, "|") != -1 || strfind(params, "\r") != -1 || strfind(params, "\n") != -1)
    {
        SendClientMessage(playerid, -1, "You cannot use special characters in commands.");
        return 0;
    }

    if(stringContainsIP(params) && Player[playerid][AdminLevel] < 1)
    {
        new string[256];
        format(string, sizeof string, "%s (%d) may be server advertising: /%s %s", GetUserName(playerid), playerid, cmd, params);
        SendClientMessage(playerid, -1, string);

        format(string, sizeof string, "%s (IP: %s AccountID: %d) may be server advertising: /%s %s", GetUserName(playerid), GetUserIP(playerid), Player[playerid][ID], cmd, params);
        SendClientMessage(playerid, -1, string);

        DBLog("ServerAd", string);
    }

    if(strlen(params) > 0)
    {
        printf("[cmd] [%s]: /%s %s", GetUserName(playerid), cmd, params);
    }
    else
    {
        printf("[cmd] [%s]: /%s", GetUserName(playerid), cmd);
    }

    return 1;
}

// ----------------------------------------------------

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags) 
{
    printf("[DEBUG] OnPlayerCommandPerformed: Player %d /%s %s (result: %d)", playerid, cmd, params, result);

    if(TempVar[playerid][IdleTime] > 0)
    {
        TempVar[playerid][IdleTime] = 0;
    }

    if(result == -1)
    {
        if(strlen(cmd) > 28)
        {
            SendClientMessage(playerid, -1, "Sorry, that command doesn't exist. Use /help or /helpme if you need assistance."); 
        }
        else 
        {
            new msg[128];
            format(msg, sizeof msg, "Sorry, the command \"/%s\" doesn't exist. Use /help or /helpme if you need assistance.", cmd);
            SendClientMessage(playerid, -1, msg);
        }
    }
    else
    {
        new string[256], query[512];

        if(strlen(params) > 0)
        {
            format(string, sizeof string, "[%s(%s) IP: %s AccountID: %d]: /%s %s",
                GetUserName(playerid), GetMasterName(playerid), GetUserIP(playerid), PlayerInfo[playerid][pCharacterID], cmd, params);
        }
        else
        {
            format(string, sizeof string, "[%s(%s) IP: %s AccountID: %d]: /%s",
                GetUserName(playerid), GetMasterName(playerid), GetUserIP(playerid), PlayerInfo[playerid][pCharacterID], cmd);
        }

        WriteLog("Logs/cmd.log", string);
        DBLog("Command", string);

        mysql_format(g_SQL, query, sizeof query, "INSERT INTO `cmd_log` (`AccountID`, `UserName`, `Command`, `Params`, `Timestamp`) VALUES (%d, '%e', '%e', '%e', '%d')", Player[playerid][ID], GetUserName(playerid), cmd, params, gettime());
        mysql_tquery(g_SQL, query);
    }

    return 1; 
}
