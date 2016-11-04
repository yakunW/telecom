function check(){
	if(document.getElementById('newstitle').value.length==0){
		alert('请输入新闻标题！');
		return false;
	}
	if(document.getElementById('newscontext').value.length==0){
		alert('请输入新闻内容！');
		return false;
	}
}

function checkday(){
	if(document.getElementById('d1').value.length==0){
		alert('请输入要查询的日期！');
		return false;
	}
}

function checkmonth(){
	if(document.getElementById('d2').value.length==0){
		alert('请输入要查询的月份！');
		return false;
	}
}

function checkperiod(){
	if(document.getElementById('d3').value.length==0){
		alert('请输入要查询的起始日期！');
		return false;
	}
	if(document.getElementById('d4').value.length==0){
		alert('请输入要查询的结束日期！');
		return false;
	}
}

function checkname(){
	if(document.getElementById('d5').value.length==0){
		alert('请输入要查询的姓名！');
		return false;
	}
}

function checkhistory(){
	if(document.getElementById('d6').value.length==0){
		alert('请输入要查询的起始月份！');
		return false;
	}
	if(document.getElementById('d7').value.length==0){
		alert('请输入要查询的结束月份！');
		return false;
	}
}

function checkpic(){
	if(document.getElementById('pic').value.length==0){
		alert('请选择要上传的图片！');
		return false;
	}
}

function checkstaff(){
	if(document.getElementById('staff').value.length==0){
		alert('请输入要查询的值！');
		return false;
	}
}

function test(obj1,obj2){
	if(document.getElementById('d3').value.length==0){
		alert('请输入要查询的起始日期！');
		return false;
	}
	if(document.getElementById('d4').value.length==0){
		alert('请输入要查询的结束日期！');
		return false;
	}
  var date1=document.getElementById(obj1).value;
  var date2=document.getElementById(obj2).value;
  var n1=date1.indexOf("-");
  var n2=date2.indexOf("-");
  var arr1=date1.substring(0, n1);
  var arr2=date2.substring(0, n2);
  if(arr1!=arr2){
	  alert("不允许跨年，请选择同一年份！");
	  return false;
  }
  
}

