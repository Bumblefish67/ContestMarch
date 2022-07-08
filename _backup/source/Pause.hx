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

class Pause extends FlxSubState{
    public var btn:FlxButton;
    public var pauseMsg:FlxText;
	private var shotG:FlxButton;
	private var macG:FlxButton;
	private var Gren:FlxButton;
	private var pistol:FlxButton;
	private var funds:FlxText;
	
	private var sgtext:FlxText;
	private var mgtext:FlxText;
	private var grtext:FlxText;
	var filter1:GlowFilter;
	var spr1Filter:FlxFilterFrames;
	var filter2:GlowFilter;
	var spr2Filter:FlxFilterFrames;
	var filter3:GlowFilter;
	var spr3Filter:FlxFilterFrames;
	var filter4:GlowFilter;
	var spr4Filter:FlxFilterFrames;
	private var cointxt:FlxText;
	private var grtxt:FlxText;
	private var grimg:FlxSprite;
	private var Picon:FlxSprite;
	private var Sgicon:FlxSprite;
	private var Mgicon:FlxSprite;
    override public function create():Void
	{
		FlxG.sound.pause();
		FlxG.mouse.visible = true;
		Picon = new FlxSprite(8, 30, "assets/Upgrades500024.png");
		Sgicon = new FlxSprite(8, 30, "assets/Upgrades500020.png");
		Mgicon = new FlxSprite(8, 30, "assets/Upgrades500021.png");
		grtxt = new FlxText(10, 150, 0, "", 24);
		cointxt = new FlxText(5, 10, 128);
		cointxt.size = 16;
		
	    funds = new FlxText(185, 80, 0, "You don't have enough money", 24);
		funds.borderColor = 0xff000000;
        funds.borderStyle = FlxTextBorderStyle.NONE;
        funds.size = 24;
		shotG = new FlxButton(60, 190, "");
		shotG.loadGraphic("assets/Upgrades0020.png", false, 100, 100);
		macG = new FlxButton(320, 190, "");
		macG.loadGraphic("assets/Upgrades0021.png", false, 100, 100);
		pistol = new FlxButton(320, 320, "");
		pistol.loadGraphic("assets/Upgrades0024.png", false, 100, 100);
		Gren = new FlxButton(580, 190, "");
		Gren.loadGraphic("assets/Upgrades0023.png", false, 100, 100);
		filter1 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr1Filter = FlxFilterFrames.fromFrames(macG.frames, 50, 50);
		spr1Filter.addFilter(filter1);
		filter2 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr2Filter = FlxFilterFrames.fromFrames(shotG.frames, 50, 50);
		spr2Filter.addFilter(filter2);
		filter3 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr3Filter = FlxFilterFrames.fromFrames(Gren.frames, 50, 50);
		spr3Filter.addFilter(filter3);
		filter4 = new GlowFilter(FlxColor.LIME, 1, 10, 10, 1.5, 1);
		spr4Filter = FlxFilterFrames.fromFrames(pistol.frames, 50, 50);
		spr4Filter.addFilter(filter4);
		
        pauseMsg = new FlxText(304,150, 160);
        pauseMsg.borderColor = 0xff000000;
        pauseMsg.borderStyle = FlxTextBorderStyle.NONE;
        pauseMsg.size = 16;
        pauseMsg.text = "GAME PAUSED";
		sgtext = new FlxText(shotG.x + 20, shotG.y + 120, 0, "$300", 16);
		sgtext.borderColor = 0xff000000;
        sgtext.borderStyle = FlxTextBorderStyle.NONE;
        sgtext.size = 16;
		mgtext = new FlxText(macG.x + 40, macG.y + 120, 0, "$500", 16);
		mgtext.borderColor = 0xff000000;
        mgtext.borderStyle = FlxTextBorderStyle.NONE;
        mgtext.size = 16;
		grtext = new FlxText(Gren.x + 50, Gren.y + 120, 0, "$10", 16);
		grtext.borderColor = 0xff000000;
        grtext.borderStyle = FlxTextBorderStyle.NONE;
        grtext.size = 16;
        add(btn);
        add(pauseMsg);
		add(shotG);
		add(macG);
		add(Gren);
		add(pistol);
		add(sgtext);
		add(mgtext);
		add(grtext);
		
		grimg = new FlxSprite(8, 98, "assets/Upgrades500023.png");
	    add(grimg);
		shotG.onOver.callback = shotscale;
		shotG.onOut.callback = shotuscale;
		shotG.onDown.callback = shotgive;
		
		macG.onOver.callback = macscale;
		macG.onOut.callback = macuscale;
		macG.onDown.callback = macgive;
		
		Gren.onOver.callback = grenscale;
		Gren.onOut.callback = grenuscale;
		Gren.onDown.callback = grengive;
		
		pistol.onOver.callback = pistolscale;
		pistol.onOut.callback = pistoluscale;
		pistol.onDown.callback = pistolgive;
		
		add(cointxt);
		add(funds);
		funds.kill();
		add(grtxt);
		add(Sgicon);
		add(Mgicon);
        add(Picon);	
        Sgicon.kill();
		Mgicon.kill();
		Picon.kill();
		
		
		
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
	private function grenscale():Void
	{
		if (Reg.coincount < 10)
		{
     	funds.revive();
    	}
	Gren.scale.x = Gren.scale.y = 1.5;
	}
	private function grenuscale():Void
	{
     	funds.kill();
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
	
	public function updateFilter(spr:FlxSprite, sprFilter:FlxFilterFrames)
	{
		sprFilter.applyToSprite(spr,false,true);
	}
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
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
		cointxt.text = "$ " + Std.string(Reg.coincount);
		grtxt.text =  Std.string(Reg.grCount);
		if (Reg.hasSg == true)
		{
			sgtext.kill();
		}
		if (Reg.hasMg == true)
		{
			mgtext.kill();
		}
		
	//	updateFilter(macG, spr1Filter);
		//updateFilter(shotG,spr2Filter);
	//	updateFilter(Gren, spr3Filter);
	//	updateFilter(pistol, spr4Filter);
      // 
    }
   
}