AM.View or (AM.View = {})

Handlebars.registerHelper "list_year",  ->
  out = "<option> "
  l = 1900
  i = new Date().getFullYear()

  while i >= l
    out = out + "<option>" + i
    i--
  return out

Handlebars.registerHelper "list_month",  ->
  out = "<option> "
  i = 1
  l = 12

  while i <= l
    out = out + "<option>" + i
    i++
  return out

Handlebars.registerHelper "list_day",  ->
  out = "<option> "
  i = 1
  l = 31

  while i <= l
    out = out + "<option>" + i
    i++
  return out

_basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle icon_info" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
        {{label.basic_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner row">
			<div class="span2">
			</div>
			<form class="form-horizontal span8">
				<div class="control-group">
					<label class="control-label">{{label.name}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="full_name" type="text" value="{{data.name}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.gender}}</label>
					<div class="controls">
						<label class="radio inline"><input name="gender" type="radio" value="f">{{label.female}}</label>
						<label class="radio inline"><input name="gender" type="radio" value="m">{{label.male}}</label>
					</div>
				</div>
				<div class="control-group">
						<label class="control-label">{{label.cellphone}}</label>
						<div class="controls">
							<input size="50" maxlength="50" class="input-large" name="cellphone" type="text" value="{{data.cellphone}}">
						</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.birthday}}</label>
					<div class="controls">
						<select class="span2" name="year">
							{{#list_year}}{{/list_year}}
						</select>年
						<select class="span1" name="month">
							{{#list_month}}{{/list_month}}
						</select>月
						<select class="span1" name="day">
							{{#list_day}}{{/list_day}}
						</select>日
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-large" name="email" type="text" value="{{data.email}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.address}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-large" name="address" type="text" value="{{data.address}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.identify_no}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="identify_no" type="text" value="{{data.identify_no}}">
					</div>
				</div>
				{{#with options.marriage}}
				<div class="control-group">
					<label class="control-label">{{title}}</label>
					<div class="controls">
						<label class="radio inline"><input name="marriage" type="radio" value="{{value.a}}"><p>{{label.a}}</p></label>
						<label class="radio inline"><input name="marriage" type="radio" value="{{value.b}}"><p>{{label.b}}</p></label>
						<label class="radio inline"><input name="marriage" type="radio" value="{{value.c}}"><p>{{label.c}}</p></label>
					</div>
				</div>
				{{/with}}
				<div class="control-group">
					<label class="control-label">{{label.children}}</label>
					<div class="controls">
						<input class="input-mini" name="boy" type="text">{{label.boy}}
						<input class="input-mini" name="girl" type="text">{{label.girl}}
					</div>
				</div>
			</form>
		</div>
	</div>
</div>'

_company_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle icon_info" data-toggle="collapse" data-parent="#accordion2" href="#company_info">
        {{label.company_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="company_info">
		<div class="accordion-inner row">
			<div class="span2">
			</div>
			<form class="form-horizontal span8">
				<div class="control-group">
					<label class="control-label">{{label.company_name}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="company_name" type="text" value="{{data.company.name}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.company_address}}</label>
					<div class="controls">
						<input size="50" maxlength="50" name="company_address" type="text" value="{{data.company.address}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.company_phone}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="company_phone" type="text" value="{{data.company.phone}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.job_title}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="job_title" type="text" value="{{data.company.title}}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.job_category}}</label>
					<div class="controls">
						<select class="span4" name="job_category">
							{{#each options.job_category}}
								<option >{{this}}
							{{/each}}
						</select>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>'

_value_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle icon_info" data-toggle="collapse" data-parent="#accordion2" href="#value_info">
        {{label.value_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="value_info">
		<div class="accordion-inner row">
			<div class="span2">
			</div>
			<form class="form-horizontal span8">
				<div class="control-group">
					<label class="control-label">{{personality.title}}</label>
					<div class="controls">
						{{#with personality}}
						<label class="radio inline"><input name="personality" type="radio" value="{{value.a}}">{{label.a}}</label>
						<label class="radio inline"><input name="personality" type="radio" value="{{value.b}}">{{label.b}}</label>
						<label class="radio inline"><input name="personality" type="radio" value="{{value.c}}">{{label.c}}</label>
						<label class="radio inline"><input name="personality" type="radio" value="{{value.d}}">{{label.d}}</label>
						{{/with}}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{wage.title}}</label>
					<div class="controls">
						{{#with wage}}
						<label class="radio inline"><input name="wage" type="radio" value="{{value.a}}"><p>{{label.a}}</p></label>
						<label class="radio inline"><input name="wage" type="radio" value="{{value.b}}"><p>{{label.b}}</p></label>
						<label class="radio inline"><input name="wage" type="radio" value="{{value.c}}"><p>{{label.c}}</p></label>
						<label class="radio inline"><input name="wage" type="radio" value="{{value.d}}"><p>{{label.d}}</p></label>
						{{/with}}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{raise.title}}</label>
					<div class="controls">
						{{#with raise}}
						<label class="radio inline"><input name="raise_count" type="radio" value="{{value.a}}"><p>{{label.a}}</p></label>
						<label class="radio inline"><input name="raise_count" type="radio" value="{{value.b}}"><p>{{label.b}}</p></label>
						<label class="radio inline"><input name="raise_count" type="radio" value="{{value.c}}"><p>{{label.c}}</p></label>
						<label class="radio inline"><input name="raise_count" type="radio" value="{{value.d}}"><p>{{label.d}}</p></label>
						{{/with}}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{difficulty.title}}</label>
					<div class="controls">
						{{#with difficulty}}
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="{{value.a}}"><p>{{label.a}}</p></label>
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="{{value.b}}"><p>{{label.b}}</p></label>
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="{{value.c}}"><p>{{label.c}}</p></label> 
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="{{value.d}}"><p>{{label.d}}</p></label>
						{{/with}}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{frequency.title}}</label>
					<div class="controls">
						{{#with frequency}}
						<label class="radio inline"><input name="contact_frequency" type="radio" value="{{value.a}}"><p>{{label.a}}</p></label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="{{value.b}}"><p>{{label.b}}</p></label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="{{value.c}}"><p>{{label.c}}</p></label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="{{value.d}}"><p>{{label.d}}</p></label>
						{{/with}}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.weight}}</label>
					<div class="controls">
						<select class="span2" name="weight">
							<option> 0.1
							<option> 0.2
							<option> 0.3
							<option> 0.4
							<option> 0.5
							<option> 0.6
							<option> 0.7
							<option> 0.8
							<option> 0.9
							<option selected> 1.0
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.note}}</label>
					<div class="controls">
						<textarea rows="3"  class="input-large" >{{data.note}}</textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
'

_friendship_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle icon_info" data-toggle="collapse" data-parent="#accordion2" href="#friendship_info">
        {{label.friendship_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="friendship_info">
		<div class="accordion-inner">
			<div id="relationship_block">
				{{#each data}}
					<div><a class="first span4" href="#customer/{{this.id}}">{{this.name}}</a> <p >{{this.relation}}</p></div>
				{{/each}}
			</div>
			<button class="add_relationship btn" type="submit">{{label.add_relationship}}</button>
		</div>
	</div>
</div>'

_friend_selection_template ='
<div>
	<form class="form-inline">
			{{label.name}}<input size="50" maxlength="50" class="input-medium friend_name" autocomplete="off" name="friend_name" type="text" data-provide="typeahead">
			{{label.relationship}}
			{{#with options.relationship}}
				<select class="span2" name="friendship_category">
					<option>
					<option value="{{value.a}}">{{label.a}}
					<option value="{{value.b}}">{{label.b}}
					<option value="{{value.c}}">{{label.c}}
					<option value="{{value.d}}">{{label.d}}
				</select>
			{{/with}}
	</form>
</div>
'

_header_template = '<div class="hd"><h2>{{label.new_customer}}</h2></div>'

_body_template = '<div class="body"><div class="accordion">
	{{basic}}
	{{company}}
	{{value}}
	{{friendship}}
</div></div>'

_footer_template = '<div class="ft"><div class="btn create">{{label.submit}}</div></div>'

class AM.View.NewCustomerView extends Backbone.View

	header_template: Handlebars.compile(_header_template)
	body_template: Handlebars.compile(_body_template)
	footer_template: Handlebars.compile(_footer_template)

	basic_info_template: Handlebars.compile(_basic_info_template)
	value_info_template: Handlebars.compile(_value_info_template)
	company_info_template: Handlebars.compile(_company_info_template)
	friendship_template: Handlebars.compile(_friendship_template)
	friend_selection_template: Handlebars.compile(_friend_selection_template)
	
	events: 
		"click .create": "submit"
		"click .add_relationship": "addFriend"
		"change select[name=job_category]": "updateJobCategory"

	className: "customer_widget add_customer"

	remove: ->
		@undelegateEvents() 
		@$el.html()

	initialize: ->
		@jobCategoryIndex = 0

		@collection = @options.collection
		@customer = @collection.get(@options.customer_id) if @options.customer_id
		if @customer 
			if @customer.isPartial 
				console.log "fetch"
				@customer.on 'change', ()->
					@render()
					@customer.off 'change'
				, @ 
				@customer.fetch() 
				@customer.isPartial = false
				@collection.update(@customer, remove: false)
			else
				@render()

	updateJobCategory: (e)->
		@jobCategoryIndex = e.target.selectedIndex

	_getBasicInfoTemplate: ->	
		@basic_info_template(
			options : {
				marriage: AM.Setting.Marriage
			}
			label: AM.String
			data : @customer.attributes if @customer
		)

	_getCompanyInfoTemplate: ->
		@company_info_template(
			options: 
				job_category: AM.Setting.JobCategory
			label: AM.String
			data : @customer.attributes if @customer
		) 

	_getValueInfoTemplate: ->
		@value_info_template({
			difficulty: AM.Setting.ContactDifficulty
			wage: AM.Setting.Wage
			frequency: AM.Setting.ContactFrequency
			personality: AM.Setting.Personality
			raise: AM.Setting.Raise
			label:  AM.String
			data: @customer.attributes if @customer
		}) 

	_getFriendshipTemplate: ->
		relationship = @customer.get('relationship') if @customer
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


	_getFooterTemplate: ->
		@footer_template(
			label: {
				submit: if @customer then AM.String['modify'] else AM.String['add']
			}
		)

	_getBodyTemplate: ->
		return @body_template({
			basic: @_getBasicInfoTemplate() 
			company: @_getCompanyInfoTemplate()  
			value: @_getValueInfoTemplate()  
			friendship: @_getFriendshipTemplate() 
		})

	render: ->
		@$el.html(
			@header_template(label:AM.String) +
			@_getBodyTemplate() +
		  	@_getFooterTemplate()
		)

		if @customer and  @customer.get("evaluation")
			evalObj = @customer.get("evaluation")
			@$el.find('input:radio[value=' + @customer.get("gender") + ']')[0].checked = true if @customer.get('gender')
			@$el.find('input:radio[name=wage][value=' + evalObj['income_monthly'] + ']')[0].checked = true if evalObj['income_monthly']
			@$el.find('input:radio[name=contact_difficulty][value=' + evalObj['contact_difficulty'] + ']')[0].checked = true
			@$el.find('input:radio[name=contact_frequency][value=' + evalObj['contact_frequency'] + ']')[0].checked = true
			@$el.find('input:radio[name=raise_count][value=' + evalObj['dependent_count'] + ']')[0].checked = true
			@$el.find('input:radio[value=' + @customer.get("personality") + ']')[0].checked = true

			if evalObj['weight']
				$('select[name="weight"]').children("option").filter(":selected").removeAttr('selected')
				@$el.find('select[name="weight"] option:contains(' + evalObj['weight'] + ')').attr("selected", true)
		return @

	addFriend: ->
		relations = @$el.find('#relationship_block')
		relations.append(@friend_selection_template(
			options: {
				relationship: AM.Setting.Relationship
			}
			label: AM.String
		))
		$('.friend_name').typeahead(
			source: @getFriendList
			updater: (item)->
				console.log 'updater', item
				item.split(',')[0]
		)

	getFriendList: (query, process) ->
		@collection.map((customer)->
			customer.get('name') + ", " + customer.get('cellphone')
		)


	submit: ->
		customer_info = {
			name: $('input[name="full_name"]').val()
			cellphone: $('input[name="cellphone"]').val()
			birthday: 
				year: $('select[name=year]').children("option").filter(":selected").text()
				month: $('select[name=month]').children("option").filter(":selected").text()
				day: $('select[name=day]').children("option").filter(":selected").text()
			email: $('input[name=email]').val() if $('input[name=email]').val() 
			gender: $('input:radio[name=gender]:checked').val()
			address: $('input[name=address]').val()
			identify_no: $('input[name=identify_no]').val()
			children: 
				boy: $('input[name=boy]').val()
				girl: $('input[name=girl]').val()
			marriage: if $('input:radio[name=marriage]:checked').length is 1 then $('input:radio[name=marriage]:checked').val() else "0"
			company: 
				name: $('input[name="company_name"]').val()
				phone: $('input[name="company_phone"]').val()
				address: $('input[name="company_address"]').val()
				fax: $('input[name="company_fax"]').val()
				job_desc: $('input[name="job_description"]').val()
				category: @jobCategoryIndex
				title: $('input[name="job_title"]').val()
			evaluation:
				income_monthly:  $('input:radio[name=wage]:checked').val()
				contact_difficulty: $('input:radio[name=contact_difficulty]:checked').val()
				contact_frequency: $('input:radio[name=contact_frequency]:checked').val()
				dependent_count: $('input:radio[name=raise_count]:checked').val()
				known_time: "2"
				weight: $('select[name="weight"]').children("option").filter(":selected").text()
			personality: $('input:radio[name=personality]:checked').val()
		}
		console.log customer_info

		if @customer
			@customer.save(customer_info, 
				success: (model, response, options) ->
					console.log "save success", model
					model.set('evaluation_score', response.score)
					AM.router.navigate 'customers', trigger: true
			)
		else	
			@collection.add(customer_info, merge: true)
		@
