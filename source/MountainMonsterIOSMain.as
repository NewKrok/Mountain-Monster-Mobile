package
{

	import caurina.transitions.Tweener;

	import flash.media.SoundMixer;

	import net.fpp.common.services.store.StaticStoreManager;
	import net.fpp.common.services.store.StoreManagerMock;

	import net.fpp.common.starling.StaticAssetManager;
	import net.fpp.common.starling.constant.CAspectRatio;
	import net.fpp.common.starling.core.AStarlingMain;

	import rv2.sound.SoundHandler;

	import src.assets.TerrainTextures;

	import src.constant.CLeaderBoard;

	import src.common.DataManager;

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
	import flash.geom.Rectangle;
	import flash.system.Capabilities;

	CONFIG::IS_IOS_VERSION {
		import net.flashplusplus.Snapdragon.GameCenter.SDGameCenterManager;
		import net.flashplusplus.Snapdragon.Snapdragon;
		import net.flashplusplus.Snapdragon.iAdNetwork.events.SDAdEvent;
		import net.flashplusplus.Snapdragon.iAdNetwork.SDAdManager;
		import net.flashplusplus.Snapdragon.SocialCenter.SDSocialManager;
		import net.flashplusplus.Snapdragon.NotificationCenter.SDNotificationManager;
		import net.flashplusplus.Snapdragon.NotificationCenter.SDLocalNotification;
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

	[SWF(width="480", height="320", frameRate="60", backgroundColor="#000000")]
	public class MountainMonsterIOSMain extends AStarlingMain
	{
		public static var LOG_ENABLED:Boolean = true;
		public static var IS_ALL_LEVEL_ENABLED:Boolean = true;
		public static var IS_ALL_CAR_ENABLED:Boolean = true;

		public static var IS_IOS:Boolean = false;
		public static var AD_BLOCKED:Boolean = false;
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

		private var _background:Bitmap;

		private var _loaded:Boolean = false;

		public function MountainMonsterIOSMain():void
		{
			this.setPreAppConfig();

			super();
		}

		private function setPreAppConfig():void
		{
			this._aspectRatio = CAspectRatio.LANDSCAPE;

			StaticAssetManager.scaleFactor = 2;

			Starling.multitouchEnabled = true;

			TerrainTextures.init();

			this.initSounds();
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

		override protected function onInit():void
		{
			CONFIG::IS_IOS_VERSION
			{
				if( this._isIOS )
				{
					gcManager = Snapdragon.instance.gameCenterManager;
					adManager = Snapdragon.instance.adManager;
					adManager.addEventListener( SDAdEvent.ADMOB_FULL_SCREEN_VIEW_LOADED, pauseByAd );
					adManager.addEventListener( SDAdEvent.ADMOB_FULL_SCREEN_VIEW_AD_ACTION_FINISHED, resumeByAd );
					socialManager = Snapdragon.instance.socialManager;
					notificationManager = Snapdragon.instance.notificationManager;
					this.notificationRequest();

					StaticStoreManager.init( Snapdragon.instance.storeManager );
				}

				SoundMixer.audioPlaybackMode = AudioPlaybackMode.AMBIENT;
			}

			if( !this._isIOS )
			{
				StaticStoreManager.init( new StoreManagerMock() );
			}

			this._background = this.stage.fullScreenHeight == 768 ? new BackgroundIPAD : ( this.stage.fullScreenHeight == 1536 ? new BackgroundIPADLarge : new BackgroundHD() );
			var tmpWidth:Number = this._isIOS ? this.stage.fullScreenWidth : this.stage.stageWidth;
			var tmpHeight:Number = this._isIOS ? this.stage.fullScreenHeight : this.stage.stageHeight;

			this._background.x = tmpWidth / 2 - this._background.width / 2;
			this._background.y = tmpHeight / 2 - this._background.height / 2;
			this._background.smoothing = true;
			this.addChild( this._background );

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

			this.createStarling( MountainMonsterIOS );

			this._starlingObject.skipUnchangedFrames = true;

			this.setAppConfig();
		}

		private function setAppConfig():void
		{
			this._starlingObject.simulateMultitouch = false;
			this._starlingObject.enableErrorChecking = false;
			this._starlingObject.antiAliasing = 3;

			Starling.current.showStats = true;
		}

		override protected function onStarlingRootCreated():void
		{
			this.removeChild( this._background );

			var game:MountainMonsterIOS = this._starlingObject.root as MountainMonsterIOS;
			var preloaderImage:Texture = Texture.fromBitmap( this._background, false, false, 2 );
			game.start( preloaderImage );

			this._background.bitmapData.dispose();
			this._background = null;

			CONFIG::IS_IOS_VERSION {
				if( IS_IOS && !gcManager.isAuthenticated() && gcManager.isGameCenterAvailable() )
				{
					gcManager.gameCenterAuthentication();
				}
			}
		}

		CONFIG::IS_MOBILE_VERSION {
			private function pauseByAd( event:SDAdEvent ):void
			{
				Tweener.pauseAllTweens();
				this._starlingObject.stop();
				SoundHandler.setGroupVolume( 'music', 0 );
				SoundHandler.setBaseGroupVolume( 'music', 0 );
				SoundHandler.setGroupVolume( 'fx', 0 );
				SoundHandler.setBaseGroupVolume( 'fx', 0 );
			}

			private function resumeByAd( event:SDAdEvent ):void
			{
				Tweener.resumeAllTweens();
				this._starlingObject.start();
				SoundHandler.setGroupVolume( 'music', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setBaseGroupVolume( 'music', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setGroupVolume( 'fx', DataManager.getIsMutedState ? 0 : 1 );
				SoundHandler.setBaseGroupVolume( 'fx', DataManager.getIsMutedState ? 0 : 1 );
			}
		}

		private function onActivate( event:flash.events.Event ):void
		{
			this._starlingObject.start();
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
		}

		private function onDeactivate( event:flash.events.Event ):void
		{
			Tweener.pauseAllTweens();
			if( !_loaded || !Starling.current || !Starling.current.root )
			{
				return;
			}
			( Starling.current && Starling.current.root && Starling.current.root as MountainMonsterIOS ).pause();
			this._starlingObject.stop();
		}

		public static function openToplist():void
		{
			CONFIG::IS_MOBILE_VERSION
			{
				gcManager.showLeaderboard( CLeaderBoard.LEADERBOARD_NAME, SDLeaderboard.TIME_SCOPE_TODAY );
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