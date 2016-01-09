/**
 * Created by newkrok on 09/01/16.
 */
package src.game.module.notification.view
{
	import caurina.transitions.Tweener;

	import net.fpp.starling.module.AView;

	import rv2.sound.SoundHandler;

	public class NotificationModuleView extends AView
	{
		private const MARGIN_LEFT:Number = 10;
		private const MARGIN_TOP:Number = 45;
		private const NOTIFICATION_HEIGHT:Number = 30;
		private const NOTIFICATION_GAP:Number = 5;

		private var _list:Vector.<NotificationView> = new <NotificationView>[];

		public function addFrontFlipNotification():void
		{
			this.addNotification( 'notification_front_flip' );
		}

		public function addBackFlipNotification():void
		{
			this.addNotification( 'notification_back_flip' );
		}

		public function addNiceAirTimeNotification():void
		{
			this.addNotification( 'notification_nice_airtime' );
		}

		public function addNiceWheelieTimeNotification():void
		{
			this.addNotification( 'notification_nice_wheelie' );
		}

		private function addNotification( imageName:String ):void
		{
			SoundHandler.play( 'SND_FLIP' );

			var notificationView:NotificationView = new NotificationView( remove );
			notificationView.setImage( imageName );
			notificationView.show();

			setStartPositionOfNotificationView( notificationView );

			this._list.push( notificationView );
			this.addChild( notificationView );
		}

		public function remove( view:NotificationView ):void
		{
			var length:int = _list.length;
			for( var i:int = 0; i < length; i++ )
			{
				if( _list[ i ] == view )
				{
					_list[ i ].removeFromParent( true );
					_list[ i ] = null;
					_list.splice( i, 1 );
					break;
				}
			}

			updatePositions();
		}

		private function updatePositions():void
		{
			var length:int = _list.length;
			for( var i:int = 0; i < length; i++ )
			{
				setyPositionOfNotificationViewWithAnimation( i, _list[ i ] );
			}
		}

		private function setStartPositionOfNotificationView( notificationView:NotificationView ):void
		{
			notificationView.x = this.MARGIN_LEFT;
			notificationView.y = this.MARGIN_TOP + this._list.length * this.NOTIFICATION_HEIGHT + this._list.length * this.NOTIFICATION_GAP;
		}

		private function setyPositionOfNotificationViewWithAnimation( index:int, notificationView:NotificationView ):void
		{
			Tweener.removeTweens( notificationView );

			Tweener.addTween( notificationView, {
				time: .5,
				y: this.MARGIN_TOP + index * this.NOTIFICATION_HEIGHT + index * this.NOTIFICATION_GAP
			} )
		}

		override public function dispose():void
		{
			var length:int = this._list.length;

			for( var i:int = 0; i < length; i++ )
			{
				this._list[ i ].removeFromParent( true );
				this._list[ i ] = null;
			}

			this._list.length = 0;
			this._list = null;

			super.dispose();
		}
	}
}