#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__assets_fonts_arial_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.ogg") @:keep #if display private #end class __ASSET__assets_sounds_beep_ogg extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.ogg") @:keep #if display private #end class __ASSET__assets_sounds_flixel_ogg extends flash.media.Sound {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/arial.ttf") @:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}





#else


class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/arial.ttf"; fontName = "Arial";  }}


#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.system.ThreadPool;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var loadHandlers:Map<String, Dynamic>;
	private var threadPool:ThreadPool;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/1.png", "assets/1.png");
		type.set ("assets/1.png", AssetType.IMAGE);
		path.set ("assets/2.png", "assets/2.png");
		type.set ("assets/2.png", AssetType.IMAGE);
		path.set ("assets/3.png", "assets/3.png");
		type.set ("assets/3.png", AssetType.IMAGE);
		path.set ("assets/4.png", "assets/4.png");
		type.set ("assets/4.png", AssetType.IMAGE);
		path.set ("assets/Background1.png", "assets/Background1.png");
		type.set ("assets/Background1.png", AssetType.IMAGE);
		path.set ("assets/Background2 (1).png", "assets/Background2 (1).png");
		type.set ("assets/Background2 (1).png", AssetType.IMAGE);
		path.set ("assets/Background2.png", "assets/Background2.png");
		type.set ("assets/Background2.png", AssetType.IMAGE);
		path.set ("assets/Background4.png", "assets/Background4.png");
		type.set ("assets/Background4.png", AssetType.IMAGE);
		path.set ("assets/Bomb.png", "assets/Bomb.png");
		type.set ("assets/Bomb.png", AssetType.IMAGE);
		path.set ("assets/bosssheet.png", "assets/bosssheet.png");
		type.set ("assets/bosssheet.png", AssetType.IMAGE);
		path.set ("assets/bosssheet2.png", "assets/bosssheet2.png");
		type.set ("assets/bosssheet2.png", AssetType.IMAGE);
		path.set ("assets/buttonsmedium2.png", "assets/buttonsmedium2.png");
		type.set ("assets/buttonsmedium2.png", AssetType.IMAGE);
		path.set ("assets/Coin1.png", "assets/Coin1.png");
		type.set ("assets/Coin1.png", AssetType.IMAGE);
		path.set ("assets/contestsprite.png", "assets/contestsprite.png");
		type.set ("assets/contestsprite.png", AssetType.IMAGE);
		path.set ("assets/fireball.png", "assets/fireball.png");
		type.set ("assets/fireball.png", AssetType.IMAGE);
		path.set ("assets/Game-Over.png", "assets/Game-Over.png");
		type.set ("assets/Game-Over.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/Map1.png", "assets/Map1.png");
		type.set ("assets/Map1.png", AssetType.IMAGE);
		path.set ("assets/Map2.png", "assets/Map2.png");
		type.set ("assets/Map2.png", AssetType.IMAGE);
		path.set ("assets/Map3.png", "assets/Map3.png");
		type.set ("assets/Map3.png", AssetType.IMAGE);
		path.set ("assets/mapCSV_Group1_zombies.csv", "assets/mapCSV_Group1_zombies.csv");
		type.set ("assets/mapCSV_Group1_zombies.csv", AssetType.TEXT);
		path.set ("assets/Maps0037.png", "assets/Maps0037.png");
		type.set ("assets/Maps0037.png", AssetType.IMAGE);
		path.set ("assets/Maps0038.png", "assets/Maps0038.png");
		type.set ("assets/Maps0038.png", AssetType.IMAGE);
		path.set ("assets/Maps0039.png", "assets/Maps0039.png");
		type.set ("assets/Maps0039.png", AssetType.IMAGE);
		path.set ("assets/Maps0040.png", "assets/Maps0040.png");
		type.set ("assets/Maps0040.png", AssetType.IMAGE);
		path.set ("assets/Maps0041.png", "assets/Maps0041.png");
		type.set ("assets/Maps0041.png", AssetType.IMAGE);
		path.set ("assets/Maps0042.png", "assets/Maps0042.png");
		type.set ("assets/Maps0042.png", AssetType.IMAGE);
		path.set ("assets/Maps0043.png", "assets/Maps0043.png");
		type.set ("assets/Maps0043.png", AssetType.IMAGE);
		path.set ("assets/MoGames.png", "assets/MoGames.png");
		type.set ("assets/MoGames.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/newerbuttons26.png", "assets/newerbuttons26.png");
		type.set ("assets/newerbuttons26.png", AssetType.IMAGE);
		path.set ("assets/pauselayer.png", "assets/pauselayer.png");
		type.set ("assets/pauselayer.png", AssetType.IMAGE);
		path.set ("assets/R1.png", "assets/R1.png");
		type.set ("assets/R1.png", AssetType.IMAGE);
		path.set ("assets/R2.png", "assets/R2.png");
		type.set ("assets/R2.png", AssetType.IMAGE);
		path.set ("assets/R3.png", "assets/R3.png");
		type.set ("assets/R3.png", AssetType.IMAGE);
		path.set ("assets/robotcloud.png", "assets/robotcloud.png");
		type.set ("assets/robotcloud.png", AssetType.IMAGE);
		path.set ("assets/robotcloud120x120.png", "assets/robotcloud120x120.png");
		type.set ("assets/robotcloud120x120.png", AssetType.IMAGE);
		path.set ("assets/scene1.png", "assets/scene1.png");
		type.set ("assets/scene1.png", AssetType.IMAGE);
		path.set ("assets/scene2-1.png", "assets/scene2-1.png");
		type.set ("assets/scene2-1.png", AssetType.IMAGE);
		path.set ("assets/scene2-2.png", "assets/scene2-2.png");
		type.set ("assets/scene2-2.png", AssetType.IMAGE);
		path.set ("assets/scene2-3.png", "assets/scene2-3.png");
		type.set ("assets/scene2-3.png", AssetType.IMAGE);
		path.set ("assets/scene2.png", "assets/scene2.png");
		type.set ("assets/scene2.png", AssetType.IMAGE);
		path.set ("assets/scene3-1.png", "assets/scene3-1.png");
		type.set ("assets/scene3-1.png", AssetType.IMAGE);
		path.set ("assets/scene3-2.png", "assets/scene3-2.png");
		type.set ("assets/scene3-2.png", AssetType.IMAGE);
		path.set ("assets/Shotgun49x12.png", "assets/Shotgun49x12.png");
		type.set ("assets/Shotgun49x12.png", AssetType.IMAGE);
		path.set ("assets/sounds/BG sound in loop maybe.mp3", "assets/sounds/BG sound in loop maybe.mp3");
		type.set ("assets/sounds/BG sound in loop maybe.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Decisions.mp3", "assets/sounds/Decisions.mp3");
		type.set ("assets/sounds/Decisions.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/grenade.wav", "assets/sounds/grenade.wav");
		type.set ("assets/sounds/grenade.wav", AssetType.SOUND);
		path.set ("assets/sounds/gun.wav", "assets/sounds/gun.wav");
		type.set ("assets/sounds/gun.wav", AssetType.SOUND);
		path.set ("assets/sounds/shotgun.wav", "assets/sounds/shotgun.wav");
		type.set ("assets/sounds/shotgun.wav", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/What You Want ver 2.mp3", "assets/sounds/What You Want ver 2.mp3");
		type.set ("assets/sounds/What You Want ver 2.mp3", AssetType.MUSIC);
		path.set ("assets/Sprites (1).png", "assets/Sprites (1).png");
		type.set ("assets/Sprites (1).png", AssetType.IMAGE);
		path.set ("assets/Title (1).png", "assets/Title (1).png");
		type.set ("assets/Title (1).png", AssetType.IMAGE);
		path.set ("assets/Upgrades0019.png", "assets/Upgrades0019.png");
		type.set ("assets/Upgrades0019.png", AssetType.IMAGE);
		path.set ("assets/Upgrades0020.png", "assets/Upgrades0020.png");
		type.set ("assets/Upgrades0020.png", AssetType.IMAGE);
		path.set ("assets/Upgrades0021.png", "assets/Upgrades0021.png");
		type.set ("assets/Upgrades0021.png", AssetType.IMAGE);
		path.set ("assets/Upgrades0023.png", "assets/Upgrades0023.png");
		type.set ("assets/Upgrades0023.png", AssetType.IMAGE);
		path.set ("assets/Upgrades0024.png", "assets/Upgrades0024.png");
		type.set ("assets/Upgrades0024.png", AssetType.IMAGE);
		path.set ("assets/Upgrades320023.png", "assets/Upgrades320023.png");
		type.set ("assets/Upgrades320023.png", AssetType.IMAGE);
		path.set ("assets/Upgrades500019.png", "assets/Upgrades500019.png");
		type.set ("assets/Upgrades500019.png", AssetType.IMAGE);
		path.set ("assets/Upgrades500020.png", "assets/Upgrades500020.png");
		type.set ("assets/Upgrades500020.png", AssetType.IMAGE);
		path.set ("assets/Upgrades500021.png", "assets/Upgrades500021.png");
		type.set ("assets/Upgrades500021.png", AssetType.IMAGE);
		path.set ("assets/Upgrades500023.png", "assets/Upgrades500023.png");
		type.set ("assets/Upgrades500023.png", AssetType.IMAGE);
		path.set ("assets/Upgrades500024.png", "assets/Upgrades500024.png");
		type.set ("assets/Upgrades500024.png", AssetType.IMAGE);
		path.set ("assets/zombieblood.png", "assets/zombieblood.png");
		type.set ("assets/zombieblood.png", AssetType.IMAGE);
		path.set ("assets/zombiecar.png", "assets/zombiecar.png");
		type.set ("assets/zombiecar.png", AssetType.IMAGE);
		path.set ("assets/Zombiegirl1.png", "assets/Zombiegirl1.png");
		type.set ("assets/Zombiegirl1.png", AssetType.IMAGE);
		path.set ("assets/zombiegirl2.png", "assets/zombiegirl2.png");
		type.set ("assets/zombiegirl2.png", AssetType.IMAGE);
		path.set ("assets/zombiegirl3.png", "assets/zombiegirl3.png");
		type.set ("assets/zombiegirl3.png", AssetType.IMAGE);
		path.set ("assets/zombieguy1.png", "assets/zombieguy1.png");
		type.set ("assets/zombieguy1.png", AssetType.IMAGE);
		path.set ("assets/zombieguy2.png", "assets/zombieguy2.png");
		type.set ("assets/zombieguy2.png", AssetType.IMAGE);
		path.set ("assets/zombieguy3.png", "assets/zombieguy3.png");
		type.set ("assets/zombieguy3.png", AssetType.IMAGE);
		path.set ("assets/zombieguy4.png", "assets/zombieguy4.png");
		type.set ("assets/zombieguy4.png", AssetType.IMAGE);
		path.set ("assets/Zombiehunter.png", "assets/Zombiehunter.png");
		type.set ("assets/Zombiehunter.png", AssetType.IMAGE);
		path.set ("assets/zombiemap.png", "assets/zombiemap.png");
		type.set ("assets/zombiemap.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		path.set ("flixel/flixel-ui/img/box.png", "flixel/flixel-ui/img/box.png");
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button.png", "flixel/flixel-ui/img/button.png");
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_arrow_down.png", "flixel/flixel-ui/img/button_arrow_down.png");
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_arrow_left.png", "flixel/flixel-ui/img/button_arrow_left.png");
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_arrow_right.png", "flixel/flixel-ui/img/button_arrow_right.png");
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_arrow_up.png", "flixel/flixel-ui/img/button_arrow_up.png");
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_thin.png", "flixel/flixel-ui/img/button_thin.png");
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/button_toggle.png", "flixel/flixel-ui/img/button_toggle.png");
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/check_box.png", "flixel/flixel-ui/img/check_box.png");
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/check_mark.png", "flixel/flixel-ui/img/check_mark.png");
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/chrome.png", "flixel/flixel-ui/img/chrome.png");
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/chrome_flat.png", "flixel/flixel-ui/img/chrome_flat.png");
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/chrome_inset.png", "flixel/flixel-ui/img/chrome_inset.png");
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/chrome_light.png", "flixel/flixel-ui/img/chrome_light.png");
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/dropdown_mark.png", "flixel/flixel-ui/img/dropdown_mark.png");
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/finger_big.png", "flixel/flixel-ui/img/finger_big.png");
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/finger_small.png", "flixel/flixel-ui/img/finger_small.png");
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/hilight.png", "flixel/flixel-ui/img/hilight.png");
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/invis.png", "flixel/flixel-ui/img/invis.png");
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/minus_mark.png", "flixel/flixel-ui/img/minus_mark.png");
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/plus_mark.png", "flixel/flixel-ui/img/plus_mark.png");
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/radio.png", "flixel/flixel-ui/img/radio.png");
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/radio_dot.png", "flixel/flixel-ui/img/radio_dot.png");
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/swatch.png", "flixel/flixel-ui/img/swatch.png");
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/tab.png", "flixel/flixel-ui/img/tab.png");
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/tab_back.png", "flixel/flixel-ui/img/tab_back.png");
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/img/tooltip_arrow.png", "flixel/flixel-ui/img/tooltip_arrow.png");
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		path.set ("flixel/flixel-ui/xml/defaults.xml", "flixel/flixel-ui/xml/defaults.xml");
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		path.set ("flixel/flixel-ui/xml/default_loading_screen.xml", "flixel/flixel-ui/xml/default_loading_screen.xml");
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		path.set ("flixel/flixel-ui/xml/default_popup.xml", "flixel/flixel-ui/xml/default_popup.xml");
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Background1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Background2 (1).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Background2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Background4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Bomb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/bosssheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/bosssheet2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/buttonsmedium2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Coin1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/contestsprite.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/fireball.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Game-Over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/Map1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Map2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Map3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/mapCSV_Group1_zombies.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/Maps0037.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0038.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0039.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0040.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0041.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0042.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Maps0043.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/MoGames.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/newerbuttons26.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/pauselayer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/R1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/R2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/R3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/robotcloud.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/robotcloud120x120.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene2-1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene2-2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene2-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene3-1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/scene3-2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Shotgun49x12.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/BG sound in loop maybe.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Decisions.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/grenade.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/gun.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/shotgun.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/What You Want ver 2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/Sprites (1).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Title (1).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades320023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades500019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades500020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades500021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades500023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Upgrades500024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombieblood.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombiecar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Zombiegirl1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombiegirl2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombiegirl3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombieguy1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombieguy2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombieguy3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombieguy4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/Zombiehunter.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/zombiemap.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/flixel-ui/img/box.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_thin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_toggle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_box.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_mark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_flat.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_inset.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_light.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/dropdown_mark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_big.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_small.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/hilight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/invis.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/minus_mark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/plus_mark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio_dot.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/swatch.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tooltip_arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/xml/defaults.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_loading_screen.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_popup.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	private function createThreadPool ():Void {
		
		threadPool = new ThreadPool (0, 2);
		threadPool.doWork.add (function (id, getMethod) {
			
			threadPool.sendComplete (id, getMethod (id));
			
		});
		threadPool.onComplete.add (function (id, data) {
			
			var handler = loadHandlers.get (id);
			handler (data);
			
		});
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getAudioBuffer (id));
			
		}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			loadHandlers = new Map ();
			createThreadPool ();
			
		}
		
		loadHandlers.set (id, handler);
		threadPool.queue (id, getBytes);
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				handler (Image.fromImageElement (image));
				
			}
			image.src = path.get (id);
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			loadHandlers = new Map ();
			createThreadPool ();
			
		}
		
		loadHandlers.set (id, handler);
		threadPool.queue (id, getImage);
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if !display
#if flash













































































@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }
































#elseif html5















































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 
































#else



#if (windows || mac || linux)


@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.ogg") #if display private #end class __ASSET__assets_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.ogg") #if display private #end class __ASSET__assets_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end
#end


#end