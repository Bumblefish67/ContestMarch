package;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxFilterFrames;
import flash.filters.GlowFilter;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

class Pause extends FlxSubState
{

	private var pauseMsg:FlxText;
	private var bgPse:FlxSprite;

	private var funds:FlxText;
	private var shotG:FlxButton;
	private var macG:FlxButton;
	private var Sgicon:FlxSprite;
	private var Mgicon:FlxSprite;
	private var sgtext:FlxText;
	private var mgtext:FlxText;
	private var filter1:GlowFilter;
	private var spr1Filter:FlxFilterFrames;
	private var filter2:GlowFilter;
	private var spr2Filter:FlxFilterFrames;
	private var pistol:FlxButton;
	private var Picon:FlxSprite;
	private var filter4:GlowFilter;
	private var spr4Filter:FlxFilterFrames;
	private var cointxt:FlxText;
	private var Gren:FlxButton;
	private var grtext:FlxText;
	//private var grimg:FlxSprite;
	private var filter3:GlowFilter;
	private var spr3Filter:FlxFilterFrames;
	private var pauseB2:FlxSprite;
	private var menuB2:FlxSprite;
	private var muteB2:FlxSprite;
	private var player:Player;
	override public function create():Void
	{
		super.create();

		player = new Player(200, 200);
		add(player);
		bgPse = new FlxSprite(0, 0, "assets/drk.png");
		add(bgPse);
		muteB2 = new FlxSprite(FlxG.width -36, 10);
		muteB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB2.animation.add("off1", [2], 1, true);
		muteB2.animation.add("on1", [9], 1, true);
		muteB2.animation.add("off2", [6], 1, true);
		muteB2.animation.add("on2", [13], 1, true);
		add(muteB2);
		FlxMouseEventManager.add(muteB2);
		FlxMouseEventManager.setMouseDownCallback(muteB2, startp4_2);
		if (Reg.mute == false)
		{
			muteB2.animation.play("off1");
		}
		else if (Reg.mute == true)
		{
			muteB2.animation.play("off2");
		}
		pauseB2 = new FlxSprite(FlxG.width -36, 46);
		pauseB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		pauseB2.animation.add("off", [4], 1, true);
		pauseB2.animation.add("on", [11], 1, true);
		add(pauseB2);
		pauseB2.animation.play("off");
		FlxMouseEventManager.add(pauseB2, startp5_2, null, scalep1_2, uscalep1_2);
		menuB2 = new FlxSprite(FlxG.width -36, 82);
		menuB2.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		menuB2.animation.add("off", [1], 1, true);
		menuB2.animation.add("on", [8], 1, true);
		add(menuB2);
		menuB2.animation.play("off");
		FlxMouseEventManager.add(menuB2, startp6_2, null, scalep2_2, uscalep2_2);
		funds = new FlxText(185, 80, 0, "You don't have enough money", 24);
		funds.borderColor = 0xff000000;
		funds.borderStyle = FlxTextBorderStyle.NONE;
		funds.size = 24;
		add(funds);
		funds.kill();
		Sgicon = new FlxSprite(8, 30, "assets/Upgrades500020.png");
		Mgicon = new FlxSprite(8, 30, "assets/Upgrades500021.png");
		shotG = new FlxButton(60, 190, "");
		shotG.loadGraphic("assets/Upgrades0020.png", false, 100, 100);
		macG = new FlxButton(320, 190, "");
		macG.loadGraphic("assets/Upgrades0021.png", false, 100, 100);
		filter1 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr1Filter = FlxFilterFrames.fromFrames(macG.frames, 50, 50);
		spr1Filter.addFilter(filter1);
		filter2 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr2Filter = FlxFilterFrames.fromFrames(shotG.frames, 50, 50);
		spr2Filter.addFilter(filter2);
		sgtext = new FlxText(shotG.x + 20, shotG.y + 120, 0, "$300", 16);
		sgtext.borderColor = 0xff000000;
		sgtext.borderStyle = FlxTextBorderStyle.NONE;
		sgtext.size = 16;
		mgtext = new FlxText(macG.x + 40, macG.y + 120, 0, "$500", 16);
		mgtext.borderColor = 0xff000000;
		mgtext.borderStyle = FlxTextBorderStyle.NONE;
		mgtext.size = 16;
		add(shotG);
		add(macG);
		add(sgtext);
		add(mgtext);
		shotG.onOver.callback = shotscale;
		shotG.onOut.callback = shotuscale;
		shotG.onDown.callback = shotgive;
		macG.onOver.callback = macscale;
		macG.onOut.callback = macuscale;
		macG.onDown.callback = macgive;
		add(Sgicon);
		add(Mgicon);
		Sgicon.kill();
		Mgicon.kill();

		Picon = new FlxSprite(8, 30, "assets/Upgrades500024.png");
		add(Picon);
		Picon.kill();
		pistol = new FlxButton(320, 320, "");
		pistol.loadGraphic("assets/Upgrades0024.png", false, 100, 100);
		add(pistol);
		pistol.scrollFactor.x = pistol.scrollFactor.y = 1;
		pistol.onOver.callback = pistolscale;
		pistol.onOut.callback = pistoluscale;
		pistol.onDown.callback = pistolgive;

		filter4 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr4Filter = FlxFilterFrames.fromFrames(pistol.frames, 50, 50);
		spr4Filter.addFilter(filter4);

		Gren = new FlxButton(580, 190, "");
		Gren.loadGraphic("assets/Upgrades0023.png", false, 100, 100);
		Gren.onOver.callback = grenscale;
		Gren.onOut.callback = grenuscale;
		Gren.onDown.callback = grengive;
		filter3 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr3Filter = FlxFilterFrames.fromFrames(Gren.frames, 50, 50);
		spr3Filter.addFilter(filter3);
		add(Gren);

		cointxt = new FlxText(5, 10, 128);
		cointxt.size = 16;
		add(cointxt);
        cointxt.scrollFactor.x = cointxt.scrollFactor.y = 1;
		grtext = new FlxText(Gren.x + 50, Gren.y + 120, 0, "$10", 16);
		grtext.borderColor = 0xff000000;
		grtext.borderStyle = FlxTextBorderStyle.NONE;
		grtext.size = 16;
		add(grtext);
		grtext.scrollFactor.x = grtext.scrollFactor.y = 1;
		//grimg = new FlxSprite(8, 98, "assets/Upgrades500023.png");
		//add(grimg);
		pauseMsg = new FlxText(304,150, 160);
		pauseMsg.borderColor = 0xff000000;
		pauseMsg.borderStyle = FlxTextBorderStyle.NONE;
		pauseMsg.size = 16;
		pauseMsg.text = "GAME PAUSED";
		add(pauseMsg);

	}
	function unPause():Void
	{
		FlxMouseEventManager.remove(muteB2);
		FlxMouseEventManager.remove(menuB2);
		FlxMouseEventManager.remove(pauseB2);
		this.close();

	}

	function startp5_2(Sprite:FlxSprite):Void
	{

		unPause();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		#if (web ||desktop)
		if (player.gp != null)
		{
			if (player.gp.justReleased.START)
			{
				startp5_2(null);
			}
			
			
		}
		#end
		if (Reg.gunNum ==1)
		{
			Picon.revive();
			Sgicon.kill();
			Mgicon.kill();
		}
		else if (Reg.gunNum ==2)
		{
			Sgicon.revive();
			Picon.kill();
			Mgicon.kill();
		}
		else if (Reg.gunNum ==3)
		{
			Mgicon.revive();
			Picon.kill();
			Sgicon.kill();
		}
		if (Reg.hasSg == true)
		{
			sgtext.kill();
		}
		if (Reg.hasMg == true)
		{
			mgtext.kill();
		}
		if (FlxG.keys.pressed.A)
		{
			if (Reg.mute == false)
			{
				FlxG.sound.resume();
			}
			unPause();
		}

		cointxt.text = "$ " + Std.string(Reg.coincount);
		grtext.text =  Std.string(Reg.grCount);

		if (Reg.gunNum ==1)
		{
			Picon.revive();
			Sgicon.kill();
			Mgicon.kill();
		}
		else if (Reg.gunNum ==2)
		{
			Sgicon.revive();
			Picon.kill();
			Mgicon.kill();
		}
		else if (Reg.gunNum ==3)
		{
			Mgicon.revive();
			Picon.kill();
			Sgicon.kill();
		}

		if (Reg.hasSg == true)
		{
			sgtext.kill();
		}
		if (Reg.hasMg == true)
		{
			mgtext.kill();
		}
		if (Reg.mute == false)
		{
			FlxMouseEventManager.setMouseOverCallback(muteB2, scaleMu1);
			FlxMouseEventManager.setMouseOutCallback(muteB2, uscaleMu1);
		}
		else if (Reg.mute == true)
		{
			FlxMouseEventManager.setMouseOverCallback(muteB2, scaleMu2);
			FlxMouseEventManager.setMouseOutCallback(muteB2, uscaleMu2);
		}

	}

	function scaleMu1(Sprite:FlxSprite)
	{
		muteB2.animation.play("on1");
	}
	function uscaleMu1(Sprite:FlxSprite):Void
	{
		muteB2.animation.play("off1");
	}
	function scaleMu2(Sprite:FlxSprite)
	{
		muteB2.animation.play("on2");
	}
	function uscaleMu2(Sprite:FlxSprite):Void
	{
		muteB2.animation.play("off2");
	}
	function startp4_2(Sprite:FlxSprite):Void
	{
		if (Reg.mute == false)
		{
			Reg.mute = true;
			FlxG.sound.pause();
			muteB2.animation.play("on2");
		}
		else if (Reg.mute == true )
		{
			Reg.mute = false;
			FlxG.sound.play("assets/sounds/BG sound in loop maybe.mp3", 0.5, true);
			FlxG.sound.playMusic("assets/sounds/What You Want ver 2.mp3", 1, true);
			muteB2.animation.play("on1");
		}
	}
	function startp6_2(Sprite:FlxSprite):Void
	{
		FlxG.resetGame();
	}
	function scalep2_2(Sprite:FlxSprite):Void
	{
		menuB2.animation.play("on");
	}
	function uscalep2_2(Sprite:FlxSprite):Void
	{
		menuB2.animation.play("off");
	}
	function scalep1_2(Sprite:FlxSprite):Void
	{
		pauseB2.animation.play("on");
	}
	function uscalep1_2(Sprite:FlxSprite):Void
	{
		pauseB2.animation.play("off");
	}
	private function shotscale():Void
	{
		if (Reg.hasSg == false)
		{
			if (Reg.coincount < 300)
			{
				funds.revive();
			}
		}
		shotG.scale.x = shotG.scale.y = 1.5;
	}
	private function shotuscale():Void
	{
		funds.kill();
		shotG.scale.x = shotG.scale.y = 1;
	}
	private function shotgive():Void
	{
		if (Reg.hasSg == false)
		{
			if (Reg.coincount >= 300)
			{
				Reg.coincount -= 300;
				Reg.gunNum = 2;
				Reg.hasSg = true;
			}
		}
		else if (Reg.hasSg == true)
		{
			Reg.gunNum = 2;
		}
	}
	private function macscale():Void
	{
		if (Reg.hasMg == false)
		{
			if (Reg.coincount < 500)
			{
				funds.revive();
			}
		}
		macG.scale.x = macG.scale.y = 1.5;
	}
	private function macuscale():Void
	{
		funds.kill();
		macG.scale.x = macG.scale.y = 1;
	}
	private function macgive():Void
	{
		if (Reg.hasMg == false)
		{
			if (Reg.coincount >= 500)
			{
				Reg.coincount -= 500;
				Reg.gunNum = 3;
				Reg.hasMg = true;
			}
		}
		else if (Reg.hasMg == true)
		{
			Reg.gunNum = 3;
		}
	}

	private function pistolscale():Void
	{
		pistol.scale.x = pistol.scale.y = 1.5;
	}
	private function pistoluscale():Void
	{
		pistol.scale.x = pistol.scale.y = 1;
	}
	private function pistolgive():Void
	{
		Reg.gunNum = 1;
	}

	private function grenscale():Void
	{
		if (Reg.coincount < 10)
		{
			//funds.revive();
		}
		Gren.scale.x = Gren.scale.y = 1.5;
	}
	private function grenuscale():Void
	{
		//funds.kill();
		Gren.scale.x = Gren.scale.y = 1;
	}
	private function grengive():Void
	{
		if (Reg.coincount >= 10)
		{
			Reg.coincount -= 10;
			Reg.grCount += 1;
		}
	}

	public function updateFilter(spr:FlxSprite, sprFilter:FlxFilterFrames)
	{
		sprFilter.applyToSprite(spr,false,true);
	}

	override public function destroy():Void
	{
		super.destroy();

	}

}