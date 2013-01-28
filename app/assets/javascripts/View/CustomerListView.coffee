AM.View or (AM.View = {})

class AM.View.CustomerListView extends Backbone.View 

	template: '<table id="customer_list_view" class="table table-striped"></table>'

	el: "#content_panel"

	initialize: ->
		@collection = @options.collection

	render: ->
		
		@$el.html(@template);
		root = @$el.find('#customer_list_view')
		
		@collection.each((customer) ->
			date_str = ""
			last_visit_time = customer.get('last_visit_time')
			date_str = new Date(parseInt(last_visit_time)).toGMTString() if last_visit_time?
			content_str = ""
			content_str += "<td>" + customer.get('name') + "</td>"
			content_str += "<td>" + customer.get('evaluation_score') + "</td>"
			content_str += "<td>" + customer.get('cellphone') + "</td>"
			content_str += "<td>" + date_str + "</td>"
			root.append('<tr>' + content_str + '</tr>')
		)