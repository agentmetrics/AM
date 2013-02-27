AM.View or (AM.View = {})

Handlebars.registerHelper "sec_to_date", (time)->
  return new Date(parseInt(time)).toLocaleDateString()

_basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
        {{label.basic_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner">
			<div class="row"><div class="span2"><p class="pull-right">{{label.name}}</p></div><div class="span10">{{data.name}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.gender}}</p></div><div class="span10">{{data.gender}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.cellphone}}</p></div><div class="span9">{{data.cellphone}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.birthday}}</p></div><div class="span9">{{data.birthday}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">Email</p></div><div class="span9">{{data.email}}</div></div>	
			<div class="row"><div class="span2"><p class="pull-right">{{label.address}}</p></div><div class="span9">{{data.address}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.identify_no}}</p></div><div class="span9">{{data.identify_no}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.marriage}}</p></div><div class="span9">{{data.marriage}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.children}}</p></div><div class="span9">{{data.children}}</div></div>
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
			<div class="row"><div class="span2"><p class="pull-right">{{label.company_name}}</p></div><div class="span10">{{data.company_name}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.company_address}}</p></div><div class="span10">{{data.company_address}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.company_phone}}</p></div><div class="span10">{{data.company_phone}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.job_title}}</p></div><div class="span10">{{data.job_title}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">{{label.job_category}}</p></div><div class="span10">{{data.job_category}}</div></div>	
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
			<div class="row"><div class="span2"><p class="pull-right">個性</p></div><div class="span9">{{personality}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">月收入</p></div><div class="span9">{{wage}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">撫養人數</p></div><div class="span9">{{raise_count}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">接觸難度</p></div><div class="span9">{{contact_difficulty}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">聯絡頻率</p></div><div class="span9">{{contact_frequency}}</div></div>	
			<div class="row"><div class="span2"><p class="pull-right">備註</p></div><div class="span9">{{description}}</div></div>
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
				<tr><th class="span3">{{label.time}}</th><th class="span9">{{label.content}}</th>
				{{#each history}}
					<tr>
					<td class="span3 pull-right">{{#sec_to_date time}}{{/sec_to_date}}</td>
					<td class="span9">{{content}}</td>
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
        客戶人際關係
      </a>
    </div>
	<div class="accordion-body collapse" id="friendship_info">
		<div id="relationship_block">
		</div>
		<div class="accordion-inner">
			<button class="add_relationship btn" type="submit">新增好友</button>
		</div>
	</div>
</div>'

_commit_button = '<div class="btn modify">{{label.modify}}</div>'

AM.View.CustomerDetailView = Backbone.View.extend

	basic_info: Handlebars.compile(_basic_info_template)
	company_info: Handlebars.compile(_company_info_template)
	value_info: Handlebars.compile(_value_info_template)
	visit_history_template: Handlebars.compile(_visit_history_template)
	commit_button: Handlebars.compile(_commit_button)

	events: {
		"click .modify": "modify"
	}

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
			@visit_history_template({
				history: visitHistory
				label: AM.String
			})
		else 
			""

	_getKeyByValue: (object, value) ->
		for key of object
			if value is object[key]
				return key
		return null

	render: ->
		if @customer.isPartial 
			return 
		
		company = @customer.get('company')
		evaluation = @customer.get('evaluation')

		@$el.html(@basic_info({
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
			}) + @company_info({
				data: {
					company_name: company['name']
					company_address: company['address']
					company_phone: company['phone']
					job_title: company['title']
					job_category: AM.Setting.JobCategory[parseInt(company['category'])]
				}
				label: AM.String
			}) + @value_info({
				personality: @customer.get('personality')
				wage: AM.Setting.Wage.label[@_getKeyByValue(AM.Setting.Wage.value, evaluation['income_monthly'])]
				raise_count: AM.Setting.Raise.label[@_getKeyByValue(AM.Setting.Raise.value, evaluation['dependent_count'])]
				contact_difficulty: AM.Setting.ContactDifficulty.label[@_getKeyByValue(AM.Setting.ContactDifficulty.value, evaluation['contact_difficulty'])]
				contact_frequency: AM.Setting.ContactFrequency.label[@_getKeyByValue(AM.Setting.ContactFrequency.value, evaluation['contact_frequency'])]
				label: AM.String
			}) + @_getVisitHistoryTemplate() + 
			@commit_button({
				label: AM.String
			})
		)

	modify: ->
		AM.router.navigate "customer/" + @options.customer_id + "/modify",  trigger: true


		