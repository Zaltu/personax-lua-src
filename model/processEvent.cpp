#include <stdio.h>
#include <iostream>
#include <vector>
#include <string.h>
extern "C"{
    #include <lua.h>
    #include <lauxlib.h>
    #include <lualib.h>
}
using namespace std;

const char* LUA_LOCAL_PREP = "package.path = package.path..';./model/?.lua' require('state')";

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

static void getUpdate(lua_State *L){
    lua_getfield(L, -1, "update");
    cout << "Current state.update: " << lua_tostring(L, -1) << endl;
    lua_pop(L, 1);
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

int main() {
    lua_State *L = prepLuaState();

    // Testsuite
    const char *context0 = "calendar";
    vector<const char*> empty;
    setStateContext(L, context0, empty);

    const char *context1 = "shop";
    vector<const char*> shopcontext = {"trainer"};
    setStateContext(L, context1, shopcontext);

    getUpdate(L);

    const char *event0 = "{'shopindex':1}";
    sendStateEvent(L, event0);
    getUpdate(L);

    const char *event1 = "{'shopindex':0}";
    sendStateEvent(L, event1);
    getUpdate(L);

    const char *event2 = "{'shopindex':0}";
    sendStateEvent(L, event2);
    getUpdate(L);

    lua_close(L);
}