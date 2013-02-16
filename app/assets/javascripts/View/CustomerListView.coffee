AM.View or (AM.View = {})

Handlebars.registerHelper "event_day",  ->
	i = 6
	l = 24
	out = ""
	while i <= l
		out += "<tr>"
		out += "<td>" + i + ":00"+ "</td>"
		out += "<td class='time_slot'> </td>"
		out + "</tr>"
		i++
	out

class AM.View.CustomerListView extends Backbone.View 

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
				<option>D
				<option>I
				<option>S
				<option>C
			</select>
			<a class="new_btn btn btn-danger" >新增客戶</a>
		</div>
		'
	list_view_template: Handlebars.compile '
		<table class="table table-striped">
		<tbody>
		<tr><th>姓名</th><th>級別</th><th>手機電話</th><th>最後連絡時間</th></tr>
		{{#each customerlist}}
			<tr class="{{gender}}">
			<td><a class="indicator" draggable="true" customer_id={{id}} href="#customer/{{id}}">{{name}}</a></td>
			<td>{{evaluation_score}}</td>
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
		"change .gender": "render"
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
  	e.originalEvent.dataTransfer.setData('customer_id', $(e.target).attr('customer_id'))

  handleDrop: (e)->
  	e.preventDefault()
  	e.stopPropagation()

  createEvent: (e)->
  	e.preventDefault()
  	e.stopPropagation()
  	customer_id = e.originalEvent.dataTransfer.getData('customer_id')
  	customer = @collection.get(customer_id)
  	$(e.target).html(customer.get("name"))
  	#$(e.target).popover().show()

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

		@$el.find('.customer_list').html(@list_view_template(
			customerlist: filtered.map (customer) ->
  				date_str = customer.get("last_visit_time")
  				name: customer.get("name")
  				evaluation_score: customer.get("evaluation_score")
  				cellphone: customer.get("cellphone")
  				gender: customer.get("gender")
  				date: (if date_str then new Date(parseInt(date_str)).toGMTString() else "")
  				id: customer.id
  		))
  				