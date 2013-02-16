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
			<div class="row"><div class="span2"><p class="pull-right">姓名</p></div><div class="span10">{{name}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">性別</p></div><div class="span9">{{gender}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">手機電話</p></div><div class="span9">{{cellphone}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">生日</p></div><div class="span9">{{birthday}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">Email</p></div><div class="span9">{{email}}</div></div>	
			<div class="row"><div class="span2"><p class="pull-right">地址</p></div><div class="span9">{{address}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">身份證字號</p></div><div class="span9">{{identify_no}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">婚姻</p></div><div class="span9">{{marriage}}</div></div>
			<div class="row"><div class="span2"><p class="pull-right">小孩</p></div><div class="span9">{{children}}</div></div>
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
	<div class="accordion-body collapse" id="company_info">
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
	<div class="accordion-body collapse" id="value_info">
		<div class="accordion-inner">
			<div class="row"><div class="span3">個性</div><div class="span9">{{personality}}</div></div>
			<div class="row"><div class="span3">月收入</div><div class="span9">{{wage}}</div></div>
			<div class="row"><div class="span3">撫養人數</div><div class="span9">{{raise_count}}</div></div>
			<div class="row"><div class="span3">接觸難度</div><div class="span9">{{contact_difficulty}}</div></div>
			<div class="row"><div class="span3">聯絡頻率</div><div class="span9">{{contact_frequency}}</div></div>	
			<div class="row"><div class="span3">備註</div><div class="span9">{{description}}</div></div>
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

AM.View.CustomerDetailView = Backbone.View.extend
	
	el: '#content_panel'

	basic_info: Handlebars.compile(basic_info_template)

	company_info: Handlebars.compile(company_info_template)

	value_info: Handlebars.compile(value_info_template)

	initialize:->
		@collection = @options.collection

		@customer = @collection.get(@options.customer_id)
		@customer.on 'change', ()->
			@render()
		, @
		@customer.fetch()


	render: ->
		console.log @customer.get('birthday') 
		@$el.html(@basic_info( 
			name: @customer.get('name')
			gender: if @customer.get('gender') is "m" then "男" else "女"
			cellphone: @customer.get('cellphone')
			birthday: new Date(parseInt(@customer.get('birthday'))) if @customer.get('birthday') 
			email:  @customer.get('email')
			address:  @customer.get('address')
			identify_no:  @customer.get('identify_no')
		) + @company_info({}) + @value_info({}))


		