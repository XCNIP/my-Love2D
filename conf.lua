--[[
    Love2D project configuration.
    Sets the window properties, save identity, and general engine settings
    for the game.
    
    Official reference: https://www.love2d.org/wiki/Config_Files
    This file is loaded by LOVE before the game starts and allows you to
    configure window behavior, persistence, modules, and other engine options.
--]]
function love.conf(t)
    t.identity = "data/saves"
    t.version  = "0.0.2"
    t.console = false
    t.externalstorage = true
    t.gammacorrect = true
    t.window.title = "Stupid game"
    t.window.icon = "icon/love-app-icon.png"
    t.window.width = 1200
    t.window.height = 700
    t.window.resizable = true
    -- t.window.borderless = true
    t.window.display = 2
    t.window.fullscreen = false
    t.window.minwidth = 1000
    t.window.minheight = 500
    t.window.x = 200
    t.window.x = 500
    t.modules.timer = false -- The timer default is true
end
