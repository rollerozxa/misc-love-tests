local resolution = {
	x = 1280,
	y = 720
}

local step = 0

local ball = {
	x = 400,
	y = 200,
	r = 50,
	vel = {
		x = 0, -- + right
		y = 0 -- + down
	}
}

function math.lerp(a,b,t)
	return a * (1-t) + b * t
end

function math.round(a,x)
	return math.floor((a+0.5)*x)/x
end

function love.load()
end

function love.update(dt)
	ball.vel.y = ball.vel.y + 9.82 * dt -- constant acceleration formula, assume gravitational constant in sweden

	ball.x = ball.x + ball.vel.x
	ball.y = ball.y + ball.vel.y

	ball.vel.x = math.lerp(ball.vel.x, 0, dt) -- lerp x velocity - simulate air resistance

	if ball.y > 600 then -- if touching ground
		if ball.vel.y > 0 then -- and currently moving downwards (fix to prevent ball froom getting stuck)
			ball.vel.y = -ball.vel.y * 0.92 -- bounce with 92% restitution
		end
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(1,1,1)

	love.graphics.circle("fill", ball.x, ball.y, ball.r)
	love.graphics.setColor(0,0,0)
	love.graphics.circle("fill", ball.x, ball.y, ball.r-3)
	love.graphics.setColor(1,1,1)

	love.graphics.rectangle("fill", 0, 655, resolution.x, 3)

	step = step + 1
end