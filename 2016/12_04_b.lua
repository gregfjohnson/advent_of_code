require 'tprint'
-- hqcfqwydw-fbqijys-whqii-huiuqhsx-660[qhiwf]

sectorsum = 0

function newch(ch, addum)
    local a = 'a'
    ch = ch:byte(1) - a:byte(1)
    ch = (ch + addum) % 26
    return string.char(ch + a:byte(1))
end
--[[
print(newch('a', 26))
os.exit()
--]]

function decode(chars, secid)
    chars = chars:gsub('[^a-z]', '')
    local result = ''
    for i = 1, #chars do
        local ch = chars:sub(i,i)
        result = result .. newch(ch, secid)
    end
    return result
end

function ok(chars, key)
    chars = chars:gsub('[^a-z]', '')
    local t = {}; setmetatable(t, {__index = function() return 0 end})
    for i = 1, #chars do
        t[chars:sub(i,i)] = t[chars:sub(i,i)] + 1
    end
    local q = {}
    for k,v in pairs(t) do
        table.insert(q, {ch = k, count = v})
    end
    table.sort(q,
        function(s1, s2)
            return (s1.count < s2.count) or (s1.count == s2.count and s1.ch > s2.ch)
        end)

    --print(key)
    --tprint(q)
    for i = 1, 5 do
        if q[1+#q-i].ch ~= key:sub(i,i) then return false end
    end
    return true
end

for l in io.lines(arg[1]) do
    chars, secid, key = l:match('(.*)%-(%d+)%[(.*)%]')
    if ok(chars, key) then
        print(decode(chars, tonumber(secid)), secid)
    end
end
