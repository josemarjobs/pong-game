class window.Backgroud
	draw: (context) ->
		context.fillStyle = '#000'
		context.fillRect 0, 0, game.width, game.height

class window.Score
	constructor: (@player, @x, @y) ->

	draw: (context) ->
		context.fillStyle = '#fff'
		context.font = '40px monospace'
		context.fillText(@player.score, @x, @y)

canvas = ($ 'canvas')[0]

window.game = new Game(canvas)

game.addEntity new Backgroud()
game.addEntity new Ball(), 'ball'
game.addEntity new Player(), 'player'
game.addEntity new Bot(), 'bot'

game.addEntity new Score(game.player, game.width * 3/8, 50)
game.addEntity new Score(game.bot, game.width * 5/8, 50)

game.start()
canvas.focus()