class window.Game

	@keys: {
		32: 'space'
		37: 'left'
		38: 'up'
		39: 'right'
		40: 'down'
	}

	constructor: (canvas) ->
		@context = canvas.getContext "2d"
		@width = canvas.width
		@height = canvas.height

		@keyPressed = {}
		@entities = []

		$(canvas).on 'keydown keyup', (e) =>
			keyName = Game.keys[e.which]

			if keyName
				@keyPressed[keyName] = e.type is 'keydown'
				e.preventDefault()
	
	addEntity: (entity, name) ->
		@entities.push entity
		@[name] = entity if name

	start: ->
		fps = 60
		interval = 1000 / fps
		setInterval =>
			@update()
			@draw()
		, interval
	
	update: ->
		entity.update() for entity in @entities when entity.update

	draw: ->
		entity.draw(@context) for entity in @entities when entity.draw



