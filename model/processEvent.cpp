#include <stdio.h>
#include <iostream>
#include <vector>
#include <string.h>
#include <json.hpp>
extern "C"{
    #include <lua.h>
    #include <lauxlib.h>
    #include <lualib.h>
}
using namespace std;
// for convenience
using json = nlohmann::json;

const char* LUA_LOCAL_PREP = "package.path = package.path..';./model/?.lua' require('state')";
enum class SL_KEYS {
    speak=0,
    info=1,
    move=2,
    ERROR=3
};
map<string, SL_KEYS> SL_MAP_ENUM = {
        {"USER FREE ROAM", SL_KEYS::ERROR},
        {"link.show.speak", SL_KEYS::speak},
        {"link.show.info", SL_KEYS::info},
        {"link.show.move", SL_KEYS::move}
};


static void setStateContext(lua_State *L, const char *context, vector<const char*> params){
    lua_getfield(L, -1, "changecontext");
    lua_pushstring(L, context);
    int i;
    for (i=0; i < params.size(); ++i){
        lua_pushstring(L, params[i]);
    }
    lua_pcall(L, params.size()+1, 0, 0);
    cout << "C++: Switched to " << context << endl;
}

static void sendStateEvent(lua_State *L, const char *event){
    lua_getfield(L, -1, "event");
    lua_pushstring(L, event);
    lua_pcall(L, 1, 1, 0);
    string returncode = lua_tostring(L, -1);
    if (returncode != "0"){
        cout << returncode << endl;
    }
    lua_pop(L, 1);
}

static json getUpdate(lua_State *L){
    lua_getfield(L, -1, "update");
    json update = json::parse(lua_tostring(L, -1));
    lua_pop(L, 1);
    return update;
}

static lua_State* prepLuaState(){
    // Begin Lua State Requirements
    lua_State *L = lua_open();
    luaL_openlibs(L);
    luaL_dostring(L, LUA_LOCAL_PREP);
    lua_getglobal(L, "state");
    // End Lua State Requirements
    return L;
}

static void runSocialLink(lua_State *L){
    const char *slContext = "link";
    vector<const char*> slcParams = {"Aeon"};
    setStateContext(L, slContext, slcParams);
    json update;
    do{
        update = getUpdate(L);
        int index = 0;
        cout << update["text"] << endl;
        if (SL_MAP_ENUM[update["key"]] == SL_KEYS::speak){
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
        sendStateEvent(L, cevent);
    }
    while(update["key"] != "USER FREE ROAM");//THIS WON'T EXIST IN REAL CODE ANYWAY
}

int main() {
    lua_State *L = prepLuaState();
    runSocialLink(L);
    lua_close(L);
}