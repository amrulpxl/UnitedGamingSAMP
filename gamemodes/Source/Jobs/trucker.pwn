//
//  Copyright (C) 2019 United Gaming LLC. All Rights Reserved.
//
//  This document is the property of United Gaming LLC.
//  It is considered confidential and proprietary.
//
//  This document may not be reproduced or transmitted in any form
//  without the consent of United Gaming LLC.
//

#include <YSI_Coding\y_hooks>

#define     MAX_TRUCKS      6
#define     TRUCKER_TABLE   "trucker_positions"

enum tInfo
{
    tID,
    Driver,
    Transport,
    DeliveryPoint,
    Timer
};
new TruckInfo[MAX_TRUCKS][tInfo];

new Float:GasOilX,
    Float:GasOilY,
    Float:GasOilZ,
    Float:WoodX,
    Float:WoodY,
    Float:WoodZ,
    Float:MetalX,
    Float:MetalY,
    Float:MetalZ;

//-1043.8407,-655.8583,32.0078 - Gas & Oil Load CP
//2585.8242,2764.2935,10.8203  - Gas & Oil Unload CP
//64.8579,-279.7427,1.5781     - Wood & Metal Load CP
//-2271.5779,2306.7737,4.8202  - Wood & Metal Unload CP
//661.6331,1219.3839,11.5489   - Final Stop (Trucking HQ)

stock TruckerTable()
{
    new q[512];
    format(q, sizeof q,
        "CREATE TABLE IF NOT EXISTS `%s` (\
            `id` TINYINT UNSIGNED NOT NULL PRIMARY KEY,\
            `GasOilX` FLOAT NOT NULL DEFAULT 0,\
            `GasOilY` FLOAT NOT NULL DEFAULT 0,\
            `GasOilZ` FLOAT NOT NULL DEFAULT 0,\
            `WoodX`   FLOAT NOT NULL DEFAULT 0,\
            `WoodY`   FLOAT NOT NULL DEFAULT 0,\
            `WoodZ`   FLOAT NOT NULL DEFAULT 0,\
            `MetalX`  FLOAT NOT NULL DEFAULT 0,\
            `MetalY`  FLOAT NOT NULL DEFAULT 0,\
            `MetalZ`  FLOAT NOT NULL DEFAULT 0\
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        TRUCKER_TABLE);
    mysql_tquery(g_SQL, q, "OnTruckerPositions", "");
    return 1;
}

function OnTruckerPositions()
{
    new q[128];
    format(q, sizeof q, "SELECT * FROM `%s` WHERE id=1", TRUCKER_TABLE);
    mysql_tquery(g_SQL, q, "OnTruckerPositionsLoaded", "");
}

function OnTruckerPositionsLoaded()
{
    if (cache_num_rows() > 0)
    {
        cache_get_value_float(0, "GasOilX", GasOilX);
        cache_get_value_float(0, "GasOilY", GasOilY);
        cache_get_value_float(0, "GasOilZ", GasOilZ);
        cache_get_value_float(0, "WoodX", WoodX);
        cache_get_value_float(0, "WoodY", WoodY);
        cache_get_value_float(0, "WoodZ", WoodZ);
        cache_get_value_float(0, "MetalX", MetalX);
        cache_get_value_float(0, "MetalY", MetalY);
        cache_get_value_float(0, "MetalZ", MetalZ);
        printf("[SYSTEM] Truck positions loaded...");
    }
    else
    {
        new q[256];
        mysql_format(g_SQL, q, sizeof q,
            "INSERT INTO `%s` (id, GasOilX,GasOilY,GasOilZ, WoodX,WoodY,WoodZ, MetalX,MetalY,MetalZ) VALUES (1, %f,%f,%f, %f,%f,%f, %f,%f,%f) \
             ON DUPLICATE KEY UPDATE GasOilX=VALUES(GasOilX), GasOilY=VALUES(GasOilY), GasOilZ=VALUES(GasOilZ), \
             WoodX=VALUES(WoodX), WoodY=VALUES(WoodY), WoodZ=VALUES(WoodZ), \
             MetalX=VALUES(MetalX), MetalY=VALUES(MetalY), MetalZ=VALUES(MetalZ)",
            TRUCKER_TABLE,
            GasOilX,GasOilY,GasOilZ,
            WoodX,WoodY,WoodZ,
            MetalX,MetalY,MetalZ);
        mysql_tquery(g_SQL, q, "OnTruckerPositionsInserted", "");
    }
}

function OnTruckerPositionsInserted()
{
    printf("[SYSTEM] Default truck positions row inserted into MySQL.");
}

stock SaveTruckerData()
{
    new q[256];
    mysql_format(g_SQL, q, sizeof q,
        "UPDATE `%s` SET GasOilX=%f,GasOilY=%f,GasOilZ=%f, WoodX=%f,WoodY=%f,WoodZ=%f, MetalX=%f,MetalY=%f,MetalZ=%f WHERE id=1",
        TRUCKER_TABLE,
        GasOilX,GasOilY,GasOilZ,
        WoodX,WoodY,WoodZ,
        MetalX,MetalY,MetalZ);
    mysql_tquery(g_SQL, q);
    return 1;
}

stock EnsureTruckerTable()
{
    TruckerTable();
    OnTruckerPositions();
}

stock LoadTruckerPositions()
{
    EnsureTruckerTable();
    return 1;
}

new g_Vehicle[12];
hook OnGameModeInit()
{
    EnsureTruckerTable();
    
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        TruckInfo[i][Driver] = -1;
    }
    TruckInfo[0][tID] = CreateVehicle(403,604.5598,1246.3439,12.3251,120.2201,0,0,-1); // Truck1
    TruckInfo[1][tID] = CreateVehicle(403,606.6532,1242.4554,12.3235,120.1265,0,0,-1); // Truck2
    TruckInfo[2][tID] = CreateVehicle(403,608.9621,1238.3749,12.3252,118.7623,0,0,-1); // Truck3
    TruckInfo[3][tID] = CreateVehicle(403,611.0492,1234.4707,12.3255,118.9395,0,0,-1); // Truck4
    TruckInfo[4][tID] = CreateVehicle(403,613.2982,1230.2473,12.3260,117.2927,0,0,-1); // Truck5
    TruckInfo[5][tID] = CreateVehicle(403,615.0554,1226.2650,12.3251,115.9865,0,0,-1); // Truck6

    g_Vehicle[0] = CreateVehicle(435, 639.4260, 1245.7573, 12.2659, 299.7846, 117, 176, -1); //Trailer A
    g_Vehicle[1] = CreateVehicle(435, 637.4517, 1249.1079, 12.2760, 299.9365, 117, 176, -1); //Trailer A
    g_Vehicle[2] = CreateVehicle(435, 635.6406, 1252.2791, 12.3170, 300.5960, 117, 176, -1); //Trailer A
    g_Vehicle[3] = CreateVehicle(435, 641.3257, 1242.3583, 12.2640, 299.7916, 117, 176, -1); //Trailer A
    g_Vehicle[4] = CreateVehicle(435, 633.5293, 1255.9282, 12.3347, 299.3123, 117, 176, -1); //Trailer A
    g_Vehicle[5] = CreateVehicle(435, 631.5001, 1259.4888, 12.2876, 299.8573, 117, 176, -1); //Trailer A
    g_Vehicle[6] = CreateVehicle(584, 666.0701, 1272.5194, 12.8016, 120.8517, 248, 128, -1); //Trailer B
    g_Vehicle[7] = CreateVehicle(584, 664.0073, 1276.0009, 12.8789, 120.1814, 248, 128, -1); //Trailer B
    g_Vehicle[8] = CreateVehicle(584, 667.9566, 1269.3950, 12.7512, 121.3114, 248, 128, -1); //Trailer B
    g_Vehicle[9] = CreateVehicle(584, 670.1434, 1265.6929, 12.7831, 120.5060, 248, 128, -1); //Trailer B
    g_Vehicle[10] = CreateVehicle(584, 672.4088, 1261.8873, 12.7923, 120.7069, 248, 128, -1); //Trailer B
    g_Vehicle[11] = CreateVehicle(584, 674.8057, 1257.9549, 12.8625, 120.3884, 248, 128, -1); //Trailer B


    new g_Object[4];
    g_Object[0] = CreateDynamicObject(1536, 621.8906, 1226.8695, 10.7025, 0.0000, 0.0000, 300.0000); //Gen_doorEXT15
    g_Object[1] = CreateDynamicObject(1536, 623.4359, 1224.2731, 10.7025, 0.0000, 0.0000, 480.0000); //Gen_doorEXT15
    g_Object[2] = CreateDynamicObject(19121, 621.4524, 1227.0833, 11.2771, 0.0000, 0.0000, 300.0000); //BollardLight1
    g_Object[3] = CreateDynamicObject(19121, 623.3485, 1223.7990, 11.2771, 0.0000, 0.0000, 300.0000); //BollardLight1
    return 1;
}

hook OnGameModeExit()
{
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        DestroyVehicle(TruckInfo[i][tID]);
    }
    for(new i = 0; i < 12; i++)
    {   
        DestroyVehicle(g_Vehicle[i]);
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
    new truckid;
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        if(TruckInfo[i][Driver] == playerid) 
        {
            truckid = i;
            break;
        }
    } 
    if(truckid != 0)
    {
        KillTimer(TruckInfo[truckid][Timer]);
        TempVar[playerid][CheckpointType] = CHECKPOINT_TYPE_TRUCK_COLLECT;
        switch (TruckInfo[truckid][DeliveryPoint])
        {
            case 2: 
            {
                if(TruckInfo[truckid][Transport] == 1 || TruckInfo[truckid][Transport] == 2) SetPlayerCheckpoint(playerid, 388.6633, 2582.4863, 17.0037, 5.0);
                else if(TruckInfo[truckid][Transport] == 3 || TruckInfo[truckid][Transport] == 4) SetPlayerCheckpoint(playerid, -2271.5779,2306.7737,4.8202, 5.0);
            }
            case 3: SetPlayerCheckpoint(playerid, 661.6331,1219.3839,11.5489, 5.0);
        }
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    new truckid;
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        if(TruckInfo[i][Driver] == playerid) 
        {
            truckid = i;
            break;
        }
    } 
    if(truckid != 0) TruckInfo[truckid][Timer] = SetTimerEx("DestroyTruckingJobTruck", 300000, false, "i", truckid);
    return 1;
}

Dialog:DIALOG_TRUCKSELECT(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    new bool:found = false;
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        if(TruckInfo[i][Driver] == -1)
        {
            new Float:x,Float:y,Float:z;
            TruckInfo[i][Transport] = listitem+1;
            GetVehiclePos(TruckInfo[i][tID], x, y, z);
            TruckInfo[i][Driver] = playerid;
            SetPlayerCheckpoint(playerid, x, y, z, 4.0);
            TempVar[playerid][CheckpointType] = CHECKPOINT_TYPE_TRUCK_COLLECT;
            PrintFooter(playerid, "A truck has been assigned for you, it has been marked outside.");
            return 1;
        }
    }
    if(found != true)
    {
        SendErrorMessage(playerid, "There are no available trucks at this moment.");
    }
    return 1;
}

stock HandleTruckCheckpoint(playerid)
{
    new truckid;
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        if(TruckInfo[i][Driver] == playerid) 
        {
            truckid = i;
            if(GetPlayerVehicleID(playerid) != TruckInfo[truckid][tID]) return 1;
            break;
        }
    }
    if(GetPlayerVehicleID(playerid) == TruckInfo[truckid][tID])
    {
        if(!IsTrailerAttachedToVehicle(TruckInfo[truckid][tID])) return 1;
        if(TruckInfo[truckid][DeliveryPoint] == 4)
        {
            new randMoney = random(15)+random(50)+100, string[128];
            SetVehicleToRespawn(GetVehicleTrailer(TruckInfo[truckid][tID]));
            SetVehicleToRespawn(TruckInfo[truckid][tID]);
            TruckInfo[truckid][DeliveryPoint] = 0;
            TruckInfo[truckid][Driver] = -1;
            TruckInfo[truckid][Transport] = 0;
            GiveMoney(playerid, randMoney);
            format(string, sizeof string, "You have sucessfully finished the job.~n~You earned ~g~$%s~w~ for your work.", FormatNumber(randMoney));
            PrintFooter(playerid, string);
            return DisablePlayerCheckpoint(playerid);
        }
        FreezePlayer(playerid,5000);
        switch (TruckInfo[truckid][DeliveryPoint])
        {
            case 1: {TruckInfo[truckid][DeliveryPoint] = 2; SendServerMessage(playerid,"Loading the cargo...");}
            case 3: SendServerMessage(playerid,"Unloading the cargo...");
        }
    }
    PlayerPlaySound(playerid, 1056, 0, 0, 0);
    DisablePlayerCheckpoint(playerid);
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new truckid;
        for(new i = 0; i < MAX_TRUCKS; i++)
        {
            if(TruckInfo[i][Driver] == playerid) 
            {
                truckid = i;
                if(GetPlayerVehicleID(playerid) != TruckInfo[truckid][tID]) return 1;
                break;
            }
        }
        if(TruckInfo[truckid][Driver] == playerid)
        {
            DisablePlayerCheckpoint(playerid);
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Attach the appropriate trailer to your truck, then use /starttrucking to start your delivery.");
        }
    }
    return 1;
}

CMD:truckerhelp(playerid, params[])
{
    if(PlayerInfo[playerid][pJob] == JOB_COURIER)
    {
        SendClientMessageEx(playerid, COLOR_GREEN, "______________________________________________________");
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Trucker Help:{FFFFFF} Type a command for more information.");
        SendClientMessageEx(playerid, COLOR_GRAD5, "Commands: /trucking, /stoptrucking, /starttrucking");
        SendClientMessageEx(playerid, COLOR_GREEN, "______________________________________________________");
    }
    else SendErrorMessage(playerid, "You are not a trucker.");
    return 1;
}

CMD:trucking(playerid)
{
    if(PlayerInfo[playerid][pJob] == JOB_COURIER)
    {
        Dialog_Show(playerid, DIALOG_TRUCKSELECT, DIALOG_STYLE_LIST, "Select the type of shipment you will transport.", "Gasoline\nOil\nWood\nMetal", "Select", "Back");
    }
    return 1;
}

CMD:stoptrucking(playerid)
{
    if(PlayerInfo[playerid][pJob] == JOB_COURIER)
    {
        for(new i = 0; i < MAX_TRUCKS; i++)
        {
            if(TruckInfo[i][Driver] == playerid) 
            {
                DestroyTruckingJobTruck(i);
                break;
            }
        }
        return SendErrorMessage(playerid,"You aren't currently trucking.");
    }
    return 1;
}

CMD:starttrucking(playerid)
{
    if(PlayerInfo[playerid][pJob] == JOB_COURIER)
    {
        new truckid;
        for(new i = 0; i < MAX_TRUCKS; i++)
        {
            if(TruckInfo[i][Driver] == playerid) 
            {
                truckid = i;
                break;
            }
        }
        if(GetPlayerVehicleID(playerid) != TruckInfo[truckid][tID]) return SendErrorMessage(playerid,"You aren't driving the truck assigned to you.");
        if(TruckInfo[truckid][DeliveryPoint] != 0) return SendErrorMessage(playerid,"You have already started trucking.");
        if(!IsTrailerAttachedToVehicle(TruckInfo[truckid][tID])) return SendErrorMessage(playerid, "You don't have a trailer attached to your truck.");

        if(TruckInfo[truckid][Transport] == 1 || TruckInfo[truckid][Transport] == 2)
        {
            if(GetVehicleModel(GetVehicleTrailer(TruckInfo[truckid][tID])) != 584)
                return SendErrorMessage(playerid,"You don't have the appropriate trailer attached to your vehicle.");

            new zone[128];
            TempVar[playerid][CheckpointType] = CHECKPOINT_TYPE_TRUCK_COLLECT;
            switch (TruckInfo[truckid][Transport])
            {
                case 1, 2: // Gas and Oil
                {
                    GetLocation(GasOilX, GasOilY, GasOilZ, zone, sizeof zone);
                    SetPlayerCheckpoint(playerid, GasOilX, GasOilY, GasOilZ, 5.0);
                }
            }

            SendClientMessageEx(playerid, COLOR_GREEN, "__________ {FFFFFF}Trucker Collection{%06x} __________", COLOR_GREEN >>> 8);
            SendClientMessageEx(playerid, COLOR_GRAD5, "Go to %s to collect your goods.", zone);
            PrintFooter(playerid, "Go to the ~r~checkpoint~w~ to load the supplies chosen.");
            TruckInfo[truckid][DeliveryPoint] = 1;
            return 1;
        }
        if(TruckInfo[truckid][Transport] == 3 || TruckInfo[truckid][Transport] == 4)
        {
            if(GetVehicleModel(GetVehicleTrailer(TruckInfo[truckid][tID])) != 435)
                return SendErrorMessage(playerid,"You don't have the appropriate trailer attached to your vehicle.");

            new zone[128];
            TempVar[playerid][CheckpointType] = CHECKPOINT_TYPE_TRUCK_COLLECT;
            switch (TruckInfo[truckid][Transport])
            {
                case 3: // Wood
                {
                    GetLocation(WoodX, WoodY, WoodZ, zone, sizeof zone);
                    SetPlayerCheckpoint(playerid, WoodX, WoodY, WoodZ, 5.0);
                }
                case 4: // Metal
                {
                    GetLocation(MetalX, MetalY, MetalZ, zone, sizeof zone);
                    SetPlayerCheckpoint(playerid, MetalX, MetalY, MetalZ, 5.0);
                }
            }

            SendClientMessageEx(playerid, COLOR_GREEN, "__________ {FFFFFF}Trucker Collection{%06x} __________", COLOR_GREEN >>> 8);
            SendClientMessageEx(playerid, COLOR_GRAD5, "Go to %s to collect your goods.", zone);
            PrintFooter(playerid, "Go to the ~r~checkpoint~w~ to load the supplies chosen.");
            TruckInfo[truckid][DeliveryPoint] = 1;
            return 1;
        }
    }
    return 1;
}



//=========================================STOCKS===========================================

forward DestroyTruckingJobTruck(truckid);
public DestroyTruckingJobTruck(truckid)
{
    if(IsTrailerAttachedToVehicle(TruckInfo[truckid][tID]))
    {
        SetVehicleToRespawn(GetVehicleTrailer(TruckInfo[truckid][tID]));
    }
    SetVehicleToRespawn(TruckInfo[truckid][tID]);
    TruckInfo[truckid][Driver] = -1;
    TruckInfo[truckid][Transport] = 0;
    TruckInfo[truckid][DeliveryPoint] = 0;
}

function UnFreezeP(playerid)
{
    TogglePlayerControllable(playerid, true);
    new truckid;
    for(new i = 0; i < MAX_TRUCKS; i++)
    {
        if(TruckInfo[i][Driver] == playerid) 
        {
            truckid = i;
            if(GetPlayerVehicleID(playerid) != TruckInfo[truckid][tID]) return 1;
            break;
        }
    }
    if(GetPlayerVehicleID(playerid) == TruckInfo[truckid][tID])
    {
        TempVar[playerid][CheckpointType] = CHECKPOINT_TYPE_TRUCK_COLLECT;
        switch (TruckInfo[truckid][DeliveryPoint])
        {
            case 2: 
            {
                if(TruckInfo[truckid][Transport] == 1 || TruckInfo[truckid][Transport] == 2) SetPlayerCheckpoint(playerid, 388.6633, 2582.4863, 17.0037, 5.0);
                else if(TruckInfo[truckid][Transport] == 3 || TruckInfo[truckid][Transport] == 4) SetPlayerCheckpoint(playerid, -2271.5779,2306.7737,4.8202, 5.0);
            }
            case 3: SetPlayerCheckpoint(playerid, 661.6331,1219.3839,11.5489, 5.0);
        }
        TruckInfo[truckid][DeliveryPoint]++;
        SendServerMessage(playerid, "Go to the next {FF0000}checkpoint{FFFF00} that's on your map.");
    }
    return 1;
}

stock FreezePlayer(playerid,time)
{
    SetTimerEx("UnFreezeP",time,false,"i",playerid);
    TogglePlayerControllable(playerid, false);
}

CMD:edittrucker(playerid, params[])
{
    if(IsAdminLevel(playerid, 4))
    {
        if(isnull(params))
            return SendUsageMessage(playerid, "/edittrucker [Params]"), SendClientMessage(playerid, -1, "Params: Oil, Metal, Wood");
        
        if(strcmp(params, "oil", true) == 0)
        {
            GetPlayerPos(playerid, GasOilX, GasOilY, GasOilZ);
            SendClientMessage(playerid, -1, "Trucker Gas/Oil position updated.");
            SaveTruckerData();
        }
        else if(strcmp(params, "metal", true) == 0)
        {
            GetPlayerPos(playerid, MetalX, MetalY, MetalZ);
            SendClientMessage(playerid, -1, "Trucker Metal position updated.");
            SaveTruckerData();
        }
        else if(strcmp(params, "wood", true) == 0)
        {
            GetPlayerPos(playerid, WoodX, WoodY, WoodZ);
            SendClientMessage(playerid, -1, "Trucker Wood position updated.");
            SaveTruckerData();
        }
    }
    return 1;
}