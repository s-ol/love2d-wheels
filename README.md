wheels
======
wheels is a set of simplifications for love2d to allow a nice learning curve.

riding with wheels
------------------
to use wheels copy `conf.lua` and `wheels.lua` to a folder.
your own program goes into `main.lua`.
at the top of `main.lua` you should enable wheels like this:
```lua
require('wheels')

-- your code here
```

wheels and lua give you many functions to program with. here is a list:

### `print(...)`
print all arguments to the terminal.

### `openWindow(width, height)`
create the window to draw in with the given size

### `setColor(color)` or `setColor(red, green, blue)`
set the current color to draw with.
you can either use color names like `setColor('red')` or give three numbers.
each number represents the amount of red, green and blue in the mix and should be from 0 to 255.
the available color names are: `white`, `silver`, `gray`, `black`, `red`, `maroon`, `yellow`,
`olive`, `lime`, `green`, `aqua`, `teal`, `blue`, `navy`, `fuschia`, and `purple`.

### `point(x, y)`
draw a point at the (x, y) coordinates.

### `line(a_x, a_y, b_x, b_y)`
draw a line from (a\_x, a\_y) to (b\_x, b\_y).

### `rectangle(x, y, width, height)` and `fillRectangle(x, y, width, height)`
draw a rectangle with the top-left corner at (x, y) and the specified width and height.
you can choose to draw it as four lines or fill it in.

### `circle(x, y, radius)` and `fillCircle(x, y, radius)`
draw a circle with the center at (x, y) and the specified radius.
you can choose to draw it as one line or fill it in.

### `fillBackground(color)` or `fillBackground(red, green, blue)`
fills the whole screen with a color. the colors work like `setColor(...)`

### `random()`, `random(max)` and `random(min, max)`
gives you random numbers.
- `random()` gives numbers from 0 to 1
- `random(max)` gives whole numbers from 1 to max
- `random(min, max)` gives whole numbers from min to max

### various mathematical functions
Lua has many mathematical functions built in:
- `math.abs(a)` - absolute value of a
- `math.sqrt(a)` - square root of a
- `math.pow(a, b)` - a taken to the power of b
- `math.floor(a)` and `math.ceil(b)` - a rounded down and b rounded upwards
- `math.exp(a)` and `math.log(b)` - *e* to the power of a and the natural logarithm of b
- `math.cos(a)`, `math.sin(a)`, `math.tan(a)`, `math.acos(a)`, `math.asin(a)`, `math.atan(a)` - basic trigonometry
- `math.pi` - pi as a variable

wheels in motion
----------------
when you get bored with images, you can set wheels into motion by creating an `everyFrame` function.
it will be run every frame, so that you can animate your image and be interactive.

### `everyFrame`
everything you write into this function will be run every frame.
often you want to have  a `fillBackground(...)` at the top of your function.
here is an example:
```lua
openWindow(400, 400)
function everyFrame()
  fillBackground('black')

  local x, y = getMouseXY()
  setColor('white')
  circle(x, y, 20)
end
```

### `isKeyDown(key)`
lets you know whether a key is pressed.
for example `if isKeyDown('a') then ...`

### `isMouseDown(number)`
lets you know whether a mouse button is pressed.
for example `if isMouseDown(1) then ...`

### `getMouseXY()`
lets you know where the mouse is right now.
for example `local x, y = getMouseXY()`
