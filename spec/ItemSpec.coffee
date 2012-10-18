describe "Item", ->
	test = {}
	beforeEach -> 
		test.item = new Item 1, "mouse", "funnnny", 50
		spyOn(test.item, 'getRatings').andCallFake ->
			JSON.parse(
				'{"ratings":[{"rating":4,"review":"This is a really great product","source":"Amazon"},
				{"rating":1,"review":"I didnt really like it that much it wasnt very good","source":"PC World"},
				{"rating":3,"review":"Its pretty average.","source":"Ebay"}]}'
			)


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


		describe "protected fields", ->

			it "is possible to add protected fields", ->
				priorCount = test.item.protectedFields.length
				test.item.addProtected "desc"
				expect(test.item.protectedFields.length).toEqual priorCount+1

			it "protects id by default", ->
				expect(test.item.protectedFields).toContain "id"

			it "doesn't update a protected property", ->
				test.item.addProtected "desc"
				test.item.update 
					"desc": "hunger flames"
				expect(test.item.desc).toEqual "funnnny"

			describe "#isProtected", ->
				it "returns true if field is protected",  ->
					expect(test.item.isProtected("id")).toBeTruthy()

				it "returns false if field isn't protected", ->
					expect(test.item.isProtected "desc").toBeFalsy()

				it "returns false if field doesn't exist", ->
					expect(test.item.isProtected "castron").toBeFalsy()

	describe 'getting ratings', ->
		it 'returns three of the latest ratings',  ->
			expect(test.item.getRatings().ratings.length).toEqual 3

		it 'parses an individual rating\'s score', ->
			expect(test.item.getRatings().ratings[0].rating).toEqual 4

			