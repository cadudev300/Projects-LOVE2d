function love.load( ... )
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	circles = {}
end

function love.update(dt)
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	if love.mouse.isDown(2) then
		table.insert(circles, {x = mouseX, y = mouseY, radius = 10})
	end
end

function love.keypressed( key )
	if key == "space" then
		for i=0,#circles do
			table.remove(circles, i)
		end
	end
end

function love.draw( ... )
	for i,v in ipairs(circles) do
		love.graphics.circle('fill', v.x, v.y, v.radius)
	end
end