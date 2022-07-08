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
 * @author bumblefish
 */
class Instructions extends FlxState
{
   private var txt:FlxText;
   private var txt2:FlxText;
   private var txt3:FlxText;
   private var txt4:FlxText;
   private var dbtn1:FlxSprite;
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
	dbtn1 = new FlxSprite(FlxG.width/2 -57, 380);
	dbtn1.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
	dbtn1.animation.add("off", [1], 1, true);
	dbtn1.animation.add("on", [6], 1, true);
	txt = new FlxText(250, 100, 0, "WASD/Arrows to move.", 16);
	txt.borderColor = 0xff000000;
    txt.borderStyle = FlxTextBorderStyle.NONE;
    txt.size = 16;
	txt2 = new FlxText(310, 150, 0, "X/N to shoot.", 16);
	txt2.borderColor = 0xff000000;
    txt2.borderStyle = FlxTextBorderStyle.NONE;
    txt2.size = 16;
	txt3 = new FlxText(290, 200, 0, "Z/M for grenade.", 16);
	txt3.borderColor = 0xff000000;
    txt3.borderStyle = FlxTextBorderStyle.NONE;
    txt3.size = 16;
//	txt4 = new FlxText(310, 250, 0, "P to pause.", 16);
//	txt4.borderColor = 0xff000000;
//    txt4.borderStyle = FlxTextBorderStyle.NONE;
//    txt4.size = 16;
	
	
	add(txt);
	add(txt2);
	add(txt3);
	//add(txt4);
	add(dbtn1);
	FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(dbtn1, startp1, null, scalep1, uscalep1);
	dbtn1.animation.play("off");
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
	function scalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("off");
   }
    function startp1(Sprite:FlxSprite):Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp1e);
   }
  	function startp1e():Void
	{
	FlxG.switchState(new MenuState());
   }
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}