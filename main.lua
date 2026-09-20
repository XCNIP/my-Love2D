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
     _G.color_R = 0
     _G.pacman = {}
     pacman.x = 200
     pacman.y = 200
     pacman.size = 100
     pacman.eat = false
     love.graphics.setBackgroundColor(.3, .5, .5)
     _G.food_x = 600
     _G.food_y = 150
     _G.food_size = 100
end

function love.update(dt)
    pacman.x = pacman.x + 2
    if pacman.x >= food_x + 50 then 
        pacman.eat = true
    end
end

function love.draw()
    if not pacman.eat then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", food_x, food_y, food_size, food_size)
    end
    -- love.graphics.rectangle( mode, x, y, width, height, rx, ry, segments )
    love.graphics.setColor(1, .5, .3)
    -- love.graphics.circle("line",100, 400, 40)
    love.graphics.arc("fill", pacman.x, pacman.y, pacman.size, 3.14 * 30 / 180, 3.14 * 330 / 180)
end

