require("file_utils")
require("args_helper")
local json = require("JSON")
local uuid = require("uuid")
local enc_utils = require("encryption_utils")
local secret_file_uuid = ReadKeyFileData()
local fmt_args = ReadArgs()
assert(fmt_args ~= nil)

if fmt_args.operation == "-e" then
	local enc_pass = enc_utils.encrypt_data(fmt_args.password, secret_file_uuid)
	InsertNewPassword(fmt_args.label, enc_pass)
end

if fmt_args.operation == "-d" then
	RetrieveNewPassword(fmt_args.label, secret_file_uuid)
end
