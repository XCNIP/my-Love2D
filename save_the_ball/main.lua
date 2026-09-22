local love = require "love"
local enemy = require "enemy"
local button = require "button"

-- set the randomseed 
math.randomseed(os.time())

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

local buttons = {
    menu_stats = {}
}

local enemies = {}

function love.load()
    love.window.setTitle("Save the ball")
    -- Sets the current visibility of the cursor. 
    love.mouse.setVisible(false)
    
    buttons.menu_stats.palygame = button("Play game", nil, nil, 150, 50)
    buttons.menu_stats.settings = button("Settings", nil, nil, 150, 50)
    buttons.menu_stats.exit = button("Exit", love.event.quit, nil, 150, 50)

    -- Creat enemy array
    for i = 1, 2 do 
        table.insert(enemies, i, enemy()) --test
    end
end

function love.update(dt)
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

    
    if game.state["running"] then
    
        for i = 1, #enemies do
            enemies[i]:draw() -- NOTE: draw enemies
        end

        love.graphics.circle("fill", player.x, player.y,
        player.radius)
    elseif game.state["menu"] then
        
        buttons.menu_stats.palygame:draw(100, 100, 25, 20)
        buttons.menu_stats.settings:draw(100, 170, 25, 20)
        buttons.menu_stats.exit:draw(100, 240, 25, 20)
    end 

    if not game.state["running"] then
        love.graphics.circle("fill", player.x, player.y,
        player.radius / 2)
    end
end