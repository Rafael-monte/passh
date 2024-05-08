FormattedArgs = {
	operation = nil,
	label = nil,
	password = nil,
}

FormattedArgs.__index = FormattedArgs

function ReadArgs()
	if #arg < 2 then
		print("Usage: ")
		print("passh [-d, -e] [label] [password]")
		error("Invalid number of arguments provided, expected at least 2, got " .. #arg)
	end
	local operation = arg[1]
	local label, password = arg[2], arg[3] or nil
	if operation ~= "-d" and operation ~= "-e" then
		error('Invalid operator: "' .. operation .. '"')
	end

	if operation == "-e" and password == nil then
		error("Tried to encrypt empty password")
	end

	local fmt_args = {
		operation = operation,
		label = label,
		password = password,
	}

	setmetatable(fmt_args, FormattedArgs)
	return fmt_args
end
