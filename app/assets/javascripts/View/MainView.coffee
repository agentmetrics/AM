AM.View or (AM.View = {})

_template ='
<div id="header">
	<div class="wrap">
	    <div class="logo"><a href="#"></a></div>    
	    <ul class="top-nav">
	      <li><a class="signup" href="#">申請會員</a></li>
	      <li><a class="login" href="#">會員登入</a></li>
	    </ul>
	  </div>
	</div>
</div>
<div class="main-nav">
  <div class="wrap">
    <ul class="menu">
      <li ref="#" ><a href="#">首頁</a></li>
      <li ref="#schedule"><a href="#schedule">行事曆</a></li>
      <li ref="#customers"><a href="#customers">客戶資料</a></li>
      <li ref="#objective"><a href="#objective">目標設定</a></li>
      <li ref="#insurance"><a href="#insurance">保險資料庫</a></li>
      <li ref="#channel"><a href="#channel">訂閱頻道</a></li>
      <li ref="#setting"><a href="#setting">設定</a></li>
    </ul>
  </div>
</div>

<div id="content_panel" class="container">
</div>

<div class="footer">
  <div class="wrap">
	<div class="left">
		© Copyright 2013 Nvesto Co., Ltd. All Rights Reserved.
	</div>
	<div class="right">
		<a href="#">服務條款</a> | <a href="#">隱私政策</a> | <a href="#">聯絡我們</a>
	</div>
  </div>
</div>

'

class AM.View.MainView extends Backbone.View

	el: 'body'

	events:
		"click ul.menu li": "changeNav"

	template: Handlebars.compile(_template)

	initialize: ->
		@render()
		@setCurrentNav()

	render:->
		@$el.html(@template(
			label: AM.String
		))

	changeNav: (e)->
		@$el.find("ul.menu li.active").removeClass("active")
		$(e.currentTarget).addClass "active"

	setCurrentNav: ->
		nav = window.location.hash.split("/")[0]
		$(@$el.find('li[ref=' + nav + ']')[0]).addClass "active"