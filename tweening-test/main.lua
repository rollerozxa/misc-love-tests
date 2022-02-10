tween = require('tween')

box = {
	x = 128,
	y = 128,
	colour_r = math.random(),
	colour_g = math.random(),
	colour_b = math.random(),
}

cursor = {
	x = love.mouse.getX(),
	y = love.mouse.getY(),
	colour_r = math.random(),
	colour_g = math.random(),
	colour_b = math.random(),
}

tweener = nil

function love.update()
	--[[if love.mouse.isDown(1) and not oldisdown then
		cursor.x = love.mouse.getX() - 16
		cursor.y = love.mouse.getY() - 16
		cursor.colour_r = math.random()
		cursor.colour_g = math.random()
		cursor.colour_b = math.random()
		tweener = tween.new(2, box, cursor, tween.easing.inOutBack)
	end
	oldisdown = love.mouse.isDown(1)]]
	if not tweener then
		cursor.x = math.random(20,780)
		cursor.y = math.random(20,580)
		cursor.colour_r = math.random()
		cursor.colour_g = math.random()
		cursor.colour_b = math.random()
		tweener = tween.new(2, box, cursor, tween.easing.inOutBack)
	end

	if tweener then
		local complete = tweener:update(0.1)
		if complete then
			tweener = nil
		end
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0.2,0.2,0.2)
	love.graphics.setColor(box.colour_r,box.colour_g,box.colour_b)
	love.graphics.rectangle("fill", box.x, box.y, 32, 32)
end
