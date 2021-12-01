var box={width:50,height:50};//每一个方块的高度
var snake=[];//保存蛇每一节身体对应的span
var DIR={
 DIR_RIGHT:1,
 DIR_LEFT:2,
 DIR_TOP:3,
 DIR_BOTTOM:4
};
var dir=DIR.DIR_BOTTOM;
var food=null; //始终记录当前的食物 
window.onload=function(){
 //1.初始化地图
 initMap();
 //2.创建蛇
 //2.5随机显示食物
 showFood();
 createSnake();
 //3.让蛇动起来
 setInterval(snakeMove,100);
 //4.控制蛇移动
 document.onkeyup=function(e){
 switch(e.keyCode){
 case 37:dir=DIR.DIR_LEFT;break;
 case 38:dir=DIR.DIR_TOP;break;
 case 39:dir=DIR.DIR_RIGHT;break;
 case 40:dir=DIR.DIR_BOTTOM;break; 
 } 
 }
};
function isInSnakeBody(left,top){
 for(var i=0;i<snake.length;i++){
 if(snake[i].offsetTop==top&&snake[i].offsetLeft==left){
 return true;
 }
 }
}
//这种随机生成食物的方法效率低---随着蛇身体的增长，随机生成食物的时间会变慢。
function showFood(){
 var con=document.getElementById("container");
 food=document.createElement("span");
 food.className="food";
 food.style.width=box.width+"px";
 food.style.height=box.height+"px";
 var left,top;
 do{
 left=Math.floor((con.offsetWidth-2)/box.width*Math.random())*box.width;
 top=Math.floor((con.offsetHeight-2)/box.height*Math.random())*box.height;
 }while(isInSnakeBody(left,top));
 food.style.left=left+"px";
 food.style.top=top+"px";
 con.appendChild(food);
}
function initMap(){
 var con=document.getElementById("container");
 var row=Math.floor(con.offsetWidth/box.width);
 var rol=Math.floor(con.offsetHeight/box.height);
 var num=row*rol;
 var newSpan=null;
 for(var i=1;i<=num;i++){
 newSpan=document.createElement("span");
 newSpan.style.width=box.width+"px";
 newSpan.style.height=box.height+"px";
 con.appendChild(newSpan);
 } 
}
function createSnake(){
 var newBody=null;
 var con=document.getElementById("container");
 for(var i=1;i<=5;i++){
 newBody=document.createElement("span");
 newBody.style.width=box.width+"px";
 newBody.style.height=box.height+"px";
 newBody.style.left=(i-1)*box.width+"px";
 newBody.style.top="0px";
 newBody.className="snake";
 con.appendChild(newBody);
 snake.push(newBody);
 }
}
function snakeMove(){
 var con=document.getElementById("container");
 //蛇头移动
 var head=snake[snake.length-1];
 var newTop=head.offsetTop,newLeft=head.offsetLeft;
 switch(dir){
 case DIR.DIR_LEFT:newLeft-=box.width; break;
 case DIR.DIR_RIGHT:newLeft+=box.width; break;
 case DIR.DIR_TOP:newTop-=box.height; break;
 case DIR.DIR_BOTTOM:newTop+=box.height; break;
 default:break;
 }
 //如果超出边界，计算蛇头下一个位置的坐标
 if(newLeft>con.offsetWidth-2-1){newLeft=0;}
 if(newLeft<0){newLeft=con.offsetWidth-2-box.width;}
 if(newTop<0){newTop=con.offsetHeight-2-box.height;}
 if(newTop>con.offsetHeight-2-1){newTop=0;}
 //判断新蛇头的位置是不是在蛇身体里面
 //for(var i=0;i<snake.length-1;i++){
 // if(snake[i].offsetLeft==newLeft&&snake[i].offsetTop==newTop){
 // alert("Game over！！");
 // window.location.href=window.location.href;
 // } 
 //}
 //1.如果吃到食物
 if(newLeft==food.offsetLeft&&newTop==food.offsetTop){
 food.className="snake";
 snake.push(food);
 showFood();
 return;
 }
 //2.如果没吃到
 //除蛇头外身体移动
 for(var i=0;i<snake.length-1;i++){
 snake[i].style.top=snake[i+1].offsetTop+"px";
 snake[i].style.left=snake[i+1].offsetLeft+"px";
 }
 head.style.left=newLeft+"px";
 head.style.top=newTop=newTop+"px";
}
*{
 padding:0;
 margin:0;
}
html,body{
 width:100%;
 height:100%;
}
body{
 position:relative;
}
div#container{
 position:absolute;
 top:0;
 bottom:0;
 left:0;
 right:0;
 margin:auto;
 width:800px;
 height:500px;
 border:1px solid black;
 font-size:0px;
}
span{
 display:inline-block;
 border:1px solid black;
 box-sizing:border-box;
}
span.snake{
 position:absolute;
 background-color:red;
}
span.food{
 position:absolute;
 background-color:blue;
}