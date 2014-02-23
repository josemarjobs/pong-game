class window.Paddle extends Entity
	constructor: ->
		super

		@width = 20
		@height = 100
		@score = 0

		@y = game.height / 2 - @height / 2

	update: ->
		super
		@y = Math.min Math.max(@y, 0), game.height - @height
		
class window.Player extends Paddle
	constructor: ->
		super
		@x = 10

	update: ->
		super
		speed = 15
		@movePlayerOrDown speed

	movePlayerOrDown: (speed) ->
		if game.keyPressed.up
			@yVelocity = -speed
		else if game.keyPressed.down
			@yVelocity = speed
		else
			@yVelocity = 0

class window.Bot extends Paddle
	constructor: ->
		super
		@x = game.width - @width - 10

	update: ->
		super
		speed = 8
		if @y < game.ball.y
			@yVelocity = speed
		else if @y > game.ball.y
			@yVelocity = -speed
		else
			@yVelocity = 0
		

















	
