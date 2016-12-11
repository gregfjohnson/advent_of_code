t = {}
for l in io.lines(arg[1]) do table.insert(t, l) end

result = ''
for i = 1, #t[1] do
    f = {}; setmetatable(f, {__index = function() return 0 end})
    for j = 1, #t do
        f[t[j]:sub(i,i)] = f[t[j]:sub(i,i)] + 1
    end
    max = 0
    for ch, count in pairs(f) do
        if max < count then
            max = count
            c = ch
        end
    end
    result = result .. c
end
print(result)
