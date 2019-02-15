/*
Helper static funciton to set up the global game state. Should be called when loading into
a save file.
*/
#include <iostream>
extern "C"{
    #include <lua.h>
    #include <lauxlib.h>
    #include <lualib.h>
}

/*Defines runtime Lua import path, and imports the state, which instantiates the game state
and sets it as global variable. Defined for explicit runtime. Executable MUST be one level
above model with this current const value.*/
const char * const LUA_LOCAL_PREP = "package.path = package.path..';./extlib/lua_path/?.lua;./model/?.lua;' package.cpath = package.cpath..';./extlib/lua_cpath/?.dll' require('state')";

static lua_State* prepLuaState(){
    /**
     * Instatiate the Lua stack and prep the game state. This sets the bottom most element
     * of the shared stack to the game's global state as defined in Lua. The state should
     * NEVER BE POPPED FROM THE SHARED STACK. All calls to Lua code should be done through
     * the state object.
     * 
     * :returns: PX Lua state w/ configured stack
     * :rtype: lua_State*
    */
    lua_State *L = lua_open();
    luaL_openlibs(L);
	luaL_dostring(L, LUA_LOCAL_PREP);
    lua_getglobal(L, "state");
    return L;
}
//TODO: Register loading request functions
