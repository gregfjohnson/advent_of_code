function haspal(str)
    if str == nil then return false end

    for i = 1, #str-2 do
        if str:sub(i,i) == str:sub(i+2,i+2)
        and str:sub(i,i) ~= str:sub(i+1,i+1)
        then
            return str:sub(i,i+2)
        end
    end

    return false
end

function ok(str)
    for s in str:gmatch('%[([a-z]*)%]') do
        if haspal(s) then return 0 end
    end
    for s in str:gmatch('%]([a-z]*)%[') do
        if haspal(s) then return 1 end
    end

    -- start of string
    if haspal(str:match('^([^%[]*)')) then return 1 end

    -- end of string
    if haspal(str:match('([^%[]*)$')) then return 1 end
    return 0
end

count = 0
for l in io.lines(arg[1]) do
    count = count + ok(l)
end
print(count)
