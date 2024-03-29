// The game engine

function Game (canvas) {
	var self = this;

	this.context = canvas.getContext('2d');
	this.width = canvas.width;
	this.height = canvas.height;

	this.keyPressed = {};

	$(canvas).on('keydown keyup', function(e) {
		// convert the key code to key name
		var keyName = Game.keys[e.which];

		if(keyName) {
			self.keyPressed[keyName] = e.type === 'keydown';
			e.preventDefault();
		}
	});
}

// Some key codes to key name mapping
Game.keys = {
	32: 'space',
	37: 'left',
	38: 'up',
	39: 'right',
	40: 'down'
}

Game.prototype.start = function() {
	var self = this;
	var fps = 60;
	var interval = 1000 / fps; // ms per frame

	setInterval(function() {
		self.update();
		self.draw();
	}, interval);		
}

Game.prototype.update = function() {
	this.entities.forEach(function(entity) {
		if (entity.update) {
			entity.update();
		}
	});	
}

Game.prototype.draw = function() {
	var self = this;
	
	this.entities.forEach(function(entity) {
		if (entity.draw) {
			entity.draw(self.context);
		}
	});	
}















