AM.View or (AM.View = {})

_header_template ='
<div id="header">
	<div class="wrap">
	    <!-- logo -->
	    <div class="logo"><a href="#"></a></div>    
	    <!-- /logo -->
	    
	    <!-- top nav -->
	    <ul class="top-nav">
	      <li class="signup"><a href="#">申請會員</a></li>
	      <li class="login"><a href="#">會員登入</a></li>
	    </ul>
	    <!-- /top nav -->
	  </div>
	</div>
</div>
<div class="main-nav">
  <div class="wrap">
    <ul class="menu">
      <li class="active"><a href="#">首頁</a></li>
      <li><a href="#schedule">行事曆</a></li>
      <li><a href="#customers">客戶資料</a></li>
      <li><a href="#">目標設定</a></li>
      <li><a href="#">保險資料庫</a></li>
      <li><a href="#">訂閱頻道</a></li>
      <li><a href="#">設定</a></li>
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

	render:->
		@$el.html(@template(
			label: AM.String
		))

	changeNav: (e)->
		console.log e
		console.log @$el.find("ul.menu li.active")[0]
		@$el.find("ul.menu li.active").removeClass("active")
		$(e.currentTarget).addClass "active"