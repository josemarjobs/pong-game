class window.Ball extends Entity
	constructor: ->
		super
		@width = 20
		@height = 20

		@reset()

	reset: ->
		@x = game.width / 2- @width
		@y = game.height / 2- @height

		min = -5
		max = 5
		@yVelocity = Math.floor(Math.random() * (max - min + 1) + min)
		@xVelocity = if Math.random() > 0.5 then 5 else -5

	update: ->
		super

		@yVelocity *= -1 if @y > game.height - @height or @y < 0

		if @x > game.width
			game.player.score += 1
			@reset()

		if @x < 0
			game.bot.score += 1
			@reset()
		
		hitter = null
		if @intersect(game.bot)
			hitter = game.bot
		else if @intersect(game.player)
			hitter = game.player

		if hitter
			@xVelocity *= -1.1

			@yVelocity += hitter.yVelocity / 4
		
		
		


