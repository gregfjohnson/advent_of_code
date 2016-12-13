require 'tprint'
require 'printf'

if arg[1] then
    l = io.lines(arg[1])()
else
    l = io.lines()()
end

-- table as a stack.  element:
-- { nextChar index, n times through to go, chars }

input = { {nextChar = 1, n = 1, chars = l} }

function prt()
    for i = 1, #input do
        printf('nextChar %d, n %d, chars --|%s|--\n', input[i].nextChar,
                input[i].n, input[i].chars:sub(input[i].nextChar))
    end
    print()
end

function next()
    --print('next start:'); prt()
    while true do
        if #input == 0 then return -1 end

        local top = input[1]
        if top.n == 0 then
            table.remove(input, 1)

        elseif top.nextChar > #top.chars then
            top.n = top.n - 1
            top.nextChar = 1

        else
            local result = top.chars:sub(top.nextChar, top.nextChar)
            --print(top.chars)
            --print('end; got', result)
            top.nextChar = top.nextChar + 1
            -- prt()
            return result
        end
    end
end

result = 0
--rs = ''
while true do
    --print('loop top:  rs', rs)
    --tprint(input)
    ch = next()
    --print('ch', ch)
    if ch == -1 then break end

    if ch ~= '(' then
        result = result + 1
        --rs = rs .. ch
    else
        local pat = '('
        while pat:sub(#pat,#pat) ~= ')' do
            pat = pat .. next()
        end
        local len, count = pat:match('%(([%d]+)x([%d]+)')
        count = tonumber(count)
        len = tonumber(len)
        --print('pat', pat, len, count)
        local rep = ''
        for i = 1, len do rep = rep .. next() end
        table.insert(input, 1, {nextChar = 1, n = count, chars = rep})
    end
end
print(result)
