<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-测试水印</title>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	function start() {
		$.ajax({
			url : 'http://localhost:8080/TestWeb/FirstServlet',
			type : 'POST', //GET
			async : true, //或false,是否异步
			data : {
				name : 'yang',
				age : 25
			//想要传输过去的数据 key：value，另一个页面通过 key接收value的值
			},
			timeout : 5000, //超时时间
			dataType : 'text', //返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data, textStatus, jqXHR) {//data是成功后，接收的返回值
				console.log(data);
			}
		});
	}
	start();
	$(document).ready(function() {
		watermark({
			watermark_txt : "窦鸿飞一二三四五"
		});
		$(".myText").click(function() {
			var s = $($(this).next(".myResult")).val();
			if (s == undefined || s == "") {
				s = 0;
			}
			s = parseInt(s) + 1;
			$($(this).next(".myResult")).val(s);
		});
	});

	function watermark(settings) {
		debugger;
		//默认设置
		var defaultSettings = {
			watermark_txt : "text",
			watermark_x : 20,//水印起始位置x轴坐标
			watermark_y : 20,//水印起始位置Y轴坐标
			watermark_rows : 20,//水印行数
			watermark_cols : 20,//水印列数
			watermark_x_space : 100,//水印x轴间隔
			watermark_y_space : 50,//水印y轴间隔
			watermark_color : '#aaa',//水印字体颜色
			watermark_alpha : 0.4,//水印透明度
			watermark_fontsize : '100px',//水印字体大小
			watermark_font : '微软雅黑',//水印字体
			watermark_width : 210,//水印宽度
			watermark_height : 80,//水印长度
			watermark_angle : 15
		//水印倾斜度数
		};
		//采用配置项替换默认值，作用类似jquery.extend
		if (arguments.length === 1 && typeof arguments[0] === "object") {
			var src = arguments[0] || {};
			for (key in src) {
				if (src[key] && defaultSettings[key]
						&& src[key] === defaultSettings[key])
					continue;
				else if (src[key])
					defaultSettings[key] = src[key];
			}
		}

		var oTemp = document.createDocumentFragment();

		//获取页面最大宽度
		var page_width = Math.max(document.body.scrollWidth,
				document.body.clientWidth);
		var cutWidth = page_width * 0.0150;
		var page_width = page_width - cutWidth;
		//获取页面最大高度
		var page_height = Math.max(document.body.scrollHeight,
				document.body.clientHeight) + 450;
		// var page_height = document.body.scrollHeight+document.body.scrollTop;
		//如果将水印列数设置为0，或水印列数设置过大，超过页面最大宽度，则重新计算水印列数和水印x轴间隔
		if (defaultSettings.watermark_cols == 0
				|| (parseInt(defaultSettings.watermark_x
						+ defaultSettings.watermark_width
						* defaultSettings.watermark_cols
						+ defaultSettings.watermark_x_space
						* (defaultSettings.watermark_cols - 1)) > page_width)) {
			defaultSettings.watermark_cols = parseInt((page_width
					- defaultSettings.watermark_x + defaultSettings.watermark_x_space)
					/ (defaultSettings.watermark_width + defaultSettings.watermark_x_space));
			defaultSettings.watermark_x_space = parseInt((page_width
					- defaultSettings.watermark_x - defaultSettings.watermark_width
					* defaultSettings.watermark_cols)
					/ (defaultSettings.watermark_cols - 1));
		}
		//如果将水印行数设置为0，或水印行数设置过大，超过页面最大长度，则重新计算水印行数和水印y轴间隔
		if (defaultSettings.watermark_rows == 0
				|| (parseInt(defaultSettings.watermark_y
						+ defaultSettings.watermark_height
						* defaultSettings.watermark_rows
						+ defaultSettings.watermark_y_space
						* (defaultSettings.watermark_rows - 1)) > page_height)) {
			defaultSettings.watermark_rows = parseInt((defaultSettings.watermark_y_space
					+ page_height - defaultSettings.watermark_y)
					/ (defaultSettings.watermark_height + defaultSettings.watermark_y_space));
			defaultSettings.watermark_y_space = parseInt(((page_height - defaultSettings.watermark_y) - defaultSettings.watermark_height
					* defaultSettings.watermark_rows)
					/ (defaultSettings.watermark_rows - 1));
		}
		var x;
		var y;
		for (var i = 0; i < defaultSettings.watermark_rows; i++) {
			y = defaultSettings.watermark_y
					+ (defaultSettings.watermark_y_space + defaultSettings.watermark_height)
					* i;
			for (var j = 0; j < defaultSettings.watermark_cols; j++) {
				x = defaultSettings.watermark_x
						+ (defaultSettings.watermark_width + defaultSettings.watermark_x_space)
						* j;

				var mask_div = document.createElement('div');
				mask_div.id = 'mask_div' + i + j;
				mask_div.className = 'mask_div';
				mask_div.appendChild(document
						.createTextNode(defaultSettings.watermark_txt));
				//设置水印div倾斜显示
				mask_div.style.webkitTransform = "rotate(-"
						+ defaultSettings.watermark_angle + "deg)";
				mask_div.style.MozTransform = "rotate(-"
						+ defaultSettings.watermark_angle + "deg)";
				mask_div.style.msTransform = "rotate(-"
						+ defaultSettings.watermark_angle + "deg)";
				mask_div.style.OTransform = "rotate(-"
						+ defaultSettings.watermark_angle + "deg)";
				mask_div.style.transform = "rotate(-"
						+ defaultSettings.watermark_angle + "deg)";
				mask_div.style.visibility = "";
				mask_div.style.position = "absolute";
				mask_div.style.left = x + 'px';
				mask_div.style.top = y + 'px';
				mask_div.style.overflow = "hidden";
				mask_div.style.zIndex = "9999";
				mask_div.style.pointerEvents = 'none';//pointer-events:none  让水印不遮挡页面的点击事件
				//mask_div.style.border="solid #eee 1px";
				mask_div.style.opacity = defaultSettings.watermark_alpha;
				mask_div.style.fontSize = defaultSettings.watermark_fontsize;
				mask_div.style.fontFamily = defaultSettings.watermark_font;
				mask_div.style.color = defaultSettings.watermark_color;
				mask_div.style.textAlign = "center";
				mask_div.style.width = defaultSettings.watermark_width + 'px';
				mask_div.style.height = defaultSettings.watermark_height + 'px';
				mask_div.style.display = "block";
				oTemp.appendChild(mask_div);
			}
			;
		}
		;
		document.body.appendChild(oTemp);
	}
</script>

<style>
body {
	background-image: url(1.jpg);
	background-size: cover;
}
</style>

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