local love = require "love"

function enemy()
    local dice = math.random(1, 4)
    local _x, _y
    local _radius = 20

    if dice == 1 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = - _radius * 4 
    elseif dice == 2 then
        _x = - _radius * 4
        _y = math.random(_radius, love.graphics.getHeight())
    elseif dice == 3 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = love.graphics.getHeight() + (_radius * 4)
    else
        _x = love.graphics.getWidth() + (_radius * 4)
        _y = math.random(_radius, love.graphics.getHeight())
    end

    return {
        level = 2,
        radius = 20,
        x = _x,
        y = _y,

        move = function (self, player_x, player_y)
            --Let enemy to  track the player 
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end

            if player_y - self.y > 0 then
                self.y = self.y + self.level -- BUG: should change the self.y instead of
                -- self.x
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level   
            end
        end,

        draw = function (self)
            love.graphics.setColor(0, 0, 0)

            love.graphics.circle("fill", self.x, self.y, self.radius)

            love.graphics.setColor(1, 1, 1)
        end
    }
end

return enemy