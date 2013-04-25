AM.View or (AM.View = {})

Handlebars.registerHelper "sec_to_date", (time)->
  return new Date(parseInt(time)).toLocaleDateString()

_basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
    	<h3 class="icon_info">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
	        {{label.basic_info}}
	      </a>
      	</h3>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner">
			<div ><div ><p >{{label.name}}</p></div><div >{{data.name}}</div></div>
			<div ><div ><p >{{label.gender}}</p></div><div >{{data.gender}}</div></div>
			<div ><div ><p >{{label.cellphone}}</p></div><div >{{data.cellphone}}</div></div>
			<div ><div ><p >{{label.birthday}}</p></div><div >{{data.birthday}}</div></div>
			<div ><div ><p >Email</p></div><div >{{data.email}}</div></div>	
			<div ><div ><p >{{label.address}}</p></div><div >{{data.address}}</div></div>
			<div ><div ><p >{{label.identify_no}}</p></div><div >{{data.identify_no}}</div></div>
			<div ><div ><p >{{label.marriage}}</p></div><div >{{data.marriage}}</div></div>
			<div ><div ><p >{{label.children}}</p></div><div >{{data.children}}</div></div>
		</div>
	</div>
</div>'

_company_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#company_info">
        {{label.company_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="company_info">
		<div class="accordion-inner">
			<div ><div ><p >{{label.company_name}}</p></div><div >{{data.company_name}}</div></div>
			<div ><div ><p >{{label.company_address}}</p></div><div >{{data.company_address}}</div></div>
			<div ><div ><p >{{label.company_phone}}</p></div><div >{{data.company_phone}}</div></div>
			<div ><div ><p >{{label.job_title}}</p></div><div >{{data.job_title}}</div></div>
			<div ><div ><p >{{label.job_category}}</p></div><div >{{data.job_category}}</div></div>	
		</div>
	</div>
</div>'

_value_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#value_info">
        {{label.value_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="value_info">
		<div class="accordion-inner">
			<div ><div ><p >個性</p></div><div >{{personality}}</div></div>
			<div ><div ><p >月收入</p></div><div >{{wage}}</div></div>
			<div ><div ><p >撫養人數</p></div><div >{{raise_count}}</div></div>
			<div ><div ><p >接觸難度</p></div><div >{{contact_difficulty}}</div></div>
			<div ><div ><p >聯絡頻率</p></div><div >{{contact_frequency}}</div></div>	
			<div ><div ><p >備註</p></div><div >{{description}}</div></div>
		</div>
	</div>
</div>
'

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
				<div><a class="first span4" href="#customer/{{this.id}}">{{this.name}}</a> <p >{{this.relation}}</p></div>
					{{#each this.link}}
						<div><div /><a  class="second span2" href="#customer/{{this.id}}">{{this.name}}</a> <p>{{this.relation}}</p>
					{{/each}}
			{{/each}}
		</div>
	</div>
</div>'

_header_template = '<div class="hd"><h2>{{label.new_customer}}</h2></div>'

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

	className: "widget add_customer"

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
			data: {
				name: @customer.get('name')
				gender: if @customer.get('gender') is "m" then AM.String['male'] else AM.String['female']
				cellphone: @customer.get('cellphone')
				birthday: new Date(parseInt(@customer.get('birthday'))) if @customer.get('birthday') 
				email:  @customer.get('email')
				address:  @customer.get('address')
				identify_no:  @customer.get('identify_no')
				marriage: AM.Setting.Marriage.label[@_getKeyByValue(AM.Setting.Marriage.value, evaluation['marriage'])] 
				}
			label: AM.String
		})

	_getCompanyInfoTemplate: ->
		company = @customer.get('company')
		
		@company_info({
			data: {
				company_name: company['name']
				company_address: company['address']
				company_phone: company['phone']
				job_title: company['title']
				job_category: AM.Setting.JobCategory[parseInt(company['category'])]
			}
			label: AM.String
		})

	_getValueInfoTemplate: ->
		evaluation = @customer.get('evaluation')

		@value_info({
			personality: @customer.get('personality')
			wage: AM.Setting.Wage.label[@_getKeyByValue(AM.Setting.Wage.value, evaluation['income_monthly'])]
			raise_count: AM.Setting.Raise.label[@_getKeyByValue(AM.Setting.Raise.value, evaluation['dependent_count'])]
			contact_difficulty: AM.Setting.ContactDifficulty.label[@_getKeyByValue(AM.Setting.ContactDifficulty.value, evaluation['contact_difficulty'])]
			contact_frequency: AM.Setting.ContactFrequency.label[@_getKeyByValue(AM.Setting.ContactFrequency.value, evaluation['contact_frequency'])]
			label: AM.String
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


		