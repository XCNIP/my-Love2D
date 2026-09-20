---@diagnostic disable: lowercase-global
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
    num = 0
    coki = {
        x = 0,
        y = 0,
        r = 0,
        sx = 0,
        sy = 0,
        sprite = love.graphics.newImage("sprites/Pink_Monster_Walk.png"),
        animation = {
            direction = "right",
            idle = true,
            fram = 1,
            max_fram = 6,
            speed = 14,
            timer = .1
        }
    }
   

   SPRITE_WIDTH,SPRITE_HEIGHT = 192, 32
   QUAD_WIDTH = SPRITE_WIDTH / 6
   QUAD_HEIGHT = SPRITE_HEIGHT
   quads = {}
   for i = 1, coki.animation.max_fram do
        quads[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 0, QUAD_WIDTH, QUAD_HEIGHT,
        SPRITE_WIDTH,SPRITE_HEIGHT)
   end
   love.graphics.setBackgroundColor(.5, .5, .5)
end

function love.update(dt)
    if not coki.animation.idle then 
        
    end
end

function love.draw()
    love.graphics.scale(2)
    love.graphics.draw(coki.sprite,quads[1],coki.x, coki.y)
end
