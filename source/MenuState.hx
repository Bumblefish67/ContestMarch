package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;
/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	private var bg:FlxSprite;
	//private var bgtxt:FlxSprite; 
	private var  dbtn1:FlxSprite;
	private var  inst:FlxSprite;
	private var  cred:FlxSprite;
	private var muteB:FlxSprite;
	override public function create():Void
	{
		super.create();
		Reg.coincount = 0;
		Reg.grCount = 0;
		Reg.gunNum = 1;
		Reg.hasMg = false;
		Reg.hasSg = false;
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		#if (android)
		FlxG.mouse.visible = false;
		#end
		
		bg = new FlxSprite(0, 0, "assets/Title (1).png");
		
		dbtn1 = new FlxSprite(FlxG.width/2 -57, 260);
		dbtn1.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
		dbtn1.animation.add("off", [4], 1, true);
		dbtn1.animation.add("on", [9], 1, true);
		inst = new FlxSprite(FlxG.width / 2 -57, 300);
		inst.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
		inst.animation.add("off", [2], 1, true);
		inst.animation.add("on", [7], 1, true);
		cred = new FlxSprite(FlxG.width/2 -57, 340);
		cred.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
		cred.animation.add("off", [0], 1, true);
		cred.animation.add("on", [5], 1, true);
		muteB = new FlxSprite(FlxG.width -36, 10);
		muteB.loadGraphic("assets/newerbuttons26.png", true, 26, 26);
		muteB.animation.add("off1", [2], 1, true);
		muteB.animation.add("on1", [9], 1, true);
        muteB.animation.add("off2", [6], 1, true);
		muteB.animation.add("on2", [13], 1, true);
		add(bg);
		add(dbtn1);
		add(inst);
		add(cred);
		add(muteB);
		cred.animation.play("off");
		inst.animation.play("off");
		dbtn1.animation.play("off");
		FlxG.plugins.add(new FlxMouseEventManager());
		FlxMouseEventManager.add(dbtn1, startp1, null, scalep1, uscalep1);
		FlxMouseEventManager.add(inst, startp3, null, scalep3, uscalep3);
		FlxMouseEventManager.add(cred, startp2, null, scalep2, uscalep2);
		FlxMouseEventManager.add(muteB);
		FlxMouseEventManager.setMouseDownCallback(muteB, startp4);
		if (Reg.mute == false)
		{
			muteB.animation.play("off1");
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
		else if (Reg.mute == true)
		{
			muteB.animation.play("off2");
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	
	 function scalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("off");
   }
    function scalep2(Sprite:FlxSprite)
   {
	   cred.animation.play("on");
   }
    function uscalep2(Sprite:FlxSprite)
   {
	   cred.animation.play("off");
   }
    function scalep3(Sprite:FlxSprite)
   {
	   inst.animation.play("on");
   }
    function uscalep3(Sprite:FlxSprite)
   {
	   inst.animation.play("off");
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
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		muteB.animation.play("on1");
	}
   }
   function startp1(Sprite:FlxSprite):Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp1e);
   }
   	function startp1e():Void
	{
		//FlxG.mouse.visible = false;
	FlxG.sound.destroy(true);
	FlxG.switchState(new Cutscene1());
   }
    function startp2(Sprite:FlxSprite):Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp2e);
   }
   	function startp2e():Void
	{
		//FlxG.mouse.visible = false;
	FlxG.sound.destroy(true);
	FlxG.switchState(new Credits());
   }
    function startp3(Sprite:FlxSprite):Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp3e);
   }
   	function startp3e():Void
	{
		//FlxG.mouse.visible = false;
	FlxG.sound.destroy(true);
	FlxG.switchState(new Instructions());
   }
    
   	
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
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
	}	
}