$(function(){
			$(".register").hide();
			$(".fanghui").hide();
			$(".zhuche").click(function(){
				if($(".checkbox").get(0).checked){
					$(".register").show();
					$(".fanghui").show();
					$(".denlu").hide();
					$(".chk").hide();
				}else{
					alert("请先勾选相关《契约》");
				}
			})
			$(".fanghui").click(function(){
				$(".register").hide();
				$(".fanghui").hide();
				$(".denlu").show();
				$(".chk").show();
			})
			$(".denlu").submit(function(){
				if($(".denlu .user").val().length<6){
					return false;
				}
			})
			$(".register").submit(function(){
				showTipBox("info", "注册！");
			})
		});