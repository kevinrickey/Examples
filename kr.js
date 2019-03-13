//////////////////////////////////////////////////////////////////
// Cache Button state Images for Faster Loading
// BUTTONS
// 1st char = First Letter of Destination page: h=Home, l=Login, b=Blog, and c=Contact
// 2nd char = Button State: u=up (1-hover), d=down (2-On), n=normal (3-Off)
/////////////////////////////////////////////////////////////////
var tr = 1;
//movie-buttonvar
var mb1 = new Image();
mb1.src = 'stuff/images/buttons/but1.png';
var mb1h = new Image();
mb1h.src = 'stuff/images/buttons/but1h.png';
// HOME BUTTON
var hu = new Image();
hu.src = 'stuff/images/buttons/bh-h.png';
var hd = new Image();
hd.src = 'stuff/images/buttons/bh-on.png';
var hn = new Image();
hn.src = 'stuff/images/buttons/bh-off.png';
// LOGIN BUTTON
var lu = new Image();
lu.src = 'stuff/images/buttons/bl-h.png';
var ld = new Image();
ld.src = 'stuff/images/buttons/bl-on.png';
var ln = new Image();
ln.src = 'stuff/images/buttons/bl-off.png';
// BLOG BUTTON
var bu = new Image();
bu.src = 'stuff/images/buttons/bb-h.png';
var bd = new Image();
bd.src = 'stuff/images/buttons/bb-on.png';
var bn = new Image();
bn.src = 'stuff/images/buttons/bb-off.png';
// ABOUT BUTTON
var au = new Image();
au.src = 'stuff/images/buttons/ba-h.png';
var ad = new Image();
ad.src = 'stuff/images/buttons/ba-on.png';
var an = new Image();
an.src = 'stuff/images/buttons/ba-off.png';
// CONTACT BUTTON
var cu = new Image();
cu.src = 'stuff/images/buttons/bc-h.png';
var cd = new Image();
cd.src = 'stuff/images/buttons/bc-on.png';
var cn = new Image();
cn.src = 'stuff/images/buttons/bc-off.png';
//B6 BUTTON
var b6u = new Image();
b6u.src = 'stuff/images/buttons/b6-h.png';
var b6d = new Image();
b6d.src = 'stuff/images/buttons/b6-on.png';
var b6n = new Image();
b6n.src = 'stuff/images/buttons/b6-off.png';
//B7 BUTTON
var hpdh = new Image();
hpdh.src = 'stuff/images/buttons/hpd-h.png';
var hpd = new Image();
hpd.src = 'stuff/images/buttons/hpd.png';
////////////////////////////
// PAGE IMAGE DEFINITIONS
////////////////////////////
var nav = new Image();
nav.src = 'stuff/images/page1/nav.jpg';
var foot = new Image();
foot.src = 'stuff/images/page1/foot.jpg';
var login = new image();
login.src = 'stuff/images/page1/login.jpg';
var login1 = new image();
login1.src = 'stuff/images/page1/login-1.jpg';
var home = new Image();
home.src = 'stuff/images/page1/home.jpg';
var home1 = new Image();
home1.src = 'stuff/images/page1/home-1.jpg';
var home2 = new Image();
home2.src = 'stuff/images/page1/home-2.jpg';
var blog = new Image();
blog.src = 'stuff/images/page1/blog.jpg';
var blog1 = new Image();
blog1.src = 'stuff/images/page1/blog-1.jpg';
var about = new Image();
about.src = 'stuff/images/page1/about.jpg';
var about1 = new Image();
about1.src = 'stuff/images/page1/about-1.jpg';
var about2 = new Image();
about2.src = 'stuff/images/page1/about-2.jpg';
var contact = new Image();
contact.src = 'stuff/images/page1/contact.jpg';
var contact1 = new Image();
contact1.src = 'stuff/images/buttons/contact-1.jpg';
var contact2 = new Image();
contact2.src = 'stuff/images/buttons/contact-2.jpg';
// function setup() {document.write('<scr' + 'ipt type="text/javascript" src="2.js"></scr' + 'ipt>');
// }
////////////////////////////////////
// MISC. FUNCTIONS
function homeonce() {document.images["bh"].src = hd.src; return true;} //set home button as "ON"
//function loginonce() {hu.src = 'stuff/images/buttons/bh-h.png';hn.src = 'stuff/images/buttons/bh-off.png'; document.images["bh"].src = hn.src;lu.src = 'stuff/images/buttons/bl-on.png';ln.src = 'stuff/images/buttons/bl-on.png'; document.images["bl"].src = ln.src; return true;} //set login button as "ON"
function nop() {return true;}
function b61() {document.images["b6"].src = b6u.src; return true;} //hover
function b62() {document.images["b6"].src = b6n.src; return true;} // off
function b71() {document.images["b7"].src = hpdh.src; return true;} //hover
function b72() {document.images["b7"].src = hpd.src; return true;} // off
function b82() {document.images["b8"].src = mb1.src; return true;} //hover
function b81() {document.images["b8"].src = mb1h.src; return true;} // off
function b83() {return true;} // on-click
//function rep() {document.images["b6"].src = b6d.src; var ele = document.getElementById("pag1"); const conten = ele.innerHTML; alert('width='+w+' hight='+h+'w1='+w1+' h1='+h1+' Content='+conten); return true;}
function scr5() {$('.scr5').animate({left:'100%'},'slow','swing'); return true;}
function scr4() {$('.scr4').animate({left:'100%'},'slow','swing'); return true;} 
//function doit (scroll) {x = scroll.getAttribute("data-t");
//document.title = d(x,2);
//if (tr = 1) {tr = 0;}
//else {tr = 1;}
//contain=$('#pag2'); contain.load('stuff/pages/'+d(x,tr)); return true;}
// function paint1() {document.images["maini"].src = bacg; return true;}
// function del1() {setTimeout(function(){document.images["maini"].src = bacg;}, 4400); return true;}
//***********************
// HOME BUTTON FUNCTIONS
//***********************
//login-home
function lth() {document.title="Home - KR.com";
$('#az2').attr('src', "stuff/images/page1/home1.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1000); return true;}
//blog-home
function bth() {document.title="Home - KR.com";
$('#az2').attr('src', "stuff/images/page1/home2.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1000); return true;}
//about-home
function ath() {document.title="Home - KR.com";
$('#az3').attr('src', "stuff/images/page1/home1.jpg");scr4();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1000); return true;}
//contact-home
function cth() {document.title="Home - KR.com";
$('#az3').attr('src', "stuff/images/page1/home1.jpg");scr4();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1000); return true;}
//***********************
//LOGIN BUTTON FUNCTIONS
//*********************** 
//home-login
function htl() {document.title="Login - KR.com";
$('#az2').attr('src', "stuff/login/stuff/login.jpg");scr5();contain=$('#pag2'); contain.load('stuff/pages/login1.php'); return true;}
//blog-login
function btl() {document.title="Login - KR.com";
$('#az2').attr('src', "stuff/login/stuff/login.jpg");scr5();contain=$('#pag2'); contain.load('stuff/pages/login1.php'); return true;}
//about-login
function atl() {document.title="Login - KR.com";
$('#az2').attr('src', "stuff/login/stuff/login.jpg");scr5();contain=$('#pag2'); contain.load('stuff/pages/login1.php'); return true;}
//contact-login
function ctl() {document.title="Login - KR.com";
$('#az2').attr('src', "stuff/login/stuff/login.jpg");scr5();contain=$('#pag2'); contain.load('stuff/pages/login1.php'); return true;}
//***********************
//BLOG BUTTON FUNCTIONS
//*********************** 
//home-blog
function htb() {document.title="Blog - KR.com";
$('#az2').attr('src', "stuff/images/page1/blog1.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1000); return true;}
//login-blog
function ltb() {document.title="Blog - KR.com";
$('#az2').attr('src', "stuff/images/page1/blog1.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1000); return true;}
//about-blog
function atb() {document.title="Blog - KR.com";
$('#az2').attr('src', "stuff/images/page1/blog1.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1000); return true;}
//contact-blog
function ctb() {document.title="Blog - KR.com";
$('#az2').attr('src', "stuff/images/page1/blog1.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1000); return true;}
//*********************** 
// ABOUT BUTTON FUNCTIONS
//*********************** 
//home -> about
function hta() {document.title="About - KR.com";
setTimeout(function() {contain=$('#pag2');contain.load('stuff/page1/home-a'); }, 2000); return true;}
//login -> about
function lta() {document.title="About - KR.com";
$('#az2').attr('src', "stuff/images/page1/about2.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1000); return true;}
//blog -> about
function bta() {document.title="About - KR.com";
$('#az2').attr('src', "stuff/images/page1/about2.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1000); return true;}
//contact -> about
function cta() {document.title="About - KR.com";
$('#az3').attr('src', "stuff/images/page1/about1.jpg");scr4();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1000); return true;}
//**************************
// CONTACT BUTTON FUNCTIONS
//**************************
//home -> contact
function htc() {document.title="Contact - KR.com";
$('#az3').attr('src', "stuff/images/page1/contact1.jpg");scr4();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1000); return true;}
//login -> contact
function ltc() {document.title="Contact - KR.com";
$('#az2').attr('src', "stuff/images/page1/contact2.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1000); return true;}
//blog-contact
function btc() {document.title="Contact - KR.com";
$('#az2').attr('src', "stuff/images/page1/contact2.jpg");scr5();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1000); return true;}
// about-contact
function atc() {document.title="Contact - KR.com";
$('#az3').attr('src', "stuff/images/page1/contact1.jpg");scr4();setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1000); return true;}
//-=-=---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-==--=-=-=-=
//login-home
//function hhl() {document.title="Home - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/home2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1800); return true;}
//blog-home
//function hhb() {document.title="Home - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/home2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1800); return true;}
//about-home
//function hha() {document.title="Home - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/home1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1800); return true;}
//contact-home
//function hhc() {document.title="Home - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/home1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/home.php'); }, 1800); return true;}
//***********************
//LOGIN BUTTON FUNCTIONS
//*********************** 
//home-login
//function lhh() {document.title="Login - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/login1.php');setTimeout(function() {$(az1).attr('src','/login/stuff/login.jpg'); }, 1800); return true;}
//blog-login
//function lhb() {document.title="Login - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/login1.php');setTimeout(function() {$(az1).attr('src','/login/stuff/login.jpg'); }, 1800); return true;}
//about-login
//function lha() {document.title="Login - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/login1.php');setTimeout(function() {$(az1).attr('src','/login/stuff/login.jpg'); }, 1800); return true;}
//contact-login
//function lhc() {document.title="Login - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/login1.php');setTimeout(function() {$(az1).attr('src','/login/stuff/login.jpg'); }, 1800); return true;}
//***********************
//BLOG BUTTON FUNCTIONS
//*********************** 
//home-blog
//function bhh() {document.title="Blog - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/blog1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1800); return true;}
//login-blog
//function bhl() {document.title="Blog - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/blog1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1800); return true;}
//about-blog
//function bha() {document.title="Blog - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/blog1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1800); return true;}
//contact-blog
//function bhc() {document.title="Blog - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/blog1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/blog.php'); }, 1800); return true;}
//*********************** 
// ABOUT BUTTON FUNCTIONS
//*********************** 
//home -> about
//function ahh() {document.title="About - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/about1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1800); return true;}
//login -> about
//function ahl() {document.title="About - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/about2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1800); return true;}
//blog -> about
//function ahb() {document.title="About - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/about2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1800); return true;}
//contact -> about
//function ahc() {document.title="About - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/about1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/about.php'); }, 1800); return true;}
//**************************
// CONTACT BUTTON FUNCTIONS
//**************************
//home -> contact
//function chh() {document.title="Contact - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/contact1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1800); return true;}
//login -> contact
//function chl() {document.title="Contact - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/contact2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1800); return true;}
//blog-contact
//function chb() {document.title="Contact - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/contact2.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1800); return true;}
// about-contact
//function cha() {document.title="Contact - KR.com";
//contain=$('#pag'); contain.load('stuff/pages/contact1.php');setTimeout(function() {contain=$('#pag2');contain.load('stuff/pages/contact.php'); }, 1800); return true;}