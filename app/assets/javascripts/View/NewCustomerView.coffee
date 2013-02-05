AM.View or (AM.View = {})

Handlebars.registerHelper "list_year",  ->
  out = ""
  l = 1900
  i = new Date().getFullYear()

  while i >= l
    out = out + "<option>" + i
    i--
  out

Handlebars.registerHelper "list_month",  ->
  out = ""
  i = 1
  l = 12

  while i <= l
    out = out + "<option>" + i
    i++
  out

Handlebars.registerHelper "list_day",  ->
  out = ""
  i = 1
  l = 31

  while i <= l
    out = out + "<option>" + i
    i++
  out


basic_info_template = '
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#basic_info">
        基本資訊
      </a>
    </div>
	<div class="accordion-body collapse in" id="basic_info">
		<div class="accordion-inner">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">姓名</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="full_name" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">性別</label>
					<div class="controls">
						<label class="radio inline"><input name="gender" type="radio" value="m">男</label>
						<label class="radio inline"><input name="gender" type="radio" value="f">女</label>
					</div>
				</div>
				<div class="control-group">
						<label class="control-label">手機電話</label>
						<div class="controls">
							<input size="50" maxlength="50" class="input-medium" name="cellphone" type="text">
						</div>
				</div>
				<div class="control-group">
					<label class="control-label">生日</label>
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
					<label class="control-label">地址</label>
					<div class="controls">
						<input size="50" maxlength="50" style="width:255px;" name="address" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">身份證字號</label>
					<div class="controls">
						<input size="50" maxlength="50" class="input-medium" name="identify_no" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">婚姻</label>
					<div class="controls">
						<label class="radio inline"><input name="marriage" type="radio" value="single">未婚</label>
						<label class="radio inline"><input name="marriage" type="radio" value="married"><p>已婚</p></label>
						<label class="radio inline"><input name="marriage" type="radio" value="divorce"><p>單親</p></label>
					</div>
				</div>
					<div class="control-group">
					<label class="control-label">小孩</label>
					<div class="controls">
						<input class="input-mini" name="boy" type="text">子
						<input class="input-mini" name="girl" type="text">女
					</div>
				</div>
			</form>
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
		<div class="accordion-inner">
			<p>Not implemented yet</p>
		</div>
	</div>
</div>'

commit_button = '<div class="btn create">新增</div>'

class AM.View.NewCustomerView extends Backbone.View

	el: "#content_panel"

	basic_info_template: Handlebars.compile(basic_info_template)

	events: 
		"click .create": "submit"
		
	initialize: ->
		@collection = @options.collection
		@render()

	render: ->
		@$el.html('<div class="accordion" id="accordion2">' + 
		@basic_info_template() + company_info_template + value_info_template + friendship_template + 
	    '</div>' + commit_button)

	submit: ->

		marriage = AM.Setting.Marrage[$('input:radio[name=marriage]:checked').val()];

		customer_info = 
			name: $('input[name="full_name"]').val()
			cellphone: $('input[name="cellphone"]').val()
			birthday: 
				year: $('select[name="year"]').children("option").filter(":selected").text()
				month: $('select[name="month"]').children("option").filter(":selected").text()
				day: $('select[name="day"]').children("option").filter(":selected").text()
			email: $('input[name="email"]').val()
			gender: $('input:radio[name=gender]:checked').val();
			address: $('input[name="address"]').val()
			children: 
				boy: $('input[name="boy"]').val()
				girl: $('input[name="girl"]').val()
			marriage: marriage;
			company: 
				name: $('input[name="company_name"]').val()
				phone: $('input[name="company_phone"]').val()
				address: $('input[name="company_address"]').val()
				fax: $('input[name="company_fax"]').val()
				job_desc: $('input[name="job_description"]').val()
				category: $('input[name="job_category"]').val()
				title: $('input[name="job_title"]').val()
				work_start: $('input[name="work_start"]').val()
				work_end: $('input[name="work_end"]').val()
			evaluation:
				income_monthly:  $('input:radio[name=wage]:checked').val()
				contact_difficulty: $('input:radio[name=contact_difficulty]:checked').val()
				contact_frequency: $('input:radio[name=contact_frequency]:checked').val()
				dependent_count: $('input:radio[name=raise_count]:checked').val()
				known_time: "2"
				weight: 1

		# window.customer = new AM.Model.Customer(
		# 	customer_info
		# )

		@collection.add(customer_info, merge: true)
		
		#