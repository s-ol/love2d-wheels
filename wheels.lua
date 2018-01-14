require 'love.window'
require 'love.graphics'

local wheels = {}

function wheels.openWindow(width, height)
  love.window.setMode(width, height)
  love.graphics.clear()
  love.graphics.origin()
end

wheels.random         = love.math.random
wheels.isKeyDown      = love.keyboard.isDown
wheels.isMousePressed = love.mouse.isDown
wheels.getMouseXY     = love.mouse.getPosition

local graphics = {}
graphics.point     = love.graphics.point
graphics.line      = love.graphics.line
function graphics.rectangle(...) return love.graphics.rectangle('line', ...) end
function graphics.fillRectangle(...) return love.graphics.rectangle('fill', ...) end
function graphics.circle(...) return love.graphics.circle('line', ...) end
function graphics.fillCircle(...) return love.graphics.circle('fill', ...) end

function graphics.fillBackground(...)
  love.graphics.push 'all'
  graphics.setColor(...)
  love.graphics.origin()
  love.graphics.rectangle('fill', 0, 0, love.graphics.getDimensions())
  love.graphics.pop()
end

local _colors = {
  white   = {255, 255, 255},
  silver  = {191, 191, 191},
  gray    = {127, 127, 127},
  black   = {  0,   0,   0},
  red     = {255,   0,   0},
  maroon  = {127,   0,   0},
  yellow  = {255, 255,   0},
  olive   = {127, 127,   0},
  lime    = {  0, 255,   0},
  green   = {  0, 127,   0},
  aqua    = {  0, 255, 255},
  teal    = {  0, 127, 127},
  blue    = {  0,   0, 255},
  navy    = {  0,   0, 127},
  fuschia = {255,   0, 255},
  purple  = {127,   0, 127},
}

function graphics.setColor(color, ...)
  if not ... then
    return love.graphics.setColor(_colors[color] or error('unknown color: ' .. color))
  else
    return love.graphics.setColor(color, ...)
  end
end

setmetatable(wheels, {
  __index = function (self, key)
    if graphics[key] then
      return love.window.isCreated() and graphics[key] or error('you need to openWindow(w,h) first')
    end
  end
})

function love.run()
  love.math.setRandomSeed(os.time())
  for i=1,3 do love.math.random() end

  love.event.pump()
  love.timer.step()
  local start = love.timer.getTime()

  if love.window.isCreated() then
    love.graphics.present()
  end

  while true do
    love.event.pump()
    for e,a,b,c,d in love.event.poll() do
      if e == "quit" then return end
      love.handlers[e](a,b,c,d)
    end

    love.timer.step()

    if everyFrame then
      if love.window.isCreated() then
        love.graphics.origin()
      end
      everyFrame(love.timer.getTime() - start, love.timer.getDelta())
      if love.window.isCreated() then
        love.graphics.present()
      end
    end
    love.timer.sleep(0.001)
  end
end

setmetatable(_G, { __index = wheels })

return wheels
