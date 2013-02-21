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
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
        {{label.basic_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">{{label.name}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="full_name" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.gender}}</label>
					<div class="controls">
						<label class="radio inline"><input name="gender" type="radio" value="m">{{label.male}}</label>
						<label class="radio inline"><input name="gender" type="radio" value="f">{{label.female}}</label>
					</div>
				</div>
				<div class="control-group">
						<label class="control-label">{{label.cellphone}}</label>
						<div class="controls">
							<input size="50" maxlength="50" class="input-medium" name="cellphone" type="text">
						</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.birthday}}</label>
					<div class="controls">
						<select class="span2" name="month">
							{{#list_month}}{{/list_month}}
						</select>
						<select class="span2" name="day">
							{{#list_day}}{{/list_day}}
						</select>
						<select name="year">
							{{#list_year}}{{/list_year}}
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						<input size="50" maxlength="50"  class="input-large" name="email" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.address}}</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="address" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.identification}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="identification" type="text">
					</div>
				</div>
				{{#with data.marriage}}
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
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#company_info">
        {{label.company_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="company_info">
		<div class="accordion-inner">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">{{label.company_name}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="company_name" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.company_address}}</label>
					<div class="controls">
						<input size="50" maxlength="50" name="company_address" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.company_phone}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="company_phone" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.job_title}}</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium"  name="job_title" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">{{label.job_category}}</label>
					<div class="controls">
						<select class="span4" name="job_category">
							{{#each job_category}}
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
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#value_info">
        {{label.value_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="value_info">
		<div class="accordion-inner">
			<form class="form-horizontal">
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
						<textarea rows="3"  style="width:255px;"></textarea>
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
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#friendship_info">
        {{label.friendship_info}}
      </a>
    </div>
	<div class="accordion-body collapse in" id="friendship_info">
		<div id="relationship_block">
		</div>
		<div class="accordion-inner">
			<button class="add_relationship btn" type="submit">{{label.add_relationship}}</button>
		</div>
	</div>
</div>'

commit_button = '<div class="btn create">新增</div>'

class AM.View.NewCustomerView extends Backbone.View

	el: "#content_panel"

	basic_info_template: Handlebars.compile(_basic_info_template)
	value_info_template: Handlebars.compile(_value_info_template)
	company_info_template: Handlebars.compile(_company_info_template)
	friendship_template: Handlebars.compile(_friendship_template)

	events: 
		"click .create": "submit"
		"click .add_relationship": "addFriend"
		"change select[name=job_category]": "updateJobCategory"

	initialize: ->
		_.bindAll @
		@collection = @options.collection
		@jobCategoryIndex = 0
		@render()

	updateJobCategory: (e)->
		@jobCategoryIndex = e.target.selectedIndex


	_getBasicInfoTemplate: ->	
		@basic_info_template(
			data: {
				marriage: AM.Setting.Marriage
			}
			label: AM.String
		)

	_getCompanyInfoTemplate: ->
		@company_info_template(
			job_category: AM.Setting.JobCategory
			label: AM.String
		) 

	_getValueInfoTemplate: ->
		@value_info_template({
			difficulty: AM.Setting.ContactDifficulty
			wage: AM.Setting.Wage
			frequency: AM.Setting.ContactFrequency
			personality: AM.Setting.Personality
			raise: AM.Setting.Raise
			label:  AM.String
		}) 

	_getFriendshipInfoTemplate: ->
		@friendship_template({
			label: AM.String
		})

	render: ->
		@$el.html('<div class="accordion" id="accordion2">' + 
			@_getBasicInfoTemplate() + 
			@_getCompanyInfoTemplate() + 
			@_getValueInfoTemplate() + 
			@_getFriendshipInfoTemplate() + 
		    '</div>' + commit_button
		)

	addFriend: ->
		relations = @$el.find('#relationship_block')
		relations.append('<p>new relationship</p>')

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
			identify_no: $('input[name=identification]').val()
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
		}
		console.log customer_info
		@collection.add(customer_info, merge: true)
		@
