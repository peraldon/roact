--[[
    Originally written by Bradsharp.
]]
local Symbol = require(script.Parent.Symbol)
local Type = require(script.Parent.Type)

local AnimatorImpl = Symbol.named("AnimatorImpl")
local AnimatorInternalApi = {}

function AnimatorInternalApi.create(...)
    local tweenInfo = TweenInfo.new(...)
    return function(newValue, optionalStartValue)
        local animator = {
            [Type] = Type.Animation,
            [AnimatorImpl] = {
                tweenInfo = tweenInfo,
                value = newValue,
                optionalStartValue = optionalStartValue
            }
        }

        animator.getTweenInfo = function(self)
            return self[AnimatorImpl].tweenInfo
        end

        animator.getValue = function(self)
            return self[AnimatorImpl].value
        end

        animator.getStartValue = function(self)
            return self[AnimatorImpl].optionalStartValue
        end

        return animator
    end
end

return AnimatorInternalApi
