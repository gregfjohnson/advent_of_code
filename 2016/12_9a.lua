l = io.lines(arg[1])()

result = ''
while l ~= '' do
    if l:sub(1,1) ~= '(' then
        result = result .. l:sub(1,1)
        l = l:sub(2)
    else
        local len, count = l:match('%(([%d]+)x([%d]+)')
        local xx = l:match('(%([%d]+x[%d]+%))')
        l = l:sub(#xx+1)
        count = tonumber(count)
        len = tonumber(len)
        local rep = l:sub(1, len)
        l = l:sub(len+1)
        for i = 1, count do
            result = result .. rep
        end
    end
end
print(result, #result)
