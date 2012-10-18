class Item
	constructor: (@id, @title, @desc, @cost) ->
		@protectedFields = ["id"]

	update: (opts) ->
		for key of opts
			if @[key]? and not @isProtected key
				@[key] = opts[key]

	addProtected: (field) ->
		@protectedFields.push field

	isProtected: (field) ->
		for key in @protectedFields
			return true if key is field
		false

	getRatings: ->
