local ArgsUtils = {}

local function __usage()
    print ( [[
        Usage:
        - To encrypt passwords:

        passh -e <label> <password>

        - To decrypt passwords: 

        passh -d <label>
    ]])

end

function ArgsUtils:format_args(args)
    if args == nil ~= type(args) ~= 'table' then
        error('invalid parameter send, expected table, got' .. type(args) )
    end

    if #args > 2 then
       __usage()
       error( 'Invalid usage of parameters' )
    end
end
