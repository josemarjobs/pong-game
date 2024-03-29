function Background() {
}

Background.prototype.draw = function(context) {
	context.fillStyle = '#000';
	context.fillRect(0, 0, game.width, game.height);

	context.fillStyle = '#0000ff';
	context.font = '17px monospace';
	context.fillText('You', game.width * 3 / 8, 15);
	context.fillText('CPU', game.width * 5 / 8, 15);

	context.fillStyle = '#fff';
	context.font = '40px monospace';
	context.fillText(game.player.score, game.width * 3 / 8, 50);
	context.fillText(game.bot.score, game.width * 5 / 8, 50);
}

var canvas = $('canvas')[0];
var game = new Game(canvas);

game.entities = [
	new Background(),
	game.ball = new Ball(),
	game.player = new Player(),
	game.bot = new Bot()

];
 
game.start();
canvas.focus();
console.log("Game Started!");