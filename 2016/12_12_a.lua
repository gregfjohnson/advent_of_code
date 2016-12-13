require 'printf'
require 'tprint'
--[[
cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2
jnz 1 5
cpy 7 c
inc d
dec c
jnz c -2
cpy a c
inc a
dec b
jnz b -2
cpy c b
dec d
jnz d -6
cpy 17 c
cpy 18 d
inc a
dec d
jnz d -2
dec c
jnz c -5
--]]
local a,b,c,d = 0,0,0,0
local reg = {a=0,b=0,c=1,d=0}
local pc = 1

function cpy(l)
    --print('cpy')
    local a1, a2 = l:match(' ([^%s]+) ([^%s]+)')
    if tonumber(a1) ~= nil then a1 = tonumber(a1)
    else
        a1 = reg[a1]
    end
    reg[a2] = a1
end

function jnz(l)
    --print('jnz', l)
    local a1, a2 = l:match(' ([^%s]+) ([^%s]+)')
    --print(a1,a2)
    if tonumber(a1) ~= nil then a1 = tonumber(a1)
    else
        a1 = reg[a1]
    end
    if a1 ~= 0 then
        pc = pc + tonumber(a2) - 1
    end
end

function inc(l)
    --print('inc')
    local a1 = l:match(' ([^%s]+)')
    reg[a1] = reg[a1] + 1
end

function dec(l)
    --print('dec')
    local a1 = l:match(' ([^%s]+)')
    reg[a1] = reg[a1] - 1
end

count = 0
function interp(pgm)
    local prevpc
    local l
    while true do
        l = pgm[pc]
        prevpc = pc
        pc = pc + 1
        local op = l:match('([^%s]*)')
            if op == 'cpy' then cpy(l)
        elseif op == 'jnz' then jnz(l)
        elseif op == 'dec' then dec(l)
        elseif op == 'inc' then inc(l)
        else error('bad op ' .. op)
        end
        count = count + 1
        if count % 1000 == 0 then
            printf('%10d:  pc %2d: %12s|  a %8d, b %8d, c %8d, d %8d\n', count, prevpc, l, reg['a'],reg['b'],reg['c'],reg['d'])
        end
        if pc > #pgm then break end
    end
    printf('%10d:  pc %2d: %12s|  a %8d, b %8d, c %8d, d %8d\n', count, prevpc, l, reg['a'],reg['b'],reg['c'],reg['d'])
end

pgm = {}
for l in io.lines(arg[1]) do
    table.insert(pgm, l)
end
interp(pgm)
