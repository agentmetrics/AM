AM.View or (AM.View = {})

Handlebars.registerHelper "sec_to_date", (time)->
  return new Date(parseInt(time)).toLocaleDateString()

_data_list_template = '
<div class="accordion-inner row">
	<div class="span2">
	</div>
	<div class="span8">
		{{#each info}}
		<div class="data-group">
			<div class="data-label">{{this.label}}</div><div class="data">{{this.data}}</div>
		</div>
		{{/each}}
	</div>
</div>
'

_basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
    	<h3 class="icon_info">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
	        {{title}}
	      </a>
      	</h3>
    </div>
	<div class="accordion-body collapse in" id="basic_info">' + 
	_data_list_template +
	'</div></div>'

_company_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
    <h3 class="icon_info">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#company_info">
        {{title}}
      </a>
    </h3>
    </div>
	<div class="accordion-body collapse in" id="company_info">' +
	_data_list_template +
	'</div></div>'

_value_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
    	<h3 class="icon_info">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#value_info">
	        {{title}}
	      </a>
    	</h3>
    </div>
	<div class="accordion-body collapse in" id="value_info">' +
	_data_list_template +
	'</div></div>'

_visit_history_template= '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#visit_history">
        {{label.visit_history}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="visit_history">
		<div class="accordion-inner">
		</div>
			<table class="table">
				<tbody>
				<tr><th class="span3">{{label.time}}</th><th >{{label.content}}</th>
				{{#each history}}
					<tr>
					<td class="span3 pull-right">{{#sec_to_date time}}{{/sec_to_date}}</td>
					<td >{{content}}</td>
					</tr>
				{{/each}}
				</tbody>
			</table>
	</div>
</div>
'
_friendship_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#friendship_info">
        {{label.friendship_info}}
      </a>
    </div>
	<div class="accordion-body" id="friendship_info">
		<div id="relationship_block">
			{{#each data}}
				<div><a class="first span4" href="#customer/{{this.id}}">{{this.name}}</a> <p >{{this.relation}}</div>
					{{#each this.link}}
						<div><div /><a  class="second span2" href="#customer/{{this.id}}">{{this.name}}</a> {{this.relation}}
					{{/each}}
			{{/each}}
		</div>
	</div>
</div>'

_header_template = '<div class="hd"><h2>{{label.customer_profile}}</h2></div>'

_body_template = '<div class="body"><div class="accordion">
	{{basic}}
	{{company}}
	{{value}}
	{{friendship}}
</div></div>'

_commit_button = '<div class="btn modify">{{label.modify}}</div>'

AM.View.CustomerDetailView = Backbone.View.extend

	header_template: Handlebars.compile(_header_template)
	body_template: Handlebars.compile(_body_template)

	basic_info: Handlebars.compile(_basic_info_template)
	company_info: Handlebars.compile(_company_info_template)
	value_info: Handlebars.compile(_value_info_template)
	visit_history_template: Handlebars.compile(_visit_history_template)
	friendship_template: Handlebars.compile(_friendship_template)
	commit_button: Handlebars.compile(_commit_button)

	events: {
		"click .modify": "modify"
	}

	className: "customer_widget customer_profile"

	initialize:->
		@collection = @options.collection
		@customer = @collection.get(@options.customer_id)

		if @customer.isPartial
			@customer.on 'change', ()->
				@customer.isPartial = false
				@customer.off('change')
				@collection.update(@customer, remove: false)
				@render()
			, @
			@customer.fetch()
		else 
			@render()

	_getVisitHistoryTemplate: ->
		visitHistory = @customer.get('visit_history')
		if visitHistory
			return @visit_history_template({
				history: visitHistory
				label: AM.String
			})
		else 
			return ""

	_getFriendshipTemplate: ->
		relationship = @customer.get('relationship')
		console.log relationship
		if relationship
			data = _.map(relationship, (relation) ->
				#customer = @collection.get(relation['relationship_id'])
				@_getRelationObject(relation)
			, @)
			console.log "data", data
			return @friendship_template({
				data: data
				label: AM.String
			})
		else
			return ""

	_getRelationObject: (relation)->
		customer = @collection.get(relation['relationship_id'])
		if relation.link
			related = _.map(relation.link, (related) ->
				@_getRelationObject(related) 
			, @)

		if customer
			name: customer.get('name') 
			id: customer.id
			relation: AM.Setting.Relationship.label[@_getKeyByValue(AM.Setting.Relationship.value, relation['related'])]
			link: related if relation.link

	_getKeyByValue: (object, value) ->
		for key of object
			if value is object[key]
				return key
		return null

	_getBasicInfoTemplate: ->	
		evaluation = @customer.get('evaluation')
		@basic_info({
			title: AM.String.basic_info
			info: [
				{ label: AM.String.name, data: @customer.get('name') },
				{ label: AM.String.gender, data: if @customer.get('gender') is "m" then AM.String['male'] else AM.String['female']},
				{ label: AM.String.cellphone, data: @customer.get('cellphone')},
				{ label: AM.String.birthday, data: new Date(parseInt(@customer.get('birthday'))) if @customer.get('birthday') },
				{ label: "Email", data:  @customer.get('email')},
				{ label: AM.String.address, data:  @customer.get('address')},
				{ label: AM.String.identify_no, data:  @customer.get('identify_no')},
				{ label: AM.String.marriage, data: AM.Setting.Marriage.label[@_getKeyByValue(AM.Setting.Marriage.value, evaluation['marriage'])]} 
			]
		})

	_getCompanyInfoTemplate: ->
		company = @customer.get('company')
		
		@company_info({
			title: AM.String.company_info
			info: [
				{ label: AM.String.company_name, data: company['name'] },
				{ label: AM.String.company_address, data: company['address'] },
				{ label: AM.String.company_phone, data: company['phone'] },
				{ label: AM.String.job_title, data: company['title'] },
				{ label: AM.String.job_category, data: AM.Setting.JobCategory[parseInt(company['category'])] }
			]
		})

	_getValueInfoTemplate: ->
		evaluation = @customer.get('evaluation')

		@value_info({
			title: AM.String.value_info 
			info: [
				{ label: AM.String.personality, data: @customer.get('personality') },
				{ label: AM.String.wage, data: AM.Setting.Wage.label[@_getKeyByValue(AM.Setting.Wage.value, evaluation['income_monthly'])] },
				{ label: AM.String.raise_count, data: AM.Setting.Raise.label[@_getKeyByValue(AM.Setting.Raise.value, evaluation['dependent_count'])] },
				{ label: AM.String.contact_difficulty, data: AM.Setting.ContactDifficulty.label[@_getKeyByValue(AM.Setting.ContactDifficulty.value, evaluation['contact_difficulty'])] },
				{ label: AM.String.contact_frequency, data: AM.Setting.ContactFrequency.label[@_getKeyByValue(AM.Setting.ContactFrequency.value, evaluation['contact_frequency'])] }
			]
		})

	_getBodyTemplate: ->
		return @body_template({
			basic: @_getBasicInfoTemplate() 
			company: @_getCompanyInfoTemplate()  
			value: @_getValueInfoTemplate()  
			friendship: @_getFriendshipTemplate() 
		})

	render: ->
		if @customer.isPartial 
			return 
		@$el.html( 
			@header_template(label:AM.String) +
			@_getBodyTemplate()+ 
			@_getVisitHistoryTemplate() + 
			@commit_button({
				label: AM.String
			})
		)

	modify: ->
		AM.router.navigate "customer/" + @options.customer_id + "/modify",  trigger: true


		