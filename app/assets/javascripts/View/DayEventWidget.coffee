AM.View or (AM.View = {})

Handlebars.registerHelper "event_day",  ->
	i = 6
	l = 24
	out = ""
	while i <= l
		out += "<tr>"
		out += "<td class='time_clock'>" + i + ":00"+ "</td>"
		out += "<td class='time_slot' data-time=" + i + "> </td>"
		out + "</tr>"
		i++
	out


AM.View.DayEventWidget = Backbone.View.extend

	template: Handlebars.compile '
		<div class="span3 panel cal schedule_widget">
			<div class="date_pick">
				<a class="prev"></a>
				<span class="date">{{dateStr}}</span>
				<a class="next"></a>				
			</div>
			<table width="100%" border="0" class="data">
			  {{#event_day}}{{/event_day}}
			</table>
		</div>'

	event_template: Handlebars.compile '
		<div>內容:</div><input size="50" maxlength="50" class="input-medium" type="text">
		<div>開始時間:</div>{{day}} {{start_time}}
		<div>結束時間:</div>{{day}} {{end_time}}
		<div>客戶:</div>{{name}}
		<div>
		<div>分類</div>
			<select class="span2" name="category">
				<option>銷售拜訪 
				<option>服務拜訪 
				<option>增員拜訪 
				<option>陌生拜訪 
				<option>教育訓練 
				<option>行政事項 
				<option>公司活動
				<option>其他			
			</select>
		</div>
		<button class="btn btn-mini ok" type="button">確認</button>
		<button class="btn btn-mini cancel" type="button">取消</button>
	'

	events: 
		"click .prev" : "previousDay"
		"click .next" : "nextDay"
		"click .ok" : "addEvent"
		"click .cancel" : "dismissOverLay"
		"dragenter .time_slot": "handleDrop"
		"dragover .time_slot": "handleDrop"
		"drop .time_slot": "createEvent"

	targetDate: new Date()

	initialize: ->
		@collection = @options.collection
		@

	render: ->
		@$el.html(@template(
			label: AM.String
			dateStr: @targetDate.toLocaleDateString()
		))
		return @

	previousDay: ->
		@targetDate.setDate( @targetDate.getDate() - 1 )
		@render()

	nextDay: ->
		@targetDate.setDate( @targetDate.getDate() + 1 )
		@render()

	addEvent: (e)->
		
		@

	dismissOverLay: (e)->
		@popover.popover('hide')
		@

	handleDrop: (e)->
		e.preventDefault()
		e.stopPropagation()

	createEvent: (e)->
		e.preventDefault()
		e.stopPropagation()

		if @popover 
			@popover.popover('hide')

		customer_id = e.originalEvent.dataTransfer.getData('customer_id')
		customer = @collection.get(customer_id)
		start_time = parseInt($(e.currentTarget).attr('data-time'))
		end_time = start_time + 1
		popover = @event_template({
			id: customer_id
			name: customer.get('name')
			day: @targetDate.toLocaleDateString()
			start_time: start_time + ":00"
			end_time: end_time + ":00"
		})
		@popover = $(e.target)
		@popover.popover({
			content: popover
			html : true
			title: ""
			}).popover('show')
		$('.popover-title').hide()
