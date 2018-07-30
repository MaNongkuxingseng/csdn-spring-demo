<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页-添加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/x-admin.css" media="">
</head>


<body>
	<div class="x-body">
		<form class=""
			action="${pageContext.request.contextPath}/home/addHomeHou.do"	method="post" enctype="multipart/form-data">
			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>序号
				</label>
				<div class="layui-input-inline">
					<input type="text" id="link" name="id" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>模块
				</label>
				<div class="layui-input-inline">
					<select lay-verify="required" name="gid">
						<optgroup label="模块">
							<c:forEach items="${genres}" var="genre">
								<option value="${genre.gid }">${genre.gname }</option>
							</c:forEach>
						</optgroup>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>标题
				</label>
				<div class="layui-input-inline">
					<input type="text" id="link" name="topic" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>上传时间
				</label>
				<div class="layui-input-inline">
					<input type="text" id="link" name="time" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>轮播图
				</label>
				<div class="layui-input-inline">
					<div class="">
						<input type="file" name="file"/>
					</div>
				</div>
			</div>
			<!-- div class="layui-form-item">
				<label class="layui-form-label">图片 </label> <img id="" width="400"
					src="">
			</div> -->
			<div class="layui-form-item">
				<label for="desc" class="layui-form-label"> <span
					class="x-red">*</span>文字信息
				</label>
				<div class="layui-input-inline">
					<textarea id="L_content" name="content" placeholder="简介"
						class="layui-textarea fly-editor" style="height: 260px;">简介</textarea>
				</div>
				<div class="layui-form-mid layui-word-aux">
					<span class="x-red">*</span>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<input type="submit" value="增加" />
				  <input name="Submit" type="submit"  value="关闭" onClick="window.close()">
			</div>
		</form>
	</div>


	<script src="${pageContext.request.contextPath}/lib/layui/layui.js"
		charset="utf-8">
		
	</script>
	<script src="${pageContext.request.contextPath}/js/x-layui.js"
		charset="utf-8">
		
	</script>
	<script>
		layui.use([ 'form', 'layer', 'upload' ], function() {
			$ = layui.jquery;
			var form = layui.form(), layer = layui.layer;

			//图片上传接口
			layui.upload({
				url : '${pageContext.request.contextPath}/home/addHomeHou.do' //上传接口
				,
				success : function(res) { //上传成功后的回调
					console.log(res);
					$('#LAY_demo_upload').attr('src', res.url);
				}
			});

			//监听提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//发异步，把数据提交给php
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
				return false;
			});

		});
	</script>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>

</html>