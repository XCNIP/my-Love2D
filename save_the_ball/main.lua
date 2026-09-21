local love = require "love"
local enemy = require "enemy"

local game = {
    difficulty = 1,
    state = {
        menu = true,
        paused  = true,
        running = false,
        ended = false
    }
}

local player = {
    radius =  25,
    x = 50,
    y = 50,
}

function log()
    io.write("\27[2K\27[1G") 
    io.write(string.format("\rplayer.x: %d, player.y: %d",
     player.x, player.y))
    io.flush()
end

local enemies = {}

function love.load()
    love.window.setTitle("Save the ball")
    -- Sets the current visibility of the cursor. 
    love.mouse.setVisible(false)
    
    -- Creat enemy array
    table.insert(enemies, 1, enemy())
end

function love.update()
    -- x, y = love.mouse.getPosition()
    -- Returns the current position of the mouse. 
    player.x , player.y = love.mouse.getPosition()
    
    for i = 1, #enemies do
        enemies[i]:move(player.x, player.y)
    end
    
    log()
end

function love.draw()
    love.graphics.printf("FPS: " .. love.timer.getFPS(),
        love.graphics.newFont(16), 10, love.graphics.getHeight() - 20,
        love.graphics.getWidth())

    -- love.graphics.circle( mode, x, y, radius )
    if not game.state["running"] then

        for i = 1, #enemies do
            enemies[i]:draw()
        end
        
        love.graphics.circle("fill", player.x, player.y,
        player.radius / 2)
    end
    
    if game.state["running"] then
        love.graphics.circle("fill", player.x, player.y,
        player.radius)
    end 
end