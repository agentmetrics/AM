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
			<div>姓名<input size="50" maxlength="50" class="input-medium" name="full_name" type="text"></div>
			<div>
				<input name="gender" type="radio" value="m">男
				<input name="gender" type="radio" value="f">女
			</div>
			<div>手機電話<input size="50" maxlength="50" class="input-medium" name="cellphone" type="text"></div>
			<div>
				生日
				<select name="month">
					<option selected>01
					<option>02
					<option>03
					<option>04
					<option>05
				</select>
				<select name="day">
					<option selected>1
					<option>2
					<option>3
					<option>4
					<option>5
				</select>
				<select name="year">
					<option selected>1980
					<option>1981
				</select>
			</div>
			<div>email<input size="50" maxlength="50" style="width:255px;" name="email" type="text"></div>
			<div>地址<input size="50" maxlength="50" style="width:255px;" name="address" type="text"></div>
			<div>身份證字號<input size="50" maxlength="50" style="width:255px;" name="identify_no" type="text"></div>
			<div>婚姻
				<input name="marriage" type="radio" value="single">未婚
				<input name="marriage" type="radio" value="married">已婚
				<input name="marriage" type="radio" value="divorce">離婚
				<span>
					小孩
					<input size="50" maxlength="50" class="input-mini" name="boy" type="text">子
					<input size="50" maxlength="50" class="input-mini" name="girl" type="text">女
				</span>
			</div>
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
			<div>公司名稱<input size="50" maxlength="50" style="width:255px;" name="company_name" type="text"></div>
			<div>公司地址<input size="50" maxlength="50" style="width:255px;" name="company_address" type="text"></div>
			<div>公司電話<input size="50" maxlength="50" style="width:255px;" name="company_phone" type="text"></div>
			<div>公司傳真<input size="50" maxlength="50" style="width:255px;" name="company_fax" type="text"></div>
			<div>職位<input size="50" maxlength="50" style="width:255px;" name="job_title" type="text"></div>
			<div>工作內容<input size="50" maxlength="50" style="width:255px;" name="job_description" type="text"></div>
			<div>工作類別<input size="50" maxlength="50" style="width:255px;" name="job_category" type="text"></div>
			<div>上班時間<input size="50" maxlength="50" style="width:255px;" name="work_start" type="text">
			<input size="50" maxlength="50" style="width:255px;" name="work_end" type="text"></div>
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
			<div>月收入
				<input name="wage" type="radio" value="1">3萬以下
				<input name="wage" type="radio" value="2">3萬-6萬
				<input name="wage" type="radio" value="3">6萬-10萬
				<input name="wage" type="radio" value="4">10萬以上
			</div>
			<div>撫養人數
				<input name="raise_count" type="radio" value="1">無
				<input name="raise_count" type="radio" value="2">1個
				<input name="raise_count" type="radio" value="3">2個
				<input name="raise_count" type="radio" value="4">2個以上
			</div>
			<div>接觸難度
				<input name="contact_difficulty" type="radio" value="1">非常困難
				<input name="contact_difficulty" type="radio" value="2">有點困難
				<input name="contact_difficulty" type="radio" value="3">容易
				<input name="contact_difficulty" type="radio" value="4">非常容易
			</div>
			<div>聯絡頻率
				<input name="contact_frequency" type="radio" value="1">一年2次以下
				<input name="contact_frequency" type="radio" value="2">一年3~6次
				<input name="contact_frequency" type="radio" value="3">一年7~12次
				<input name="contact_frequency" type="radio" value="4">經常聯絡
			</div>
			<div class="known_time">
				首次接觸日期
				<select name="month">
					<option selected>01
					<option>02
					<option>03
					<option>04
					<option>05
				</select>
				<select name="day">
					<option selected>1
					<option>2
					<option>3
					<option>4
					<option>5
				</select>
				<select name="year">
					<option selected>1980
					<option>1981
				</select>
			</div>
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
			<p>test</p>
		</div>
	</div>
</div>'

commit_button = '<div class="btn create">新增</div>'

class AM.View.NewCustomerView extends Backbone.View

	el: "#content_panel"

	template: '<div class="accordion" id="accordion2">' + 
		basic_info_template + company_info_template + value_info_template + friendship_template + 
	    '</div>' + commit_button

	events: 
		"click .create": "submit"
		
	initialize: ->
		@render()

	render: ->
		@$el.html(@template)

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
				known_time: new Date(
					$('select[name="year"]').children("option").filter(":selected").text(),
					$('select[name="month"]').children("option").filter(":selected").text(),
					$('select[name="day"]').children("option").filter(":selected").text())
				income_monthly:  $('input:radio[name=wage]:checked').val()
				contact_difficulty: $('input:radio[name=contact_difficulty]:checked').val()
				contact_frequency: $('input:radio[name=contact_frequency]:checked').val()
				dependent_count: $('input:radio[name=raise_count]:checked').val()

		console.log(customer_info)
		window.customer = new AM.Model.Customer(
			customer_info
		)
		console.log(window.customer.getOverallScore())
		window.customer.save()