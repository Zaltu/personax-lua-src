package.path= package.path..";C:/LUA/lua/?.lua"
package.cpath= package.cpath..";C:/LUA/lua/lib/lua/5.1/?.dll"

convert = require('jsontolua')

convert.convertFile(
    'K:/Git/personax-lua-src/json_data/Aeon_link.json',
    'K:/Git/personax-lua-src/json_data/Aeon_link.lua'
)