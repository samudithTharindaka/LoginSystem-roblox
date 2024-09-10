-- Define the class
local EncryptDataLibrary = {}
EncryptDataLibrary.__index = EncryptDataLibrary

-- Constructor
function EncryptDataLibrary.new()
    local self = setmetatable({}, EncryptDataLibrary)
    self.commonKey = "KeyOfVeryality"
    return self
end

 function EncryptDataLibrary:simpleHash(key)
    local hash = 0
    for i = 1, #key do
        hash = (hash + string.byte(key, i) * i) % 256
    end
    return hash
end

-- XOR encryption function
function EncryptDataLibrary:xorEncrypt(data, key)
    local keyHash = self:simpleHash(key)
    local encrypted = {}

    for i = 1, #data do
        local char = string.byte(data, i)
        local encryptedChar = bit32.bxor(char, keyHash)
        table.insert(encrypted, string.char(encryptedChar))
    end

    return table.concat(encrypted)
end

function EncryptDataLibrary:xorDecrypt(data, key)
    return self:xorEncrypt(data, key)  -- XOR decrypt is the same as encrypt
end

function EncryptDataLibrary:encryptData(data)
    return self:xorEncrypt(data, self.commonKey)
end

-- Decrypts data using XOR and hashing
function EncryptDataLibrary:decryptData(data)
    return self:xorDecrypt(data,self.commonKey)
end

-- Return the class
return EncryptDataLibrary