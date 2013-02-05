# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#am_menu li").click ->
		$("#am_menu li.active").removeClass("active")
		$(@).addClass "active"

	AM.Collection.customers = new AM.Collection.CustomerCollection
	AM.Collection.customers.fetch(
		success: (model, response) ->
        	console.log("fetch success")

        error: (model, response) ->
        	console.log("fetch error")
    )

	AM.router = new AM.Router()
	Backbone.history.start();