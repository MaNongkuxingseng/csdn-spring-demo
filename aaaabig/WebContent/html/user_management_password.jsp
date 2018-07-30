<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            用户管理-修改密码
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="../css/x-admin.css" media="all">
    </head>
    <body>
        <div class="x-body">
            <form class="layui-form" id="form1">
            <input type="hidden" name="id" value="${user.id }">
                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label">
                        昵称
                    </label>
                    <div class="layui-input-inline">
                 <!--        <input type="text" id="L_username" name="username" disabled="" value="宋加加" class="layui-input"> -->
                        <input type="text" id="L_username" name="name"  value="${ user.name}" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                        <span class="x-red">*</span>旧密码
                    </label>
                    <div class="layui-input-inline">
                       <!--  <input type="password" id="L_repass" name="oldpass" required lay-verify="required" -->
                        <input type="password" id="L_repass" name="password" required lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_pass" class="layui-form-label">
                        <span class="x-red">*</span>新密码
                    </label>
                    <div class="layui-input-inline">
                       <!--  <input type="password" id="L_pass" name="newpass" required lay-verify="required" -->
                        <input type="password" id="L_pass" name="password" required lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        6到16个字符
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                        <span class="x-red">*</span>确认密码
                    </label>
                    <div class="layui-input-inline">
                      <!--   <input type="password" id="L_repass" name="repass" required lay-verify="required" -->
                        <input type="password" id="L_repass" name="password" required lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
               <!--      <button  class="layui-btn" lay-filter="save" lay-submit="">
                        确定修改
                    </button> -->
                       <input name="Submit" type="submit" class="buttonface02" value="  修 改  " onClick="xiugai2(${user.id })">
            &nbsp;&nbsp;
                </div>
            </form>
        </div>
        <script src="../lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="../js/x-layui.js" charset="utf-8">
        </script>
    <!--     <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;
            
              //监听提交
              form.on('submit(save)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                
                layer.alert("修改成功", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    document.getElementById("form").action="../test/userUpdate.do";
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
              });
              
              
            });
        </script> -->
        <script>
function xiugai2(id)
{
	var str = confirm("是否确定密码");
	if(str == true)
	{
		document.getElementById("form1").action="../test/userUpdate.do";
	}
}
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