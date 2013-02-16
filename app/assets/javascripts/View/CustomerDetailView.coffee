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
			<div class="row"><div class="span2">姓名</div><div class="span10">{{name}}</div></div>
			<div class="row"><div class="span2">性別</div><div class="span10">{{gender}}</div></div>
			<div class="row"><div class="span2">手機電話</div><div class="span10">{{cellphone}}</div></div>
			<div class="row"><div class="span2">生日</div><div class="span10">{{birthday}}</div></div>
			<div class="row"><div class="span2">Email</div><div class="span10">{{email}}</div></div>	
			<div class="row"><div class="span2">地址</div><div class="span10">{{address}}</div></div>
			<div class="row"><div class="span2">身份證字號</div><div class="span10">{{identify_no}}</div></div>
			<div class="row"><div class="span2">婚姻</div><div class="span10">{{marriage}}</div></div>
			<div class="row"><div class="span2">小孩</div><div class="span10">{{children}}</div></div>
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
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">公司名稱</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="company_name" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">公司地址</label>
					<div class="controls">
						<input size="50" maxlength="50" name="company_address" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">公司電話</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="company_phone" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">職位</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="job_title" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">工作類別</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="job_category" type="text">
					</div>
				</div>
			</form>
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
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">個性</label>
					<div class="controls">
						<label class="radio inline"><input name="personality" type="radio" value="D">D</label>
						<label class="radio inline"><input name="personality" type="radio" value="I">I</label>
						<label class="radio inline"><input name="personality" type="radio" value="S">S</label>
						<label class="radio inline"><input name="personality" type="radio" value="C">C</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">月收入</label>
					<div class="controls">
						<label class="radio inline"><input name="wage" type="radio" value="1">3萬以下</label>
						<label class="radio inline"><input name="wage" type="radio" value="2">3萬-6萬</label>
						<label class="radio inline"><input name="wage" type="radio" value="3">6萬-10萬</label>
						<label class="radio inline"><input name="wage" type="radio" value="4">10萬以上</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">撫養人數</label>
					<div class="controls">
						<label class="radio inline"><input name="raise_count" type="radio" value="1">無</label>
						<label class="radio inline"><input name="raise_count" type="radio" value="2">1個</label>
						<label class="radio inline"><input name="raise_count" type="radio" value="3">2個</label>
						<label class="radio inline"><input name="raise_count" type="radio" value="4">2個以上</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">接觸難度</label>
					<div class="controls">
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="1">非常困難</label>
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="2">有點困難</label>
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="3">容易</label>
						<label class="radio inline"><input name="contact_difficulty" type="radio" value="4">非常容易</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">聯絡頻率</label>
					<div class="controls">
						<label class="radio inline"><input name="contact_frequency" type="radio" value="1">一年2次以下</label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="2">一年3~6次</label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="3">一年7~12次</label>
						<label class="radio inline"><input name="contact_frequency" type="radio" value="4">經常聯絡</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">備註</label>
					<div class="controls">
						<textarea rows="3"  style="width:255px;"></textarea>
					</div>
				</div>
			</form>
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

	initialize:->
		@collection = @options.collection
		@customer = @collection.get(@options.customer_id)
		@render() if @customer 
		
	render: ->
		template = Handlebars.compile(basic_info_template)
		@$el.html template 
			name: @customer.get('name')
			gender: "男"
			cellphone: @customer.get('cellphone')


		