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

void static setStateContext(lua_State *L, const char *context, vector<const char*> params){
    lua_getfield(L, -1, "changecontext");
    lua_pushstring(L, context);
    int i;
    for (i=0; i < params.size(); ++i){
        lua_pushstring(L, params[i]);
    }
    lua_pcall(L, params.size()+1, 1, 0);
    std::cout << "C++: Switched to " << context << std::endl;
    lua_pop(L, 1);
}

void static setStateContextShop(lua_State *L, const char *context){
    lua_getfield(L, -1, "changecontext");
    lua_pushstring(L, context);
    lua_pushstring(L, "trainer");
    lua_pushstring(L, "data/envs/home");
    lua_pcall(L, 3, 1, 0);
    std::cout << "C++: Switched to " << context << std::endl;
    lua_pop(L, 1);
}

void static sendStateEvent(lua_State *L, const char *event){
    lua_getfield(L, -1, "event");
    lua_pushstring(L, event);
    lua_pcall(L, 1, 1, 0);
    std::cout << lua_tostring(L, -1) << std::endl;
    lua_pop(L, 1);
}

void static getUpdate(lua_State *L){
    lua_getfield(L, -1, "update");
    std::cout << "Current state.update: " << lua_tostring(L, -1) << std::endl;
    lua_pop(L, 1);
}

int main() {
    lua_State *L = lua_open();
    luaL_openlibs(L);
    luaL_loadfile(L, "state.lua") || lua_pcall(L, 0, 0, 0);
    lua_getglobal(L, "state");
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