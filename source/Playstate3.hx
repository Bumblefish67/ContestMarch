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
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class Playstate3 extends FlxState
{
	private var blts:FlxTypedGroup<Bullet>;
	private var blt:Bullet;
	private var coins:FlxTypedGroup<Coin>;
	private var coin:Coin;
	private var zombies:FlxTypedGroup<Zombie>;
	private var zombie:Zombie;
	private var zombies2:FlxTypedGroup<Zombie2>;
	private var zombie2:Zombie2;
    private var zombies3:FlxTypedGroup<Zombie3>;
	private var zombie3:Zombie3;
	private var zombies4:FlxTypedGroup<Zombie4>;
	private var zombie4:Zombie4;
    private var zombies5:FlxTypedGroup<Zombie5>;
	private var zombie5:Zombie5;
	private var zombies6:FlxTypedGroup<Zombie6>;
	private var zombie6:Zombie6;
	private var zombies7:FlxTypedGroup<Zombie7>;
	private var zombie7:Zombie7;
	private var zomnum:Int = 0;
	private var zomkillnum:Int = 0;
	private var randnum:Int;
	private var player:Player;
	private var bg:FlxSprite;
	private var zomblood:FlxTypedGroup<Blood>;
	private var blood:Blood;
	private var killtxt:FlxText;
	private var killtxtnum:FlxText;
	private var guntmr:Float = 0.25;
	private var cointxt:FlxText;
	private var blttimer:Float = 0.25;
	private var blttimer2:Float = 0.10;
	private var grtxt:FlxText;
	private var grenade:Grenade;
	private var grenades:FlxTypedGroup<Grenade>;
	private var grimg:FlxSprite;
	private var boom:Explosion2;
	private var booms:FlxTypedGroup<Explosion2>;
	private var Picon:FlxSprite;
	private var Sgicon:FlxSprite;
	private var Mgicon:FlxSprite;
	private var hlth:Hlth;
	private var htlths:FlxTypedGroup<Hlth>;
	private var hNum:Int = 50;
	private var hbool:Bool = false;
	private var muteB:FlxSprite;
	private var pauseB:FlxSprite;
	private var menuB:FlxSprite;
	private var menuB2:FlxSprite;
	private var muteB2:FlxSprite;
	private var pauseB2:FlxSprite;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		Picon = new FlxSprite(8, 30, "assets/Upgrades500024.png");
		Sgicon = new FlxSprite(8, 30, "assets/Upgrades500020.png");
		Mgicon = new FlxSprite(8, 30, "assets/Upgrades500021.png");
		grtxt = new FlxText(10, 150, 0, "", 24);
		
		cointxt = new FlxText(5, 10, 128);
		cointxt.size = 16;
		killtxtnum = new FlxText(FlxG.width / 2 + 60,390,320);
		killtxtnum.size = 32;
		killtxt = new FlxText(FlxG.width / 2 -60, 390, 120, "KILLS", 32);
		bg = new FlxSprite(0, 0, "assets/Background2.png");
		add(bg);
		FlxG.worldBounds.setSize(768, 432);
		player = new Player(100, 300);
		add(zomblood = new FlxTypedGroup<Blood>()); 
		add(Player.bar);
		add(player);
		add(blts = new FlxTypedGroup<Bullet>()); 
		add(coins = new FlxTypedGroup<Coin>());
		add(htlths = new FlxTypedGroup<Hlth>());
		add(zombies = new FlxTypedGroup<Zombie>()); 
		add(zombies2 = new FlxTypedGroup<Zombie2>()); 
		add(zombies3 = new FlxTypedGroup<Zombie3>()); 
		add(zombies4 = new FlxTypedGroup<Zombie4>()); 
		add(zombies5 = new FlxTypedGroup<Zombie5>()); 
		add(zombies6 = new FlxTypedGroup<Zombie6>()); 
		add(zombies7 = new FlxTypedGroup<Zombie7>()); 
		add(grenades = new FlxTypedGroup<Grenade>()); 
		add(booms = new FlxTypedGroup<Explosion2>());
	add(killtxt);
	add(killtxtnum);
	add(cointxt);
	add(grtxt);
	add(Sgicon);
		add(Mgicon);
        add(Picon);
		 Sgicon.kill();
		Mgicon.kill();
		Picon.kill();
		muteB = new FlxSprite(FlxG.width -36, 10);
		muteB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB.animation.add("off1", [2], 1, true);
		muteB.animation.add("on1", [9], 1, true);
        muteB.animation.add("off2", [6], 1, true);
		muteB.animation.add("on2", [13], 1, true);
		add(muteB);
		
		pauseB = new FlxSprite(FlxG.width -36, 46);
		pauseB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		pauseB.animation.add("off", [5], 1, true);
		pauseB.animation.add("on", [12], 1, true);
		add(pauseB);
		
		menuB = new FlxSprite(FlxG.width -36, 82);
		menuB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		menuB.animation.add("off", [1], 1, true);
		menuB.animation.add("on", [8], 1, true);
		add(menuB);
		pauseB2 = new FlxSprite(FlxG.width -36, 46);
		pauseB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		pauseB2.animation.add("off", [4], 1, true);
		pauseB2.animation.add("on", [11], 1, true);
		add(pauseB2);
		pauseB2.kill();
		menuB2 = new FlxSprite(FlxG.width -36, 82);
		menuB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		menuB2.animation.add("off", [1], 1, true);
		menuB2.animation.add("on", [8], 1, true);
		add(menuB2);
		menuB2.kill();
		muteB2 = new FlxSprite(FlxG.width -36, 10);
		muteB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB2.animation.add("off1", [2], 1, true);
		muteB2.animation.add("on1", [9], 1, true);
        muteB2.animation.add("off2", [6], 1, true);
		muteB2.animation.add("on2", [13], 1, true);
		
	grimg = new FlxSprite(8, 98, "assets/Upgrades500023.png");
	add(grimg);
	
	FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(muteB);
	FlxMouseEventManager.setMouseDownCallback(muteB, startp4);
	FlxMouseEventManager.add(pauseB, startp5, null, scalep1, uscalep1);
	FlxMouseEventManager.add(menuB, startp6, null, scalep2, uscalep2);
	//FlxMouseEventManager.add(pauseB2, startp5_2, null, scalep1_2, uscalep1_2);
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
		menuB.animation.play("off");
	   pauseB.animation.play("off");
	#if android
		add(Player.analog);
		add(Player.virtualPad);
		#end
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
   
   function startp6_2(Sprite:FlxSprite):Void
	{
		FlxG.resetGame();
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
		
	  openSubState(new Pause());
    }
   
   function startp6(Sprite:FlxSprite):Void
	{
		FlxG.resetGame();
    }
   
	override public function destroy():Void
	{
		super.destroy();
	}
	function addHealth()
	{
		hlth = new Hlth(FlxG.random.int(60,700), FlxG.random.int(80,350), "assets/Upgrades500019.png");
	return htlths.add(hlth);
	}
	function getHealth():Void
	{
		for (hlth in htlths)
		{
			if (FlxG.overlap(player, hlth))
			{	
	           player.health +=10;
			   htlths.remove(hlth);
			}	
		}
	}
	
	function addGrenadeR():FlxSprite
	{ 
		grenade = new Grenade(player.x, player.y);
		grenade.animation.play("blow");
		return grenades.add(grenade); 
	} 
	function addboom(X,Y)
		{
			boom = new Explosion2(X ,Y);
			boom.animation.play("downL", false);
			return booms.add(boom);
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
	function hitzombie():Void
	{
		for (blt in blts)
		{
			for (zombie in zombies)
			{
		if (FlxG.collide(blt, zombie))
		{
			//addblood();
		//	blood.x = zombie.x;
		//blood.y = zombie.y;
		hNum --;
		        addcoin();
				coin.x = zombie.x + 15;
				coin.y = zombie.y + 30;
			    zomkillnum++;
				blts.remove(blt);
				zombies.remove(zombie);
				zomnum--;
			}
		}
	}
	}
	function hitzombie2():Void
	{
		for (blt in blts)
		{
			for (zombie2 in zombies2)
			{
		if (FlxG.collide(blts, zombie2))
		{
		    hNum --;
			    addblood2();
		        blood.x = zombie2.x;
		        blood.y = zombie2.y;
				addcoin2();
				coin.x = zombie2.x + 15;
				coin.y = zombie2.y + 30;
		        zomkillnum++;
				blts.remove(blt);
				zombies2.remove(zombie2);
				zomnum--;
			}
		}
	}
	}
	function hitzombie3():Void
	{
		for (blt in blts)
		{
			for (zombie3 in zombies3)
			{
		if (FlxG.collide(blts, zombie3))
		{
			  hNum --;
			    addblood3();
			    blood.x = zombie3.x;
		        blood.y = zombie3.y;  
				addcoin3();
				coin.x = zombie3.x + 15;
				coin.y = zombie3.y + 30;
				zomkillnum++;
				blts.remove(blt);
				zombies3.remove(zombie3);
				zomnum--;
			}
		}
	}
	}
	function hitzombie4():Void
	{
		for (blt in blts)
		{
			for (zombie4 in zombies4)
			{
		if (FlxG.collide(blts, zombie4))
		{
		//	addblood4();
		//	blood.x = zombie4.x;
	//	blood.y = zombie4.y;
	hNum --;
	            addcoin4();
				coin.x = zombie4.x + 15;
				coin.y = zombie4.y + 30;
		   		zomkillnum++;
				blts.remove(blt);
				zombies4.remove(zombie4);
				zomnum--;
			}
		}
	}
	}
	function hitzombie5():Void
	{
		for (blt in blts)
		{
			for (zombie5 in zombies5)
			{
		if (FlxG.collide(blts, zombie5))
		{
			    hNum --;
			     addblood5();
			     blood.x = zombie5.x;
		         blood.y = zombie5.y; 
				 addcoin5();
				 coin.x = zombie5.x + 15;
				coin.y = zombie5.y + 30;
				 zomkillnum++;
				blts.remove(blt);
				zombies5.remove(zombie5);
				zomnum--;
			}
		}
	}
	}
	function hitzombie6():Void
	{
			for (blt in blts)
		{
			for (zombie6 in zombies6)
			{
		if (FlxG.collide(blts, zombie6))
		{
			   hNum --;
			   addblood6();	
			   blood.x = zombie6.x;
	        	blood.y = zombie6.y;
				addcoin6();
				coin.x = zombie6.x + 15;
				coin.y = zombie6.y + 30;
		        zomkillnum++;
				blts.remove(blt);
				zombies6.remove(zombie6);
				zomnum--;
			}
		}
	}
	}
	function hitzombie7():Void
	{
			for (blt in blts)
		{
			for (zombie7 in zombies7)
			{
		if (FlxG.collide(blts, zombie7))
		{
		//	addblood7();
		//	blood.x = zombie7.x;
		 //  blood.y = zombie7.y;
		 hNum --;
		        addcoin7();
				coin.x = zombie7.x + 15;
				coin.y = zombie7.y + 30;
		        zomkillnum++;
				blts.remove(blt);
				zombies7.remove(zombie7);
				zomnum--;
			}
		}
	}
	}
	
		function bhitzombie():Void
	{
		for (boom in booms)
		{
			for (zombie in zombies)
			{
		if (FlxG.overlap(boom, zombie))
		{
			//addblood();
		//	blood.x = zombie.x;
		//blood.y = zombie.y;
		hNum --;
		        addcoin();
				coin.x = zombie.x + 15;
				coin.y = zombie.y + 30;
			    zomkillnum++;
				zombies.remove(zombie);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie2():Void
	{
		for (boom in booms)
		{
			for (zombie2 in zombies2)
			{
		if (FlxG.overlap(boom, zombie2))
		{
		    hNum --;
			    addblood2();
		        blood.x = zombie2.x;
		        blood.y = zombie2.y;
				addcoin2();
				coin.x = zombie2.x + 15;
				coin.y = zombie2.y + 30;
		        zomkillnum++;
				zombies2.remove(zombie2);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie3():Void
	{
		for (boom in booms)
		{
			for (zombie3 in zombies3)
			{
		if (FlxG.overlap(boom, zombie3))
		{
			  hNum --;
			    addblood3();
			    blood.x = zombie3.x;
		        blood.y = zombie3.y;  
				addcoin3();
				coin.x = zombie3.x + 15;
				coin.y = zombie3.y + 30;
				zomkillnum++;
				zombies3.remove(zombie3);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie4():Void
	{
		for (boom in booms)
		{
			for (zombie4 in zombies4)
			{
		if (FlxG.overlap(boom, zombie4))
		{
		//	addblood4();
		//	blood.x = zombie4.x;
	//	blood.y = zombie4.y;
	hNum --;
	            addcoin4();
				coin.x = zombie4.x + 15;
				coin.y = zombie4.y + 30;
		   		zomkillnum++;
				zombies4.remove(zombie4);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie5():Void
	{
		for (boom in booms)
		{
			for (zombie5 in zombies5)
			{
		if (FlxG.overlap(boom, zombie5))
		{
			    hNum --;
			     addblood5();
			     blood.x = zombie5.x;
		         blood.y = zombie5.y; 
				 addcoin5();
				 coin.x = zombie5.x + 15;
				coin.y = zombie5.y + 30;
				 zomkillnum++;
				zombies5.remove(zombie5);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie6():Void
	{
			for (boom in booms)
		{
			for (zombie6 in zombies6)
			{
		if (FlxG.overlap(boom, zombie6))
		{
			   hNum --;
			   addblood6();	
			   blood.x = zombie6.x;
	        	blood.y = zombie6.y;
				addcoin6();
				coin.x = zombie6.x + 15;
				coin.y = zombie6.y + 30;
		        zomkillnum++;
				zombies6.remove(zombie6);
				zomnum--;
			}
		}
	}
	}
	function bhitzombie7():Void
	{
			for (boom in booms)
		{
			for (zombie7 in zombies7)
			{
		if (FlxG.overlap(boom, zombie7))
		{
		//	addblood7();
		//	blood.x = zombie7.x;
		 //  blood.y = zombie7.y;
		 hNum --;
		        addcoin7();
				coin.x = zombie7.x + 15;
				coin.y = zombie7.y + 30;
		        zomkillnum++;
				zombies7.remove(zombie7);
				zomnum--;
			}
		}
	}
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
	function addzombie():FlxSprite
	{ 
		 zombie = new Zombie(FlxG.random.int(-40,-740), FlxG.random.int(55,432)); 
		return zombies.add(zombie); 
	} 
	function addzombie2():FlxSprite
	{ 
		 zombie2 = new Zombie2(FlxG.random.int(-40,-740) , FlxG.random.int(55,432)); 
		return zombies2.add(zombie2); 
	} 
	function addzombie3():FlxSprite
	{ 
		 zombie3 = new Zombie3(FlxG.random.int(-40,-740)  , FlxG.random.int(55,432)); 
		return zombies3.add(zombie3); 
	} 
	function addzombie4():FlxSprite
	{ 
		 zombie4 = new Zombie4(FlxG.random.int(768,1340)  , FlxG.random.int(55,432)); 
		return zombies4.add(zombie4); 
	} 
	function addzombie5():FlxSprite
	{ 
		 zombie5 = new Zombie5(FlxG.random.int(768,1340)   , FlxG.random.int(55,432)); 
		return zombies5.add(zombie5); 
	} 
	function addzombie6():FlxSprite
	{ 
		 zombie6 = new Zombie6(FlxG.random.int(768,1340)   , FlxG.random.int(55,432)); 
		return zombies6.add(zombie6); 
	} 
	function addzombie7():FlxSprite
	{ 
		 zombie7 = new Zombie7(FlxG.random.int(768,1340)   , FlxG.random.int(55,432)); 
		return zombies7.add(zombie7); 
	} 
	function addzombie8():FlxSprite
	{ 
		 zombie7 = new Zombie7(FlxG.random.int(-40,-740) , FlxG.random.int(55,432)); 
		return zombies7.add(zombie7); 
	} 
	function addzombie9():FlxSprite
	{ 
		 zombie = new Zombie( FlxG.random.int(5,760) ,-40); 
		return zombies.add(zombie); 
	} 
	function addzombie10():FlxSprite
	{ 
		 zombie2 = new Zombie2( FlxG.random.int(5,760) ,-40); 
		return zombies2.add(zombie2); 
	} 
	function addzombie11():FlxSprite
	{ 
		 zombie3 = new Zombie3( FlxG.random.int(5,760) ,-40); 
		return zombies3.add(zombie3); 
	} 
	function addzombie12():FlxSprite
	{ 
		 zombie4 = new Zombie4( FlxG.random.int(5,760) ,430); 
		return zombies4.add(zombie4); 
	} 
	function addzombie13():FlxSprite
	{ 
		 zombie5 = new Zombie5( FlxG.random.int(5,760) ,430); 
		return zombies5.add(zombie5); 
	} 
	function addzombie14():FlxSprite
	{ 
		 zombie6 = new Zombie6( FlxG.random.int(5,760) ,430); 
		return zombies6.add(zombie6); 
	} 
	function addzombie15():FlxSprite
	{ 
		 zombie7 = new Zombie7( FlxG.random.int(5,760) ,430); 
		return zombies7.add(zombie7); 
	} 
	function addzombie16():FlxSprite
	{ 
		 zombie7 = new Zombie7( FlxG.random.int(5,760) ,-40); 
		return zombies7.add(zombie7); 
	} 
function addbulL():FlxSprite 
		{ 
		 blt = new Bullet(player.x  , player.y + 28); 
		 	blt.velocity.x = -800;
		return blts.add(blt); 
		} 
		function addbulL2():FlxSprite 
		{ 
		 blt = new Bullet(player.x  , player.y + 28); 
		 	blt.velocity.x = -800;
			blt.velocity.y = -200;
		return blts.add(blt); 
		} 
		function addbulL3():FlxSprite 
		{ 
		 blt = new Bullet(player.x  , player.y + 28); 
		 	blt.velocity.x = -800;
			blt.velocity.y= 200;
		return blts.add(blt); 
		} 
		function addbulR():FlxSprite 
		{ 
		 blt = new Bullet(player.x + 35, player.y + 28); 
		 blt.velocity.x = 800;
		return blts.add(blt); 
		} 
		function addbulR2():FlxSprite 
		{ 
		 blt = new Bullet(player.x + 35, player.y + 28); 
		 blt.velocity.x = 800;
		 blt.velocity.y = 200;
		return blts.add(blt); 
		} 
		function addbulR3():FlxSprite 
		{ 
		 blt = new Bullet(player.x + 35, player.y + 28); 
		 blt.velocity.x = 800;
		 blt.velocity.y = -200;
		return blts.add(blt); 
		} 
			private function shoot():Void
		{
			if ( Reg.gunNum == 1)
			{
			blttimer -= FlxG.elapsed;
			if (blttimer <= 0)
			{
			blttimer = 0.25;
			if (Reg.mute == false)
			{
			FlxG.sound.play("assets/sounds/gun.wav", 0.3);
			}
			if (player.flipX == false)
			{
				addbulR();
			}
		else if (player.flipX == true)
			  {
				addbulL();
			   }
		    }
		  }
		  else if(Reg.gunNum == 2)
		  {
			   guntmr -= FlxG.elapsed;
			   if (guntmr <= 0)
		{
			guntmr = 0.25;
			if (Reg.mute == false)
			{
			FlxG.sound.play("assets/sounds/shotgun.wav");
			}
			if (player.flipX == false)
			{
				addbulR();
				addbulR2();
				addbulR3();
			}
		else if (player.flipX == true)
			{
				addbulL();
				addbulL2();
				addbulL3();
			}
		  }
		}
		else if ( Reg.gunNum == 3)
			{
			blttimer2 -= FlxG.elapsed;
			if (blttimer2 <= 0)
			{
			blttimer2 = 0.10;
			if (Reg.mute == false)
			{
			FlxG.sound.play("assets/sounds/gun.wav", 0.3);
			}
			if (player.flipX == false)
			{
				addbulR();
			}
		else if (player.flipX == true)
			  {
				addbulL();
			   }
		    }
		  }
	}
	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		#if (web || desktop)
		if (player.gp != null)
		{
			if (player.gp.justReleased.START)
			{
				startp5(null);
			}
			
		}
		#end
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
		getHealth();
		if (hNum <= 0)
		{
		hbool = true;
		}
		if(hbool == true)
		{
		addHealth();
		hNum = 50;
		hbool = false;
		}
		
		if(Reg.gunNum ==1)
		{
			Picon.revive();
		    Sgicon.kill();
		    Mgicon.kill();
		}
		else if(Reg.gunNum ==2)
		{
			Sgicon.revive();
		    Picon.kill();
		    Mgicon.kill();
		}
		else if(Reg.gunNum ==3)
		{
			Mgicon.revive();
		    Picon.kill();
		    Sgicon.kill();
		}
		if (FlxG.keys.justPressed.Z && Reg.grCount > 0 || FlxG.keys.justPressed.M && Reg.grCount > 0)
		{
			Reg.grCount -= 1;
				addGrenadeR();
		}
		for (grenade in grenades)
		{
		if(grenade.animation.finished)
			{
				if (Reg.mute == false)
			{
				FlxG.sound.play("assets/sounds/grenade.wav", 1, false);
			}
				addboom(grenade.x - 44, grenade.y - 44);
				grenades.remove(grenade);
			}
		}
		for (boom in booms)
		{
		if (boom.animation.finished)
		{
		booms.remove(boom);
		}
		
		}
		grtxt.text =  Std.string(Reg.grCount);
		
		FlxG.collide(zombies, zombies);
		FlxG.collide(zombies2, zombies2);
		FlxG.collide(zombies3, zombies3);
		FlxG.collide(zombies4, zombies4);
		FlxG.collide(zombies5, zombies5);
		FlxG.collide(zombies6, zombies6);
		FlxG.collide(zombies7, zombies7);
		FlxG.collide(zombies, zombies2);
		FlxG.collide(zombies2, zombies3);
		FlxG.collide(zombies3, zombies4);
		FlxG.collide(zombies4, zombies5);
		FlxG.collide(zombies5, zombies6);
		FlxG.collide(zombies6, zombies7);
		FlxG.collide(zombies7, zombies);
		
		 cointxt.text = "$ " + Std.string(Reg.coincount);
		 killtxtnum.text = Std.string(zomkillnum) + "/160";
		 FlxSpriteUtil.screenWrap(player);
		for (coin in coins)
		{
			if (coin.x < 16 || coin.x > 752 || coin.y > 416 || coin.y < 16)
		{
		coins.remove(coin);
		}
		}
		 #if (web || desktop)
		if (player.gp == null)
		{
			if (FlxG.keys.pressed.X || FlxG.keys.pressed.N)
			{
				shoot();
			}
		}
		else if (player.gp != null)
		{
			if (player.gp.pressed.A)
			{
				shoot();
			}
			if (player.gp.justPressed.X && Reg.grCount > 0)
			{
			Reg.grCount -= 1;
				addGrenadeR();
			}
		}
		#end
		#if (android)
		Player.virtualPad.buttonA.onDown.callback = shoot;
		#end
		
		 /**
		 if (FlxG.keys.justPressed.SPACE && guntmr >= 0.25)
		{
			guntmr = 0;
			FlxG.sound.play("assets/sounds/shotgun.wav");
			if (player.flipX == false)
			{
				addbulR();
				addbulR2();
				addbulR3();
			}
		else if (player.flipX == true)
			{
				addbulL();
				addbulL2();
				addbulL3();
			}
		}**/
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
		
		if (zomnum <= 25)
		{
			zomnum++;
		 randnum =  FlxG.random.int(1, 16);
			if (randnum== 1)
			{
				addzombie();
			}
			else if (randnum == 1)
			{
				addzombie();
			}
			else if (randnum == 2)
			{
				addzombie2();
			}
			else if (randnum == 3)
			{
				addzombie3();
			}
			else if (randnum == 4)
			{
				addzombie4();
			}
			else if (randnum == 5)
			{
				addzombie5();
			}
			else if (randnum == 6)
			{
				addzombie6();
			}
			else if (randnum == 7)
			{
				addzombie7();
			}
			else if (randnum == 8)
			{
				addzombie8();
			}
			else if (randnum == 9)
			{
				addzombie9();
			}
			else if (randnum == 10)
			{
				addzombie10();
			}
			else if (randnum == 11)
			{
				addzombie11();
			}
			else if (randnum == 12)
			{
				addzombie12();
			}
			else if (randnum == 13)
			{
				addzombie13();
			}
			else if (randnum == 14)
			{
				addzombie14();
			}
			else if (randnum == 15)
			{
				addzombie15();
			}
			else if (randnum == 16)
			{
				addzombie16();
			}
		}
		
		for (zombie in zombies)
		{
			if (zombie.x < player.x)
			{
				zombie.velocity.x = FlxG.random.int(5,95);
				zombie.flipX = false;
			}
			else if (zombie.x > player.x)
			{
				zombie.velocity.x = - FlxG.random.int(5,95);
				zombie.flipX = true;
			}
			if (zombie.isOnScreen() == true)
			{
			if (zombie.y < player.y)
			{
				zombie.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie.y > player.y)
			{
				zombie.velocity.y = - FlxG.random.int(5,95);
			}
			}
		}
		for (zombie2 in zombies2)
		{
			if (zombie2.x < player.x)
			{
				zombie2.velocity.x = FlxG.random.int(5,95);
				zombie2.flipX = false;
			}
			else if (zombie2.x > player.x)
			{
				zombie2.velocity.x = -FlxG.random.int(5,95);
				zombie2.flipX = true;
			}
			if (zombie2.isOnScreen() == true)
			{
			if (zombie2.y < player.y)
			{
				zombie2.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie2.y > player.y)
			{
				zombie2.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		for (zombie3 in zombies3)
		{
			if (zombie3.x < player.x)
			{
				zombie3.velocity.x = FlxG.random.int(5,95);
				zombie3.flipX = false;
			}
			else if (zombie3.x > player.x)
			{
				zombie3.velocity.x = -FlxG.random.int(5,95);
				zombie3.flipX = true;
			}
			if (zombie3.isOnScreen() == true)
			{
			if (zombie3.y < player.y)
			{
				zombie3.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie3.y > player.y)
			{
				zombie3.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		for (zombie4 in zombies4)
		{
			if (zombie4.x < player.x)
			{
				zombie4.velocity.x = FlxG.random.int(5,95);
				zombie4.flipX = false;
			}
			else if (zombie4.x > player.x)
			{
				zombie4.velocity.x = -FlxG.random.int(5,95);
				zombie4.flipX = true;
			}
			if (zombie4.isOnScreen() == true)
			{
			if (zombie4.y < player.y)
			{
				zombie4.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie4.y > player.y)
			{
				zombie4.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		for (zombie5 in zombies5)
		{
			if (zombie5.x < player.x)
			{
				zombie5.velocity.x = FlxG.random.int(5,95);
				zombie5.flipX = false;
			}
			else if (zombie5.x > player.x)
			{
				zombie5.velocity.x = -FlxG.random.int(5,95);
				zombie5.flipX = true;
			}
			if (zombie5.isOnScreen() == true)
			{
			if (zombie5.y < player.y)
			{
				zombie5.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie5.y > player.y)
			{
				zombie5.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		for (zombie6 in zombies6)
		{
			if (zombie6.x < player.x)
			{
				zombie6.velocity.x = FlxG.random.int(5,95);
				zombie6.flipX = false;
			}
			else if (zombie6.x > player.x)
			{
				zombie6.velocity.x = -FlxG.random.int(5,95);
				zombie6.flipX = true;
			}
			if (zombie6.isOnScreen() == true)
			{
			if (zombie6.y < player.y)
			{
				zombie6.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie6.y > player.y)
			{
				zombie6.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		for (zombie7 in zombies7)
		{
			if (zombie7.x < player.x)
			{
				zombie7.velocity.x = FlxG.random.int(5,95);
				zombie7.flipX = false;
			}
			else if (zombie7.x > player.x)
			{
				zombie7.velocity.x = -FlxG.random.int(5,95);
				zombie7.flipX = true;
			}
			if (zombie7.isOnScreen() == true)
			{
			if (zombie7.y < player.y)
			{
				zombie7.velocity.y = FlxG.random.int(5,95);
			}
			else if (zombie7.y > player.y)
			{
				zombie7.velocity.y = -FlxG.random.int(5,95);
			}
			}
		}
		if (FlxG.overlap(zombies, player) || FlxG.overlap(zombies2, player) || FlxG.overlap(zombies3, player) || FlxG.overlap(zombies4, player) || FlxG.overlap(zombies5, player) || FlxG.overlap(zombies6, player) || FlxG.overlap(zombies7, player))
		{
		  player.health -= FlxG.elapsed*4;
		}
		if (zomkillnum >= 160)
		{
			FlxG.switchState(new Cutscene3());
		}
		if (player.health <= 0)
		{
			FlxG.switchState(new Gameover());
		}
		
	hitzombie();
	hitzombie2();
	hitzombie3();
	hitzombie4();
	hitzombie5();
	hitzombie6();
	hitzombie7();
	
	bhitzombie();
	bhitzombie2();
	bhitzombie3();
	bhitzombie4();
	bhitzombie5();
	bhitzombie6();
	bhitzombie7();
	
	hitcoin();		
	}	
}