	function checknull()
	{
		if(document.getElementById("visitor_name").value.length==0){
  			alert('来访者姓名不能为空！');
  			document.getElementById("visitor_name").focus();
  			return false;}
  		if(document.getElementById("visitor_company").value.length==0){
  			alert('单位不能为空！');
  			document.getElementById("visitor_company").focus();
  			return false;}
  		if(document.getElementById("visitor_purpose").value.length==0){
  			alert('来访目的不能为空！');
  			document.getElementById("visitor_purpose").focus();
  			return false;}
  		if(document.getElementById("visitor_number").value.length==0){
  			alert('来访人数不能为空！');
  			document.getElementById("visitor_number").focus();
  			return false;}
  		if(document.getElementById("receiver_name").value.length==0){
  			alert('接待人姓名不能为空！');
  			document.getElementById("receiver_name").focus();
  			return false;}
  		if(document.getElementById("receiver_department").value.length==0){
  			alert('所在部门不能为空！');
  			document.getElementById("receiver_department").focus();
  			return false;}
  		if(document.getElementById("date1").value.length==0){
  			alert('来访时间不能为空！');
  			document.getElementById("date1").focus();
  			return false;}
  		if(document.getElementById("visit_location").value.length==0){
  			alert('会见地点不能为空！');
  			document.getElementById("visit_location").focus();
  			return false;}
  		if(document.getElementById("remarks").value.length==0){
  			alert('备注不能为空！');
  			document.getElementById("remarks").focus();
  			return false;}
  		return true;
	}