package
{

	import caurina.transitions.Tweener;

	import flash.media.SoundMixer;

	import net.fpp.services.store.StoreManagerMock;

	import net.fpp.services.store.StaticStoreManager;

	import rv2.sound.SoundHandler;

	import src.assets.TerrainTextures;

	import src.constant.CLeaderBoards;

	import src.data.DataManager;

	CONFIG::IS_IOS_VERSION {
		import flash.desktop.NativeApplication;
	}
	CONFIG::IS_ANDROID_VERSION {
		import flash.desktop.NativeApplication;
	}

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;

	CONFIG::IS_IOS_VERSION {
		import net.flashplusplus.Snapdragon.GameCenter.SDGameCenterManager;
		import net.flashplusplus.Snapdragon.GameCenter.events.SDAuthenticationEvent;
		import net.flashplusplus.Snapdragon.Snapdragon;
		import net.flashplusplus.Snapdragon.iAdNetwork.events.SDAdEvent;
		import net.flashplusplus.Snapdragon.iAdNetwork.SDAdManager;
		import net.flashplusplus.Snapdragon.InAppStore.SDStoreManager;
		import net.flashplusplus.Snapdragon.SocialCenter.SDSocialManager;
		import net.flashplusplus.Snapdragon.NotificationCenter.SDNotificationManager;
		import net.flashplusplus.Snapdragon.NotificationCenter.SDLocalNotification;
		import net.flashplusplus.Snapdragon.GameCenter.SDAchievement;
		import net.flashplusplus.Snapdragon.GameCenter.SDLeaderboard;

		import flash.media.AudioPlaybackMode;
	}

	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	import starling.textures.Texture;

	import flash.net.navigateToURL;
	import flash.net.URLRequest;

	import net.fpp.starling.StaticAssetManager;

	[SWF(width="480", height="320", frameRate="60", backgroundColor="#000000")]
	public class MountainMonsterIOSMain extends Sprite
	{

		public static var LOG_ENABLED:Boolean = true;
		public static var IS_ALL_LEVEL_ENABLED:Boolean = true;
		public static var IS_ALL_CAR_ENABLED:Boolean = true;
		public static var IS_IOS:Boolean;
		public static var AD_BLOCKED:Boolean;
		public static var APP_ID:String = "net.flashplusplus.mountainmonster";

		CONFIG::IS_IOS_VERSION {
			public static var gcManager:SDGameCenterManager;
			public static var adManager:SDAdManager;
			public static var socialManager:SDSocialManager;
			public static var notificationManager:SDNotificationManager;
		}

		public static const URL_EXT:String = "?utm_source=mountain_monster_ios&utm_medium=banner&utm_campaign=iOSGames";
		public static const HOME_LINK:String = "http://flashplusplus.net/ios-games" + URL_EXT;
		public static const FACEBOOK_LINK:String = "https://www.facebook.com/flashplusplus";
		public static const RATING_LINK:String = "https://itunes.apple.com/us/app/mountain-monster/id1041815415?ls=1&mt=8";
		public static const MUSIC_SOURCE_LINK:String = "http://soundimage.org";

		[Embed(source="../assets/system/startupHD.png")]
		private static var BackgroundHD:Class;
		[Embed(source="../assets/system/startup_ipad_small.png")]
		private static var BackgroundIPAD:Class;
		[Embed(source="../assets/system/startup_ipad_large.png")]
		private static var BackgroundIPADLarge:Class;

		private var mStarling:Starling;

		private var _loaded:Boolean = false;

		public function MountainMonsterIOSMain():void
		{
			addEventListener( flash.events.Event.ADDED_TO_STAGE, initSWF );
		}

		private function initSWF( event:flash.events.Event ):void
		{
			removeEventListener( flash.events.Event.ADDED_TO_STAGE, initSWF );
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP;

			TerrainTextures.init();

			initSounds();
			initStarling();
		}

		private function initSounds():void
		{
			SoundHandler.attach( SND_WIN, "SND_WIN", "fx" );
			SoundHandler.attach( SND_MENU_BACK, "SND_MENU_BACK", "music" );
			SoundHandler.attach( SND_GAME_BACK, "SND_GAME_BACK", "music" );
			SoundHandler.attach( SND_FAIL, "SND_FAIL", "fx" );
			SoundHandler.attach( SND_BUTTON, "SND_BUTTON", "fx" );
			SoundHandler.attach( SND_FLIP, "SND_FLIP", "fx" );
			SoundHandler.attach( SND_COUNTER_1, "SND_COUNTER_1", "fx" );
			SoundHandler.attach( SND_COUNTER_2, "SND_COUNTER_2", "fx" );
			SoundHandler.attach( SND_COUNTER_3, "SND_COUNTER_3", "fx" );
		}

		private function initStarling():void
		{
			StaticAssetManager.scaleFactor = 2;

			IS_IOS = Capabilities.manufacturer.indexOf( "iOS" ) != -1;
			CONFIG::IS_IOS_VERSION
			{
				if( IS_IOS )
				{
					gcManager = Snapdragon.instance.gameCenterManager;
					adManager = Snapdragon.instance.adManager;
					adManager.addEventListener( SDAdEvent.ADMOB_FULL_SCREEN_VIEW_LOADED, pauseByAd );
					adManager.addEventListener( SDAdEvent.ADMOB_FULL_SCREEN_VIEW_AD_ACTION_FINISHED, resumeByAd );
					socialManager = Snapdragon.instance.socialManager;
					notificationManager = Snapdragon.instance.notificationManager;
					notificationRequest();

					StaticStoreManager.init( Snapdragon.instance.storeManager );
				}

				SoundMixer.audioPlaybackMode = AudioPlaybackMode.AMBIENT;
			}

			if( !IS_IOS )
			{
				StaticStoreManager.init( new StoreManagerMock() );
			}

			var MAC:Boolean = ( CONFIG::IS_IOS_VERSION || CONFIG::IS_ANDROID_VERSION ) ? false : true;
			var isIPAD:Boolean = MAC ? false : ( stage.fullScreenHeight == 768 || stage.fullScreenHeight == 1536 ) ? true : false;
			var stageWidth:int = 0;
			var stageHeight:int = 0;
			if( isIPAD )
			{
				stageWidth = 1024 / 2;
				stageHeight = 768 / 2;
			}
			else
			{
				stageWidth = !MAC ? ( ( stage.fullScreenWidth / stage.fullScreenHeight != 480 / 320 ) ? 568 : 480 ) : ( ( stage.stageWidth / stage.stageHeight != 480 / 320 ) ? 568 : 480 );
				stageHeight = 320;
			}
			Starling.multitouchEnabled = true;
			Starling.handleLostContext = MAC ? true : !IS_IOS;
			var viewPort:Rectangle = RectangleUtil.fit(
					new Rectangle( 0, 0, stageWidth, stageHeight ),
					new Rectangle( 0, 0, MAC ? stage.stageWidth : stage.fullScreenWidth, MAC ? stage.stageHeight : stage.fullScreenHeight ),
					ScaleMode.SHOW_ALL, IS_IOS
			);

			var background:Bitmap = stage.fullScreenHeight == 768 ? new BackgroundIPAD : ( stage.fullScreenHeight == 1536 ? new BackgroundIPADLarge : new BackgroundHD() );
			var tmpWidth:Number = IS_IOS ? stage.fullScreenWidth : stage.stageWidth;
			var tmpHeight:Number = IS_IOS ? stage.fullScreenHeight : stage.stageHeight;

			background.x = tmpWidth / 2 - background.width / 2;
			background.y = tmpHeight / 2 - background.height / 2;
			background.smoothing = true;
			addChild( background );
			mStarling = new Starling( MountainMonsterIOS, stage, viewPort );
			mStarling.stage.stageWidth = stageWidth;
			mStarling.stage.stageHeight = stageHeight;
			mStarling.simulateMultitouch = false;
			mStarling.enableErrorChecking = false;
			mStarling.antiAliasing = 3;

			mStarling.addEventListener( starling.events.Event.ROOT_CREATED, function ():void
			{
				removeChild( background );
				var game:MountainMonsterIOS = mStarling.root as MountainMonsterIOS;
				var preloaderImage:Texture = Texture.fromBitmap( background, false, false, 2 );
				background.bitmapData.dispose();
				background = null;
				game.start( preloaderImage );
				mStarling.start();
				CONFIG::IS_IOS_VERSION {
					if( IS_IOS && !gcManager.isAuthenticated() && gcManager.isGameCenterAvailable() )
					{
						gcManager.gameCenterAuthentication();
					}
				}
			} );
			CONFIG::IS_IOS_VERSION {
				NativeApplication.nativeApplication.addEventListener( flash.events.Event.ACTIVATE, onActivate );
				NativeApplication.nativeApplication.addEventListener( flash.events.Event.DEACTIVATE, onDeactivate );
			}
			CONFIG::IS_ANDROID_VERSION {
				NativeApplication.nativeApplication.addEventListener( flash.events.Event.ACTIVATE, onActivate );
				NativeApplication.nativeApplication.addEventListener( flash.events.Event.DEACTIVATE, onDeactivate );
			}
			if( !CONFIG::IS_IOS_VERSION && !CONFIG::IS_ANDROID_VERSION )
			{
				stage.addEventListener( flash.events.Event.ACTIVATE, onActivate );
				stage.addEventListener( flash.events.Event.DEACTIVATE, onDeactivate );
			}
			_loaded = true;
		}

		CONFIG::IS_MOBILE_VERSION {
			private function pauseByAd( event:SDAdEvent ):void
			{
				Tweener.pauseAllTweens();
				mStarling.stop();
				SoundHandler.setGroupVolume( 'music', 0 );
				SoundHandler.setBaseGroupVolume( 'music', 0 );
				SoundHandler.setGroupVolume( 'fx', 0 );
				SoundHandler.setBaseGroupVolume( 'fx', 0 );
			}

			private function resumeByAd( event:SDAdEvent ):void
			{
				Tweener.resumeAllTweens();
				mStarling.start();
				SoundHandler.setGroupVolume( 'music', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setBaseGroupVolume( 'music', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setGroupVolume( 'fx', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setBaseGroupVolume( 'fx', DataManager.getIsMutedState ? 0 : 1 );
			}
		}

		private function onActivate( event:flash.events.Event ):void
		{
			mStarling.start();
			Tweener.updateTime();
			Tweener.resumeAllTweens();

			if( Starling.current.root )
			{
				( Starling.current.root as MountainMonsterIOS ).resume();
			}

			CONFIG::IS_IOS_VERSION {
				if( IS_IOS && !gcManager.isAuthenticated() && gcManager.isGameCenterAvailable() )
				{
					gcManager.gameCenterAuthentication();
				}
			}

			trace( "APP ACTIVATED" );
		}

		private function onDeactivate( event:flash.events.Event ):void
		{
			Tweener.pauseAllTweens();
			if( !_loaded )
			{
				return;
			}
			( Starling.current && Starling.current.root && Starling.current.root as MountainMonsterIOS ).pause();
			mStarling.stop();

			trace( "APP DEACTIVATED" );
		}

		public static function openToplist():void
		{
			CONFIG::IS_MOBILE_VERSION
			{
				gcManager.showLeaderboard( CLeaderBoards.LEADERBOARD_NAME, SDLeaderboard.TIME_SCOPE_TODAY );
			}
		}

		public static function openAchievements():void
		{
			CONFIG::IS_MOBILE_VERSION
			{
				gcManager.showAchievements();
			}
		}

		public static function facebookRequest():void
		{
			navigateToURL( new URLRequest( FACEBOOK_LINK ), "_blank" );
		}

		public static function goToHome():void
		{
			navigateToURL( new URLRequest( HOME_LINK ), "_blank" );
		}

		public static function goToRating():void
		{
			navigateToURL( new URLRequest( RATING_LINK ), "_blank" );
		}

		public static function goToMusicSource():void
		{
			navigateToURL( new URLRequest( MUSIC_SOURCE_LINK ), "_blank" );
		}

		public static function notificationRequest():void
		{
			// Temporary disabled!
			return;
			CONFIG::IS_MOBILE_VERSION
			{
				notificationManager.cancelLocalNotification( "mountain_monster_play_again" );

				var date:Date = new Date();
				date.time += 1000 * 60 * 60 * 24 * 14;

				var notification:SDLocalNotification = new SDLocalNotification( "mountain_monster_play_again", "Ready for some 4x4?", date );
				notification.alertAction = "Let's Ride!";
				notificationManager.addLocalNotification( notification );
			}
		}
	}
}