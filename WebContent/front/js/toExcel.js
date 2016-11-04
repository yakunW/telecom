function saveTable(obj)
{
	var winname=window.open('','newwin','');
	var str=document.getElementById(obj);
	var strHTML=str.innerHTML;
	winname.document.open('application/vnd.ms-excel','replace');
	winname.document.writeln(strHTML);
	winname.document.execCommand('SaveAs','','result.xls');
	winname.close();
}