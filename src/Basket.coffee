class Basket
	items: []
	distinctCount: 0
	totalCount: 0

	add: (item, quantity) ->
		@items.push {
			"item_id" : item.id,
			"quantity" : quantity
		}
		@distinctCount++
		@totalCount++

	getQuantity: (item_id) ->
		for i in @items
			return i.quantity if i.item_id is item_id
		false