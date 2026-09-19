--[[
    Main game script for this Love2D project.
    This file initializes the game state and contains the core lifecycle
    functions used by LOVE, such as load, update, and draw.

    API reference: https://love2d.org/wiki/Main_Page
    For detailed documentation on LOVE functions and modules, see the
    official Love2D API website.
--]]

_G.love = require("love") -- import love modules

function love.load()
     _G.num = 0    
end

function love.update(dt)
    _G.num = num + 1
end

function love.draw()
    love.graphics.rectangle("line", 100, 100, 100, 100)
    -- love.graphics.rectangle( mode, x, y, width, height, rx, ry, segments )
end

