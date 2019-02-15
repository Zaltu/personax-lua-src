#include <stdio.h>
#include <iostream>
#include <vector>
#include <json.hpp>
#include "setupState.cpp"
#include "processEvent.cpp"
extern "C"{
    #include <lua.h>
    #include <lauxlib.h>
    #include <lualib.h>
}
using namespace std;

using json = nlohmann::json;


static void runSocialLink(lua_State *L){
    const char* slContext = "link";
    const char* arcana = "Aeon";
    lua_getfield(L, -1, "changecontext");
    lua_pushstring(L, slContext);
    lua_pushstring(L, arcana);
    lua_pcall(L, 2, 0, 0);

    json update = getUpdate(L);
    do{
        int index = 0;
        if (update["key"].get<string>().rfind("link", 0) == 0){
            cout << update["text"] << endl;
            if (update["options"].size() > 0){
                int i;
                for (i=0; i<update["options"].size(); ++i){
                    cout << i << ":  " << update["options"][i] << endl;
                };
                cin >> index;
            }
            else{
                cin.ignore();
            };
        }
        json event = {
            {"key", "link.action"},
            {"index", index}
        };
        update = sendStateEvent(L, event);
    }
    while(update["key"] != "USER FREE ROAM");//THIS WON'T EXIST IN REAL CODE ANYWAY
}


static void runBattle(lua_State *L){
    // Set ENV
    lua_getfield(L, -1, "loadenv");
    lua_pushstring(L, "barbariccia");
    lua_pcall(L, 1, 0, 0);
    // Set battle context
    const char *btContext = "battle";
    lua_getfield(L, -1, "changecontext");
    lua_pushstring(L, btContext);
    lua_pushnumber(L, 1);
    lua_pcall(L, 2, 0, 0);
    // Get update
    json update = getUpdate(L);
    json event;
    int openindex;
    while(update["iparty"].size() > 0 && update["ienemy"].size() > 0){
        // Adjust open index from Lua to anything else
        openindex = update["open"];
        openindex -= 1;
        // Print full update
        for(int i=0; i < update["turns"].size(); ++i){
            for (int j=0; j < update["turns"][i].size(); ++j){
                if (update["turns"][i][j]["miss"] != nullptr){
                    cout << update["turns"][i][j]["caster"] << " attacked " << update["turns"][i][j]["target"] << " but missed!" << endl;
                }
                else if (update["turns"][i][j]["getup"] != nullptr){
                    cout << update["turns"][i][j]["caster"] << " recovered from being knocked down..." << endl;
                }
                else if (update["turns"][i][j]["oncemore"] != nullptr){
                    cout << "1 More!" << endl;
                }
                else if (update["turns"][i][j]["status"] != nullptr && update["turns"][i][j]["blurb"] != nullptr){
                    cout << update["turns"][i][j]["blurb"] << endl;
                }
                else {
                    cout << update["turns"][i][j]["caster"] << " dealt " << update["turns"][i][j]["damage"] << " to " << update["turns"][i][j]["target"] << "'s " << update["turns"][i][j]["dmgType"] << "!" << endl;
                }
                if(update["turns"][i][j]["down"] != nullptr){
                    cout << update["turns"][i][j]["target"] << " has been knocked down!" << endl;
                }
            }
        }
        cout << update["participants"][openindex]["name"] << " has " << update["participants"][openindex]["hp"] << " HP " << endl;
        cout << endl;
        cout << "Choose what spell " << update["participants"][openindex]["name"] << " should use:" << endl;
        int spellindex;
        for (int i=0; i<update["participants"][openindex]["persona"]["spellDeck"].size(); ++i){
            if(update["participants"][openindex]["persona"]["spellDeck"][i] != ""){
                cout << i+1 << ":  " << update["participants"][openindex]["persona"]["spellDeck"][i] << endl;
            }
        };
        cin >> spellindex;

        event = {
            {"key", "battle.spellrequest"},
            {"spellDataRequest", spellindex}
        };
        json spelldata = sendStateEvent(L, event);
        int targetindex;
        if (spelldata["target"] == "One Enemy"){
            cout << endl;
            cout << "Choose which enemy " << update["participants"][openindex]["name"] << " should attack:" << endl;
            for (int i=0; i<update["ienemy"].size(); ++i){
                int enemyindex = update["ienemy"][i];
                cout << enemyindex << ":  " << update["participants"][enemyindex-1]["name"] << endl;// -1 because LUA TO C++ REEEEEEEEEEEEEEE
            };
            cin >> targetindex;
            cin.ignore();
            event = {
                {"key", "battle.userinput"},
                {"spellindex", spellindex},
                {"targetindex", targetindex}
            };
        }
        else if (spelldata["target"] == "One Ally"){
            cout << endl;
            cout << "Choose which ally " << update["participants"][openindex]["name"] << " should help:" << endl;
            for (int i=0; i<update["iparty"].size(); ++i){
                int partyindex = update["iparty"][i];
                cout << partyindex << ":  " << update["participants"][partyindex-1]["name"] << endl;// -1 because LUA TO C++ REEEEEEEEEEEEEEE
            };
            cin >> targetindex;
            cin.ignore();
            event = {
                {"key", "battle.userinput"},
                {"spellindex", spellindex},
                {"targetindex", targetindex}
            };
        }
        else if (spelldata["target"] == "All Allies"){
            cout << "Confirm your support on all allies" << endl;
            cin.ignore();
            cin.ignore();
            
            event = {
                {"key", "battle.userinput"},
                {"spellindex", spellindex},
            };
        }
        else{
            cout << "Confirm your attack on all enemies" << endl;
            cin.ignore();
            cin.ignore();
            
            event = {
                {"key", "battle.userinput"},
                {"spellindex", spellindex},
            };
        }

        update = sendStateEvent(L, event);
    }
    for(int i=0; i < update["turns"].size(); ++i){
        for (int j=0; j < update["turns"][i].size(); ++j){
            if (update["turns"][i][j]["miss"] != nullptr){
                cout << update["turns"][i][j]["caster"] << " attacked " << update["turns"][i][j]["target"] << " but missed!" << endl;
            }
            else if (update["turns"][i][j]["getup"] != nullptr){
                cout << update["turns"][i][j]["caster"] << " recovered from being knocked down..." << endl;
            }
            else if (update["turns"][i][j]["oncemore"] != nullptr){
                cout << "1 More!" << endl;
            }
            else {
                cout << update["turns"][i][j]["caster"] << " dealt " << update["turns"][i][j]["damage"] << " to " << update["turns"][i][j]["target"] << "'s " << update["turns"][i][j]["dmgType"] << "!" << endl;
            }
            if(update["turns"][i][j]["down"] != nullptr){
                cout << update["turns"][i][j]["target"] << " has been knocked down!" << endl;
            }
        }
    }
    if (update["iparty"].size() == 0){
        cout << "All of your party members have succumbed." << endl;
        cout << "You is dead" << endl;
        cout << "RIP" << endl;
    }
    else{
        cout << "You have crushed your enemies UwU" << endl;
    }
}

int main() {
    lua_State *L = prepLuaState();
    //runSocialLink(L);
    runBattle(L);
    lua_close(L);
}