<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            数据统计
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/css/x-admin.css" media="all">
        <!--饼状图开始-->
        <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jsapi.js"></script>
<script type="text/javascript" src="js/corechart.js"></script>		
<script type="text/javascript" src="js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
	$('#myTable5').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable1').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>
        <!--结束-->
        
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>数据管理</cite></a>
              <a><cite>数据统计</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
     <!--    <form class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <input type="text" name="username"  placeholder="搜索内容" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                  </div>
                </div> 
            </form> -->
          <xblock>
          
         <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/look2.png" width="15" height="15"></img></i>详细信息</button>
          <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/tongji.png" width="15" height="15"></img></i>统计</button>
         <!--   <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/daochu.png" width="15" height="15"></img></i>批量导出</button>
          <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/daochu1.png" width="15" height="15"></img></i>导出</button> -->
          <span class="x-right" style="line-height:40px">共有数据：${pages.totalRows } 条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <!-- <th>
                            <input type="checkbox" name="" value="">
                        </th> -->
                        <th>
                            用户名
                        </th>
                        <th>
                            唯一标识
                        </th>
                        <th>
                            年龄
                        </th>
                        <th>
                            性别
                        </th>
                        <th>
                            所属
                        </th>
                        <th>
                            测试用时
                        </th>
                        <th>
                            预警等级
                        </th>
                        <th>
                            测试时间
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>
              
                 <c:forEach items="${pages.datas }" var="pagel">
      			
                    <tr>
                        <!-- <td>
                            <input type="checkbox" value="1" name="">
                        </td> -->
                        <td>
                            ${pagel.name }
                        </td>
                        <td>
                            <u style="cursor:pointer" onclick="question_show()">
                                ${pagel.mark }
                            </u>
                        </td>
                        <td >
                          ${pagel.age }
                        </td>
                        <td >
                            ${pagel.gender }
                        </td>
                        <td >
                            ${pagel.belong }
                        </td>
                        <td >${pagel.test_time }</td>
                        <td>
                            ${pagel.warning_level }
                        </td>
                        <td>${pagel.testTime }</td>
                         <td class="td-manage">
                            <a title="查看"  onclick="person_look('查看','${pageContext.request.contextPath}/data/searchForShuLook.do?pid=${pagel.id }','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon"><img src="${pageContext.request.contextPath}/images/look.png" width="15" height="15"></img></i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="person_del(this,'${pagel.id}')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    
                   </c:forEach>
                </tbody>
               
            </table>
            
            <div id="page"></div>
        </div>
        <br /><br /><br />
        
		 <%--  分页显示   --%> 
	<c:choose>
    <%--	 只有一页的时候  --%>
		<c:when test="${pages.totalPages == 1 }">
	      <tr>
    	    <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath }/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="${pageContext.request.contextPath }/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="${pageContext.request.contextPath }/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="${pageContext.request.contextPath }/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 ${pages.pageno }/${pages.totalPages } 页 共有${pages.totalRows } 条记录</td>
     	 </tr>
		</c:when>
		 <%-- 当前是第一页的时候  --%>    
		<c:when test="${pages.pageno == 1 }">
	      <tr>
    	    <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath }/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="${pageContext.request.contextPath }/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="${pageContext.request.contextPath }/images/2-2.gif" width="3" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.pageno+1 }">下一页</a>　 <img src="${pageContext.request.contextPath }/images/3.gif" width="4" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.totalPages }">末页</a>　共 ${pages.pageno }/${pages.totalPages } 页 共有${pages.totalRows } 条记录</td>
     	 </tr>
		</c:when>
		 <%--  当前是最后的时候    --%>  
		<c:when test="${pages.pageno == pages.totalPages }">
	      <tr>
    	    <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath }/images/1.gif" width="4" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=1">首页</a>　 <img src="${pageContext.request.contextPath }/images/2.gif" width="3" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.pageno-1 }">上一页</a>　 <img src="${pageContext.request.contextPath }/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="${pageContext.request.contextPath }/images/3.gif" width="4" height="5" align="absmiddle"> 末页　共 ${pages.pageno }/${pages.totalPages } 页 共有${pages.totalRows } 条记录</td>
     	 </tr>
		</c:when>
		 <%-- 当前是中间页的时候 --%>  
		<c:otherwise>
	      <tr>
    	    <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath }/images/1.gif" width="4" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=1">首页</a>　 <img src="${pageContext.request.contextPath }/images/2.gif" width="3" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.pageno-1 }">上一页</a>　 <img src="${pageContext.request.contextPath }/images/2-2.gif" width="3" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.pageno+1 }">下一页</a>　 <img src="${pageContext.request.contextPath }/images/3.gif" width="4" height="5" align="absmiddle"> <a href="${pageContext.request.contextPath}/data/searchForData.do?pageno=${pages.totalPages }">末页</a>　共 ${pages.pageno }/${pages.totalPages } 页 共有${pages.totalRows } 条记录</td>
     	 </tr>
		</c:otherwise>
	</c:choose>    
              
              
          
        <script src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
        <script src="${pageContext.request.contextPath }/js/x-layui.js" charset="utf-8"></script>
        <script>
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

         /*      //以上模块根据需要引入
              laypage({
                cont: 'page'
                ,pages: 100
                ,first: 1
                ,last: 100
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
              }); 
               */
            });

            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }

             function question_show (argument) {
                layer.msg('唯一标识',{icon:1,time:1000});
             }
            
            //查看
           function person_look (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }

            /*删除*/
			 function person_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                     location.href="${pageContext.request.contextPath}/data/deleteForShu.do?id="+id ;  
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
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
<!--         饼状图开始
        <div style="width:100%;margin:0 auto;">
        
        <table width="100%">
        <tr>
    <td colspan="2" align="center">症状图表显示（标题）</td>
  </tr>
  <tr>
    <td align="center"> <table id='myTable5'>
			<caption>症状比例</caption>
			<thead>
				<tr>
					<th></th>
					<th>人格障碍</th>
					<th>样人格障碍</th>
					<th>人格障碍</th>
					<th>人格障碍</th>
					<th>人格障碍</th>
					<th>人格障碍</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1200</th>
					<td>540</td>
					<td>300</td>
					<td>150</td>
					<td>180</td>
					<td>120</td>
					<td>180</td>
                    
				</tr>
			</tbody>
		</table>  </td>
    <td align="center"> <table id='myTable1'>
			<caption>症状性别比例</caption>
			<thead>
				<tr>
					<th></th>
					<th>男</th>
					<th>女</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1000</th>
					<td>450</td>
					<td>550</td>
					</tr>
			</tbody>
		</table>  </td>
  </tr>
</table>
	</div>	

        结束
        <br /><br /> -->
    </body>
</html>