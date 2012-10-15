describe "Basket Class", ->
	test = {}

	beforeEach ->
		test.basket = new Basket()
		test.item = new Item 1, "Macbook Air", "Newer, thinner, better", 799
		test.item2 = new Item 2, "Magic Trackpad", "Better", 50
		test.basket.add test.item2, 1
		false

	it  "is able to add a new item", ->
		priorCountVal = test.basket.distinctCount
		test.basket.add test.item, 1
		expect(test.basket.distinctCount).toEqual priorCountVal + 1

	it "updates the quantity when adding an item already in the basket", ->
		test.basket.add test.item, 1
		priorCountVal = test.basket.getQuantity(1)
		test.basket.add test.item, 1
		expect(test.basket.getQuantity 1).toEqual priorCountVal + 1

	it "updates the total count by 1 after adding a new item", ->
		priorCountVal = test.basket.totalCount
		test.basket.add(test.item, 1)
		expect(test.basket.totalCount).toEqual priorCountVal+1

	it "updates the distinct count by 1 after a adding a new item", ->
		priorCountVal = test.basket.distinctCount
		test.basket.add(test.item, 1)
		expect(test.basket.distinctCount).toEqual priorCountVal+1

	it "doesn't change the distinct count when adding an existing item", ->
		test.basket.add(test.item, 1)
		priorCountVal = test.basket.distinctCount
		test.basket.add(test.item, 1)
		expect(test.basket.distinctCount).toEqual priorCountVal

	describe "total cost", ->
		it "calculates the total cost when there's 1 item in the basket", ->
			expect(test.basket.calculateTotal()).toEqual 50

		it "calculates the total cost for 1 item type with quantity > 1", ->
			test.basket.add(test.item2, 3)
			expect(test.basket.calculateTotal()).toEqual 200

		it "calculates the total cost when there are multiple types of items", ->
			test.basket.add(test.item2, 3)
			test.basket.add(test.item, 2)
			expect(test.basket.calculateTotal()).toEqual 1798

	describe "helper functions", ->
		describe "getQuantity", ->
			it "returns false if there's no item with that id", ->
				expect(test.basket.getQuantity(12345)).toBeFalsy()

			it "returns false if it receives a String", ->
				expect(test.basket.getQuantity "Hello").toBeFalsy()

			it "returns the quantity if the there's an item with that id", ->
				expect(test.basket.getQuantity 2).toEqual 1

		describe "itemExistsInBasket", ->
			it "returns false if there's no item with that id", ->
				expect(test.basket.itemExistsInBasket 1223).toBeFalsy()

			it "returns true if there's an item with that id", ->
				expect(test.basket.itemExistsInBasket 2).toBeTruthy()

			it "returns false if given a string", ->
				expect(test.basket.itemExistsInBasket "hello dolly").toBeFalsy()

		describe "getItemLocation", ->
			it "returns the location in the items array if item exists", ->
				expect(test.basket.getItemLocation 2).toEqual 0
			it "returns false if the item doesn't exist", ->
				expect(test.basket.getItemLocation 324).toBeFalsy()

			it "returns false if given a string", ->
				expect(test.basket.getItemLocation "location").toBeFalsy()

