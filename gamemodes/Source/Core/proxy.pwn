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

hook OnPlayerSpawn(playerid)
{
    new ip[128], string[256];
    GetPlayerIp(playerid, ip, sizeof ip);
	
    /*if(strcmp(ip, "127.0.0.1", true) == 0)
        return 1;*/

    // Free proxy check API (no key required)
    // Docs: https://ipwhois.io/documentation (ipwhois.app)
    // We will scan the JSON for '"proxy":true' to warn admins.
    format(string, sizeof string, "http://ipwhois.app/json/%s", ip);
    HTTP(playerid, HTTP_GET, string, "", "ProxyCheck");
    return 1;
}

function ProxyCheck(index, response_code, data[])
{
    if(response_code == 200)
    {
        new name[MAX_PLAYERS], string[256];
        new ip[16];
		
		GetPlayerName(index, name, sizeof(name));
		GetPlayerIp(index, ip, sizeof ip);
		
		if(strcmp(ip, "127.0.0.1", true) == 0)
			return 1; // Simple JSON scan for proxy/vpn/tor usage flags (handle various formats)
        if (
            strfind(data, "\"proxy\":true", true) != -1 ||
            strfind(data, "\"proxy\":1", true) != -1 ||
            strfind(data, "\"proxy\":\"yes\"", true) != -1 ||
            strfind(data, "\"vpn\":true", true) != -1 ||
            strfind(data, "\"tor\":true", true) != -1
        )
        {
            format(string, sizeof string, "%s may be possibly using a proxy.", name);
            SendAdminWarning(1, string);
        }
    }
    else
    {
        printf("[WARN]: Proxy check request did not return 200 for %s. Code: %d", GetUserName(index), response_code);
    }
    return 1;
}