require 'tprint'
require 'printf'

visited = {}
--[[
setmetatable(visited, {__index =
    function()
        local r = {};
        setmetatable(r, {__index =
            function ()
                return {}
            end})
        return r
    end})
--]]
function addv(i,j)
    if visited[i] == nil then visited[i] = {} end
    visited[i][j] = true
end
go = {}
for l in io.lines() do
    dir, distance = l:match('(.)(%d+)')
    --print(dir,distance)
    table.insert(go, {dir=dir, distance=tonumber(distance)})
end
dir = 0
pos = {0,0}
for i = 1, #go do
    printf('pos <%d %d>, facing %d %d\n', pos[1], pos[2], dir, i)
     printf('%s%d pos <%d %d>, facing %d\n', go[i].dir, go[i].distance, pos[1], pos[2], dir)
    if visited[pos[1]] and visited[pos[1]][pos[2]] then
        print('*********')
        print(pos[1],pos[2])
        print(math.sqrt(pos[1]*pos[1] + pos[2]*pos[2]))
        print(pos[1]+pos[2])
        --os.exit()
    end
    addv(pos[1], pos[2])
    if go[i].dir == 'L' then dir = (dir-1) % 4
    elseif go[i].dir == 'R' then dir = (dir+1) % 4
    else
        print('ick')
        os.exit()
    end
    if dir == 0 then pos[2] = pos[2] + go[i].distance end
    if dir == 2 then pos[2] = pos[2] - go[i].distance end
    if dir == 1 then pos[1] = pos[1] + go[i].distance end
    if dir == 3 then pos[1] = pos[1] - go[i].distance end

end
    printf('pos <%d %d>, facing %d\n', pos[1], pos[2], dir)
