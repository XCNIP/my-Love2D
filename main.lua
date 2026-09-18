_G.love = require("love") --import love modules

function love.load()
     _G.num = 0    
end

function love.update(dt)
    _G.num = num + 1
end

function love.draw()
    love.graphics.print(num)
end

