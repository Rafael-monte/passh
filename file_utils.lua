local KEY_FILE_LOCATION = "" -- HACK: Insert the key file location right here
local uuid = require("uuid")
local enc_utils = require("encryption_utils")
local PASSH_FILE_LOCATION = "" -- HACK: Insert the passwords file location

local function create_new_key_file()
	local file = assert(io.open(KEY_FILE_LOCATION, "w"))
	local generated_uuid = uuid()
	assert(file:write(generated_uuid))
	file:close()
	return generated_uuid
end

function ReadKeyFileData()
	local file = io.open(KEY_FILE_LOCATION, "r")
	if file == nil then
		return create_new_key_file()
	end
	local generated_uuid = assert(file:read())
	file:close()
	return generated_uuid
end

function InsertNewPassword(label, enc_pass)
	local file = io.open(PASSH_FILE_LOCATION, "a+")
	if file == nil then
		local nfile = io.open(PASSH_FILE_LOCATION, "w")
		assert(nfile ~= nil)
		nfile:close()
	end
	file = io.open(PASSH_FILE_LOCATION, "a+")
	assert(file ~= nil)
	assert(file:write(label .. ":" .. enc_pass .. "\n"))
	file:close()
	print(label .. " Inserted")
end

function RetrieveNewPassword(label, secret_key)
	local file = io.open(PASSH_FILE_LOCATION, "a+")
	if file == nil then
		local nfile = io.open(PASSH_FILE_LOCATION, "w")
		assert(nfile ~= nil)
		nfile:close()
	end
	file = io.open(PASSH_FILE_LOCATION, "a+")
	assert(file ~= nil)
	for line in file:lines() do
		local lbl, password = line:match("([^:]+):([^:]+)")
		if lbl == label then
			local decrypted = enc_utils.decrypt_data(password, secret_key)
			print("Name: " .. lbl .. ", Password: " .. decrypted)
		end
	end
end

return ReadKeyFileData, InsertNewPassword
