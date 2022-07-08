package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/1.png", __ASSET__assets_1_png);
		type.set ("assets/1.png", AssetType.IMAGE);
		className.set ("assets/2.png", __ASSET__assets_2_png);
		type.set ("assets/2.png", AssetType.IMAGE);
		className.set ("assets/3.png", __ASSET__assets_3_png);
		type.set ("assets/3.png", AssetType.IMAGE);
		className.set ("assets/4.png", __ASSET__assets_4_png);
		type.set ("assets/4.png", AssetType.IMAGE);
		className.set ("assets/Background1.png", __ASSET__assets_background1_png);
		type.set ("assets/Background1.png", AssetType.IMAGE);
		className.set ("assets/Background2 (1).png", __ASSET__assets_background2__1__png);
		type.set ("assets/Background2 (1).png", AssetType.IMAGE);
		className.set ("assets/Background2.png", __ASSET__assets_background2_png);
		type.set ("assets/Background2.png", AssetType.IMAGE);
		className.set ("assets/Background4.png", __ASSET__assets_background4_png);
		type.set ("assets/Background4.png", AssetType.IMAGE);
		className.set ("assets/Bomb.png", __ASSET__assets_bomb_png);
		type.set ("assets/Bomb.png", AssetType.IMAGE);
		className.set ("assets/bosssheet.png", __ASSET__assets_bosssheet_png);
		type.set ("assets/bosssheet.png", AssetType.IMAGE);
		className.set ("assets/bosssheet2.png", __ASSET__assets_bosssheet2_png);
		type.set ("assets/bosssheet2.png", AssetType.IMAGE);
		className.set ("assets/buttonsmedium2.png", __ASSET__assets_buttonsmedium2_png);
		type.set ("assets/buttonsmedium2.png", AssetType.IMAGE);
		className.set ("assets/Coin1.png", __ASSET__assets_coin1_png);
		type.set ("assets/Coin1.png", AssetType.IMAGE);
		className.set ("assets/contestsprite.png", __ASSET__assets_contestsprite_png);
		type.set ("assets/contestsprite.png", AssetType.IMAGE);
		className.set ("assets/fireball.png", __ASSET__assets_fireball_png);
		type.set ("assets/fireball.png", AssetType.IMAGE);
		className.set ("assets/Game-Over.png", __ASSET__assets_game_over_png);
		type.set ("assets/Game-Over.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/Map1.png", __ASSET__assets_map1_png);
		type.set ("assets/Map1.png", AssetType.IMAGE);
		className.set ("assets/Map2.png", __ASSET__assets_map2_png);
		type.set ("assets/Map2.png", AssetType.IMAGE);
		className.set ("assets/Map3.png", __ASSET__assets_map3_png);
		type.set ("assets/Map3.png", AssetType.IMAGE);
		className.set ("assets/mapCSV_Group1_zombies.csv", __ASSET__assets_mapcsv_group1_zombies_csv);
		type.set ("assets/mapCSV_Group1_zombies.csv", AssetType.TEXT);
		className.set ("assets/Maps0037.png", __ASSET__assets_maps0037_png);
		type.set ("assets/Maps0037.png", AssetType.IMAGE);
		className.set ("assets/Maps0038.png", __ASSET__assets_maps0038_png);
		type.set ("assets/Maps0038.png", AssetType.IMAGE);
		className.set ("assets/Maps0039.png", __ASSET__assets_maps0039_png);
		type.set ("assets/Maps0039.png", AssetType.IMAGE);
		className.set ("assets/Maps0040.png", __ASSET__assets_maps0040_png);
		type.set ("assets/Maps0040.png", AssetType.IMAGE);
		className.set ("assets/Maps0041.png", __ASSET__assets_maps0041_png);
		type.set ("assets/Maps0041.png", AssetType.IMAGE);
		className.set ("assets/Maps0042.png", __ASSET__assets_maps0042_png);
		type.set ("assets/Maps0042.png", AssetType.IMAGE);
		className.set ("assets/Maps0043.png", __ASSET__assets_maps0043_png);
		type.set ("assets/Maps0043.png", AssetType.IMAGE);
		className.set ("assets/MoGames.png", __ASSET__assets_mogames_png);
		type.set ("assets/MoGames.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/newerbuttons26.png", __ASSET__assets_newerbuttons26_png);
		type.set ("assets/newerbuttons26.png", AssetType.IMAGE);
		className.set ("assets/pauselayer.png", __ASSET__assets_pauselayer_png);
		type.set ("assets/pauselayer.png", AssetType.IMAGE);
		className.set ("assets/R1.png", __ASSET__assets_r1_png);
		type.set ("assets/R1.png", AssetType.IMAGE);
		className.set ("assets/R2.png", __ASSET__assets_r2_png);
		type.set ("assets/R2.png", AssetType.IMAGE);
		className.set ("assets/R3.png", __ASSET__assets_r3_png);
		type.set ("assets/R3.png", AssetType.IMAGE);
		className.set ("assets/robotcloud.png", __ASSET__assets_robotcloud_png);
		type.set ("assets/robotcloud.png", AssetType.IMAGE);
		className.set ("assets/robotcloud120x120.png", __ASSET__assets_robotcloud120x120_png);
		type.set ("assets/robotcloud120x120.png", AssetType.IMAGE);
		className.set ("assets/scene1.png", __ASSET__assets_scene1_png);
		type.set ("assets/scene1.png", AssetType.IMAGE);
		className.set ("assets/scene2-1.png", __ASSET__assets_scene2_1_png);
		type.set ("assets/scene2-1.png", AssetType.IMAGE);
		className.set ("assets/scene2-2.png", __ASSET__assets_scene2_2_png);
		type.set ("assets/scene2-2.png", AssetType.IMAGE);
		className.set ("assets/scene2-3.png", __ASSET__assets_scene2_3_png);
		type.set ("assets/scene2-3.png", AssetType.IMAGE);
		className.set ("assets/scene2.png", __ASSET__assets_scene2_png);
		type.set ("assets/scene2.png", AssetType.IMAGE);
		className.set ("assets/scene3-1.png", __ASSET__assets_scene3_1_png);
		type.set ("assets/scene3-1.png", AssetType.IMAGE);
		className.set ("assets/scene3-2.png", __ASSET__assets_scene3_2_png);
		type.set ("assets/scene3-2.png", AssetType.IMAGE);
		className.set ("assets/Shotgun49x12.png", __ASSET__assets_shotgun49x12_png);
		type.set ("assets/Shotgun49x12.png", AssetType.IMAGE);
		className.set ("assets/sounds/BG sound in loop maybe.mp3", __ASSET__assets_sounds_bg_sound_in_loop_maybe_mp3);
		type.set ("assets/sounds/BG sound in loop maybe.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Decisions.mp3", __ASSET__assets_sounds_decisions_mp3);
		type.set ("assets/sounds/Decisions.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/grenade.wav", __ASSET__assets_sounds_grenade_wav);
		type.set ("assets/sounds/grenade.wav", AssetType.SOUND);
		className.set ("assets/sounds/gun.wav", __ASSET__assets_sounds_gun_wav);
		type.set ("assets/sounds/gun.wav", AssetType.SOUND);
		className.set ("assets/sounds/shotgun.wav", __ASSET__assets_sounds_shotgun_wav);
		type.set ("assets/sounds/shotgun.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/What You Want ver 2.mp3", __ASSET__assets_sounds_what_you_want_ver_2_mp3);
		type.set ("assets/sounds/What You Want ver 2.mp3", AssetType.MUSIC);
		className.set ("assets/Sprites (1).png", __ASSET__assets_sprites__1__png);
		type.set ("assets/Sprites (1).png", AssetType.IMAGE);
		className.set ("assets/Title (1).png", __ASSET__assets_title__1__png);
		type.set ("assets/Title (1).png", AssetType.IMAGE);
		className.set ("assets/Upgrades0019.png", __ASSET__assets_upgrades0019_png);
		type.set ("assets/Upgrades0019.png", AssetType.IMAGE);
		className.set ("assets/Upgrades0020.png", __ASSET__assets_upgrades0020_png);
		type.set ("assets/Upgrades0020.png", AssetType.IMAGE);
		className.set ("assets/Upgrades0021.png", __ASSET__assets_upgrades0021_png);
		type.set ("assets/Upgrades0021.png", AssetType.IMAGE);
		className.set ("assets/Upgrades0023.png", __ASSET__assets_upgrades0023_png);
		type.set ("assets/Upgrades0023.png", AssetType.IMAGE);
		className.set ("assets/Upgrades0024.png", __ASSET__assets_upgrades0024_png);
		type.set ("assets/Upgrades0024.png", AssetType.IMAGE);
		className.set ("assets/Upgrades320023.png", __ASSET__assets_upgrades320023_png);
		type.set ("assets/Upgrades320023.png", AssetType.IMAGE);
		className.set ("assets/Upgrades500019.png", __ASSET__assets_upgrades500019_png);
		type.set ("assets/Upgrades500019.png", AssetType.IMAGE);
		className.set ("assets/Upgrades500020.png", __ASSET__assets_upgrades500020_png);
		type.set ("assets/Upgrades500020.png", AssetType.IMAGE);
		className.set ("assets/Upgrades500021.png", __ASSET__assets_upgrades500021_png);
		type.set ("assets/Upgrades500021.png", AssetType.IMAGE);
		className.set ("assets/Upgrades500023.png", __ASSET__assets_upgrades500023_png);
		type.set ("assets/Upgrades500023.png", AssetType.IMAGE);
		className.set ("assets/Upgrades500024.png", __ASSET__assets_upgrades500024_png);
		type.set ("assets/Upgrades500024.png", AssetType.IMAGE);
		className.set ("assets/zombieblood.png", __ASSET__assets_zombieblood_png);
		type.set ("assets/zombieblood.png", AssetType.IMAGE);
		className.set ("assets/zombiecar.png", __ASSET__assets_zombiecar_png);
		type.set ("assets/zombiecar.png", AssetType.IMAGE);
		className.set ("assets/Zombiegirl1.png", __ASSET__assets_zombiegirl1_png);
		type.set ("assets/Zombiegirl1.png", AssetType.IMAGE);
		className.set ("assets/zombiegirl2.png", __ASSET__assets_zombiegirl2_png);
		type.set ("assets/zombiegirl2.png", AssetType.IMAGE);
		className.set ("assets/zombiegirl3.png", __ASSET__assets_zombiegirl3_png);
		type.set ("assets/zombiegirl3.png", AssetType.IMAGE);
		className.set ("assets/zombieguy1.png", __ASSET__assets_zombieguy1_png);
		type.set ("assets/zombieguy1.png", AssetType.IMAGE);
		className.set ("assets/zombieguy2.png", __ASSET__assets_zombieguy2_png);
		type.set ("assets/zombieguy2.png", AssetType.IMAGE);
		className.set ("assets/zombieguy3.png", __ASSET__assets_zombieguy3_png);
		type.set ("assets/zombieguy3.png", AssetType.IMAGE);
		className.set ("assets/zombieguy4.png", __ASSET__assets_zombieguy4_png);
		type.set ("assets/zombieguy4.png", AssetType.IMAGE);
		className.set ("assets/Zombiehunter.png", __ASSET__assets_zombiehunter_png);
		type.set ("assets/Zombiehunter.png", AssetType.IMAGE);
		className.set ("assets/zombiemap.png", __ASSET__assets_zombiemap_png);
		type.set ("assets/zombiemap.png", AssetType.IMAGE);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
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
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
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
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/1.png", __ASSET__assets_1_png);
		type.set ("assets/1.png", AssetType.IMAGE);
		
		className.set ("assets/2.png", __ASSET__assets_2_png);
		type.set ("assets/2.png", AssetType.IMAGE);
		
		className.set ("assets/3.png", __ASSET__assets_3_png);
		type.set ("assets/3.png", AssetType.IMAGE);
		
		className.set ("assets/4.png", __ASSET__assets_4_png);
		type.set ("assets/4.png", AssetType.IMAGE);
		
		className.set ("assets/Background1.png", __ASSET__assets_background1_png);
		type.set ("assets/Background1.png", AssetType.IMAGE);
		
		className.set ("assets/Background2 (1).png", __ASSET__assets_background2__1__png);
		type.set ("assets/Background2 (1).png", AssetType.IMAGE);
		
		className.set ("assets/Background2.png", __ASSET__assets_background2_png);
		type.set ("assets/Background2.png", AssetType.IMAGE);
		
		className.set ("assets/Background4.png", __ASSET__assets_background4_png);
		type.set ("assets/Background4.png", AssetType.IMAGE);
		
		className.set ("assets/Bomb.png", __ASSET__assets_bomb_png);
		type.set ("assets/Bomb.png", AssetType.IMAGE);
		
		className.set ("assets/bosssheet.png", __ASSET__assets_bosssheet_png);
		type.set ("assets/bosssheet.png", AssetType.IMAGE);
		
		className.set ("assets/bosssheet2.png", __ASSET__assets_bosssheet2_png);
		type.set ("assets/bosssheet2.png", AssetType.IMAGE);
		
		className.set ("assets/buttonsmedium2.png", __ASSET__assets_buttonsmedium2_png);
		type.set ("assets/buttonsmedium2.png", AssetType.IMAGE);
		
		className.set ("assets/Coin1.png", __ASSET__assets_coin1_png);
		type.set ("assets/Coin1.png", AssetType.IMAGE);
		
		className.set ("assets/contestsprite.png", __ASSET__assets_contestsprite_png);
		type.set ("assets/contestsprite.png", AssetType.IMAGE);
		
		className.set ("assets/fireball.png", __ASSET__assets_fireball_png);
		type.set ("assets/fireball.png", AssetType.IMAGE);
		
		className.set ("assets/Game-Over.png", __ASSET__assets_game_over_png);
		type.set ("assets/Game-Over.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/Map1.png", __ASSET__assets_map1_png);
		type.set ("assets/Map1.png", AssetType.IMAGE);
		
		className.set ("assets/Map2.png", __ASSET__assets_map2_png);
		type.set ("assets/Map2.png", AssetType.IMAGE);
		
		className.set ("assets/Map3.png", __ASSET__assets_map3_png);
		type.set ("assets/Map3.png", AssetType.IMAGE);
		
		className.set ("assets/mapCSV_Group1_zombies.csv", __ASSET__assets_mapcsv_group1_zombies_csv);
		type.set ("assets/mapCSV_Group1_zombies.csv", AssetType.TEXT);
		
		className.set ("assets/Maps0037.png", __ASSET__assets_maps0037_png);
		type.set ("assets/Maps0037.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0038.png", __ASSET__assets_maps0038_png);
		type.set ("assets/Maps0038.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0039.png", __ASSET__assets_maps0039_png);
		type.set ("assets/Maps0039.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0040.png", __ASSET__assets_maps0040_png);
		type.set ("assets/Maps0040.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0041.png", __ASSET__assets_maps0041_png);
		type.set ("assets/Maps0041.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0042.png", __ASSET__assets_maps0042_png);
		type.set ("assets/Maps0042.png", AssetType.IMAGE);
		
		className.set ("assets/Maps0043.png", __ASSET__assets_maps0043_png);
		type.set ("assets/Maps0043.png", AssetType.IMAGE);
		
		className.set ("assets/MoGames.png", __ASSET__assets_mogames_png);
		type.set ("assets/MoGames.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/newerbuttons26.png", __ASSET__assets_newerbuttons26_png);
		type.set ("assets/newerbuttons26.png", AssetType.IMAGE);
		
		className.set ("assets/pauselayer.png", __ASSET__assets_pauselayer_png);
		type.set ("assets/pauselayer.png", AssetType.IMAGE);
		
		className.set ("assets/R1.png", __ASSET__assets_r1_png);
		type.set ("assets/R1.png", AssetType.IMAGE);
		
		className.set ("assets/R2.png", __ASSET__assets_r2_png);
		type.set ("assets/R2.png", AssetType.IMAGE);
		
		className.set ("assets/R3.png", __ASSET__assets_r3_png);
		type.set ("assets/R3.png", AssetType.IMAGE);
		
		className.set ("assets/robotcloud.png", __ASSET__assets_robotcloud_png);
		type.set ("assets/robotcloud.png", AssetType.IMAGE);
		
		className.set ("assets/robotcloud120x120.png", __ASSET__assets_robotcloud120x120_png);
		type.set ("assets/robotcloud120x120.png", AssetType.IMAGE);
		
		className.set ("assets/scene1.png", __ASSET__assets_scene1_png);
		type.set ("assets/scene1.png", AssetType.IMAGE);
		
		className.set ("assets/scene2-1.png", __ASSET__assets_scene2_1_png);
		type.set ("assets/scene2-1.png", AssetType.IMAGE);
		
		className.set ("assets/scene2-2.png", __ASSET__assets_scene2_2_png);
		type.set ("assets/scene2-2.png", AssetType.IMAGE);
		
		className.set ("assets/scene2-3.png", __ASSET__assets_scene2_3_png);
		type.set ("assets/scene2-3.png", AssetType.IMAGE);
		
		className.set ("assets/scene2.png", __ASSET__assets_scene2_png);
		type.set ("assets/scene2.png", AssetType.IMAGE);
		
		className.set ("assets/scene3-1.png", __ASSET__assets_scene3_1_png);
		type.set ("assets/scene3-1.png", AssetType.IMAGE);
		
		className.set ("assets/scene3-2.png", __ASSET__assets_scene3_2_png);
		type.set ("assets/scene3-2.png", AssetType.IMAGE);
		
		className.set ("assets/Shotgun49x12.png", __ASSET__assets_shotgun49x12_png);
		type.set ("assets/Shotgun49x12.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/BG sound in loop maybe.mp3", __ASSET__assets_sounds_bg_sound_in_loop_maybe_mp3);
		type.set ("assets/sounds/BG sound in loop maybe.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Decisions.mp3", __ASSET__assets_sounds_decisions_mp3);
		type.set ("assets/sounds/Decisions.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/grenade.wav", __ASSET__assets_sounds_grenade_wav);
		type.set ("assets/sounds/grenade.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/gun.wav", __ASSET__assets_sounds_gun_wav);
		type.set ("assets/sounds/gun.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/shotgun.wav", __ASSET__assets_sounds_shotgun_wav);
		type.set ("assets/sounds/shotgun.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/What You Want ver 2.mp3", __ASSET__assets_sounds_what_you_want_ver_2_mp3);
		type.set ("assets/sounds/What You Want ver 2.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sprites (1).png", __ASSET__assets_sprites__1__png);
		type.set ("assets/Sprites (1).png", AssetType.IMAGE);
		
		className.set ("assets/Title (1).png", __ASSET__assets_title__1__png);
		type.set ("assets/Title (1).png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades0019.png", __ASSET__assets_upgrades0019_png);
		type.set ("assets/Upgrades0019.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades0020.png", __ASSET__assets_upgrades0020_png);
		type.set ("assets/Upgrades0020.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades0021.png", __ASSET__assets_upgrades0021_png);
		type.set ("assets/Upgrades0021.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades0023.png", __ASSET__assets_upgrades0023_png);
		type.set ("assets/Upgrades0023.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades0024.png", __ASSET__assets_upgrades0024_png);
		type.set ("assets/Upgrades0024.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades320023.png", __ASSET__assets_upgrades320023_png);
		type.set ("assets/Upgrades320023.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades500019.png", __ASSET__assets_upgrades500019_png);
		type.set ("assets/Upgrades500019.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades500020.png", __ASSET__assets_upgrades500020_png);
		type.set ("assets/Upgrades500020.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades500021.png", __ASSET__assets_upgrades500021_png);
		type.set ("assets/Upgrades500021.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades500023.png", __ASSET__assets_upgrades500023_png);
		type.set ("assets/Upgrades500023.png", AssetType.IMAGE);
		
		className.set ("assets/Upgrades500024.png", __ASSET__assets_upgrades500024_png);
		type.set ("assets/Upgrades500024.png", AssetType.IMAGE);
		
		className.set ("assets/zombieblood.png", __ASSET__assets_zombieblood_png);
		type.set ("assets/zombieblood.png", AssetType.IMAGE);
		
		className.set ("assets/zombiecar.png", __ASSET__assets_zombiecar_png);
		type.set ("assets/zombiecar.png", AssetType.IMAGE);
		
		className.set ("assets/Zombiegirl1.png", __ASSET__assets_zombiegirl1_png);
		type.set ("assets/Zombiegirl1.png", AssetType.IMAGE);
		
		className.set ("assets/zombiegirl2.png", __ASSET__assets_zombiegirl2_png);
		type.set ("assets/zombiegirl2.png", AssetType.IMAGE);
		
		className.set ("assets/zombiegirl3.png", __ASSET__assets_zombiegirl3_png);
		type.set ("assets/zombiegirl3.png", AssetType.IMAGE);
		
		className.set ("assets/zombieguy1.png", __ASSET__assets_zombieguy1_png);
		type.set ("assets/zombieguy1.png", AssetType.IMAGE);
		
		className.set ("assets/zombieguy2.png", __ASSET__assets_zombieguy2_png);
		type.set ("assets/zombieguy2.png", AssetType.IMAGE);
		
		className.set ("assets/zombieguy3.png", __ASSET__assets_zombieguy3_png);
		type.set ("assets/zombieguy3.png", AssetType.IMAGE);
		
		className.set ("assets/zombieguy4.png", __ASSET__assets_zombieguy4_png);
		type.set ("assets/zombieguy4.png", AssetType.IMAGE);
		
		className.set ("assets/Zombiehunter.png", __ASSET__assets_zombiehunter_png);
		type.set ("assets/Zombiehunter.png", AssetType.IMAGE);
		
		className.set ("assets/zombiemap.png", __ASSET__assets_zombiemap_png);
		type.set ("assets/zombiemap.png", AssetType.IMAGE);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
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
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
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
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
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
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
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
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
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
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
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
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_background1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_background2__1__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_background2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_background4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bomb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bosssheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bosssheet2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_buttonsmedium2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_coin1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_contestsprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fireball_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_game_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_map1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_map2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_map3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_group1_zombies_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_maps0037_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0038_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0039_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0040_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0041_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0042_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_maps0043_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mogames_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_newerbuttons26_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_pauselayer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_r1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_r2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_r3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_robotcloud_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_robotcloud120x120_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene2_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene2_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene2_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene3_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_scene3_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_shotgun49x12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bg_sound_in_loop_maybe_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_decisions_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_grenade_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_gun_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shotgun_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_what_you_want_ver_2_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sprites__1__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_title__1__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades320023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades500019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades500020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades500021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades500023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_upgrades500024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombieblood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiecar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiegirl1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiegirl2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiegirl3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombieguy1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombieguy2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombieguy3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombieguy4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiehunter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_zombiemap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }


#elseif html5















































































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 

































#else



#if (windows || mac || linux || cpp)


@:image("assets/1.png") #if display private #end class __ASSET__assets_1_png extends lime.graphics.Image {}
@:image("assets/2.png") #if display private #end class __ASSET__assets_2_png extends lime.graphics.Image {}
@:image("assets/3.png") #if display private #end class __ASSET__assets_3_png extends lime.graphics.Image {}
@:image("assets/4.png") #if display private #end class __ASSET__assets_4_png extends lime.graphics.Image {}
@:image("assets/Background1.png") #if display private #end class __ASSET__assets_background1_png extends lime.graphics.Image {}
@:image("assets/Background2 (1).png") #if display private #end class __ASSET__assets_background2__1__png extends lime.graphics.Image {}
@:image("assets/Background2.png") #if display private #end class __ASSET__assets_background2_png extends lime.graphics.Image {}
@:image("assets/Background4.png") #if display private #end class __ASSET__assets_background4_png extends lime.graphics.Image {}
@:image("assets/Bomb.png") #if display private #end class __ASSET__assets_bomb_png extends lime.graphics.Image {}
@:image("assets/bosssheet.png") #if display private #end class __ASSET__assets_bosssheet_png extends lime.graphics.Image {}
@:image("assets/bosssheet2.png") #if display private #end class __ASSET__assets_bosssheet2_png extends lime.graphics.Image {}
@:image("assets/buttonsmedium2.png") #if display private #end class __ASSET__assets_buttonsmedium2_png extends lime.graphics.Image {}
@:image("assets/Coin1.png") #if display private #end class __ASSET__assets_coin1_png extends lime.graphics.Image {}
@:image("assets/contestsprite.png") #if display private #end class __ASSET__assets_contestsprite_png extends lime.graphics.Image {}
@:image("assets/fireball.png") #if display private #end class __ASSET__assets_fireball_png extends lime.graphics.Image {}
@:image("assets/Game-Over.png") #if display private #end class __ASSET__assets_game_over_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/Map1.png") #if display private #end class __ASSET__assets_map1_png extends lime.graphics.Image {}
@:image("assets/Map2.png") #if display private #end class __ASSET__assets_map2_png extends lime.graphics.Image {}
@:image("assets/Map3.png") #if display private #end class __ASSET__assets_map3_png extends lime.graphics.Image {}
@:file("assets/mapCSV_Group1_zombies.csv") #if display private #end class __ASSET__assets_mapcsv_group1_zombies_csv extends lime.utils.Bytes {}
@:image("assets/Maps0037.png") #if display private #end class __ASSET__assets_maps0037_png extends lime.graphics.Image {}
@:image("assets/Maps0038.png") #if display private #end class __ASSET__assets_maps0038_png extends lime.graphics.Image {}
@:image("assets/Maps0039.png") #if display private #end class __ASSET__assets_maps0039_png extends lime.graphics.Image {}
@:image("assets/Maps0040.png") #if display private #end class __ASSET__assets_maps0040_png extends lime.graphics.Image {}
@:image("assets/Maps0041.png") #if display private #end class __ASSET__assets_maps0041_png extends lime.graphics.Image {}
@:image("assets/Maps0042.png") #if display private #end class __ASSET__assets_maps0042_png extends lime.graphics.Image {}
@:image("assets/Maps0043.png") #if display private #end class __ASSET__assets_maps0043_png extends lime.graphics.Image {}
@:image("assets/MoGames.png") #if display private #end class __ASSET__assets_mogames_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:image("assets/newerbuttons26.png") #if display private #end class __ASSET__assets_newerbuttons26_png extends lime.graphics.Image {}
@:image("assets/pauselayer.png") #if display private #end class __ASSET__assets_pauselayer_png extends lime.graphics.Image {}
@:image("assets/R1.png") #if display private #end class __ASSET__assets_r1_png extends lime.graphics.Image {}
@:image("assets/R2.png") #if display private #end class __ASSET__assets_r2_png extends lime.graphics.Image {}
@:image("assets/R3.png") #if display private #end class __ASSET__assets_r3_png extends lime.graphics.Image {}
@:image("assets/robotcloud.png") #if display private #end class __ASSET__assets_robotcloud_png extends lime.graphics.Image {}
@:image("assets/robotcloud120x120.png") #if display private #end class __ASSET__assets_robotcloud120x120_png extends lime.graphics.Image {}
@:image("assets/scene1.png") #if display private #end class __ASSET__assets_scene1_png extends lime.graphics.Image {}
@:image("assets/scene2-1.png") #if display private #end class __ASSET__assets_scene2_1_png extends lime.graphics.Image {}
@:image("assets/scene2-2.png") #if display private #end class __ASSET__assets_scene2_2_png extends lime.graphics.Image {}
@:image("assets/scene2-3.png") #if display private #end class __ASSET__assets_scene2_3_png extends lime.graphics.Image {}
@:image("assets/scene2.png") #if display private #end class __ASSET__assets_scene2_png extends lime.graphics.Image {}
@:image("assets/scene3-1.png") #if display private #end class __ASSET__assets_scene3_1_png extends lime.graphics.Image {}
@:image("assets/scene3-2.png") #if display private #end class __ASSET__assets_scene3_2_png extends lime.graphics.Image {}
@:image("assets/Shotgun49x12.png") #if display private #end class __ASSET__assets_shotgun49x12_png extends lime.graphics.Image {}
@:file("assets/sounds/BG sound in loop maybe.mp3") #if display private #end class __ASSET__assets_sounds_bg_sound_in_loop_maybe_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/Decisions.mp3") #if display private #end class __ASSET__assets_sounds_decisions_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/grenade.wav") #if display private #end class __ASSET__assets_sounds_grenade_wav extends lime.utils.Bytes {}
@:file("assets/sounds/gun.wav") #if display private #end class __ASSET__assets_sounds_gun_wav extends lime.utils.Bytes {}
@:file("assets/sounds/shotgun.wav") #if display private #end class __ASSET__assets_sounds_shotgun_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/What You Want ver 2.mp3") #if display private #end class __ASSET__assets_sounds_what_you_want_ver_2_mp3 extends lime.utils.Bytes {}
@:image("assets/Sprites (1).png") #if display private #end class __ASSET__assets_sprites__1__png extends lime.graphics.Image {}
@:image("assets/Title (1).png") #if display private #end class __ASSET__assets_title__1__png extends lime.graphics.Image {}
@:image("assets/Upgrades0019.png") #if display private #end class __ASSET__assets_upgrades0019_png extends lime.graphics.Image {}
@:image("assets/Upgrades0020.png") #if display private #end class __ASSET__assets_upgrades0020_png extends lime.graphics.Image {}
@:image("assets/Upgrades0021.png") #if display private #end class __ASSET__assets_upgrades0021_png extends lime.graphics.Image {}
@:image("assets/Upgrades0023.png") #if display private #end class __ASSET__assets_upgrades0023_png extends lime.graphics.Image {}
@:image("assets/Upgrades0024.png") #if display private #end class __ASSET__assets_upgrades0024_png extends lime.graphics.Image {}
@:image("assets/Upgrades320023.png") #if display private #end class __ASSET__assets_upgrades320023_png extends lime.graphics.Image {}
@:image("assets/Upgrades500019.png") #if display private #end class __ASSET__assets_upgrades500019_png extends lime.graphics.Image {}
@:image("assets/Upgrades500020.png") #if display private #end class __ASSET__assets_upgrades500020_png extends lime.graphics.Image {}
@:image("assets/Upgrades500021.png") #if display private #end class __ASSET__assets_upgrades500021_png extends lime.graphics.Image {}
@:image("assets/Upgrades500023.png") #if display private #end class __ASSET__assets_upgrades500023_png extends lime.graphics.Image {}
@:image("assets/Upgrades500024.png") #if display private #end class __ASSET__assets_upgrades500024_png extends lime.graphics.Image {}
@:image("assets/zombieblood.png") #if display private #end class __ASSET__assets_zombieblood_png extends lime.graphics.Image {}
@:image("assets/zombiecar.png") #if display private #end class __ASSET__assets_zombiecar_png extends lime.graphics.Image {}
@:image("assets/Zombiegirl1.png") #if display private #end class __ASSET__assets_zombiegirl1_png extends lime.graphics.Image {}
@:image("assets/zombiegirl2.png") #if display private #end class __ASSET__assets_zombiegirl2_png extends lime.graphics.Image {}
@:image("assets/zombiegirl3.png") #if display private #end class __ASSET__assets_zombiegirl3_png extends lime.graphics.Image {}
@:image("assets/zombieguy1.png") #if display private #end class __ASSET__assets_zombieguy1_png extends lime.graphics.Image {}
@:image("assets/zombieguy2.png") #if display private #end class __ASSET__assets_zombieguy2_png extends lime.graphics.Image {}
@:image("assets/zombieguy3.png") #if display private #end class __ASSET__assets_zombieguy3_png extends lime.graphics.Image {}
@:image("assets/zombieguy4.png") #if display private #end class __ASSET__assets_zombieguy4_png extends lime.graphics.Image {}
@:image("assets/Zombiehunter.png") #if display private #end class __ASSET__assets_zombiehunter_png extends lime.graphics.Image {}
@:image("assets/zombiemap.png") #if display private #end class __ASSET__assets_zombiemap_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_down.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_left.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_right.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_up.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_thin.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_toggle.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/check_box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/check_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_flat.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_inset.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_light.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/dropdown_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/finger_big.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/finger_small.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/hilight.png") #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/invis.png") #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/minus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/plus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/radio.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/radio_dot.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/swatch.png") #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tab.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tab_back.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tooltip_arrow.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/defaults.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/default_loading_screen.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/default_popup.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends lime.utils.Bytes {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end