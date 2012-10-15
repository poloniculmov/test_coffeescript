describe "Basket Class", ->
	test = {}
	
	beforeEach ->
		test.basket = new Basket()
		test.item = new Item '001', "Macbook Air", "Newer, thinner, better", 799

	it  "is able to add a new item", ->
		priorCountVal = test.basket.distinctCount
		test.basket.add test.item, 1
		expect(test.basket.distinctCount).toEqual priorCountVal + 1

	it "updates the qunatity when adding an item already in the basket", ->
		priorCountVal = test.basket.getQuantity('001')
		test.basket.add test.item, 1
		expect(test.basket.getQuantity '001').toEqual priorCountVal + 1

