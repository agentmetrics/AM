AM.Collection or (AM.Collection = {})

AM.Collection.CustomerCollection = Backbone.Collection.extend (
	
	model: AM.Model.Customer
	
	url: "am_server/customer/partial"

	initialize: ->
 		@on 'add', (customer) ->
 			customer.save {},  
				success: (model, response, options) ->
					console.log response
					model.set('id', response.id)
					model.set('evaluation_score', response.score)
				error: (model, xhr, options) -> 
					console.log xhr
   	
)
