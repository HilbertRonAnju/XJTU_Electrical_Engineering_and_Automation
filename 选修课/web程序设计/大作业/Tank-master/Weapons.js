/*
*武器工厂类WeaponsFactory 子类包括坦克类、子弹类
*/

var WeaponsFactory=function(count){
	this.count=count||1;
	this.nowCount=0;	//当前存在的数量
	this.totalCount=0;	//总数量
	this.oTank=null;
}

//生成坦克
WeaponsFactory.prototype.createTank=function(BaseObj){
	if(this.nowCount>=this.count) return;
	
	var basePos=null;
	var left=0;
	if(BaseObj.category===ENEMY){
		switch(getRandom(1,3)){
			case 1:basePos={x:0, y:-32};
				break;
			case 2:basePos={x:-128, y:-32};
				break;
			case 3:basePos={x:0, y:-64};
				break;	
		}
		left=(this.totalCount%4)*8*BASE;
	}else{
		basePos={x:0, y:0};
		left=1*8*BASE;
	}
	this.nowCount++;
	this.totalCount++;
	
	var tank=new Tank();
	tank.basePos=basePos;
	
	tank.tankDiv=createDiv("copyTank",left,BaseObj.top,this.totalCount);
	tank.tankDiv.category=BaseObj.category;
	oMoveBox.appendChild(tank.tankDiv);
	this.oTank=tank;
	var oThis=this;
	
	tank.tankTimer=setInterval(function(){
		tank.tankDiv.style.backgroundPosition=-256+(tank.index++)*(-32)+"px -32px";//坦克生成效果
		//效果完成后，显示真正坦克
		if(tank.index!=7) return;
		clearInterval(tank.tankTimer);
		tank.setDir(BaseObj.dir);	//设置坦克方向的图片背景
		tank.tankDiv.className=TANK;
		TankObj[tank.tankDiv.id]={ oTank:tank, tankID:tank.tankDiv.id};	
		
		//如果是敌机，则加定时任务
		if(BaseObj.category===ENEMY){
			//一秒后发射子弹
			tank.shootTimer=setTimeout(function(){
				if(tank) {tank.shoot(ENEMY);}
				
			},1000);
				
			tank.tankMoveTimer=setInterval(function(){ 
				if(!tank) { clearInterval(tank.tankMoveTimer); return;}
				tank.move();
			},30);//定时移动
			
			if(oThis.nowCount<=oThis.count){
				oThis.createTank(BaseObj);
			}
		}
		
	},200)
}
