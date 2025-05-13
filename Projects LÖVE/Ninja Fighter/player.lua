local Player = Object:extend()
score_player = 1
function Player.new( self, x, y )
	self.x = x
	self.y = y
	self.image_Idle = love.graphics.newImage("Ninja_Peasant/Idle.png")
	self.image_Run = love.graphics.newImage("Ninja_Peasant/Run.png")
	self.image_Atack =  love.graphics.newImage("Ninja_Peasant/Attack_1.png")
	self.image = self.image_Idle
	self.speed = 200
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	local width = self.width 
	local height =self.height
	self.ground = self.y
	self.y_velocity = 0
	self.jump = -400
	self.gravity = -600
	self.life = 150

	local frame_width = 96
	local frame_height = 96
	
	frames = {}

	for i=0,6 do
		table.insert(frames, love.graphics.newQuad(i*frame_width, 0, frame_width, frame_height, width, height))
	end
	currentFrame = 1
end

function Player:update( dt )
	
	currentFrame = currentFrame + 10 * dt
	
	if(currentFrame >= 6)then
		currentFrame = 1	
	end

	if(self.y + self.height >= 400)then
		self.y = 300
	end

	if(self.y_velocity ~= 0)then
		self.y = self.y + self.y_velocity * dt
		self.y_velocity = self.y_velocity - self.gravity * dt
	end

	if(self.y > self.ground)then
		self.y_velocity = 0
		self.y = self.ground
	end

	if love.keyboard.isDown("d") then
		self.x = self.x + self.speed * dt
		self.image = self.image_Run
	elseif love.keyboard.isDown("a") then
		self.x = self.x - self.speed * dt
		self.image = self.image_Run
	elseif love.keyboard.isDown("f") then
		self.image = self.image_Atack
	else
		self.image = self.image_Idle
	end
end

function Player.keypressed( self, key )
	if key == "w" then
		if(self.y_velocity == 0)then
			self.y_velocity = self.jump
		end
	end
end

function Player.draw( self )
	love.graphics.draw(self.image, frames[math.floor(currentFrame)], self.x, self.y)
	love.graphics.print("Player: " .. math.floor(self.life), 0, 15)
	love.graphics.print("score: " .. math.floor(score_player), 100, 15)
end

return Player