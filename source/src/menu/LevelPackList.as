package src.menu
{
	import caurina.transitions.Tweener;

	import flash.geom.Point;

	import net.fpp.services.store.StaticStoreManager;

	import net.fpp.starling.StaticAssetManager;

	import rv2.sound.SoundHandler;

	import src.AbstractPanel;
	import src.assets.Fonts;
	import src.assets.Levels;
	import src.constant.CPurchaseItem;
	import src.constant.CStarRequired;
	import src.data.DataManager;
	import src.menu.events.MenuEvent;
	import src.menu.module.carselect.view.CarSelectButton;

	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;

	public class LevelPackList extends AbstractPanel
	{
		private const LEVEL_PACK_BUTTON_SIZE:Point = new Point( 162, 107 );

		private var _carSelectButton:CarSelectButton;

		private var _starGuiView:StarGuiView;

		private var _levelPackButtonContainer:Sprite;
		private var _levelPackButtons:Vector.<LevelPackButton> = new Vector.<LevelPackButton>;

		private var _backButton:Button;
		private var _removeAdButton:Button;

		public function LevelPackList():void
		{
		}

		override public function init():void
		{
			var margin:Number = 10;
			var levelPackButtonOffset:Number = 10;

			addChild( _levelPackButtonContainer = new Sprite );

			var col:uint = 0;
			var row:uint = 0;

			var length:int = Levels.length;
			for( var i:int = 0; i < length; i++ )
			{
				_levelPackButtons.push( new LevelPackButton( i ) );
				var button:LevelPackButton = _levelPackButtons[ i ];
				_levelPackButtonContainer.addChild( button );

				button.x = LEVEL_PACK_BUTTON_SIZE.x / 2 + col * LEVEL_PACK_BUTTON_SIZE.x + col * levelPackButtonOffset;
				button.y = LEVEL_PACK_BUTTON_SIZE.y / 2 + row * LEVEL_PACK_BUTTON_SIZE.y + row * levelPackButtonOffset;

				col++;
				if( col == 2 )
				{
					col = 0;
					row++;
				}

				Tweener.addTween( button, {delay: Math.random() * .5, time: .5, alpha: 1} );
			}

			_levelPackButtonContainer.x = stage.stageWidth / 2 - _levelPackButtonContainer.width / 2;
			_levelPackButtonContainer.y = 20;

			addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "BACK" ) );
			_backButton.name = "back_button";
			_backButton.fontSize = 18;
			_backButton.fontColor = 0xFFFFFF;
			_backButton.fontName = Fonts.getAachenLightFont().name;
			_backButton.x = stage.stageWidth / 2 - _backButton.width / 2;
			_backButton.y = stage.stageHeight;
			Tweener.addTween( _backButton, {
				delay: Math.random() * .5,
				time: .5,
				y: Starling.current.stage.stageHeight - _backButton.height - margin
			} );

			if ( !MountainMonsterIOSMain.AD_BLOCKED )
			{
				addChild( _removeAdButton = new Button( StaticAssetManager.instance.getTexture( "remove_ad_button" ) ) );
				_removeAdButton.name = "remove_ad";
				_removeAdButton.x = -_removeAdButton.width;
				_removeAdButton.y = 5;
				Tweener.addTween( _removeAdButton, {
					delay: Math.random() * .5,
					time: .5,
					x: 5
				} );
			}

			this.addChild( this._carSelectButton = new CarSelectButton() );
			this._carSelectButton.name = "car_select";
			this._carSelectButton.x = -_carSelectButton.width;
			this._carSelectButton.y = this.stage.stageHeight - this._carSelectButton.height - 5;
			Tweener.addTween( this._carSelectButton, {
				delay: Math.random() * .5,
				time: .5,
				x: -10
			} );

			addStarGuiView();
			unlockAvailableLevelPacks();

			resume();
		}

		public function hideRemoveADButton():void
		{
			if ( _removeAdButton )
			{
				_removeAdButton.visible = false;
			}
		}

		private function addStarGuiView():void
		{
			_starGuiView = new StarGuiView();
			addChild( _starGuiView );

			_starGuiView.x = stage.stageWidth - 90;
			_starGuiView.y = Starling.current.stage.stageHeight - _backButton.height - 8;
			_starGuiView.alpha = .5;

			Tweener.addTween( _starGuiView, {delay: Math.random() * .5, time: .5, alpha: 1} );

			var allEarnedStarCount:int = DataManager.getAllEarnedStarCount();

			_starGuiView.updateValue( allEarnedStarCount );
		}

		private function unlockAvailableLevelPacks():void
		{
			var allEarnedStarCount:int = DataManager.getAllEarnedStarCount();

			if ( allEarnedStarCount >= CStarRequired.UNLOCK_LEVEL_PACK_1 )
			{
				this.unlockLevelPack( 1 );
			}
			if ( allEarnedStarCount >= CStarRequired.UNLOCK_LEVEL_PACK_2 )
			{
				this.unlockLevelPack( 2 );
			}
		}

		private function onButtonTriggered( e:Event ):void
		{
			SoundHandler.play( 'SND_BUTTON' );
			var button:Button = e.target as Button;

			switch( button.name )
			{
				case 'back_button':
					this.dispatchEvent( new MenuEvent( MenuEvent.MAIN_MENU_REQUEST ) );
					this.pause();
					break;

				case 'remove_ad':
					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_REMOVE_AD );
					break;

				case 'car_select':
					this.dispatchEvent( new MenuEvent( MenuEvent.OPEN_CAR_SELECT_REQUEST ) );
					break;
			}
		}

		public function unlockLevelPack( index:uint ):void
		{
			DataManager.unlockLevelPack( index );
			_levelPackButtons[ index ].unlock();
		}

		private function openLevels( e:MenuEvent ):void
		{
			var levelPackID:uint = e.data as uint;

			if( !DataManager.getIsLevelPackUnlocked( levelPackID ) )
			{
				if ( levelPackID == 0 )
				{
					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_1 );
				} else if ( levelPackID == 0 )
				{
					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_2 );
				}
			}
			else
			{
				this.dispatchEvent( e );
				this.pause();
			}
		}

		public function pause():void
		{
			this.removeEventListener( Event.TRIGGERED, onButtonTriggered );
			this._backButton.enabled = false;
			this._carSelectButton.enabled = false;

			var length:int = _levelPackButtons.length;
			for( var i:int = 0; i < length; i++ )
			{
				_levelPackButtons[ i ].removeEventListener( MenuEvent.NORMAL_GAME_REQUEST, openLevels );
				_levelPackButtons[ i ].pause();
			}
		}

		public function resume():void
		{
			this.addEventListener( Event.TRIGGERED, onButtonTriggered );

			if( !_backButton )
			{
				return;
			}

			this._backButton.enabled = true;
			this._carSelectButton.enabled = true;

			var length:int = _levelPackButtons.length;
			for( var i:int = 0; i < length; i++ )
			{
				_levelPackButtons[ i ].addEventListener( MenuEvent.NORMAL_GAME_REQUEST, openLevels );
				_levelPackButtons[ i ].resume();
			}
		}

		override public function dispose():void
		{
			pause();

			var length:int = _levelPackButtons.length;
			for( var i:int = 0; i < length; i++ )
			{
				_levelPackButtons[ i ].removeFromParent( true );
				_levelPackButtons[ i ] = null;
			}
			_levelPackButtons.length = 0;

			_backButton.removeFromParent( true );
			_backButton = null;

			this._carSelectButton.removeFromParent( true );
			this._carSelectButton = null;

			if ( _removeAdButton )
			{
				_removeAdButton.removeFromParent( true );
				_removeAdButton = null;
			}

			Tweener.removeTweens( _starGuiView );
			_starGuiView.removeFromParent( true );
			_starGuiView = null;

			super.dispose();
		}
	}
}