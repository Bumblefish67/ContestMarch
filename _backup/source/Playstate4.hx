package ;
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
 * ...
 * @author Thomas Williamson
 */
class Playstate4 extends FlxState
{
    private var blts:FlxTypedGroup<Bullet>;
	private var blt:Bullet;
	private var coins:FlxTypedGroup<Coin>;
	private var coin:Coin;
	private var player:Player;
	private var bg:FlxSprite;
	private var zomblood:FlxTypedGroup<Blood>;
	private var blood:Blood;
	private var guntmr:Float = 0.25;
	private var boss:Boss;
	private var velocnum:Float = 2;
	private var bosslive :Bool = true;
	private var deathtimer:Float = 6;
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
	private var bgPse:FlxSprite;
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
		bg = new FlxSprite(0, 0, "assets/Background4.png");
		add(bg);
		FlxG.worldBounds.setSize(768, 432);
		player = new Player(100, 300);
		boss = new Boss(600, 200);
		add(zomblood = new FlxTypedGroup<Blood>()); 
		add(Player.bar);
		add(player);
		add(Boss.bar);
		add(boss);
		
		add(blts = new FlxTypedGroup<Bullet>()); 
		add(htlths = new FlxTypedGroup<Hlth>());
		add(grenades = new FlxTypedGroup<Grenade>()); 
		add(booms = new FlxTypedGroup<Explosion2>());
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
		bgPse = new FlxSprite(0, 0, "assets/pauselayer.png");
		add(bgPse); 
		bgPse.kill();
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
		 blood.animation.play("two");
		return zomblood.add(blood); 
	} 
		function hitboss():Void
	{
		for (blt in blts)
		{
		if (FlxG.overlap(blt, boss))
		   {
			addblood();
			hNum --;
			blood.x = boss.x;
	    	blood.y = boss.y;
			blts.remove(blt);
			boss.health--;
		  }
	  }
	}
	
	function bhitboss():Void
	{
		for (boom in booms)
		{
		if (FlxG.overlap(boom, boss))
		   {
			addblood();
			blood.x = boss.x;
	    	blood.y = boss.y;
			hNum --;
			boss.health - 10;
		  }
	  }
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
		function change():Void
		{
			FlxG.switchState(new Cutscene2());
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
		grtxt.text = Std.string(Reg.grCount);
		
		
		 cointxt.text = "$ " + Std.string(Reg.coincount);
		 FlxSpriteUtil.screenWrap(player);

		  #if (web || desktop)
		if (FlxG.keys.pressed.X || FlxG.keys.pressed.N)
		{
			shoot();
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
		
		
		
	if (bosslive == true)
		{
		velocnum -= FlxG.elapsed;
		if (velocnum <= 0)
		{
		      velocnum = 2;
		}
    	if (velocnum <= 1)
    	{
    	if (boss.x < player.x - 50)
			{
				boss.velocity.x = 110;
				//boss.flipX = true;
			}
			else if (boss.x > player.x +50)
			{
				boss.velocity.x = -110;
		    //	boss.flipX = false;
			}
	    	if (boss.y < player.y  )
			{
				boss.velocity.y = 110;
			}
			else if (boss.y > player.y )
			{
				boss.velocity.y = - 110;
			}
				else if (boss.x <= player.x +49 || boss.x >= player.x -49 ) 
			{
				boss.velocity.x = 0;
				//boss.flipX = false;
			}
			
		}
	else if (velocnum >= 1)
	{
			if (boss.x < player.x - 50 )
			{
				boss.velocity.x = 210;
				//boss.flipX = true;
			}
			else if (boss.x > player.x +50)
			{
				boss.velocity.x = -210;
		    	//boss.flipX = false;
			}
	    	if (boss.y < player.y )
			{
				boss.velocity.y = 210;
			}
			else if (boss.y > player.y )
			{
				boss.velocity.y = - 210;
			}
				else if (boss.x <= player.x +49 || boss.x >= player.x -49 ) 
			{
				boss.velocity.x = 0;
				//boss.flipX = false;
			}
			
	}
	if ( boss.velocity.x == 210 || boss.velocity.x == 110)
	{
		boss.flipX = true;
	}
	else if ( boss.velocity.x == -210 || boss.velocity.x == -110)
	{
		boss.flipX = false;
	}
	
	
		if (FlxG.overlap(boss, player) )
		{
		  player.health -= FlxG.elapsed*12;
		}
		if(boss.health <= 0)
		{
			bosslive = false;
		}
		if (player.health <= 0)
		{
			FlxG.switchState(new Gameover());
		}
	if (boss.health <= 100)	
	{
	boss.health += FlxG.elapsed * 2;
    }
	hitboss();
	bhitboss();
	 if((boss.velocity.x != 0) || (boss.velocity.y != 0) ||  (boss.velocity.y != -0))
			{
			 boss.animation.play("walk");
			}
  else {
			  boss.animation.play("idle");
			}
		}
	else if(bosslive == false)
{
	deathtimer -= FlxG.elapsed;
	if (deathtimer >4)
		{
			boss.velocity.x = boss.velocity.y = 0;
			boss.animation.play("dying", false);
			FlxG.camera.shake(0.02, 0.5);
		}
		else if (deathtimer <= 4 && deathtimer > 0)
		{
		boss.animation.play("dead", true);	
		}
		else if (deathtimer <= 0)
		{
		      change();
		}
	}
}
}	
