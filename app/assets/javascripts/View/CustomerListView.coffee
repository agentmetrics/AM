AM.View or (AM.View = {})

Handlebars.registerHelper "event_day",  ->
	i = 6
	l = 24
	out = ""
	while i <= l
		out += "<tr>"
		out += "<td>" + i + ":00"+ "</td>"
		out += "<td class='time_slot' data-toggle='popover' data-placement='left' data-content='' title='' data-original-title='New Task'> </td>"
		out + "</tr>"
		i++
	out

AM.View.CustomerListView = Backbone.View.extend

	tool_bar: '
		<div class="span12 toolbar">
			<input class="search" type="text" name="name" placeholder="搜尋名字">
			級別
			<select class="span1" name="grade">
				<option>
				<option>A
				<option>B
				<option>C
			</select>
			性別
			<select class="span1 gender" name="gender">
				<option value="n">
				<option value="m">男
				<option value="f">女
			</select>
			個性
			<select class="span1" name="personality">
				<option value="n">
				<option value="D">D
				<option value="I">I
				<option value="S">S
				<option value="C">C
			</select>
			<a class="new_btn btn btn-danger">新增客戶</a>
		</div>
		'
	list_view_template: Handlebars.compile '
		<table class="table table-striped">
		<tbody>
		<tr><th>姓名</th><th>級別</th><th>個性</th><th>手機電話</th><th>最後連絡時間</th></tr>
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

	list_view_container: '<div class="span10 customer_list"></div>'

	day_event_template: Handlebars.compile '
		<div class="span2 panel cal">
			<table width="100%" border="0" class="data" border="5">
			  <tr>
				<th scope="col" width="15%">時間</th>
				<th scope="col" width="40%">今天(12/7)</th>
			  </tr>
			  {{#event_day}}{{/event_day}}
			</table>
		</div>'

	el: "#content_panel"

	events: 
		"click .new_btn": "gotoAddCustomer"
		"change select[name='gender']": "render"
		"change select[name='personality']": "render"
		"change input[name='name']": "render"
		"dragstart .indicator": "handleDragStart" 
		"dragenter .time_slot": "handleDrop"
		"dragover .time_slot": "handleDrop"
		"drop .time_slot": "createEvent"


	initialize: ->
		@collection = @options.collection
		@collection.on "reset", @render, @ 
		@$el.html(@tool_bar + @day_event_template() + @list_view_container)
		@render()

	gotoAddCustomer:->
  	AM.router.navigate "addcustomer", trigger: true

	handleDragStart: (e) ->
  	e.originalEvent.dataTransfer.setData('customer_id', $(e.target).attr('data-customer-id'))

  handleDrop: (e)->
  	e.preventDefault()
  	e.stopPropagation()

  createEvent: (e)->
  	e.preventDefault()
  	e.stopPropagation()
  	customer_id = e.originalEvent.dataTransfer.getData('customer_id')
  	customer = @collection.get(customer_id)
  	$(e.target).html(customer.get("name"))
  	$(e.target).popover('show')

	render: ->
		filtered = @collection
		selected_gender = $('select[name="gender"]').children("option").filter(":selected").val()
		if selected_gender isnt "n" 
			filtered = filtered.filter((customer) ->
				customer.get("gender") is selected_gender
			)

		name = $('input[name="name"]').val()
		if name
			filtered = filtered.filter((customer) ->
				customer.get("name").indexOf(name) >= 0
			)

		selected_personality = $('select[name="personality"]').children('option').filter(':selected').val() 
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
  				date: (if date_str then new Date(parseInt(date_str)).toGMTString() else "")
  				id: customer.id
  		))
  				