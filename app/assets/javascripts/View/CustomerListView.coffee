AM.View or (AM.View = {})


_body_template = '<div class="body row"></div>'

_tool_bar_template = '
	<div class="span12 toolbar">
		{{label.customer_search}}
		<input class="search input-small" type="text" name="name" >
		{{label.grade}}
		<select class="span1" name="grade">
			<option>
			<option>A
			<option>B
			<option>C
		</select>
		{{label.gender}}
		<select class="span1 gender" name="gender">
			<option value="n">
			<option value="m">{{label.male}}
			<option value="f">{{label.female}}
		</select>
		{{label.personality}}
		<select class="span1" name="personality">
			<option value="n">
			<option value="D">D
			<option value="I">I
			<option value="S">S
			<option value="C">C
		</select>
		{{label.customer_type}}
		<select class="span2" name="customer_type">
			<option value="n">
			<option value="new">{{label.new_customer}}
			<option value="paid">{{label.paid_customer}}
			<option value="birthday">{{label.birthday_customer}}
		</select>

		<a class="add_btn">{{label.new_customer}}</a>
	</div>'


AM.View.CustomerListView = Backbone.View.extend

	className: "list_view"
	
	tool_bar_template: Handlebars.compile(_tool_bar_template)
	
	list_view_template: Handlebars.compile '
		<div class="msg warm">{{label.warm}}</div>
		<table class="table">
		<tbody>
		<tr class="th"><th>{{label.name}}}</th><th>{{label.grade}}</th><th>{{label.personality}}</th><th>{{label.cellphone}}</th><th>{{label.last_visit}}</th></tr>
		{{#each customerlist}}
			<tr class="{{gender}}">
			<td><a class="indicator" draggable="true" data-customer-id={{id}} href="#customer/{{id}}">{{name}}</a></td>
			<td>{{evaluation_score}}</td>
			<td>{{personality}}</td>
			<td>{{cellphone}}</td>
			<td>{{date}}</td>
			</tr>
		{{/each}}
		</tbody></table>
	'
	header_template: '<div class="hd"><h2>客戶表列</h2></div>'

	list_view_container: '<div class="span8  customer_list"></div>'

	body_template: Handlebars.compile(_body_template)

	targetDay: new Date()

	events: 
		"click .add_btn": "gotoAddCustomer"
		"change select[name='gender']": "render"
		"change select[name='personality']": "render"
		"change input[name='name']": "render"
		"dragstart .indicator": "handleDragStart" 
	
	initialize: ->
		@collection = @options.collection
		dateWidget = new AM.View.DayEventWidget(collection: @collection)
		$body_container = $(@body_template())
		$body_container.append @tool_bar_template({label: AM.String})
		$body_container.append dateWidget.render().el
		$body_container.append @list_view_container
		console.log $body_container

		@$el.append(@header_template)
		@$el.append $body_container

	gotoAddCustomer:->
  		AM.router.navigate "addcustomer", trigger: true

	handleDragStart: (e) ->
  		e.originalEvent.dataTransfer.setData('customer_id', $(e.target).attr('data-customer-id'))

	render: ->
		filtered = @collection
		selected_gender = @$el.find('select[name="gender"]').children("option").filter(":selected").val()
		if selected_gender isnt "n" 
			filtered = filtered.filter((customer) ->
				customer.get("gender") is selected_gender
			)

		name = @$el.find('input[name="name"]').val()
		if name
			filtered = filtered.filter((customer) ->
				customer.get("name").indexOf(name) >= 0
			)

		selected_personality = @$el.find('select[name="personality"]').children('option').filter(':selected').val() 
		if selected_personality isnt 'n'
			filtered = filtered.filter((customer) ->
				customer.get('personality') is selected_personality
			)

		@$el.find('.customer_list').html(@list_view_template(
			customerlist: filtered.map (customer) ->
  				date_str = customer.get("last_visit_time")
  				name: customer.get("name")
  				evaluation_score: customer.get("evaluation_score")
  				personality: customer.get('personality')
  				cellphone: customer.get("cellphone")
  				gender: customer.get("gender")
  				date: (if date_str then new Date(parseInt(date_str)).toLocaleDateString() else "")
  				id: customer.id
  			label:AM.String
  		))
  				