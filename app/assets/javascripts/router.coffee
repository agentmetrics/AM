
class AM.Router extends Backbone.Router 

	routes: 
		"addcustomer": "addCustomer"
		"customers":   "listCustomers"
		"customer/:id/:action": "modifyCustomer"
		"customer/:id": "showCustomer"

	addCustomer: (id, action)->
		if AM.newCustomerView 
			AM.newCustomerView.remove()
		
		AM.newCustomerView = new AM.View.NewCustomerView(collection: AM.Collection.customers)
		Am.newCustomerView.render()

	listCustomers: ->
		customerListView = new AM.View.CustomerListView(collection: AM.Collection.customers)

	showCustomer: (id, action)->

		if(action and action is "modify")
			if AM.newCustomerView
				AM.newCustomerView.remove()  
			AM.newCustomerView = new AM.View.NewCustomerView(collection: AM.Collection.customers)
		else 
			customerView = new AM.View.CustomerDetailView
				customer_id: id,
				collection: AM.Collection.customers

	modifyCustomer: (id, action)->

		if AM.newCustomerView
			AM.newCustomerView.remove() 
		if action is "modify"
			AM.newCustomerView = new AM.View.NewCustomerView(
				customer_id: id
				collection: AM.Collection.customers
			)