AM.View or (AM.View = {})

class AM.View.CustomerListView extends Backbone.View 

	tool_bar: '
		<div class="toolbar">
			<input class="search" type="text" name="name" placeholder="搜尋名字">
			<a class="new_btn btn btn-danger" >新增客戶</a>
			<select class="span1 gender" name="gender">
				<option value="n">-
				<option value="m">男
				<option value="f">女
			</select>
			<select class="span1" name="personality">
				<option>D
				<option>I
				<option>S
				<option>C
			</select>
		</div>
		<div class="customer_list">
		</div>
		'
	info_template: Handlebars.compile '
		<table class="table table-striped">
		<tbody>
		<tr><th>姓名</th><th>級別</th><th>手機電話</th><th>最後連絡時間</th></tr>
		{{#each customerlist}}
			<tr class="{{gender}}">
			<td><a>{{name}}</a></td>
			<td>{{evaluation_score}}</td>
			<td>{{cellphone}}</td>
			<td draggable="true">{{date}}</td>
			</tr>
		{{/each}}
		</tbody></table>
	'

	el: "#content_panel"

	events: 
		"click .new_btn": "gotoAddCustomer"
		"change .gender": "render"
		"change input[name='name']": "render"

	initialize: ->
		@collection = @options.collection
		@collection.on "reset", @render, @ 
		@$el.html(@tool_bar)
		@render()

	gotoAddCustomer:->
  		AM.router.navigate "addcustomer", trigger: true

	render: ->
		gender = $('select[name="gender"]').children("option").filter(":selected").val()
		filtered = @collection
		if gender isnt "n" 
			filtered = filtered.filter((customer) ->
				customer.get("gender") == gender
			)

		name = $('input[name="name"]').val()
		console.log name
		if name
			filtered = filtered.filter((customer) ->
				customer.get("name").indexOf(name) >= 0
			)

		@$el.find('.customer_list').html(@info_template(
			customerlist: filtered.map (customer) ->
  				date_str = customer.get("last_visit_time")
  				name: customer.get("name")
  				evaluation_score: customer.get("evaluation_score")
  				cellphone: customer.get("cellphone")
  				gender: customer.get("gender")
  				date: (if date_str then new Date(parseInt(date_str)).toGMTString() else "")
  		))
  	