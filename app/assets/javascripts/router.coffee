
class AM.Router extends Backbone.Router 

	container: '#content_panel'

	routes: 
		"addcustomer": "addCustomer"
		"customers":   "listCustomers"
		"customer/:id/:action": "modifyCustomer"
		"customer/:id": "showCustomer"

	addCustomer: ->
		AM.VM.showView new AM.View.NewCustomerView(collection: AM.customers)

	listCustomers: ->
		console.log AM.customers
		AM.VM.showView new AM.View.CustomerListView(collection: AM.customers)

	showCustomer: (id)-> 
		AM.VM.showView new AM.View.CustomerDetailView(
			customer_id: id,
			collection: AM.customers
		)

	modifyCustomer: (id, action)->
		if action is "modify"
			AM.VM.showView new AM.View.NewCustomerView(
				customer_id: id
				collection: AM.customers
			)