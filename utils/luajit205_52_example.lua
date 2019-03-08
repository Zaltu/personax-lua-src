


tval = {'y', nil, 'n', nil}

function len(tab)
    last = 0
    for index, _ in pairs(tab) do
        last = index
    end
    return last
end

setmetatable(tval, {__len=len})


local function test(val)
    for k,v in pairs(val) do
        if type(k) ~= 'number' then
            print(k)
            return false
        end
        local _, decim = math.modf(k)
        if not (decim == 0 and 1<=k) then
            print(k)
            return false
        end
        if k > #val then -- Use Lua's length as absolute determiner
            print(k)
            return false
        end
    end
end

print(#tval)
print(test(tval))