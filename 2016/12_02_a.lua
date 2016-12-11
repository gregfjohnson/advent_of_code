--[[
1 2 3
4 5 6
7 8 9
--]]

function left(current)
    if current == 1 or current == 4 or current == 7 then return current
    else return current - 1
    end
end

function right(current)
    if current == 3 or current == 6 or current == 9 then return current
    else return current + 1
    end
end

function up(current)
    if current == 1 or current == 2 or current == 3 then return current
    else return current - 3
    end
end

function down(current)
    if current == 7 or current == 8 or current == 9 then return current
    else return current + 3
    end
end

function move(current, todo)
    if todo == 'L' then return left (current) end
    if todo == 'U' then return up   (current) end
    if todo == 'R' then return right(current) end
    if todo == 'D' then return down (current) end
end

function doline(current, line)
    for i = 1, #line do
        current = move(current, line:sub(i,i))
    end
    return current
end

current = 5
result = ''
for l in io.lines() do
    current = doline(current, l)
    result = result .. tostring(current)
end
print(result)
