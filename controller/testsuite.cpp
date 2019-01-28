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
    //Set ENV
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
    cout << update << endl;
    for(int i=0; i < update.size(); ++i){
        cout << update[i]["caster"] << " dealt " << update[i]["damage"] << " to " << update[i]["target"] << "'s " << update[i]["dmgType"] << "!" << endl;
    }
}

int main() {
    lua_State *L = prepLuaState();
    //runSocialLink(L);
    runBattle(L);
    lua_close(L);
}