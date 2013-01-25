
class AM.Router extends Backbone.Router 

	routes: 
		"addcustomer": "addCustomer"
		"customers":   "listCustomers"

	addCustomer: ->
		newCustomerView = new AM.View.NewCustomerView()

	listCustomers: ->
		customerListView = new AM.View.CustomerListView()
		customerListView.render()

		
		