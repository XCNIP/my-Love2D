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
    pacman.speed = 2
    pacman.rotation = 0
    pacman.flashTick = 7
    pacman.angle1 = math.pi * 30 / 180 + pacman.rotation
    pacman.angle2 = math.pi * 330 / 180 + pacman.rotation
    love.graphics.setBackgroundColor(.3, .5, .5)
    _G.food = {
        x     = 600,
        y     = 150,
        size  = 100,
        eaten = false,
    }
    _G.tick = 0
    _G.flag = false
end

function love.update(dt)
    if love.keyboard.isDown("down") then
        pacman.rotation = (pacman.rotation + 3.14/180) % (2 * math.pi)
    end
    if love.keyboard.isDown("up") then
        pacman.rotation = (pacman.rotation - 3.14/180) % (2 * math.pi) 
    end
    if love.keyboard.isDown("a") then
        pacman.x = pacman.x - 1
    end
    if love.keyboard.isDown("d") then
        pacman.x = pacman.x + 1
    end
    if love.keyboard.isDown("w") then
        pacman.y = pacman.y - 1
    end
    if love.keyboard.isDown("s") then
        pacman.y = pacman.y + 1
    end
    if pacman.x >= food.x + 50 then
        food.eaten = true
    end
    
    _G.tick = tick + 1

    if tick >= pacman.flashTick then
        _G.tick = 0
        if _G.flag == false then
            _G.flag = true
            pacman.angle1 = 0
            pacman.angle2 = 10
        else
            _G.flag = false
            pacman.angle1 = math.pi * 40 / 180 + pacman.rotation
            pacman.angle2 = math.pi * 320 / 180 + pacman.rotation
        end
    end
end

function love.draw()
    if not food.eaten then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", food.x, food.y, food.size, food.size)
    end
    -- love.graphics.rectangle( mode, x, y, width, height, rx, ry, segments )
    love.graphics.setColor(1, .5, .3)
    -- love.graphics.circle("line",100, 400, 40)
    love.graphics.arc("fill", pacman.x, pacman.y, pacman.size, pacman.angle1,pacman.angle2 )
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(pacman.rotation, 0, 0)
end
