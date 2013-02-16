AM.Model or (AM.Model = {})

class AM.Model.Customer extends Backbone.Model

	urlRoot: "am_server/customer/"

	getOverallScore: ->
		evaluation 		   = @get('evaluation')
		marriage 	       = parseInt(@get('marriage')) or 0
		income_monthly     = parseInt(evaluation['income_monthly']) or 0
		contact_difficulty = parseInt(evaluation['contact_difficulty']) or 0
		contact_frequency  = parseInt(evaluation['contact_frequency']) or 0
		raise_count        = parseInt(evaluation['dependent_count']) or 0
		marriage + income_monthly + contact_difficulty + 
		contact_frequency + raise_count + @getAgeScore()

	getAge: ->
		new Date().getFullYear() - @get('birthday').year

	getAgeScore: ->
		age = @getAge()

		if age <= 24 or age >= 56
			1
		else if age >= 25 and age <= 35
			4
		else if age >= 36 and age <= 45
			3
		else if age >= 46 and age <= 55
			2
		else 
			0

	save: ->
		Backbone.Model.prototype.save.apply @, arguments



