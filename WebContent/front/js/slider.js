var roll_image = new Array;
var image_link = new Array;
var small_img = new Array;

var cliImg = '';
var cliImgSrc = '';
var imgNo = -1;//Math.round(Math.random() * 8)

var interval = 3000;
var setTime = '';

function click_simg(ci, no){
 var pImg = document.getElementById('bigimg');
 var pLink = document.getElementById('imglink');

 if(cliImg == '') {
  cliImg = ci;
  cliImgSrc = ci.src;
  ci.src = small_img[no];
  imgNo=no;
  pImg.src =roll_image[no];
  pLink.href = image_link[no];
 } else if(cliImg != ci) {
  cliImg.src = cliImgSrc;
  cliImg = ci;
  cliImgSrc = ci.src;
  ci.src = small_img[no];
  imgNo=no;
  pImg.src =roll_image[no];
  pLink.href = image_link[no];
 }
 clearTimeout(setTime);
 setTime=setTimeout("rotate()",interval);
}

function rotate(){
	        var Sys = {};
	        var ua = navigator.userAgent.toLowerCase();
	        if (window.ActiveXObject)
	            Sys.ie = ua.match(/msie ([\d.]+)/)[1]
	        else if (document.getBoxObjectFor)
	            Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1]
	        else if (window.MessageEvent && !document.getBoxObjectFor)
	            Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
	        else if (window.opera)
	            Sys.opera = ua.match(/opera.([\d.]+)/)[1]
	        else if (window.openDatabase)
	            Sys.safari = ua.match(/version\/([\d.]+)/)[1];
	        
	        //以下进行测试
	        if(Sys.ie){
imgNo = (imgNo >= 7) ? 0 : imgNo+1;
var ci = document.getElementById("num_img"+imgNo);

document.getElementById('bigimg').filters.blendTrans.apply();
document.getElementById('imglink').href=image_link[imgNo];
document.getElementById('bigimg').src=roll_image[imgNo];
document.getElementById('bigimg').filters.blendTrans.play();

if(cliImg == '') {
  cliImg = ci;
  cliImgSrc = ci.src;
  ci.src = small_img[imgNo];
} else if(cliImg != ci) {
  cliImg.src = cliImgSrc;
  cliImg = ci;
  cliImgSrc = ci.src;
  ci.src = small_img[imgNo];
}
	}
	else{
imgNo = (imgNo >= 7) ? 0 : imgNo+1;
var ci = document.getElementById("num_img"+imgNo);
click_simg(ci, imgNo);
	}
 

 setTime=setTimeout("rotate()",interval);
}