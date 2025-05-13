Object = require "classic"	
local Player = require "player"
local Enemy = require "enemy"

function love.load( ... )
	player = Player(50, 300)
	enemy = Enemy(700, 300)
end

function love.update( dt )
	player:update(dt)
	enemy:update(dt)

	if player.x + 60 >= enemy.x and
		player.x <= enemy.x + 60 and
		player.y + 60 >= enemy.y and
		player.y + 60 >= enemy.y and
		player.image == player.image_Atack then
			enemy.life = enemy.life - 10 * dt
	end


	if enemy.x + 60 >= player.x and
		enemy.x <= player.x + 60 and
		enemy.y + 60 >= player.y and
		enemy.y + 60 >= player.y and
		enemy.image == enemy.Image_Attack then
			player.life = player.life - 10 * dt
	end

	if(player.life <= 0) then
		score_enemy = score_enemy + 100 * dt
		player.life = 150
	end

	if(enemy.life <= 0) then
		score_player = score_player + 100 * dt
		enemy.life = 150
	end

end

function love.keypressed( key )
	player:keypressed(key)
end

function love.draw( ... )
	
	player:draw()
	enemy:draw()

end