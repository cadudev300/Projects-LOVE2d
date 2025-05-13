local Enemy = Object:extend()
local frames = {}
local currentFrame = 1
score_enemy = 1
function Enemy:new(  x, y )
	self.x = x
	self.y = y
	self.speed = 200
	self.life = 150

	self.image_Idle = love.graphics.newImage("Ninja_Monk/Idle.png")
	self.image_Run = love.graphics.newImage("Ninja_Monk/Walk.png")
	self.Image_Attack = love.graphics.newImage("Ninja_Monk/Blade.png")
	self.image = self.image_Idle
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	
	local width = self.width
	local height = self.height
	local frame_width = 96
	local frame_height = 96
	for i=0,6 do		
		table.insert(frames, love.graphics.newQuad(i*frame_width, 0, frame_width, frame_height, width, height))
	end
end

function Enemy:update( dt )

	if self.y + self.height >= 400 then
		self.y = 300
	end

		currentFrame = currentFrame + 10 * dt
		if currentFrame >= 4 then
			currentFrame = 1
		end


	if love.keyboard.isDown("left") then
		self.x = self.x - self.speed * dt
		self.image = self.image_Run
	elseif love.keyboard.isDown("right") then
		self.x = self.x + self.speed * dt
		self.image = self.image_Run
	elseif love.keyboard.isDown("m") then
		self.image = self.Image_Attack

	else
		self.image = self.image_Idle
	end
end

function Enemy.draw( self )
	love.graphics.draw(self.image, frames[math.floor(currentFrame)], self.x, self.y)
	love.graphics.print("Enemy: " .. math.floor(self.life))
	love.graphics.print("score: " .. math.floor(score_enemy), 100, 0)
end

return Enemy