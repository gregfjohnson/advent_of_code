ok = 0

function istriangle(a,b,c)
    local t = {a,b,c}
    table.sort(t, function(n,m) return n<m end)
    return (t[1] + t[2] > t[3]) and 1 or 0
end

all = {}
for l in io.lines(arg[1]) do
    local a,b,c = l:match('%s*(%d+)%s+(%d+)%s+(%d+)')
    a, b, c = tonumber(a), tonumber(b), tonumber(c)
    table.insert(all, a)
    table.insert(all, b)
    table.insert(all, c)
end

for i = 1, #all-8, 9 do
    ok = ok + istriangle(all[i],   all[i+3], all[i+6])
    ok = ok + istriangle(all[i+1], all[i+4], all[i+7])
    ok = ok + istriangle(all[i+2], all[i+5], all[i+8])
end
print(ok)
