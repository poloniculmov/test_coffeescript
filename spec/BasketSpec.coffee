describe "Basket Class", ->
	test = {}

	beforeEach ->
		test.basket = new Basket()
		test.item = new Item 1, "Macbook Air", "Newer, thinner, better", 799
		item2 = new Item 2, "Magic Trackpad", "Better", 50
		test.basket.add item2, 1
		false

	it  "is able to add a new item", ->
		priorCountVal = test.basket.distinctCount
		test.basket.add test.item, 1
		expect(test.basket.distinctCount).toEqual priorCountVal + 1

	it "updates the qunatity when adding an item already in the basket", ->
		priorCountVal = test.basket.getQuantity(1)
		test.basket.add test.item, 1
		expect(test.basket.getQuantity 1).toEqual priorCountVal + 1


	describe "helper functions", ->
		describe "getQuantity", ->
			it "returns false if there's no item with that id", ->
				expect(test.basket.getQuantity(12345)).toBeFalsy()

			it "returns false if it receives a String", ->
				expect(test.basket.getQuantity "Hello").toBeFalsy()

			it "returns the quantity if the there's an item with that id", ->
				expect(test.basket.getQuantity 2).toEqual 1

