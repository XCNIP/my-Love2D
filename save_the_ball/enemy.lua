local love = require("love")

function enemy()
    return {
        level = 1,
        radius = 15,
        x = -50,
        y = -50,

        move = function (self, player_x, player_y)
            --Let enemy to  track the player 
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end

            if player_y - self.y > 0 then
                self.x = self.x + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
        end,

        draw = function (self)
            love.graphics.setColor(1, .3, .5)

            love.graphics.circle("fill", self.x, self.y, self.radius)

            love.graphics.setColor(1, 1, 1)
        end
    }
end

return enemy