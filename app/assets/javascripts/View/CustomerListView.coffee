AM.View or (AM.View = {})

class AM.View.CustomerListView extends Backbone.View 

	info_template: Handlebars.compile "
		<div class='toolbar'>
			<input type='text' placeholder='搜尋名字'>
			<a class='new_btn btn btn-danger' >新增客戶</a>
		</div>
		<div>
			<table class='table table-striped'>
			<tbody id='customer_list'>
			<tr><th>姓名</th><th>級別</th><th>手機電話</th><th>最後連絡時間</th></tr>
			{{#each customerlist}}
				<tr class='{{gender}}'>
				<td><a>{{name}}</a></td>
				<td>{{evaluation_score}}</td>
				<td>{{cellphone}}</td>
				<td draggable='true'>{{date}}</td>
				</tr>
			{{/each}}
			</tbody></table>
		</div>
	"

	el: "#content_panel"

	events: 
		"click .new_btn": "gotoAddCustomer"

	initialize: ->
		@collection = @options.collection
		@collection.on "reset", @render, @ 

	gotoAddCustomer:->
  		AM.router.navigate "addcustomer", trigger: true

	render: ->
		@$el.html(@info_template(
			customerlist: @collection.map (customer) ->
  				date_str = customer.get("last_visit_time")
  				name: customer.get("name")
  				evaluation_score: customer.get("evaluation_score")
  				cellphone: customer.get("cellphone")
  				gender: customer.get("gender")
  				date: (if date_str then new Date(parseInt(date_str)).toGMTString() else "")
  		))
  	