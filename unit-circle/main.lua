resolution = {
	x = 1280,
	y = 720
}

love.window.setMode(resolution.x, resolution.y)

step = 0

function love.load()
	font = love.graphics.newFont(11)
	bigFont = love.graphics.newFont(24)
end

angle = math.pi / 3

function love.update()
	if love.keyboard.isDown("d") and not old_d then
		angle = angle + (math.pi / 12)
	elseif love.keyboard.isDown("a") and not old_a then
		angle = angle - (math.pi / 12)
	end
	old_d = love.keyboard.isDown("d")
	old_a = love.keyboard.isDown("a")

	--if step % 15 == 0 then
	--	angle = angle + (math.pi / 12)
	--end

	angle = angle % (2*math.pi)
end

function love.draw()
	love.graphics.setBackgroundColor(0,0,0)

	love.graphics.setColor(1,1,1)

	local x = math.cos(angle) * 100 + (resolution.x / 2)
	local y = math.sin(angle) * 100 + (resolution.y / 2)
	love.graphics.line(resolution.x / 2, resolution.y / 2, x, y)

	love.graphics.circle("line", resolution.x/2, resolution.y/2, 100)
	love.graphics.line(resolution.x/2, resolution.y/2, (resolution.x/2)+100, resolution.y/2)

	love.graphics.setFont(bigFont)
	love.graphics.print("angle: "..angle, 10, 10)

	love.graphics.setFont(font)
	love.graphics.print("FPS: "..love.timer.getFPS(), 10, resolution.y-30)

	step = step + 1
end