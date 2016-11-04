function change_page(num)
{
	curpage=num;
	for(var i=1;i<=sumpages;i++){
		if(i==num){
			document.getElementById('table_'+i).style.display='block';
			document.getElementById('page'+i).className='cur_page';
		}
		else {
			document.getElementById('table_'+i).style.display='none';
			document.getElementById('page'+i).className='';
		}
	}
	if(num==1){
		document.getElementById('firstpage').style.display='none';
		document.getElementById('prepage').style.display='none';
		document.getElementById('nextpage').style.display='block';
		document.getElementById('lastpage').style.display='block';
	}
	else if(num==sumpages){
		document.getElementById('firstpage').style.display='block';
		document.getElementById('prepage').style.display='block';
		document.getElementById('nextpage').style.display='none';
		document.getElementById('lastpage').style.display='none';
	}
	else{
		document.getElementById('firstpage').style.display='block';
		document.getElementById('prepage').style.display='block';
		document.getElementById('nextpage').style.display='block';
		document.getElementById('lastpage').style.display='block';
	}
}
function pre_page(num)
{
	change_page(curpage-1);
}
function next_page(num)
{
	change_page(curpage+1);
}