require 'tprint'
--[[
The first floor contains a strontium generator, a strontium-compatible
microchip, a plutonium generator, and a plutonium-compatible microchip.

The second floor contains a thulium generator, a ruthenium generator,
a ruthenium-compatible microchip, a curium generator, and a
curium-compatible microchip.

The third floor contains a thulium-compatible microchip.

The fourth floor contains nothing relevant.
-----

  S s P p
  T R r C c
E t
-----
--]]
-- always ok to move empty elevator.
-- always ok as far as "from" floor to move a processor.
-- move processor "to" floor:  ok iff no gen's,
--                             or my gen (which may have come with).
-- move gen "from" floor:  

-- for every processor, either it has its gen, or there are no gens.
function floorOK(floor, whichfloor)
    local c,C,p,P,r,R,s,S,t,T=
        floor:match('....(.)..(.)..(.)..(.)..(.)..(.)..(.)..(.)..(.)..(.)')
    local procs = {}
    local gens  = {}
    if c == whichfloor then procs['c'] = true end
    if p == whichfloor then procs['p'] = true end
    if r == whichfloor then procs['r'] = true end
    if s == whichfloor then procs['s'] = true end
    if t == whichfloor then procs['t'] = true end

    if C == whichfloor then gens['c'] = true end
    if P == whichfloor then gens['p'] = true end
    if R == whichfloor then gens['r'] = true end
    if S == whichfloor then gens['s'] = true end
    if T == whichfloor then gens['t'] = true end

    local gct = 0
    for _,_ in pairs(gens) do gct = gct + 1 end
    if gct == 0 then return true end

    for p,_ in pairs(procs) do
        if gens[p] == nil and gct > 0 then return false end
    end
    return true
end

function configOK(config)
    return     floorOK(config, '1')
           and floorOK(config, '2')
           and floorOK(config, '3')
           and floorOK(config, '4')
end

--print(floorOK('E1 c2 C2 p3 P3 r2 R2 s3 S3 t1 T2', '1'))
--print(floorOK('E1 c2 C2 p3 P3 r2 R2 s3 S3 t1 T2', '2'))
--print(floorOK('E1 c2 C2 p3 P3 r2 R2 s3 S3 t1 T2', '3'))
print(configOK('E1 c2 C2 p3 P3 r2 R2 s3 S3 t1 T2', '4'))
print(configOK('E1 c2 C4 p3 P3 r2 R2 s3 S3 t1 T2', '2'))

maze = {
    ['E1 c2 C2 p3 P3 r2 R2 s3 S3 t1 T2'] = {}
}

while true do
    didSomething = false
    for cfg,_ in pairs(maze) do
        if elup(cfg)         then didSomething = true; break end
        if eldown(cfg)       then didSomething = true; break end
        if oneItemUp(cfg)    then didSomething = true; break end
        if oneItemDown(cfg)  then didSomething = true; break end
        if twoItemsUp(cfg)   then didSomething = true; break end
        if twoItemsDown(cfg) then didSomething = true; break end
    end
end
