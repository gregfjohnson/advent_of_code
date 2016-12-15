require 'tprint'
-- number of positions, position at time 0.
-- 440895 positions (product of below).

input = {
    {17,15,},
    {3,2,},
    {19,4,},
    {13,2,},
    {7,2,},
    {5,0,},
    {11,0,},
}
--[[
16
1
7
6
0
1
input = {
    {17,1,},
    {3,2,},
    {19,3,},
    {13,4,},
    {7,5,},
    {5,6,},
}
--]]
for i = 1, #input do
    input[i][2] = (input[i][2] + i) % input[i][1]
end
tprint(input)
time = 0
while true do
    if      input[1][2] == 0
        and input[2][2] == 0
        and input[3][2] == 0
        and input[4][2] == 0
        and input[5][2] == 0
        and input[6][2] == 0
        and input[7][2] == 0
    then
        break
    end
    input[1][2] = (input[1][2] + 1) % input[1][1]
    input[2][2] = (input[2][2] + 1) % input[2][1]
    input[3][2] = (input[3][2] + 1) % input[3][1]
    input[4][2] = (input[4][2] + 1) % input[4][1]
    input[5][2] = (input[5][2] + 1) % input[5][1]
    input[6][2] = (input[6][2] + 1) % input[6][1]
    input[7][2] = (input[7][2] + 1) % input[7][1]
    time = time + 1
end
print(time)
