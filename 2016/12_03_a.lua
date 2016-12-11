ok = 0

function istriangle(a,b,c)
    local t = {a,b,c}
    table.sort(t, function(n,m) return n<m end)
    return (t[1] + t[2] > t[3]) and 1 or 0
end

for l in io.lines(arg[1]) do
    local a,b,c = l:match('%s*(%d+)%s+(%d+)%s+(%d+)')
    a = tonumber(a)
    b = tonumber(b)
    c = tonumber(c)
    ok = ok + istriangle(a,b,c)
end
print(ok)
