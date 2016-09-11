package src.menu
{

	import flash.geom.Point;

	import net.fpp.common.services.store.StaticStoreManager;

	import net.fpp.common.starling.StaticAssetManager;

	import src.common.DataManager;
	import src.constant.CPurchaseItem;
	import src.menu.events.MenuEvent;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class LevelPackButton extends Sprite
	{
		private var _back:Image;
		private var _lockImage:Image;

		private var _touchPoint:Point = new Point;

		private var _worldID:uint;

		private var _isLocked:Boolean = false;
		private var _isComingSoon:Boolean = false;

		public function LevelPackButton( worldID:uint ):void
		{
			useHandCursor = true;
			_worldID = worldID;

			if( worldID <= 3 )
			{
				addChild( _back = new Image( StaticAssetManager.instance.getTexture( "level_pack_" + Math.min( worldID, 2 ) ) ) );

				if( !DataManager.getIsLevelPackUnlocked( worldID ) )
				{
					lock();
				}
			}
			else
			{
				_isComingSoon = true;
				addChild( _back = new Image( StaticAssetManager.instance.getTexture( "level_pack_coming_soon" ) ) );
			}

			pivotX = width / 2;
			pivotY = height / 2;

			resume();
		}

		private function lock():void
		{
			_isLocked = true;

			addChild( _lockImage = new Image( StaticAssetManager.instance.getTexture( "level_pack_" + _worldID + "_locked" ) ) );
			_lockImage.x = width / 2 - _lockImage.width / 2 - 1;
			_lockImage.y = 5;
		}

		public function unlock():void
		{
			if( !_isLocked )
			{
				return;
			}

			_isLocked = false;

			if( _lockImage )
			{
				_lockImage.removeFromParent( true );
				_lockImage = null;
			}

			useHandCursor = true;
			touchable = true;
		}

		private function onTouch( event:TouchEvent ):void
		{
			var tp:Touch = event.touches[ 0 ];
			if( tp.phase == TouchPhase.BEGAN )
			{
				scaleX = scaleY = .9;
				_touchPoint.setTo( tp.globalX, tp.globalY );
			}
			else if( tp.phase == TouchPhase.ENDED && scaleX != 1 )
			{
				scaleX = scaleY = 1;
				if( Math.sqrt( Math.pow( _touchPoint.x - tp.globalX, 2 ) + Math.pow( _touchPoint.y - tp.globalY, 2 ) ) < 20 )
				{
					if( _isLocked )
					{
						if( _worldID == 1 )
						{
							StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_1 );
						}
						else if( _worldID == 2 )
						{
							StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_2 );
						}
						else if( _worldID == 3 )
						{
							StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_3 );
						}
					}
					else
					{
						var menuEvent:MenuEvent = new MenuEvent( MenuEvent.NORMAL_GAME_REQUEST, _worldID );
						dispatchEvent( menuEvent );
					}
				}
			}
		}

		public function pause():void
		{
			removeEventListener( TouchEvent.TOUCH, onTouch );
		}

		public function resume():void
		{
			if( !_isComingSoon )
			{
				addEventListener( TouchEvent.TOUCH, onTouch );
			}
		}

		override public function dispose():void
		{
			pause();
			removeChild( _back, true );
			_back = null;

			if( _lockImage )
			{
				removeChild( _lockImage, true );
				_lockImage = null;
			}
			super.dispose();
		}
	}
}