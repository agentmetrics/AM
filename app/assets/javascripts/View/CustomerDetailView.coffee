AM.View or (AM.View = {})


basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
        基本資訊
      </a>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner">
			<div class="row"><div class="span2"><p class="pull-right">姓名</p></div><div class="span10">{{data.name}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">性別</p></div><div class="span10">{{data.gender}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">手機電話</p></div><div class="span9">{{data.cellphone}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">生日</p></div><div class="span9">{{data.birthday}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">Email</p></div><div class="span9">{{data.email}}</div></div>	
			<div class="row"><div class="span2"><p class="pull-right">地址</p></div><div class="span9">{{data.address}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">身份證字號</p></div><div class="span9">{{data.identify_no}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">婚姻</p></div><div class="span9">{{data.marriage}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">小孩</p></div><div class="span9">{{data.children}}</div></div>
		</div>
	</div>
</div>'

company_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#company_info">
        公司資訊
      </a>
    </div>
	<div class="accordion-body collapse in" id="company_info">
		<div class="accordion-inner">
			<div class="row"><div class="span2"><p class="pull-right">公司名稱</p></div><div class="span10">{{company_name}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">公司地址</p></div><div class="span10">{{company_address}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">公司電話</p></div><div class="span10">{{company_phone}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">職位</p></div><div class="span10">{{job_title}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">工作類別</p></div><div class="span10">{{job_category}}</div></div>	
		</div>
	</div>
</div>'

value_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#value_info">
        額外資訊
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

friendship_template = '
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
	
	el: '#content_panel'

	basic_info: Handlebars.compile(basic_info_template)

	company_info: Handlebars.compile(company_info_template)

	value_info: Handlebars.compile(value_info_template)

	commit_button: Handlebars.compile(_commit_button)

	events: {
		"click .modify": "modify"
	}

	initialize:->
		@collection = @options.collection

		@customer = @collection.get(@options.customer_id)
		@customer.on 'change', ()->
			@render()
		, @
		@customer.fetch()

	_getKeyByValue: (object, value) ->
		for key of object
			if value is object[key]
				return key
  		null

	render: ->
		console.log @customer.get('birthday') 
		company = @customer.get('company')
		evaluation = @customer.get('evaluation')

		console.log evaluation
		@$el.html(@basic_info({
				data: {
					name: @customer.get('name')
					gender: if @customer.get('gender') is "m" then "男" else "女"
					cellphone: @customer.get('cellphone')
					birthday: new Date(parseInt(@customer.get('birthday'))) if @customer.get('birthday') 
					email:  @customer.get('email')
					address:  @customer.get('address')
					identify_no:  @customer.get('identify_no')
					marriage: AM.Setting.Marriage.label[@_getKeyByValue(AM.Setting.Marriage.value, evaluation['marriage'])]
				}
			}) + @company_info({
				company_name: company['name']
				company_address: company['address']
				company_phone: company['phone']
				job_title: company['title']
				job_category: AM.Setting.JobCategory[parseInt(company['category'])]
			}) + @value_info({
				personality: @customer.get('personality')
				wage: AM.Setting.Wage.label[@_getKeyByValue(AM.Setting.Wage.value, evaluation['income_monthly'])]
				raise_count: AM.Setting.Raise.label[@_getKeyByValue(AM.Setting.Raise.value, evaluation['dependent_count'])]
				contact_difficulty: AM.Setting.ContactDifficulty.label[@_getKeyByValue(AM.Setting.ContactDifficulty.value, evaluation['contact_difficulty'])]
				contact_frequency: AM.Setting.ContactFrequency.label[@_getKeyByValue(AM.Setting.ContactFrequency.value, evaluation['contact_frequency'])]
			}) + @commit_button({
				label: AM.String
			})
		)

	modify: ->
		AM.router.navigate "customer/" + @options.customer_id + "/modify",  trigger: true


		