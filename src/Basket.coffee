class Basket
	items: []
	distinctCount: 0
	totalCount: 0

	constructor: () ->
		@distinctCount = 0
		@totalCount = 0
		@items = []

	add: (item, quantity) ->
		if @itemExistsInBasket item.id
			currentItemLocation = @getItemLocation item.id
			@items[currentItemLocation].quantity += quantity
		else
			@items.push {
				"item_id" : item.id,
				"quantity" : quantity,
				"item": item
			}
			@distinctCount++

		@totalCount += quantity


	itemExistsInBasket: (item_id) ->
		for i in @items
			return true if i.item_id is item_id
		false

	getItemLocation: (item_id) ->
		location = 0
		for i in @items 
			return location if i.item_id is item_id
			location++
		false


	getQuantity: (item_id) ->
		for i in @items
			return i.quantity if i.item_id is item_id
		false

	calculateTotal: ->
		total = 0 
		for i in @items 
			total += i.item.cost * i.quantity
		total


	remove: (item_id, quantity) ->

