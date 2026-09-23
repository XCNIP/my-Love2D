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
    },
    points = 0,
    levels = {15, 30, 60, 120}
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

function starNewGame()
    game.state["menu"] = false
    game.state["running"] = true

    game.points = 0
    
    enemies = {
        enemy(1),
    }
end

function love.mousepressed(x, y, button, istouch, presses)
-- this is a callback function
-- when the mouse button is pressed, this function will be called
    if not game.state["running"] then
        if button == 1 then
            if game.state["menu"] then
                for index in pairs(buttons.menu_stats) do
                    buttons.menu_stats[index]:checkPreesed(x, y, player.radius)
                end
            end
        end
    end
end

function love.load()
    love.window.setTitle("Save the ball")
    -- Sets the current visibility of the cursor. 
    love.mouse.setVisible(false)
    
    buttons.menu_stats.palygame = button("Play game", starNewGame, nil, 150, 50)
    buttons.menu_stats.settings = button("Settings", nil, nil, 150, 50)
    buttons.menu_stats.exit = button("Exit", love.event.quit, nil, 150, 50)

end



function love.update(dt)
    -- x, y = love.mouse.getPosition()
    -- Returns the current position of the mouse. 
    player.x , player.y = love.mouse.getPosition()
    
    if game.state["running"] then
        for i = 1, #enemies do
            enemies[i]:move(player.x, player.y)
        end
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