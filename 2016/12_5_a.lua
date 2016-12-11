pwd = ''
--input = 'wtnhxymk'
input = 'abc'
index = 0

while #pwd < #input do
    f = io.open('/tmp/xxx', 'w')
    f:write(input .. tostring(index))
    f:close()
    os.execute('md5sum /tmp/xxx > /tmp/yyy')
    f = io.open('/tmp/yyy', 'r')
    hash = f:read('*l')
    f:close()
    if hash:sub(1,5) == '00000' then
        pwd = pwd .. hash:sub(6,6)
        printf('pwd %s; index %d\n', pwd, index)
    end
    index = index + 1
end
