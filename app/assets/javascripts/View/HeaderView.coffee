AM.View or (AM.View = {})

_header_template ='
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
      <li ref="#schedule"><a href="#schedule"><span>行事曆</span></a></li>
      <li ref="#customers"><a href="#customers"><span>客戶資料</span></a></li>
      <li ref="#objective"><a href="#objective"><span>目標設定</span></a></li>
      <li ref="#insurance"><a href="#insurance"><span>保險資料庫</span></a></li>
      <li ref="#channel"><a href="#channel"><span>訂閱頻道</span></a></li>
      <li ref="#setting"><a href="#setting"><span>設定</span></a></li>
    </ul>
</div>
'

class AM.View.HeaderView extends Backbone.View

	el: '#hd'

	events:
		"click ul.menu li": "changeNav"

	template: Handlebars.compile(_header_template)

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