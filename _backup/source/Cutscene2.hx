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
class Cutscene2 extends FlxState
{
   private var bg:FlxSprite;
    private var bg2:FlxSprite;
    private var bg3:FlxSprite;
   private var txt:FlxTypeText;
    private var txt2:FlxTypeText;
    private var txt3:FlxTypeText;
    private var txt4:FlxTypeText;
    private var txt5:FlxTypeText;
   private var txt6:FlxTypeText;
    private var txt7:FlxTypeText;
	 private var txt8:FlxTypeText;
	 private var txt9:FlxTypeText;
	private var time:Float = 65;
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
		bg.loadGraphic("assets/scene2-1.png", true, 768, 432);
		bg2.loadGraphic("assets/scene2-2.png", true, 768, 432);
		bg3.loadGraphic("assets/scene2-3.png", true, 768, 432);
		
		bg3.animation.add("zero", [3], 1);
		bg3.animation.add("one", [2], 1);
		bg3.animation.add("two", [1], 1);
		bg3.animation.add("three", [0], 1);
		
		bg2.animation.add("four", [3,2,0,2], 16);
		bg2.animation.add("seven", [1], 1);
		
		bg.animation.add("eight", [3], 1);
		bg.animation.add("nine", [2], 1);
		bg.animation.add("ten", [1], 1);
		bg.animation.add("eleven", [0], 1);
		txt = new FlxTypeText(100, 10, FlxG.width - 150, "I think this is the last of them...", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.YELLOW;
		txt.waitTime = 1;
		txt.autoErase = true;
		txt2 = new FlxTypeText(100, 10, FlxG.width - 150, "Hmmm...", 24, true );
		txt2.delay = 0.0;
		txt2.eraseDelay = 0.0;
		txt2.showCursor = false;
		txt2.color = FlxColor.YELLOW;
		txt2.waitTime = 1;
		txt3 = new FlxTypeText(100, 10, FlxG.width - 150, "Rescue is here!", 24, true );
		txt3.delay = 0.0;
		txt3.eraseDelay = 0.0;
		txt3.showCursor = false;
		txt3.color = FlxColor.YELLOW;
		txt3.waitTime = 1;
		txt4 = new FlxTypeText(100, 10, FlxG.width - 150, "Damn, you are a courageous fella!", 24, true );
		txt4.delay = 0.0;
		txt4.eraseDelay = 0.5;
		txt4.showCursor = false;
		txt4.color = FlxColor.WHITE;
		txt4.waitTime = 1;
		txt5 = new FlxTypeText(100, 10, FlxG.width - 150, "The rescue teams are sending the survivors outside the affected area!", 24, true );
		txt5.delay = 0.0;
		txt5.eraseDelay = 0.5;
		txt5.showCursor = false;
		txt5.color = FlxColor.WHITE;
		txt5.waitTime = 1;
		txt6 = new FlxTypeText(100, 10, FlxG.width - 150, "It didn't spread too far, and the mess is being contained. It is not a virus, the rest of the population will be safe.", 24, true );
		txt6.delay = 0.0;
		txt6.eraseDelay = 0.5;
		txt6.showCursor = false;
		txt6.color = FlxColor.WHITE;
		txt6.waitTime = 1;
		txt7 = new FlxTypeText(100, 10, FlxG.width - 150, " Actually, it seems that...", 24, true );
		txt7.delay = 0.0;
		txt7.eraseDelay = 0.5;
		txt7.showCursor = false;
		txt7.color = FlxColor.YELLOW;
		txt7.waitTime = 1;
		txt8 = new FlxTypeText(100, 10, FlxG.width - 150, "Wow! What the...?", 24, true );
		txt8.delay = 0.0;
		txt8.eraseDelay = 0.5;
		txt8.showCursor = false;
		txt8.color = FlxColor.WHITE;
		txt8.waitTime = 1;
		txt9 = new FlxTypeText(100, 10, FlxG.width - 150, "We're going down!", 24, true );
		txt9.delay = 0.0;
		txt9.eraseDelay = 0.5;
		txt9.showCursor = false;
		txt9.color = FlxColor.WHITE;
		txt9.waitTime = 1;
		
		
		if (Reg.mute == false)
		{
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
		add(bg);
		add(bg2);
		add(bg3);
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
	FlxG.switchState(new CarLevel());
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
	function eighth()
	{
			txt7.resetText("");
		add(txt8);
		txt8.start(0.04, false, false);
	}
	function ninth()
	{
			txt8.resetText("");
		add(txt9);
		txt9.start(0.04, false, false);
	}
	
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
		
		if (time <65 && time > 60 )
		{
		bg3.animation.play("zero");
		}
	else if (time < 60&& time > 55)
		{
		txt.erase(0.0);
		bg3.animation.play("one");
        first(); 
		}
	else if (time < 55 && time > 50)
		{
		bg3.animation.play("two");
		second();
		}
		   else if (time < 50 && time > 45)
		   {
			third();
			bg3.animation.play("three");
		   }
		     else if (time < 45 && time > 40)
		   {
			fourth();
			bg3.kill();
			bg2.animation.play("four");
		   }
		     else if (time < 40 && time > 30)
		   {
			fifth();
		   }
		   if (time < 30 && time > 20)
		   {
			sixth();
		   }
		     else if (time < 20 && time > 10)
		   {
			seventh();
		   }
		     else if (time < 10 && time > 0)
		   {
			eighth();
			bg2.animation.play("seven");
		   }
	else if (time < 0 && time > -5)
		{
		ninth();
		bg2.kill();
			bg.animation.play("eight");
		}
		else if (time < -5 && time > -10)
		{
			txt9.resetText("");
		bg.animation.play("nine");
		}
		else if (time < -10 && time > -15)
		{
	bg.animation.play("ten");
		}
		else if (time < -15 && time > -20)
		{
	bg.animation.play("eleven");
		}
		else if (time < -20 )
		{
		FlxG.switchState(new CarLevel());
		}
		
  }
}