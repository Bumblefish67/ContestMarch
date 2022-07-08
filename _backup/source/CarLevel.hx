package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;
import flixel.util.FlxSpriteUtil;
import flixel.FlxSubState;
import flixel.FlxCamera;
import flixel.addons.nape.FlxNapeSpace;
import flixel.addons.nape.FlxNapeSprite;
import flixel.tile.FlxTilemap;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import nape.geom.Vec2;
import openfl.Assets;
import flixel.input.mouse.FlxMouseEventManager;
/// 43776 wide level ///zombiecar = 110x56
/**
 * ...
 * @author Thomas Williamson
 */
class CarLevel extends FlxState
{
	private var blts:FlxTypedGroup<Bullet>;
	private var blt:Bullet;
	private var coins:FlxTypedGroup<Coin>;
	private var coin:Coin;
	private var zombie:Zombie;
	private var zombies:FlxTypedGroup<Zombie>;
	private var zombie2:Zombie2;
	private var zombies2:FlxTypedGroup<Zombie2>;
	private var map:FlxTilemap;
	private var zomnum:Int = 0;
	private var zomkillnum:Int = 0;
	private var randnum:Int;
	private var player:Car;
	private var bg:FlxSprite;
	private var bg2:FlxSprite;
	private var bg3:FlxSprite;
	private var zomblood:FlxTypedGroup<Blood>;
	private var blood:Blood;
	private var killtxt:FlxText;
	private var killtxtnum:FlxText;
	private var cointxt:FlxText;
	private var mine:Mine;
	private var mines:FlxTypedGroup<Mine>;
	private var boom:Explosion;
	private var booms:FlxTypedGroup <Explosion>;
	private var moveflt:Float = 6;
	private var movebool:Bool = false;
	private var carPause:Bool = false;
	private var muteB:FlxSprite;
	private var pauseB:FlxSprite;
	private var menuB:FlxSprite;
	private var menuB2:FlxSprite;
	private var muteB2:FlxSprite;
	private var pauseB2:FlxSprite;
	private var bgPse:FlxSprite;
	override public function create():Void
	{
		super.create();
	#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		FlxNapeSpace.init();
		//FlxNapeSpace.drawDebug = true;
	    //FlxG.debugger.drawDebug = true;
		FlxNapeSpace.createWalls(0,0,43776,432);
	   FlxG.worldBounds.set(0, 0, 43776, 432);
	   Car.ended = false;
		cointxt = new FlxText(5, 10, 128);
		cointxt.size = 16;
		killtxtnum = new FlxText(FlxG.width / 2 + 60,390,320);
		killtxtnum.size = 32;
		killtxt = new FlxText(FlxG.width / 2 -60, 390, 120, "KILLS", 32);
		bg = new FlxSprite(0, 0, "assets/R1.png");
		bg2 = new FlxSprite(768, 0, "assets/R2.png");
		bg3 = new FlxSprite(1536, 0, "assets/R3.png");
		add(bg);
		add(bg2);
		add(bg3);
		map = new FlxTilemap();
	    map.loadMapFromCSV(Assets.getText("assets/mapCSV_Group1_zombies.csv"), "assets/zombiemap.png", 8, 8, 0, 1);
	    add(map);	
		player = new Car(100, 300);
		add(zomblood = new FlxTypedGroup<Blood>()); 
		add(Car.bar);
		add(booms = new FlxTypedGroup<Explosion>());
		add(player);
	    player.body.space = FlxNapeSpace.space;
		add(blts = new FlxTypedGroup<Bullet>()); 
		add(coins = new FlxTypedGroup<Coin>()); 
		zombies = new FlxTypedGroup<Zombie>();
	    zombies2 = new FlxTypedGroup<Zombie2>();
		mines = new FlxTypedGroup<Mine>();
		
		add(mines);
	    add(zombies); 
		add(zombies2);
        parseZombie();
	    parseZombie2();
	    parseMines();
	    parseMines2();
	    removeTileType(map, 2);
        removeTileType(map, 8);
		removeTileType(map, 9);
		removeTileType(map, 1);
 
		add(killtxt);
		add(killtxtnum);
		add(cointxt);
		Car.bar.scrollFactor.x = 0;
		killtxt.scrollFactor.x = 0;
		killtxtnum.scrollFactor.x = 0;
		cointxt.scrollFactor.x = 0;
		
	    muteB = new FlxSprite(FlxG.width -36, 10);
		muteB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB.animation.add("off1", [2], 1, true);
		muteB.animation.add("on1", [9], 1, true);
        muteB.animation.add("off2", [6], 1, true);
		muteB.animation.add("on2", [13], 1, true);
		add(muteB);
		muteB.scrollFactor.x = 0;
		pauseB = new FlxSprite(FlxG.width -36, 46);
		pauseB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		pauseB.animation.add("off", [5], 1, true);
		pauseB.animation.add("on", [12], 1, true);
		add(pauseB);
		pauseB.scrollFactor.x = 0;
		menuB = new FlxSprite(FlxG.width -36, 82);
		menuB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		menuB.animation.add("off", [1], 1, true);
		menuB.animation.add("on", [8], 1, true);
		add(menuB);
		menuB.scrollFactor.x = 0;
		bgPse = new FlxSprite(0, 0, "assets/pauselayer.png");
		add(bgPse); 
		bgPse.scrollFactor.x = 0;
		bgPse.kill();
		pauseB2 = new FlxSprite(FlxG.width -36, 46);
		pauseB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		pauseB2.animation.add("off", [4], 1, true);
		pauseB2.animation.add("on", [11], 1, true);
		add(pauseB2);
		pauseB2.scrollFactor.x = 0;
		pauseB2.kill();
		
		menuB2 = new FlxSprite(FlxG.width -36, 82);
		menuB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		menuB2.animation.add("off", [1], 1, true);
		menuB2.animation.add("on", [8], 1, true);
		add(menuB2);
		menuB2.scrollFactor.x = 0;
		menuB2.kill();
		muteB2 = new FlxSprite(FlxG.width -36, 10);
		muteB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB2.animation.add("off1", [2], 1, true);
		muteB2.animation.add("on1", [9], 1, true);
        muteB2.animation.add("off2", [6], 1, true);
		muteB2.animation.add("on2", [13], 1, true);
		
		FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(muteB);
	FlxMouseEventManager.setMouseDownCallback(muteB, startp4);
	FlxMouseEventManager.add(pauseB, startp5, null, scalep1, uscalep1);
	FlxMouseEventManager.add(menuB, startp6, null, scalep2, uscalep2);
	FlxMouseEventManager.add(pauseB2, startp5_2, null, scalep1_2, uscalep1_2);
	FlxMouseEventManager.add(menuB2, startp6_2, null, scalep2_2, uscalep2_2);
		
		
	if (Reg.mute == false)
	{
		muteB.animation.play("off1");
	FlxG.sound.play("assets/sounds/BG sound in loop maybe.mp3", 0.5, true);
	FlxG.sound.playMusic("assets/sounds/What You Want ver 2.mp3", 1, true);
	}
	else if (Reg.mute == true)
		{
			muteB.animation.play("off2");
		}
		}
	private function setLead() 
	{
		var cam = FlxG.camera;
		cam.followLead.x = 7;
	}
	function scalep1_2(Sprite:FlxSprite):Void
   {
	   pauseB2.animation.play("on");
   }
    function uscalep1_2(Sprite:FlxSprite):Void
   {
	   pauseB2.animation.play("off");
   }
   function scalep2_2(Sprite:FlxSprite):Void
   {
	   menuB2.animation.play("on");
   }
    function uscalep2_2(Sprite:FlxSprite):Void
   {
	   menuB2.animation.play("off");
   }
   function startp5_2(Sprite:FlxSprite):Void
	{
	  closeME();
    }
   function startp6_2(Sprite:FlxSprite):Void
	{
		FlxG.resetGame();
    }
	  public function closeME():Void
	{
        //Close it. Don't Destroy it.
		//FlxG.mouse.visible = false;
		bgPse.kill();
		muteB.revive();
		pauseB.revive();
		menuB.revive();
		//muteB2.kill();
		menuB2.kill();
		pauseB2.kill();
		carPause = false;
		if (Reg.mute == false)
		{
		FlxG.sound.resume();
		}
		
        //closeSubState();
    }
	 function scalep1(Sprite:FlxSprite):Void
   {
	   pauseB.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite):Void
   {
	   pauseB.animation.play("off");
   }
   function scalep2(Sprite:FlxSprite):Void
   {
	   menuB.animation.play("on");
   }
    function uscalep2(Sprite:FlxSprite):Void
   {
	   menuB.animation.play("off");
   }
   
    function scaleMu1(Sprite:FlxSprite)
   {
	   muteB.animation.play("on1");
   }
    function uscaleMu1(Sprite:FlxSprite):Void
   {
	   muteB.animation.play("off1");
   }
   function scaleMu2(Sprite:FlxSprite)
   {
	   muteB.animation.play("on2");
   }
    function uscaleMu2(Sprite:FlxSprite):Void
   {
	   muteB.animation.play("off2");
   }
   function startp4(Sprite:FlxSprite):Void
	{
	if (Reg.mute == false)
	{
		Reg.mute = true;
		FlxG.sound.pause();
		muteB.animation.play("on2");
	}
		else if (Reg.mute == true )
	{
		Reg.mute = false;
		FlxG.sound.play("assets/sounds/BG sound in loop maybe.mp3", 0.5, true);
	FlxG.sound.playMusic("assets/sounds/What You Want ver 2.mp3", 1, true);
	muteB.animation.play("on1");
	}
   }
   
   function startp5(Sprite:FlxSprite):Void
	{
		bgPse.revive();
		muteB.kill();
		pauseB.kill();
		menuB.kill();
		//muteB2.revive();
		menuB2.revive();
		pauseB2.revive();
		carPause = true;
	  openSubState(new Pause2());
    }
   
   function startp6(Sprite:FlxSprite):Void
	{
		FlxG.resetGame();
    }
   
	function parseMines():Void
{
   var mineTileCoords:Array<FlxPoint> =  map.getTileCoords(8, false);
   for (coord in mineTileCoords)
   {
		addMine(coord.x, coord.y);
   }
}            
    
function addMine(X:Float,Y:Float):FlxSprite
	{ 
		 mine = new Mine(X,Y); 
		return mines.add(mine); 
	} 
	function parseMines2():Void
{
   var mineTileCoords:Array<FlxPoint> =  map.getTileCoords(9, false);
   for (coord in mineTileCoords)
   {
		addMine2(coord.x, coord.y);
   }
}            
    
function addMine2(X:Float,Y:Float):FlxSprite
	{ 
		 mine = new Mine(X,Y); 
		return mines.add(mine); 
	} 
	
	function parseZombie():Void
{
   var zomTileCoords:Array<FlxPoint> =  map.getTileCoords(1, false);
   for (coord in zomTileCoords)
   {
		addzombie(coord.x, coord.y);
   }
}            
    
function addzombie(X:Float,Y:Float):FlxSprite
	{ 
		 zombie = new Zombie(X,Y); 
		return zombies.add(zombie); 
	} 
	function parseZombie2():Void
{
   var zomTileCoords2:Array<FlxPoint> =  map.getTileCoords(2, false);
   for (coord in zomTileCoords2)
   {
		addzombie2(coord.x, coord.y);
   }
}       
function addzombie2(X:Float,Y:Float):FlxSprite
	{ 
		return zombies2.add(zombie2 = new Zombie2(X,Y)); 
	} 

 function removeTileType(Tilemap:FlxTilemap, TileType:Int):Void
{
	var tiles:Array<Int> = Tilemap.getTileInstances(TileType);
	for (tileIndex in tiles)
	{
		map.setTileByIndex(tileIndex, 0);
	}
}

	override public function destroy():Void
	{
		super.destroy();
	}
	function addblood():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("one");
		return zomblood.add(blood); 
	} 
	function addblood2():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("two");
		return zomblood.add(blood); 
	} 
	function addblood3():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("three");
		return zomblood.add(blood); 
	} 
	function addblood4():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("one");
		return zomblood.add(blood); 
	} 
	function addblood5():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("five");
		return zomblood.add(blood); 
	} 
	function addblood6():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("six");
		return zomblood.add(blood); 
	} 
		function addblood7():FlxSprite
	{ 
		 blood = new Blood(); 
		 blood.animation.play("seven");
		return zomblood.add(blood); 
	} 
	function addcoin():FlxSprite
	{ 
		 coin = new Coin(); 
		return coins.add(coin); 
	} 
	function  addcoin2():FlxSprite
	{ 
		  coin = new Coin(); 
		return coins.add(coin); 
	} 
	function  addcoin3():FlxSprite
	{ 
     coin = new Coin(); 
     return coins.add(coin); 
	} 
	function  addcoin4():FlxSprite
	{ 
		  coin = new Coin(); 
		return coins.add(coin);  
	} 
	function  addcoin5():FlxSprite
	{ 
		   coin = new Coin(); 
		return coins.add(coin); 
	} 
	function  addcoin6():FlxSprite
	{ 
		   coin = new Coin(); 
		return coins.add(coin); 
	} 
		function  addcoin7():FlxSprite
	{ 
		  coin = new Coin(); 
		return coins.add(coin); 
	} 
	function hitzombie(ply:FlxObject,zom:Zombie):Void
	{
			     addblood();
			    blood.x = zom.x;
		        blood.y = zom.y;
		        addcoin();
				coin.x = zom.x + 15;
				coin.y = zom.y + 30;
			    zomkillnum++;
				zombies.remove(zom);
        	}
	function hitzombie2(ply:FlxObject,zom2:Zombie2):Void
	{
			    addblood2();
			    blood.x = zom2.x;
		        blood.y = zom2.y;
		        addcoin();
				coin.x = zom2.x + 15;
				coin.y = zom2.y + 30;
			    zomkillnum++;
				zombies2.remove(zom2);
	}
	function hitcoin()
	{
		for (coin in coins)
		{
		if (FlxG.overlap(coin, player))
		 { 
			Reg.coincount++;
		    coins.remove(coin);
		 }
		}
	}
		function bulhitzombie(b:Bullet,zom:Zombie):Void
	{
			    addblood();
		       blood.x = zom.x;
		       blood.y = zom.y;
		        addcoin();
				coin.x = zom.x + 15;
				coin.y = zom.y + 30;
			    zomkillnum++;
				blts.remove(b);
				zombies.remove(zom);
				
			}
	function bulhitzombie2(b:Bullet,zom:Zombie2):Void
	{
			    addblood2();
		        blood.x = zom.x;
		        blood.y = zom.y;
				addcoin2();
				coin.x = zom.x + 15;
				coin.y = zom.y + 30;
		        zomkillnum++;
				blts.remove(b);
				zombies2.remove(zom);
				zomnum--;
	}
		function addbulR():FlxSprite 
		{ 
		 blt = new Bullet(player.x + 35, player.y + 28); 
		 blt.velocity.x = 800;
		return blts.add(blt); 
	} 
	
	function hitMine(ply:Car,mn:Mine):Void
	{
	ply.health -= 2;
	addboom(mn.x - 16, mn.y - 16);
	mines.remove(mn);
	}
	function addboom(X,Y)
		{
			boom = new Explosion(X ,Y);
			boom.animation.play("downL", false);
			return booms.add(boom);
			if (Reg.mute == false)
			{
			FlxG.sound.play("assets/sounds/grenade.wav", 1, false);
		}
		}
		
		
		 function start2():Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 3, false, start2e);
   }
   	function start2e():Void
	{
	FlxG.switchState(new Playstate6());
   }
		
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.mute == false)
		{
			FlxMouseEventManager.setMouseOverCallback(muteB, scaleMu1);
			FlxMouseEventManager.setMouseOutCallback(muteB, uscaleMu1);
		}
		else if (Reg.mute == true)
		{
			FlxMouseEventManager.setMouseOverCallback(muteB, scaleMu2);
			FlxMouseEventManager.setMouseOutCallback(muteB, uscaleMu2);
		}
	FlxG.camera.setSize(768, 432);
		FlxG.camera.follow(player, FlxCameraFollowStyle.TOPDOWN_TIGHT, 1);
			setLead();
		FlxG.camera.setScrollBoundsRect(0,0,43776,432,true);
		moveflt -= FlxG.elapsed;
		
		if(moveflt <= 0)
		{
				if(movebool == false)
			{
				movebool = true;
			}
			else if(movebool == true)
			{
				movebool = false;
			}
			moveflt = 6;
		}
		/////38
		if (player.x < 1532)
		{
		bg.x = 0;
		}
		else if (player.x >= 1532 && player.x < 3840)
		{
		bg.x = 2304;
		}
		else if (player.x >= 3840 &&  player.x < 6144)
		{
		bg.x = 4608;
		}
			else if (player.x >= 6144 &&  player.x <  8448)
		{
		bg.x = 6912;
		}
		else if (player.x >= 8448  &&  player.x <  10752)
		{
		bg.x = 9216;
		}
		else if (player.x >= 10752 &&  player.x <  13056)
		{
		bg.x = 11520;
		}
		else  if (player.x >= 13056 &&  player.x <  15360)
		{
		bg.x = 13824;
		}
		else if (player.x >= 15360 &&  player.x <  17664)
		{
		bg.x = 16128;
		}
		else if (player.x >= 17664  &&  player.x < 19968 )
		{
		bg.x = 18432;
		}
		else if (player.x >= 19968 &&  player.x < 22272 )
		{
		bg.x = 20736;
		}
		else if (player.x >= 22272 &&  player.x < 24576 )
		{
		bg.x = 23040;
		}
		else if (player.x >= 24576 &&  player.x <  26880)
		{
		bg.x = 25344;
		}
		else if (player.x >= 26880 &&  player.x < 29184 )
		{
		bg.x = 27648;
		}
		else if (player.x >= 29184 &&  player.x < 31488 )
		{
		bg.x = 29952;
		}
		else	if (player.x >= 31488 &&  player.x < 33792 )
		{
		bg.x = 32256;
		}
		else if (player.x >= 33792 &&  player.x <  36096)
		{
		bg.x = 34560;
		}
		else if (player.x >= 36096 &&  player.x < 38400 )
		{
		bg.x = 36864;
		}
		else if (player.x >= 38400 &&  player.x < 40704 )
		{
		bg.x = 39168;
		}
		else if (player.x >= 40704)
		{
		bg.x = 41472;
		}
		if (player.x <  2304)
		{
		bg2.x = 768;
		}
		else if (player.x >= 2304 && player.x < 4608)
		{
		bg2.x = 3072;
		}
		else if (player.x >= 4608 &&  player.x < 6912)
		{
		bg2.x = 5376;
		}
		else if (player.x >= 6912 &&  player.x < 9216 )
		{
		bg2.x = 7680;
		}
		else if (player.x >= 9216 &&  player.x <  11520)
		{
		bg2.x = 9984;
		}
		else  if (player.x >= 11520 &&  player.x <  13824)
		{
		bg2.x = 12288;
		}
		else  if (player.x >= 13824 &&  player.x <  16128)
		{
		bg2.x = 14592;
		}
		 else if (player.x >= 16128 &&  player.x <  18432)
		{
		bg2.x = 16896;
		}
		else  if (player.x >= 18432 &&  player.x <  20736 )
		{
		bg2.x = 19200;
		}
		else if (player.x >= 20736 &&  player.x < 23040 )
		{
		bg2.x = 21504;
		}
		else if (player.x >= 23040 &&  player.x < 25344 )
		{
		bg2.x = 23808;
		}
		else if (player.x >= 25344 &&  player.x < 27648 )
		{
		bg2.x = 26112;
		}
		else if (player.x >= 27648 &&  player.x <  29952)
		{
		bg2.x = 28416;
		}
		else if (player.x >= 29952 &&  player.x < 32256 )
		{
		bg2.x = 30720;
		}
	else if (player.x >= 32256 &&  player.x < 34560 )
		{
		bg2.x = 33024;
		}
		else if (player.x >= 34560 &&  player.x < 36864 )
		{
		bg2.x = 35328;
		}
		else if (player.x >= 36864 &&  player.x < 39168 )
		{
		bg2.x = 37632;
		}
		else if (player.x >= 39168 &&  player.x <  41472)
		{
		bg2.x = 39936;
		}
		else if (player.x >= 41472)
		{
		bg2.x = 42240;
		}
		if (player.x < 3072)
		{
		bg3.x = 1536;
		}
		else if (player.x >= 3072   && player.x < 5376)
		{
		bg3.x = 3840;
		}
		else if (player.x >= 5376 &&  player.x < 7680  )
		{
		bg3.x = 6144;
		}
		else if (player.x >= 7680 &&  player.x <  9984)
		{
		bg3.x = 8448;
		}
		else if (player.x >= 9984 &&  player.x <  12288)
		{
		bg3.x = 10752;
		}
		else if (player.x >= 12288 &&  player.x <  14592)
		{
		bg3.x = 13056;
		}
		else if (player.x >= 14592 &&  player.x < 16896 )
		{
		bg3.x = 15360;
		}
		else if (player.x >= 16896 &&  player.x <  19200)
		{
		bg3.x = 17664;
		}
		else if (player.x >= 19200 &&  player.x < 21504 )
		{
		bg3.x = 19968;
		}
		else if (player.x >= 21504 &&  player.x < 23808 )
		{
		bg3.x = 22272;
		}
		else if (player.x >= 23808 &&  player.x <  26112)
		{
		bg3.x = 24576;
		}
		else if (player.x >= 26112 &&  player.x < 28416 )
		{
		bg3.x = 26880;
		}
		else if (player.x >= 28416 &&  player.x <  30720)
		{
		bg3.x = 29184;
		}
		else if (player.x >= 30720 &&  player.x < 33024 )
		{
		bg3.x = 31488;
		}
		else if (player.x >= 33024 &&  player.x < 35328 )
		{
		bg3.x = 33792;
		}
		else if (player.x >= 35328 &&  player.x < 37632 )
		{
		bg3.x = 36096;
		}
		else if (player.x >= 37632 &&  player.x < 39936 )
		{
		bg3.x = 38400;
		}
		else if (player.x >= 39936 &&  player.x < 42240 )
		{
		bg3.x = 40704;
		}
		else if (player.x >= 42240)
		{
		bg3.x = 43008;
		}
		if (player.x > 43008)
		{
			Car.ended = true;
			start2();
		}
		
		FlxG.overlap(blts, zombies, bulhitzombie);
		FlxG.overlap(player, zombies2, hitzombie2);
		FlxG.overlap(blts, zombies, bulhitzombie2);
		FlxG.overlap(player, zombies, hitzombie);
		FlxG.overlap(player, mines, hitMine);
		
		
		if (carPause == true) 
		{
		player.physicsEnabled = false;
		}
		else if (carPause == false ) 
		{
		player.physicsEnabled = true;
		}
		cointxt.text = "$ " + Std.string(Reg.coincount);
		/// killtxtnum.text = Std.string(zomkillnum) + "/200";
	/**
		 if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.sound.play("assets/sounds/gun.wav",0.3);
				addbulR();
		}
		for (blt in blts)
		{
			if (blt.isOnScreen() == false)
			{
				blts.remove(blt);
			}
			if (blt.velocity.x != 800 && blt.velocity.x != -800)
			{
				blts.remove(blt);
			}
		}
	**/
		for (zombie in zombies)
		{
			if (movebool == false)
			{
				zombie.flipX = false;
				zombie.velocity.x = 20;
			}
			else if (movebool == true)
			{
				zombie.flipX = true;
				zombie.velocity.x = -20;				
			}
		}
		for (zombie2 in zombies2)
		{
			if (movebool == true)
			{
			    zombie2.flipX = false;
				zombie2.velocity.x = 20;
			}
			else if (movebool == false)
			{
				zombie2.flipX = true;
				zombie2.velocity.x = -20;				
			}
		}
		for (boom in booms)
		{
		if (boom.animation.finished)
		{
		booms.remove(boom);
		}
		}
		if (player.health <= 0)
		{
			FlxG.switchState(new Gameover());
		}
	hitcoin();	
	}	
}