class Item
	constructor: (@id, @title, @desc, @cost) ->

	update: (opts) ->
		for key of opts
			if @[key]? and key isnt "id"
				@[key] = opts[key]