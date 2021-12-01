//关卡页面10波强度最大为15
oS.Init({
		//场景对象数据
		PName:[oPeashooter,oSunFlower,oCherryBomb,oWallNut,oPotatoMine,oSnowPea,oChomper,oRepeater,oPuffShroom],
		ZName:[oZombie,oNewspaperZombie],
		PicArr:function(){
			var Pro=oSunShroom.prototype,PicArr=Pro.PicArr;
			return ['images/interface/background2.jpg','images/interface/Tombstones.png','images/interface/Tombstone_mounds.png',
				PicArr[Pro.CardGif],PicArr[Pro.NormalGif]]
		}(),
		backgroundImage:'images/interface/background2.jpg',
		CanSelectCard:1,
		DKind:0,
		SunNum:50,
		LevelName:'关卡 2-1',
		LargeWaveFlag:{10:$('imgFlag1')},
		Monitor:{f:AppearTombstones,ar:[7,9,4]}, //初始化时在7到9列随机生成4个墓碑
		UserDefinedFlagFunc:function($T){ //最后一波时从坟墓出来僵尸
			oP.FlagNum==oP.FlagZombies&&oP.SetTimeoutTomZombie([oZombie])
		},
		LoadMusic:function(){NewEle('oEmbed','embed','width:0;height:0',{src:'music/Look up at the.swf'},EDAll)},
		StartGameMusic:'Ultimate battle.swf'
	},{	
		//传递给流程控制对象数据
		ArZ:[oZombie,oZombie,oZombie,oZombie,oZombie,oZombie,oZombie,oNewspaperZombie,oNewspaperZombie],
		FlagNum:10, //僵尸波数
		SumToZombie:{1:7,2:9,'default':9}, //在oP流程控制对象里使用，a1表示僵尸强度，a2表示跟强度对应的ArZ的索引，a2应该比a1多一个元素，多出来的就是default
		FlagToSumNum:{a1:[3,5,9],a2:[1,2,3,15]}, //代表第1-3波强度是1，4-5是2，6-9是3，其余是10
		FlagToMonitor:{10:[ShowFinalWave,0]},
		FlagToEnd:function(){
			NewImg('imgSF','images/Card/Plants/SunShroom.png','left:667px;top:220px',EDAll,{onclick:function(){SelectModal(12)}});
			NewImg('PointerUD','images/interface/PointerDown.gif','top:185px;left:676px',EDAll);
		}
});
