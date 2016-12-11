--[[
    1
  2 3 4
5 6 7 8 9
  A B C
    D
--]]

moveum = {
    --         U    D    L    R
    ['1'] = { '1', '3', '1', '1' },
    ['2'] = { '2', '6', '2', '3' },
    ['3'] = { '1', '7', '2', '4' },
    ['4'] = { '4', '8', '3', '4' },
    ['5'] = { '5', '5', '5', '6' },
    ['6'] = { '2', 'A', '5', '7' },
    ['7'] = { '3', 'B', '6', '8' },
    ['8'] = { '4', 'C', '7', '9' },
    ['9'] = { '9', '9', '8', '9' },
    ['A'] = { '6', 'A', 'A', 'B' },
    ['B'] = { '7', 'D', 'A', 'C' },
    ['C'] = { '8', 'C', 'B', 'C' },
    ['D'] = { 'B', 'D', 'D', 'D' },
}

function move(current, todo)
    --debug.debug()
    --print('start m', current,todo)
    local i
    if     todo == 'U' then i = 1
    elseif todo == 'D' then i = 2
    elseif todo == 'L' then i = 3
    elseif todo == 'R' then i = 4
    end
    --print('end m', current, i)
    --print(moveum[current])
    --print(moveum[current][i])
    return moveum[current][i]
end

function doline(current, line)
    for i = 1, #line do
        current = move(current, line:sub(i,i))
    end
    return current
end

current = '5'
result = ''
for l in io.lines(arg[1]) do
    --print(l)
    current = doline(current, l)
    result = result .. tostring(current)
end
print(result)
