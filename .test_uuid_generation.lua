local uuid = require("uuid")
describe("UUID generation tests", function()
    it("Should generate unique UUID's", function()
        local last_uuid = uuid()
        for i = 1, 10 do
            local current_uuid = uuid()
            assert.are_not.same( current_uuid, last_uuid )
        end
    end)
end)
