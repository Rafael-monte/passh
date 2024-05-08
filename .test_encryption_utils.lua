local enc_utils = require("encryption_utils")
local key = "abcdefghijklmnopqrstuvwxyz"

describe("Encryption utils test", function()

    it('Should encrypt data, given the string data and key', function()
        local data = "testData-123"
        local encrypted = enc_utils.encrypt_data(data, key)
        assert.are_not.same( data, encrypted )
    end)

    it('Should retrieve formatted data, given the encrypted string and the key', function()
        local data = "testData-123"
        local encrypted_data = enc_utils.encrypt_data(data, key)
        local decrypted = enc_utils.decrypt_data(encrypted_data, key)
        assert.are.same( data, decrypted )
    end)

end)
