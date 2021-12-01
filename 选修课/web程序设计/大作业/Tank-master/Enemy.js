/*
Enemy.js
*/

var Enemy=function(){
	
}

Enemy.prototype=new WeaponsFactory(4);

Enemy.prototype.createEnemy=function(baseObj){
	
	var enemyBaseObj=baseObj || {
		dir: 2,
		top: 0,
		category: ENEMY
	}
	
	this.createTank(enemyBaseObj);
	
}