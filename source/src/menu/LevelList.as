package src.menu
{
	import caurina.transitions.Tweener;

	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;

	import flash.display.BitmapData;
	import flash.geom.Point;

	import net.fpp.services.store.StaticStoreManager;

	import net.fpp.starling.StaticAssetManager;

	import rv2.sound.SoundHandler;

	import src.assets.Fonts;
	import src.assets.Levels;
	import src.constant.CPurchaseItem;
	import src.data.DataManager;
	import src.data.LevelResultVO;
	import src.menu.events.MenuEvent;
	import src.menu.module.carselect.view.CarSelectButton;
	import src.menu.module.task.view.TaskButton;
	import src.utils.Pager;

	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	import src.AbstractPanel;

	public class LevelList extends AbstractPanel
	{
		public static const LEVEL_BUTTON_SIZE:Point = new Point( 77, 62 );
		private const LEVEL_BUTTON_OFFSET:Point = new Point( 10, 10 );
		private const PAGER_BASE_Y_OFFSET:Number = 20;

		private const COL_PER_PAGE:uint = 4;
		private const ROW_PER_PAGE:uint = 3;

		private var _carSelectButton:CarSelectButton;

		private var _levelButtons:Vector.<LevelButton> = new Vector.<LevelButton>;
		private var _pages:Vector.<Sprite> = new Vector.<Sprite>;

		private var _starGuiView:StarGuiView;

		private var _scrollContainer:ScrollContainer;
		private var _container:Sprite;
		private var _pager:Pager;
		private var _pagerStart:Image;
		private var _pagerEnd:Image;

		private var _worldID:uint;

		private var _backButton:Button;
		private var _removeAdButton:Button;
		private var _taskButton:TaskButton;

		public function LevelList( worldID:uint ):void
		{
			this._worldID = worldID;
		}

		override public function init():void
		{
			addChild( _scrollContainer = new ScrollContainer );
			_scrollContainer.addChild( _container = new Sprite );
			_scrollContainer.width = stage.stageWidth;
			_scrollContainer.horizontalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_scrollContainer.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_scrollContainer.snapScrollPositionsToPixels = true;
			_scrollContainer.snapToPages = true;
			_scrollContainer.isEnabled = false;

			var row:uint = 0;
			var col:uint = 0;
			var page:uint = 0;
			var currentPage:uint = 0;
			var pivotXBaseOffset:Number = 0;
			var pivotYBaseOffset:Number = 0;
			var pageOffset:Number = 0;

			_pages.push( new Sprite );
			_container.addChild( _pages[ _pages.length - 1 ] );

			for( var i:uint = 0; i < Levels.levels[ _worldID ].length; i++ )
			{
				_levelButtons.push( _pages[ _pages.length - 1 ].addChild( new LevelButton( _worldID, i ) ) as LevelButton );

				if( i == 0 )
				{
					pivotXBaseOffset = _levelButtons[ i ].pivotX;
					pivotYBaseOffset = _levelButtons[ i ].pivotY;
				}

				_levelButtons[ i ].x = pivotXBaseOffset + col * LEVEL_BUTTON_SIZE.x + LEVEL_BUTTON_OFFSET.x * col;
				_levelButtons[ i ].y = pivotYBaseOffset + row * LEVEL_BUTTON_SIZE.y + LEVEL_BUTTON_OFFSET.y * row;
				_levelButtons[ i ].alpha = 0;

				Tweener.addTween( _levelButtons[ i ], {delay: i * .05, time: .5, alpha: 1} );

				var tmpSavedData:LevelResultVO = DataManager.getLevelData( _worldID, i );
				if( tmpSavedData.isLastPlayed )
				{
					currentPage = page;
				}
				col++;
				if( col == COL_PER_PAGE )
				{
					col = 0;
					row++;
				}
				if( row == ROW_PER_PAGE )
				{
					row = 0;
					page++;

					_pages.push( new Sprite );
					_container.addChild( _pages[ _pages.length - 1 ] );
				}
			}

			pageOffset = stage.stageWidth / 2 - _pages[ 0 ].width / 2;
			for( i = 0; i < _pages.length; i++ )
			{
				_pages[ i ].x = i * stage.stageWidth + pageOffset;
				_pages[ i ].y = PAGER_BASE_Y_OFFSET;
			}

			_scrollContainer.height = _container.height + PAGER_BASE_Y_OFFSET;

			addChild( _pager = new Pager );
			_pager.addEventListener( Event.CHANGE, onPagerAction );
			if( Levels.levels[ _worldID ].length % ( COL_PER_PAGE * ROW_PER_PAGE ) == 0 )
			{
				page--;
			}
			_pager.init( page + 1 );
			_pager.x = stage.stageWidth / 2 - _pager.width / 2;

			_scrollContainer.addChild( _pagerStart = new Image( Texture.fromBitmapData( new BitmapData( 10, 10, true, 0x60 ) ) ) );
			_scrollContainer.addChild( _pagerEnd = new Image( Texture.fromBitmapData( new BitmapData( 10, 10, true, 0x60 ) ) ) );
			_pagerEnd.x = ( page + 1 ) * stage.stageWidth - _pagerEnd.width;

			addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "BACK" ) );
			_backButton.fontSize = 18;
			_backButton.fontColor = 0xFFFFFF;
			_backButton.fontName = Fonts.getAachenLightFont().name;
			_backButton.name = "back";
			_backButton.x = stage.stageWidth / 2 - _backButton.width / 2;
			_backButton.y = stage.stageHeight;
			_pager.y = Starling.current.stage.stageHeight - 10 - _backButton.height - _pager.height - 15;
			Tweener.addTween( _backButton, {
				delay: Math.random() * .5,
				time: .5,
				y: Starling.current.stage.stageHeight - 10 - _backButton.height
			} );

			this.addTaskButton();

			if ( !MountainMonsterIOSMain.AD_BLOCKED )
			{
				this.addRemoveAdButton();
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

			_pager.setPage( currentPage );
			_scrollContainer.horizontalScrollPosition = _scrollContainer.width * currentPage;

			addStarGuiView();

			resume();
		}

		private function addTaskButton():void
		{
			this.addChild( this._taskButton = new TaskButton( this._worldID ) );

			this._taskButton.name = "task";
			this._taskButton.x = -this._taskButton.width;
			this._taskButton.y = 5;

			Tweener.addTween( this._taskButton, {
				delay: Math.random() * .5,
				time: .5,
				x: 5
			} );
		}

		private function addRemoveAdButton():void
		{
			addChild( _removeAdButton = new Button( StaticAssetManager.instance.getTexture( "remove_ad_button" ) ) );

			_removeAdButton.name = "remove_ad";
			_removeAdButton.x = -_removeAdButton.width;
			_removeAdButton.y = this._taskButton.y + this._taskButton.height + 5;

			Tweener.addTween( _removeAdButton, {
				delay: Math.random() * .5,
				time: .5,
				x: 5
			} );
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

			_starGuiView.updateValue( DataManager.getEarnedStarCountByWorld( _worldID ) );
		}

		private function onButtonTriggered( e:Event ):void
		{
			SoundHandler.play( 'SND_BUTTON' );
			var button:Button = e.target as Button;

			switch( button.name )
			{
				case 'back':
					this.dispatchEvent( new MenuEvent( MenuEvent.MAIN_MENU_REQUEST ) );
					this.pause();
					break;

				case 'task':
					this._taskButton.reset();
					this.dispatchEvent( new MenuEvent( MenuEvent.OPEN_TASKS_REQUEST ) );
					break;

				case 'remove_ad':
					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_REMOVE_AD );
					break;

				case 'car_select':
					this.dispatchEvent( new MenuEvent( MenuEvent.OPEN_CAR_SELECT_REQUEST ) );
					break;
			}
		}

		private function startLevel( event:MenuEvent ):void
		{
			dispatchEvent( event );
			pause();
		}

		private function setPager( event:Event ):void
		{
			_pager.setPage( _scrollContainer.horizontalPageIndex );
		}

		private function onPagerAction( event:Event ):void
		{
			Tweener.addTween( _scrollContainer, {
				horizontalScrollPosition: _scrollContainer.width * _pager.currentPage,
				time: .3
			} );
		}

		public function pause():void
		{
			this.removeEventListener( Event.TRIGGERED, onButtonTriggered );

			if( _pager )
			{
				this._backButton.enabled = false;
				this._scrollContainer.isEnabled = false;
				this._scrollContainer.removeEventListener( Event.SCROLL, setPager );

				var length:uint = _levelButtons.length;
				for( var i:uint = 0; i < length; i++ )
				{
					_levelButtons[ i ].removeEventListener( MenuEvent.NORMAL_GAME_REQUEST, startLevel );
				}
			}
		}

		public function resume():void
		{
			this.addEventListener( Event.TRIGGERED, onButtonTriggered );

			if( _pager )
			{
				this._backButton.enabled = true;
				this._scrollContainer.isEnabled = true;
				this._scrollContainer.addEventListener( Event.SCROLL, setPager );

				var length:uint = _levelButtons.length;
				for( var i:uint = 0; i < length; i++ )
				{
					_levelButtons[ i ].addEventListener( MenuEvent.NORMAL_GAME_REQUEST, startLevel );
				}
			}
		}

		override public function dispose():void
		{
			pause();
			if( _pager )
			{
				_pager.removeEventListener( Event.CHANGE, onPagerAction );
				removeChild( _pager, true );
				_pager = null;

				_scrollContainer.removeChild( _pagerStart, true );
				_pagerStart = null;

				_scrollContainer.removeChild( _pagerEnd, true );
				_pagerEnd = null;

				removeChild( _backButton, true );
				_backButton = null;

				this._carSelectButton.removeFromParent( true );
				this._carSelectButton = null;

				if ( _removeAdButton )
				{
					_removeAdButton.removeFromParent( true );
					_removeAdButton = null;
				}

				if ( this._taskButton )
				{
					this._taskButton.removeFromParent( true );
					this._taskButton = null;
				}

				var length:uint = _levelButtons.length;
				for( var i:uint = 0; i < length; i++ )
				{
					_levelButtons[ i ].removeFromParent( true );
					_levelButtons[ i ] = null;
				}
				_levelButtons.length = 0;

				length = _pages.length;
				for( i = 0; i < length; i++ )
				{
					_pages[ i ].removeFromParent( true );
					_pages[ i ] = null;
				}
				_pages.length = 0;

				removeChild( _scrollContainer, true );
				_scrollContainer = null;
			}

			Tweener.removeTweens( _starGuiView );
			_starGuiView.removeFromParent( true );
			_starGuiView = null;

			super.dispose();
		}
	}
}