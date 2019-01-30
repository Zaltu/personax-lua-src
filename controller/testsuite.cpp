#include <stdio.h>
#include <iostream>
#include <vector>
#include <string.h>
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
        if (string(update["key"]).rfind("link", 0) == 0){
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
        const char *cevent = event.dump().c_str();
        update = sendStateEvent(L, cevent);
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
    int openindex;
    while(update["iparty"].size() > 0 && update["ienemy"].size() > 0){
        // Adjust open index from Lua to anything else
        openindex = update["open"];
        openindex -= 1;
        // Print full update
        for(int i=0; i < update["turns"].size(); ++i){
            if (update["turns"][i]["miss"] != nullptr){
                cout << update["turns"][i]["caster"] << " attacked " << update["turns"][i]["target"] << " but missed!" << endl;
            }
            else{
                cout << update["turns"][i]["caster"] << " dealt " << update["turns"][i]["damage"] << " to " << update["turns"][i]["target"] << "'s " << update["turns"][i]["dmgType"] << "!" << endl;
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

        cout << endl;
        cout << "Choose which enemy " << update["participants"][openindex]["name"] << " should attack:" << endl;
        int targetindex;
        for (int i=0; i<update["ienemy"].size(); ++i){
            cout << update["ienemy"] << endl;
            int enemyindex = update["ienemy"][i];
            cout << enemyindex << ":  " << update["participants"][enemyindex-1]["name"] << endl;
        };
        cin >> targetindex;

        json event = {
            {"key", "battle.userinput"},
            {"spellindex", spellindex},
            {"targetindex", targetindex}
        };
        const char *cevent = event.dump().c_str();
        update = sendStateEvent(L, cevent);
    }
    openindex = update["open"];
    for(int i=0; i < update["turns"].size(); ++i){
        cout << update["turns"][i]["caster"] << " dealt " << update["turns"][i]["damage"] << " to " << update["turns"][i]["target"] << "'s " << update["turns"][i]["dmgType"] << "!" << endl;
    }
    cout << "All of your party members have succumbed." << endl;
    cout << "You is dead" << endl;
    cout << "RIP" << endl;
    cout << update << endl;
}

int main() {
    lua_State *L = prepLuaState();
    //runSocialLink(L);
    runBattle(L);
    lua_close(L);
}