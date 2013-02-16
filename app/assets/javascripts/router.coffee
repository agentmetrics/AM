
class AM.Router extends Backbone.Router 

	routes: 
		"addcustomer": "addCustomer"
		"customers":   "listCustomers"
		"customer/:id": "showCustomer"

	addCustomer: ->
		newCustomerView = new AM.View.NewCustomerView(collection: AM.Collection.customers)

	listCustomers: ->
		customerListView = new AM.View.CustomerListView(collection: AM.Collection.customers)

	showCustomer: (id)->

		customerView = new AM.View.CustomerDetailView
			customer_id: id,
			collection: AM.Collection.customers