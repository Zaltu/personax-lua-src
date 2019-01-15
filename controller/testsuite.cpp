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


static void runSocialLink(lua_State *L){
    const char *slContext = "link";
    vector<const char*> slcParams = {"Aeon"};
    setStateContext(L, slContext, slcParams);
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

int main() {
    lua_State *L = prepLuaState();
    runSocialLink(L);
    lua_close(L);
}