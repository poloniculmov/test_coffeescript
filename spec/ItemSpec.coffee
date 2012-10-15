describe "Item", ->
	test = {}
	beforeEach -> 
		test.item = new Item 1, "mouse", "funnnny", 50

	describe "updating", ->
		it "updates only the props passed", ->
			test.item.update
				"title": "Magic mouse",
				"cost" : 49.50

			expect(test.item.title).toEqual "Magic mouse"
			expect(test.item.cost).toEqual 49.50
			expect(test.item.desc).toEqual "funnnny"

		it  "doesn't update the id", ->
			test.item.update
				"id": 342333
			expect(test.item.id).toEqual 1


		