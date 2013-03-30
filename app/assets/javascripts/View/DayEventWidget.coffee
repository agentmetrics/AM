AM.View or (AM.View = {})

AM.View.DayEventWidget = Backbone.View.extend

	template: Handlebars.compile '
		<div class="span3 panel cal schedule_widget">
				<div class="date_pick">
					<a href="#" class="prev"></a>
					<span class="date">{{dateStr}}</span>
					<a href="#" class="next"></a>				
				</div>
			<table width="100%" border="0" class="data" border="5">
			  <tr>
				<th scope="col" width="15%"></th>
				<th scope="col" width="40%"></th>
			  </tr>
			  {{#event_day}}{{/event_day}}
			</table>
		</div>'

	events: 
		"click .prev" : "previousDay"
		"click .next" : "nextDay"
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