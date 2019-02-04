/*
Wrapped handler around interacting with the Lua PX API.

This is the core module for doing so. There are only two
exposed functionalities: one to send an update to the model
and one to fetch the update value. Under normal circumstances,
sending the state a value will return the update that ensued.
*/
extern "C"{
    #include <lua.h>
    #include <lauxlib.h>
    #include <lualib.h>
}
//For convenience. std is only used to print out an error return code here.
using namespace std;

using json = nlohmann::json;


static json getUpdate(lua_State *L){
    /**
     * Fetch the state.update value from the Lua stack.
     * This does NOT clear the value of state.update
     * 
     * :returns: C++ form of state.update, for interpreting
     * :rtype: json
    */
    lua_getfield(L, -1, "update");
    json update = json::parse(lua_tostring(L, -1));
    lua_pop(L, 1);
    return update;
}


static json sendStateEvent(lua_State *L, json event){
    /**
     * Used to send a valid event to the Lua state. Will return
     * the value of state.update that resulted from the event.
     * 
     * :returns: C++ form of state.update after the event was processed
     * :rtype: json
    */
    lua_getfield(L, -1, "event");
    lua_pushstring(L, event.dump().c_str());
    lua_pcall(L, 1, 1, 0);
    string returncode = lua_tostring(L, -1);
    if (returncode != "0"){
        cout << returncode << endl;
    }
    lua_pop(L, 1);
    return getUpdate(L);
}
