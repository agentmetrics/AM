# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

    new AM.View.MainView()
   
	AM.customers = new AM.Collection.CustomerCollection()
	AM.customers.fetch(
		success: (collection, response) ->
            collection.each( (customer) ->
                customer.isPartial = true
            )
            console.log collection
            AM.router = new AM.Router()
            Backbone.history.start()

        error: (model, response) ->
        	console.log("fetch error")
    )

	