

$(function(){
		
		//-->右键自定义菜单
	   var drawing =document.getElementsByClassName("drawing")[0];
	   var menu = document.getElementById('menu');
	   
	   //当前选中的歌单
	    var list_create = "";
		
		/*刷新右键选择的样式*/
		function refreshMenu(){
			drawing =document.getElementsByClassName("drawing")[0];
			menu = document.getElementById('menu');
			LTEvent.addListener(drawing,"contextmenu",LTEvent.cancelBubble);
			LTEvent.addListener(drawing,"contextmenu",showmenu);
			LTEvent.addListener(document,"click",hidemenu);  
		}
		/*动态给歌单绑定点击事件*/
		$("#songListList").on("click",".list_create_001",function(){
			//调用右键刷新元素
			refreshMenu();
			
			//将当前选中歌单对象赋值给全局变量
			list_create=$(this);
		})
	   /*显示菜单*/
	   function showmenu() {
					
			
	       var evt = window.event || arguments[0];
	        
	       /*获取当前鼠标右键按下后的位置，据此定义菜单显示的位置*/
	       var rightedge = drawing.clientWidth-evt.clientX;
	       var bottomedge = drawing.clientHeight-evt.clientY;
	       /*如果从鼠标位置到容器右边的空间小于菜单的宽度，就定位菜单的左坐标（Left）为当前鼠标位置向左一个菜单宽度*/
	       if (rightedge < menu.offsetWidth)               
	           menu.style.left = drawing.scrollLeft + evt.clientX - menu.offsetWidth + "px";            
	       else
	       /*否则，就定位菜单的左坐标为当前鼠标位置*/
	           menu.style.left = drawing.scrollLeft + evt.clientX + "px";
	        
	       /*如果从鼠标位置到容器下边的空间小于菜单的高度，就定位菜单的上坐标（Top）为当前鼠标位置向上一个菜单高度*/
	       if (bottomedge < menu.offsetHeight)
	           menu.style.top = drawing.scrollTop + evt.clientY - menu.offsetHeight + "px";
	       else
	       /*否则，就定位菜单的上坐标为当前鼠标位置*/
	       menu.style.top = drawing.scrollTop + evt.clientY + "px";
						
	       menu.style.visibility = "visible";             
	       LTEvent.addListener(menu,"contextmenu",LTEvent.cancelBubble);
	   }
	   /*隐藏菜单*/
	   function hidemenu() {
	       menu.style.visibility = 'hidden';
	   }
	   LTEvent.addListener(drawing,"contextmenu",LTEvent.cancelBubble);
	   LTEvent.addListener(drawing,"contextmenu",showmenu);
	   LTEvent.addListener(document,"click",hidemenu);  
	
	
	/*增加歌单的方法传入的参数分别是：当前时间，当前用户编号，歌单名*/
	function addSongList(userId,songListName){
		if(userId == -1){
			showTipBox("info", "您尚未登录，请先登录再进行操作！");
			return ;
		}
		$.ajax({
			"url":"AddSongList",
			"dataType":"text",
			"type":"post",
			"data":{
				"mCreateName":userId,
				"mName":songListName
			},
			"success":function(data){
				if(data>0){
					$("#songListList").append("<p class='btn list_create_001 drawing'><i class='fa fa-music' aria-hidden='true'><input name='songListId' type='hidden' value='"+data+"' </i>&nbsp;&nbsp;"+songListName+"</p>");
				}else{
					showTipBox("info", "歌单新增失败！");
				}
			}
		});
	}

	//添加歌单按钮点击事件
	$("#addimg").click(function(){
		$(".addList").toggle();
	});
	
	//取消添加歌单按钮点击事件
	$("#addSongListCancel").click(function(){
		$(".addList").hide();
	});
	
	//确认添加歌单按钮点击事件
	$("#addSongListbtn").click(function(){
		var songListName = $("#songListValue #usr").val().trim();
		if(songListName == ""){
			showTipBox("info", "歌单名不能为空！请输入歌单名");
			return;
		}
		
		//影藏添加歌单按钮
		$(".addList").hide();
		//清空用户输入的歌单名，避免下一次用户输入时出现上一个用户添加的歌单名
		$("#songListValue #usr").val("");
		
		//调用添加歌单的方法，先传入一个1作为测试
		addSongList(1,songListName);
	});
	
	//右键菜单的播放按钮点击事件
	$("#menu #play").click(function(){
		if(list_create == ""){
			showTipBox("info", "请先点击选择一个歌单，再进行播放操作！");
		}
	});
	$("#menu #compile").click(function(){
		if(list_create == ""){
			showTipBox("info", "请先点击选择一个歌单，再进行修改操作！");
		}
	});
	//右键删除按钮点击事件
	$("#menu #delete").click(function(){
		if(list_create == ""){
			showTipBox("info", "请先点击选择一个歌单，再进行删除操作！");
		}
		var bool = confirm("确认要删除当前选中的歌单么？");
		if(bool==true){
			//拿到当前选中歌单的编号id
			var mid = list_create.find("[name='songListId']").val();

			$.ajax({
				"url":"DeleteSongList",
				"dataType":"text",
				"type":"post",
				"data":{
					"mid":mid
				},
				"success":function(data){
					if(data>0){
						list_create.remove();
						showTipBox("info", "删除成功！");
					}else{
						showTipBox("info", "删除失败！请与管理员联系");
					}
				}
			});
		}
	});
	
	   
});

