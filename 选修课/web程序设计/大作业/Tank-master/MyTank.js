/*
MyTank.js
*/

var MyTank=function(){
	
}

MyTank.prototype=new WeaponsFactory();

MyTank.prototype.createMyTank=function(baseObj){
	var myBaseObj=baseObj || {
		dir: 1,
		top: 24*BASE,
		category: MYTANK
	}
	this.createTank(myBaseObj);
}