/*
*坦克类
*/ 

var Tank=function(){
	this.width=this.height=BASE*2;	//宽、高
	this.dir;		//方向：1-上、2-下、3-左、4-右
	this.speed=BASE/4;	//速度
	this.type;	//坦克种类：1、2、3
	this.basePos=null;	//不同种类的坦克背景图片显示的x、y坐标基本位置（坦克材料对象）
	this.index=0;	//坦克孵化效果次数计数，6次以后便创造出来
	this.tankDiv=null;	//坦克对象
}

//移动
Tank.prototype.move=function(){
	var maxVal=(this.dir==1 || this.dir==3)?0:BASE*24;	//方向：上左 最大值0，下右 最大值24*16
	var attr=(this.dir==1 || this.dir==2)?"top":"left";	//方向：上下 对top操作，左右 对left操作
	var attrVal=parseInt(getAttr(this.tankDiv,attr));		//获取当前方向上的值
	
	var speed=(this.dir==1||this.dir==3)?-1*this.speed:this.speed;//方向：上、右 速度为负
	var isGo={ result:true };
	
	//检测是否碰撞
	isGo=isHit(this.tankDiv, speed, attr); 
	
	if(attrVal!=maxVal && isGo.result){		
		this.tankDiv.style[attr]=attrVal+speed+'px';
		return;
	}
	
	if(this.tankDiv.category===ENEMY) {
		//如果不是FLOW或者不是自己一伙，则无法继续，改变方向
		this.setDir();
	}
}

//改变方向
Tank.prototype.setDir=function(dir){
	this.dir=dir?dir:getRandom(1,4);
	this.tankDiv.style.backgroundPosition=(this.basePos.x-32*(this.dir-1))+"px "+this.basePos.y+"px";
}

//创建子弹 suffix：id的后缀
Tank.prototype.createBullet=function(bulletCategory,suffixID){
	//var oBullet=new Bullet();
	var bullet=createDiv(BULLET,0,0,suffixID);
	bullet.category=bulletCategory;
	oMoveBox.appendChild(bullet);
	return bullet;
}

//坦克的射击方法
Tank.prototype.shoot=function(bulletCategory){
	if(!TankObj[this.tankDiv.id]) return;	//如果该tank射击了子弹，则不继续出
	var oBullet=this.createBullet(bulletCategory,this.tankDiv.id);
	
	var x=parseInt(getAttr(this.tankDiv, "left"));
	var y=parseInt(getAttr(this.tankDiv, "top"));
	switch(this.dir){
		case 1:x+=13,y-=6;
			break;
		case 2:x+=13,y+=32;
			break;
		case 3:x-=6,y+=13;
			break;
		case 4:x+=32,y+=13;
			break;
	}
	oBullet.style.left=x+"px";
	oBullet.style.top=y+"px";
	oBullet.id="div_"+x+"_"+y+'_'+this.tankDiv.id;
	//TankObj[this.tankDiv.id].oBullet=oBullet;
	TankObj[this.tankDiv.id].bulletID=oBullet.id;
	
	var baseObj={};
	baseObj.dir=this.dir;
	baseObj.speed=2*this.speed;
	baseObj.bullet=oBullet;
	BulletMove(baseObj);
	oBullet.bulletTimer=setInterval(function(){BulletMove(baseObj)},30);
}


//移动
function BulletMove(baseObj){
	//if(!this.bullet) return;
	var attr=(baseObj.dir==1 || baseObj.dir==2)?"top":"left";	// top left
	var attrVal=parseInt(getAttr(baseObj.bullet,attr));	//获取当前方向上的值
	var isOverMaxVal=(baseObj.dir==1||baseObj.dir==3)?attrVal<=0:attrVal>=(BASE*26-6);	// 方向：上左 小于最大值0返回true，下右 大于最大值26*16 则返回true		
	var speed=(baseObj.dir==1||baseObj.dir==3)?-1*baseObj.speed:baseObj.speed;//方向：上、右 速度为负
	
	//检测是否碰撞
	var isGo={ result:true };	
	isGo=isHit(baseObj.bullet, speed, attr); 
	
	//是否到达边界
	if(isOverMaxVal){
		BulletDie(baseObj.bullet);
		return;
	}
	
	if(isGo.result){		
		baseObj.bullet.style[attr]=attrVal+speed+'px';
		return;
	}
	
	//false-被阻挡
	if(!isGo.result){
		var eleDiv=document.getElementById(isGo.eleID),
			eleClass=eleDiv.className,
			eleCategory=eleDiv.category,
			bulletCategory=baseObj.bullet.category;
			
		if(eleClass==SLAB){
			//如果是预制板-Slab，则自己灭亡
			BulletDie(baseObj.bullet);
		}
		else if(eleClass==WALL){
			oGrid[isGo.iGrid].splice(isGo.index,1);	
			BulletKill(eleDiv);
		}
		else if(eleClass==TANK && bulletCategory!=eleCategory){
			BulletKill(eleDiv);
		}
		else if(eleClass==BULLET && bulletCategory!=eleCategory){
			BulletDie(baseObj.bullet);
			BulletDie(eleDiv);
		}
		else{
			baseObj.bullet.style[attr]=attrVal+speed+'px';
		}
	}
	
		
	//子弹消失
	function BulletDie(bulletDiv){
		var Tank=getTankObjByBulletID(bulletDiv.id);
		if(!Tank || !bulletDiv || !bulletDiv.parentNode) return;
		
		clearInterval(bulletDiv.bulletTimer);
		try{
			oMoveBox.removeChild(bulletDiv);
		}catch(ex){ 
			return;
		}
		bulletDiv=null;
		
		if(Tank.oTank && Tank.oTank.tankDiv.category===ENEMY){
			//子弹消失以后，所属坦克隔800ms后继续发射子弹
			setTimeout(function(){
				if(!Tank.oTank) return;
				Tank.oTank.shoot(Tank.oTank.tankDiv.category);
			},1000);
		}
		
	}
	
	//消灭对方
	function BulletKill(killObj){
		BulletDie(baseObj.bullet);
		
		var className=killObj.className;
		//如果对方是Tank
		if(className===TANK) {
			var Tank=getTankObjByTankID(killObj.id);
			if(!Tank) return;
			//消灭后新增Tank
			if(killObj.category===MYTANK){
				--Global.myTank.nowCount<0 && (Global.myTank.nowCount=0);
				Global.myTank.createMyTank();
			}
			else{
				clearInterval(Tank.oTank.tankMoveTimer);
				clearTimeout(Tank.oTank.shootTimer);
				Tank.oTank=Tank[Tank.oTank.tankID]=null;
				--Global.enemyTank.nowCount<0 && (Global.enemyTank.nowCount=0);
				Global.enemyTank.createEnemy();
			}
			oMoveBox.removeChild(killObj);
		}
		else if(className===BULLET){
			//var Tank=getTankObjByBulletID(killObj.id);
			//if(!Tank.oBullet) return;
			BulletDie(baseObj.bullet);
		}
		else{
			oBox.removeChild(killObj);
		}
		killObj=null;
		
	}
	 
	
}
