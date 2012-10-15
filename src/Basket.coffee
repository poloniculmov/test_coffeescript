class Basket
	items: []
	distinctCount: 0
	totalCount: 0

	add: (item, quantity) ->
		if @itemExistsInBasket item.id
			currentItemLocation = @getItemLocation item.id
			@items[currentItemLocation].quantity += quantity
		else
			@items.push {
				"item_id" : item.id,
				"quantity" : quantity
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