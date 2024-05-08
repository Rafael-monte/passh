local openssl = require("openssl")
local envp_cypher = openssl.cipher.get("des")

local enc_utils = {}

enc_utils.encrypt_data = function(data, key)
	if key == nil or type(key) ~= "string" then
		error("Invalid key given")
	end

	if data == nil or type(data) ~= "string" then
		error("Invalid datatype given")
	end

	local encrypted = envp_cypher:encrypt(data, key)
	return encrypted
end

enc_utils.decrypt_data = function(encrypted_data, key)
	if key == nil or type(key) ~= "string" then
		error("Invalid key given")
	end

	if encrypted_data == nil or type(encrypted_data) ~= "string" then
		error("Invalid datatype given")
	end

	local decrypted = envp_cypher:decrypt(encrypted_data, key)
	return decrypted
end

return enc_utils
