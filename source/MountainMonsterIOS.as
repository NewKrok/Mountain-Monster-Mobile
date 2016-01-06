﻿package{	import caurina.transitions.Tweener;	import flash.events.UncaughtErrorEvent;	import src.assets.CarDatas;	import src.data.PlayerData;	import src.events.BaseModuleEvent;	import src.game.events.GameEvent;	CONFIG::IS_MOBILE_VERSION	{		import net.flashplusplus.Snapdragon.InAppStore.events.SDStoreEvent;		import net.flashplusplus.Snapdragon.InAppStore.SDResponse;	}	import net.fpp.services.store.IStoreResponse;	import net.fpp.services.store.StaticStoreManager;	import net.fpp.services.store.events.StoreManagerEvent;	import net.fpp.starling.StaticAssetManager;	import net.fpp.starling.log.LogModule;	import src.constant.CPurchaseItem;	import src.menu.module.rating.RatingModule;	import src.menu.module.carselect.carselectpanel.CarSelectModule;	import src.menu.module.menubackground.MenuBackgroundModule;	import rv2.sound.SoundHandler;	import src.assets.Levels;	import src.data.DataManager;	import src.menu.MainMenu;	import src.menu.Options;	import src.menu.events.MenuEvent;	import src.menu.LevelPackList;	import src.menu.LevelList;	import starling.core.Starling;	import starling.display.Image;	import starling.display.Sprite;	import starling.textures.Texture;	import src.assets.EmbeddedAssets2x;	import src.AbstractPanel;	import src.game.Game;	import src.game.events.GameGuiEvent;	import flash.display.BitmapData;	import starling.events.Event;	public class MountainMonsterIOS extends Sprite	{		private const APP_NAMESPACE:String = 'MountainMonsterIOS';		private var _lastSelectedWorldID:uint;		private var _lastSelectedLevelID:uint;		private var _game:Game;		private var _mainMenu:MainMenu;		private var _options:Options;		private var _normalLevelPacks:LevelPackList;		private var _levelList:LevelList;		private var _ratingModule:RatingModule;		private var _carSelectModule:CarSelectModule;		private var _gamePreloader:Sprite;		private var _preloaderImage:Image;		private var _menuBackgroundModule:MenuBackgroundModule;		private var _logo:Image;		private var _isInited:Boolean;		public function MountainMonsterIOS()		{		}		public function start( background:Texture ):void		{			addChild( _preloaderImage = new Image( background ) );			CONFIG::IS_MOBILE_VERSION			{				if( Starling.current.nativeStage.fullScreenWidth > 1136 )				{					_preloaderImage.width = stage.stageWidth;					_preloaderImage.height = stage.stageHeight;				}			}			CONFIG::IS_FLASH_VERSION			{				_preloaderImage.height = stage.stageHeight;				_preloaderImage.scaleX = _preloaderImage.scaleY;			}			_preloaderImage.x = stage.stageWidth / 2 - _preloaderImage.width / 2;			_preloaderImage.y = stage.stageHeight / 2 - _preloaderImage.height / 2;			this.loadAssets();		}		private function loadAssets():void		{			StaticAssetManager.instance.enqueue( EmbeddedAssets2x );			StaticAssetManager.instance.loadQueue(					function ( ratio:Number ):void					{						if( ratio == 1 )						{							Starling.juggler.delayCall(									function ():void									{										init();									},									0.15 );						}					}			);			resume();		}		private function init():void		{			if ( MountainMonsterIOSMain.LOG_ENABLED ) {				LogModule.createView( this );				LogModule.add( 'Warning: log enabled' );				Starling.current.nativeStage.loaderInfo.uncaughtErrorEvents.addEventListener( UncaughtErrorEvent.UNCAUGHT_ERROR, this.handleGlobalErrors );			}			DataManager.init( APP_NAMESPACE );			PlayerData.carID = DataManager.getLastSelectedCarId();			Levels.init();			StaticStoreManager.addEventListener( StoreManagerEvent.PRODUCT_PURCHASED, productPurchased );			StaticStoreManager.addEventListener( StoreManagerEvent.PRODUCT_PURCHASE_RESTORED, productPurchased );			StaticStoreManager.addEventListener( StoreManagerEvent.PRODUCT_IDENTIFIER_VALIDATION_COMPLETE, storeValidationComplete );			this.validateStore();			var isMuted:Boolean = DataManager.getIsMutedState;			SoundHandler.setBaseGroupVolume( "music", isMuted ? 0 : 1 );			SoundHandler.setBaseGroupVolume( "fx", isMuted ? 0 : 1 );			this.addChildAt( this._menuBackgroundModule = new MenuBackgroundModule(), 0 );			this._menuBackgroundModule.setLevelPackId( DataManager.getLastPlayedLevelPackId() );			addChildAt( _logo = new Image( StaticAssetManager.instance.getTexture( "logo" ) ), 1 );			_logo.x = stage.stageWidth / 2 - _logo.width / 2;			_logo.y = -_logo.height			Tweener.addTween( _preloaderImage, {delay: 1, time: 1, alpha: 0, onComplete: disposePreloader} );			this.enableItemsForTesting();			this.openMainMenu();			_gamePreloader = new Sprite();			_gamePreloader.touchable = false;			var loadingBack:Image = new Image( Texture.fromBitmapData( new BitmapData( stage.stageWidth, stage.stageHeight, false, 0 ) ) );			_gamePreloader.addChild( loadingBack );			var loadingLogo:Image = new Image( StaticAssetManager.instance.getTexture( "loading_logo" ) );			_gamePreloader.addChild( loadingLogo );			loadingLogo.x = loadingBack.width / 2 - loadingLogo.width / 2;			loadingLogo.y = loadingBack.height / 2 - loadingLogo.height / 2;			StaticStoreManager.addEventListener( StoreManagerEvent.PRODUCT_PURCHASED, this.productPurchased );			_isInited = true;		}		private function handleGlobalErrors( e:UncaughtErrorEvent ):void		{			if ( MountainMonsterIOSMain.LOG_ENABLED )			{				LogModule.add( 'Uncaught error: ' + e.error.getStackTrace() );			}			e.preventDefault();		}		private function enableItemsForTesting():void		{			if ( MountainMonsterIOSMain.IS_ALL_LEVEL_ENABLED )			{				this.enableLevelsForTesting();			}			if ( MountainMonsterIOSMain.IS_ALL_CAR_ENABLED )			{				this.enableCarsForTesting();			}		}		private function enableLevelsForTesting():void		{			DataManager.unlockLevelPack( 1 );			DataManager.unlockLevelPack( 2 );			DataManager.unlockLevelPack( 3 );			for( var i:int = 0; i < 24; i++ )			{				for( var j:int = 0; j < 4; j++ )				{					DataManager.setLevelData( j, i, true, false );				}			}		}		private function enableCarsForTesting():void		{			for( var i:int = 0; i < CarDatas.CAR_DATAS.length; i++ )			{				this.unlockCarRoutine( CarDatas.CAR_DATAS[i].id );			}		}		private function disposePreloader():void		{			this.removeChild( this._preloaderImage, true );			this._preloaderImage = null;		}		private function validateStore():void		{			StaticStoreManager.validateProductIdentifiers( CPurchaseItem.ITEM_LIST, MountainMonsterIOSMain.APP_ID );		}		CONFIG::IS_MOBILE_VERSION {			private function storeValidationComplete( e:SDStoreEvent ):void			{				var response:SDResponse = e.response;				if ( MountainMonsterIOSMain.LOG_ENABLED )				{					LogModule.add( 'Check store validation result...' + ' (' + response.products.length + ')' );				}				for( var i:uint = 0; i < response.products.length; ++i )				{					if ( MountainMonsterIOSMain.LOG_ENABLED )					{						LogModule.add( ' 	# ' + response.products[ i ].productionIdentifier + ' | ' + response.products[ i ].purchased );					}					if( response.products[ i ].purchased )					{						this.unlockProductItem( response.products[ i ].productionIdentifier );					}				}				if ( MountainMonsterIOSMain.LOG_ENABLED )				{					LogModule.add( 'Store validation completed' );				}			}			public function productPurchased( e:SDStoreEvent ):void			{				if ( MountainMonsterIOSMain.LOG_ENABLED )				{					LogModule.add( 'Product purchased request: '+ e.productIdentifier );				}				this.unlockProductItem( e.productIdentifier );			}		}		CONFIG::IS_FLASH_VERSION {			private function storeValidationComplete( e:StoreManagerEvent ):void			{				var response:IStoreResponse = e.response;				for( var i:uint = 0; i < response.products.length; ++i )				{					if( response.products[ i ].purchased )					{						this.unlockProductItem( response.products[ i ].productionIdentifier );					}				}			}			public function productPurchased( e:StoreManagerEvent ):void			{				this.unlockProductItem( e.productIdentifier );			}		}		private function unlockProductItem( productionIdentifier:String ):void		{			switch ( productionIdentifier )			{				case CPurchaseItem.PURCHASE_ITEM_REMOVE_AD:					this.removeAdRoutine();					break;				case CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_1:					this.unlockLevelPack1Routine();					break;				case CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_2:					this.unlockLevelPack2Routine();					break;				case CPurchaseItem.PURCHASE_ITEM_CAR_1:					this.unlockCarRoutine( 1000 );					break;				case CPurchaseItem.PURCHASE_ITEM_CAR_2:					this.unlockCarRoutine( 1001 );					break;				case CPurchaseItem.PURCHASE_ITEM_CAR_3:					this.unlockCarRoutine( 1002 );					break;				case CPurchaseItem.PURCHASE_ITEM_CAR_4:					this.unlockCarRoutine( 1003 );					break;				case CPurchaseItem.PURCHASE_ITEM_CAR_5:					this.unlockCarRoutine( 1004 );					break;			}		}		private function removeAdRoutine():void		{			if ( MountainMonsterIOSMain.AD_BLOCKED )			{				return;			}			MountainMonsterIOSMain.AD_BLOCKED = true;			if( this._options )			{				this._options.hideRemoveADButton();			}			if( this._normalLevelPacks )			{				this._normalLevelPacks.hideRemoveADButton();			}			if( this._levelList )			{				this._levelList.hideRemoveADButton();			}		}		private function unlockLevelPack1Routine():void		{			DataManager.unlockLevelPack( 1 );			if( this._normalLevelPacks )			{				this._normalLevelPacks.unlockLevelPack( 1 );			}		}		private function unlockLevelPack2Routine():void		{			DataManager.unlockLevelPack( 2 );			if( this._normalLevelPacks )			{				this._normalLevelPacks.unlockLevelPack( 2 );			}		}		private function unlockCarRoutine( carId:uint ):void		{			DataManager.unlockCar( carId );			if( this._carSelectModule )			{				this._carSelectModule.unlockCar( carId );			}		}		private function showLogo():void		{			_logo.y = -_logo.height;			Tweener.removeTweens( _logo );			Tweener.addTween( _logo, {time: .5, delay: 1, y: 20} );		}		private function hideLogo():void		{			Tweener.removeTweens( _logo );			Tweener.addTween( _logo, {time: .5, y: -_logo.height} );		}		private function openMainMenuRequest( event:MenuEvent = null ):void		{			openMainMenu( event );			DataManager.save();		}		private function openMainMenu( event:MenuEvent = null ):void		{			if( !SoundHandler.isPlaying( "SND_MENU_BACK" ) )			{				SoundHandler.play( "SND_MENU_BACK", {loops: 99999} );			}			showLogo();			pause();			addChildAt( _mainMenu = new MainMenu(), 1 );			disposePanels( _mainMenu );			this._menuBackgroundModule.enable();			resume();		}		private function openOptionsRequest( event:MenuEvent = null ):void		{			openOptions( event );		}		private function openOptions( event:MenuEvent = null ):void		{			hideLogo();			pause();			addChild( _options = new Options() );			disposePanels( _options );			resume();		}		private function openLevelPacks( event:MenuEvent = null ):void		{			hideLogo();			pause();			addChild( _normalLevelPacks = new LevelPackList() );			disposePanels( _normalLevelPacks );			this._menuBackgroundModule.enable();			resume();		}		private function openLevelList( e:Event ):void		{			if( !SoundHandler.isPlaying( "SND_MENU_BACK" ) )			{				SoundHandler.play( "SND_MENU_BACK", {loops: 99999} );			}			hideLogo();			pause();			var levelPackId:uint = e.data as uint;			addChild( _levelList = new LevelList( levelPackId ) );			disposePanels( _levelList );			this._menuBackgroundModule.enable();			this._menuBackgroundModule.setLevelPackId( levelPackId );			resume();			DataManager.save();		}		private function openCarSelectPanel( e:MenuEvent ):void		{			this._carSelectModule = new CarSelectModule();			this._carSelectModule.addEventListener( BaseModuleEvent.DISPOSE_REQUEST, this.onCarSelectModuleDisposeRequest );			this.addChild( this._carSelectModule );		}		private function onCarSelectModuleDisposeRequest( e:BaseModuleEvent ):void		{			this._carSelectModule.removeEventListener( BaseModuleEvent.DISPOSE_REQUEST, this.onCarSelectModuleDisposeRequest );			this._carSelectModule.removeFromParent( true );			this._carSelectModule = null;		}		private function restartGameRequest():void		{			checkRatingState();			pause();			showGamePreloader();			Tweener.addTween( this, {delay: .25, time: .5, onComplete: restartGame} );		}		private function restartGame():void		{			openNormalGame( null, true );		}		private function nextLevelRequest( e:MenuEvent = null ):void		{			checkRatingState();			var event:MenuEvent = new MenuEvent( MenuEvent.START_GAME_REQUEST, [ e.data.levelID + 1, e.data.worldID ] );			disposePanels();			openGameRequest( event, false )		}		private function openGameRequest( e:MenuEvent = null, $isRestart:Boolean = false ):void		{			showGamePreloader();			Tweener.addTween( this, {time: .1, onComplete: openNormalGame, onCompleteParams: [ e ]} );		}		private function openNormalGame( event:MenuEvent = null, $isRestart:Boolean = false ):void		{			SoundHandler.stopAll();			if( event )			{				_lastSelectedWorldID = event.data[ 1 ] == null ? _lastSelectedWorldID : event.data[ 1 ];				_lastSelectedLevelID = event.data[ 0 ] == null ? _lastSelectedLevelID : event.data[ 0 ];			}			else			{				_lastSelectedWorldID = _lastSelectedWorldID;				_lastSelectedLevelID = _lastSelectedLevelID;			}			if( _lastSelectedLevelID >= Levels.levels[ _lastSelectedWorldID ].length )			{				openLevelPacks();				return;			}			DataManager.setLastPlayedGame( _lastSelectedWorldID, _lastSelectedLevelID );			hideLogo();			if( !$isRestart )			{				addChildAt( _game = new Game( _lastSelectedLevelID, _lastSelectedWorldID ), 1 );				_game.alpha = 0				disposePanels( _game );				Tweener.addTween( _game, {delay: .25, time: .5, alpha: 1, onComplete: hideGamePreloader} );			}			else			{				Tweener.addTween( _game, {time: .5, alpha: 1, onComplete: hideGamePreloader} );				_game.restartRutin();			}			this.increasePlayedGameCounters();			this._menuBackgroundModule.disable();			resume( false );		}		private function increasePlayedGameCounters():void		{			var playedGameCounters:Array = DataManager.getPlayedGameCounters;			if( playedGameCounters[ _lastSelectedWorldID ] == undefined )			{				playedGameCounters[ _lastSelectedWorldID ] = [];			}			if( playedGameCounters[ _lastSelectedWorldID ][ _lastSelectedLevelID ] == undefined )			{				playedGameCounters[ _lastSelectedWorldID ][ _lastSelectedLevelID ] = 0;			}			playedGameCounters[ _lastSelectedWorldID ][ _lastSelectedLevelID ]++;			DataManager.setPlayedGameCounters( playedGameCounters );		}		private function showGamePreloader():void		{			addChild( _gamePreloader );			_gamePreloader.alpha = 1;		}		private function hideGamePreloader():void		{			Tweener.addTween( _gamePreloader, {				time: 1,				alpha: 0,				onComplete: removeChild,				onCompleteParams: [ _gamePreloader ]			} )		}		private function checkRatingState():void		{			if( DataManager.getRatingData && DataManager.getTotalPlayedGameCount() % 10 == 0 )			{				this.initRatingModule();			}		}		private function initRatingModule():void		{			this._ratingModule = new RatingModule();			this._ratingModule.addEventListener( BaseModuleEvent.DISPOSE_REQUEST, onRatingModuleDisposeRequest );			this.addChild( this._ratingModule );		}		private function onRatingModuleDisposeRequest( e:BaseModuleEvent ):void		{			this._ratingModule.removeEventListener( BaseModuleEvent.DISPOSE_REQUEST, onRatingModuleDisposeRequest );			this._ratingModule.removeFromParent( true );			this._ratingModule = null;		}		public function pause():void		{			if( this._game )			{				this._game.removeEventListener( GameGuiEvent.MAIN_MENU_REQUEST, this.openMainMenuRequest );				this._game.removeEventListener( GameGuiEvent.LEVEL_SELECT_REQUEST, this.openLevelList );				this._game.removeEventListener( GameGuiEvent.INGAME_RESTART_REQUEST, this.restartGameRequest );				this._game.removeEventListener( MenuEvent.NEXT_LEVEL_REQUEST, this.nextLevelRequest );				this._game.removeEventListener( GameEvent.RESOURCE_LIMIT_ERROR, onResourceLimitError );			}			if( this._normalLevelPacks )			{				this._normalLevelPacks.pause();				this._normalLevelPacks.removeEventListener( MenuEvent.MAIN_MENU_REQUEST, this.openMainMenuRequest );				this._normalLevelPacks.removeEventListener( MenuEvent.NORMAL_GAME_REQUEST, this.openLevelList );				this._normalLevelPacks.removeEventListener( MenuEvent.OPEN_CAR_SELECT_REQUEST, this.openCarSelectPanel );			}			if( this._levelList )			{				this._levelList.pause();				this._levelList.removeEventListener( MenuEvent.MAIN_MENU_REQUEST, this.openLevelPacks );				this._levelList.removeEventListener( MenuEvent.NORMAL_GAME_REQUEST, this.openGameRequest );				this._levelList.removeEventListener( MenuEvent.OPEN_CAR_SELECT_REQUEST, this.openCarSelectPanel );			}			if( this._mainMenu )			{				this._mainMenu.pause();				this._mainMenu.removeEventListener( MenuEvent.NORMAL_GAME_REQUEST, this.openLevelPacks );				this._mainMenu.removeEventListener( MenuEvent.OPTIONS_REQUEST, this.openOptionsRequest );			}			if( this._options )			{				this._options.pause();				this._options.removeEventListener( MenuEvent.MAIN_MENU_REQUEST, this.openMainMenuRequest );			}		}		public function resume( $byPlatform:Boolean = true ):void		{			if( _game )			{				_game.addEventListener( GameGuiEvent.MAIN_MENU_REQUEST, openMainMenuRequest );				_game.addEventListener( GameGuiEvent.LEVEL_SELECT_REQUEST, openLevelList );				_game.addEventListener( GameGuiEvent.INGAME_RESTART_REQUEST, restartGameRequest );				_game.addEventListener( MenuEvent.NEXT_LEVEL_REQUEST, nextLevelRequest );				_game.addEventListener( GameEvent.RESOURCE_LIMIT_ERROR, onResourceLimitError );			}			if( this._normalLevelPacks && !this._normalLevelPacks.waitingForDispose )			{				this._normalLevelPacks.resume();				this._normalLevelPacks.addEventListener( MenuEvent.MAIN_MENU_REQUEST, openMainMenuRequest );				this._normalLevelPacks.addEventListener( MenuEvent.NORMAL_GAME_REQUEST, openLevelList );				this._normalLevelPacks.addEventListener( MenuEvent.OPEN_CAR_SELECT_REQUEST, openCarSelectPanel );			}			if( _levelList && !this._levelList.waitingForDispose )			{				_levelList.resume();				_levelList.addEventListener( MenuEvent.MAIN_MENU_REQUEST, openLevelPacks );				_levelList.addEventListener( MenuEvent.NORMAL_GAME_REQUEST, openGameRequest );				_levelList.addEventListener( MenuEvent.OPEN_CAR_SELECT_REQUEST, openCarSelectPanel );			}			if( _mainMenu && !_mainMenu.waitingForDispose )			{				_mainMenu.resume();				_mainMenu.addEventListener( MenuEvent.NORMAL_GAME_REQUEST, openLevelPacks );				_mainMenu.addEventListener( MenuEvent.OPTIONS_REQUEST, openOptionsRequest );			}			if( _options && !this._options.waitingForDispose )			{				_options.resume();				_options.addEventListener( MenuEvent.MAIN_MENU_REQUEST, openMainMenuRequest );			}		}		private function onResourceLimitError( e:GameEvent ):void		{			if ( MountainMonsterIOSMain.LOG_ENABLED )			{				LogModule.add( 'Resource limit error! - please restart the application' );			}			this._game.removeFromParent( true );			this._game = null;			this.openMainMenuRequest();		}		private function disposePanels( $exception:AbstractPanel = null, $time:Number = .5 ):void		{			var needWaiting:Boolean = false;			if( _mainMenu && ( ( $exception && $exception != _mainMenu ) || !$exception ) )			{				_mainMenu.disposeRequest( disposeThis, $time );				needWaiting = true;			}			if( _options && ( ( $exception && $exception != _options ) || !$exception ) )			{				_options.disposeRequest( disposeThis, $time );				needWaiting = true;			}			if( _normalLevelPacks && ( ( $exception && $exception != _normalLevelPacks ) || !$exception ) )			{				_normalLevelPacks.disposeRequest( disposeThis, $time );				needWaiting = true;			}			if( _game && ( ( $exception && $exception != _game ) || !$exception ) )			{				_game.disposeRequest( disposeThis, $time );				needWaiting = true;			}			if( _levelList && ( ( $exception && $exception != _levelList ) || !$exception ) )			{				_levelList.disposeRequest( disposeThis, $time );				needWaiting = true;			}			if( $exception )			{				if( needWaiting )				{					Tweener.addTween( this, {time: $time, onComplete: $exception.init} );				}				else				{					$exception.init();				}			}		}		private function disposeThis( $target:AbstractPanel ):void		{			removeChild( $target, true );			if( $target == _mainMenu )			{				_mainMenu = null;			}			else if( $target == _options )			{				_options = null;			}			else if( $target == _normalLevelPacks )			{				_normalLevelPacks = null;			}			else if( $target == _levelList )			{				_levelList = null;			}			else if( $target == _game )			{				_game = null;			}		}	}}