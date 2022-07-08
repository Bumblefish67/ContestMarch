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
import flixel.addons.text.FlxTypeText;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

/**
 * ...
 * @author Thomas Williamson
 */
class Cutscene4 extends FlxState
{
   private var bg:FlxSprite;
   private var bg2:FlxSprite;
   private var bg3:FlxSprite;
   private var bg4:FlxSprite;
   private var bg5:FlxSprite;
   private var bg6:FlxSprite;
   private var txt:FlxTypeText;
   private var txt2:FlxTypeText;
   private var txt3:FlxTypeText;
   private var txt4:FlxTypeText;
   private var txt5:FlxTypeText;
   private var txt6:FlxTypeText;
   private var txt7:FlxTypeText;
   private var time:Float = 60;
   private var skip:FlxSprite;
   
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		skip = new FlxSprite(640, 380);
	    skip.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
	    skip.animation.add("off", [3], 1, true);
	    skip.animation.add("on", [8], 1, true);
		bg = new FlxSprite(0, 0);
		bg2 = new FlxSprite(0, 0);
		bg3 = new FlxSprite(0, 0);
		bg4 = new FlxSprite(0, 0);
		bg5 = new FlxSprite(0, 0);
		bg6 = new FlxSprite(0, 0);
		bg.loadGraphic("assets/Maps0037.png", true, 768, 432);
		bg.animation.add("one", [0], 1);
		bg2.loadGraphic("assets/Maps0038.png", true, 768, 432);
		bg2.animation.add("two", [0], 1);
		bg3.loadGraphic("assets/Maps0039.png", true, 768, 432);
		bg3.animation.add("three", [0], 1);
		bg4.loadGraphic("assets/Maps0040.png", true, 768, 432);
		bg4.animation.add("four", [0], 1);
		bg5.loadGraphic("assets/Maps0041.png", true, 768, 432);
		bg5.animation.add("five", [0], 1);
		bg6.loadGraphic("assets/Maps0042.png", true, 768, 432);
		bg6.animation.add("six", [0], 1);
		
		txt = new FlxTypeText(150, 100, FlxG.width - 150, "Oh, what do I have here?", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.WHITE;
		txt.waitTime = 1;
		txt.autoErase = true;
		txt2 = new FlxTypeText(100, 100, FlxG.width - 150, "I was running out of test subjects, but I think you will do just fine.", 24, true );
		txt2.delay = 0.0;
		txt2.eraseDelay = 0.0;
		txt2.showCursor = false;
		txt2.color = FlxColor.WHITE;
		txt2.waitTime = 1;
		txt3 = new FlxTypeText(100, 100, FlxG.width - 150, "Just in time for my new creation to be tested!", 24, true );
		txt3.delay = 0.0;
		txt3.eraseDelay = 0.0;
		txt3.showCursor = false;
		txt3.color = FlxColor.WHITE;
		txt3.waitTime = 1;
		txt4 = new FlxTypeText(100, 100, FlxG.width - 150, "It looks like the one I killed before, it was easy.", 24, true );
		txt4.delay = 0.0;
		txt4.eraseDelay = 0.5;
		txt4.showCursor = false;
		txt4.color = FlxColor.YELLOW;
		txt4.waitTime = 1;
		txt5 = new FlxTypeText(100, 100, FlxG.width - 150, "Oh, so it was you?", 24, true );
		txt5.delay = 0.0;
		txt5.eraseDelay = 0.5;
		txt5.showCursor = false;
		txt5.color = FlxColor.WHITE;
		txt5.waitTime = 1;
		txt6 = new FlxTypeText(100, 100, FlxG.width - 150, "Don't worry, this one will finish the job.", 24, true );
		txt6.delay = 0.0;
		txt6.eraseDelay = 0.5;
		txt6.showCursor = false;
		txt6.color = FlxColor.WHITE;
		txt6.waitTime = 1;
		txt7 = new FlxTypeText(100, 100, FlxG.width - 150, "Get him, boy!", 24, true );
		txt7.delay = 0.0;
		txt7.eraseDelay = 0.5;
		txt7.showCursor = false;
		txt7.color = FlxColor.WHITE;
		txt7.waitTime = 1;
		if (Reg.mute == false)
		{
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
		add(bg);
		add(bg2);
		add(bg3);
		add(bg4);
		add(bg5);
		add(bg6);
		bg2.kill();
		bg3.kill();
		bg4.kill();
		bg5.kill();
		bg6.kill();
		add(skip);
		FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(skip, skipScene, null, scalep1, uscalep1);
	skip.animation.play("off");
	}
	function scalep1(Sprite:FlxSprite)
   {
	   skip.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite)
   {
	   skip.animation.play("off");
   }
	private function skipScene(Sprite:FlxSprite):Void
	{
	FlxG.switchState(new PlayState8());
	}
	override public function destroy():Void
	{
		super.destroy();
	}
	function first()
	{
		add(txt);
			txt.start(0.02, false, true);
	}
	function second()
	{
	txt.resetText("");
		add(txt2);
		txt2.start(0.02, false, true);
	}
	function third()
	{
		txt2.resetText("");
		add(txt3);
		txt3.start(0.02, false, true);
	}
	function fourth()
	{
			txt3.resetText("");
		add(txt4);
		txt4.start(0.04, false, false,null,null);
	}
	function fifth()
	{
			txt4.resetText("");
		add(txt5);
		txt5.start(0.04, false, false,null,null);
	}
	function sixth()
	{
			txt5.resetText("");
		add(txt6);
		txt6.start(0.04, false, false);
	}
	function seventh()
	{
			txt6.resetText("");
		add(txt7);
		txt7.start(0.04, false, false);
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
	
		
		
	if (time < 60&& time > 56)
		{
		txt.erase(0.0);
		bg.animation.play("one");
        first(); 
		}
	else if (time < 56 && time > 42)
		{
			
		   if (time < 56 && time > 52)
		   {
			second(); 
		   }
		     else if (time < 52 && time > 48)
		   {
			
			third();
		   }
		     else if (time < 48 && time > 42)
		   {
			  bg.kill();
			bg2.reset(0, 0);
		    bg2.animation.play("two");   
			
			
			fourth();
		   }
		}
	else if (time < 42 && time > 29)
		{
			
		   if (time < 42 && time > 38)
		   {
			 bg2.kill();
			bg3.reset(0, 0);
		    bg3.animation.play("three"); 
			fifth();
		   }
		     else if (time < 38 && time > 34)
		   {
			     bg3.kill();
			bg4.reset(0, 0);
			bg4.animation.play("four");  
			sixth();
		   }
		     else if (time < 34 && time > 29)
		   {
			
			seventh();
		   }
		}
	else if (time < 29 && time > 25)
		{
			
			if (time < 29 && time > 27)
			{
		       txt7.resetText("");
		       bg4.kill();
			   bg5.reset(0, 0);
			   bg5.animation.play("five");
			}  
			  else if (time < 27 && time > 25)
			{
		       
		       bg5.kill();
			   bg6.reset(0, 0);
			   bg6.animation.play("six"); 
			}  
		    
		}
		
		else if (time <= 25)
	{
		FlxG.switchState(new PlayState8());
	}
  }
}