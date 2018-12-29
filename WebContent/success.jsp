<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-测试水印</title>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script src="jquery.watermark.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".myText").click(function() {
			var s = $($(this).next(".myResult")).val();
			if (s == undefined || s == "") {
				s = 0;
			}
			s = parseInt(s) + 1;
			$($(this).next(".myResult")).val(s);
		});
		
		$('body').watermark({
            texts : ["林俊杰", "喜欢打Dota", "但其实更喜欢田馥甄"], //水印文字
            textColor : "#d2d2d2", //文字颜色
            textFont : '14px 微软雅黑', //字体
            width : 100, //水印文字的水平间距
            height : 100,  //水印文字的高度间距（低于文字高度会被替代）
            textRotate : -30 //-90到0， 负数值，不包含-90
        })
	});
</script>

</head>
<body>

	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
	<div></div>
	<input type="text" value="123123123123123123" class="myText">
	<input type="text" class="myResult">
	</div>
</body>
</html>