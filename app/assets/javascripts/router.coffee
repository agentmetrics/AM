
class AM.Router extends Backbone.Router 

	routes: 
		"addcustomer": "addCustomer"
		"customers":   "listCustomers"

	addCustomer: ->
		newCustomerView = new AM.View.NewCustomerView(collection: AM.Collection.customers)

	listCustomers: ->
		customerListView = new AM.View.CustomerListView(collection: AM.Collection.customers)