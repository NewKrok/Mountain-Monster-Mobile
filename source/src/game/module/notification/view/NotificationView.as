/**
 * Created by newkrok on 14/08/15.
 */
package src.game.module.notification.view
{
	import caurina.transitions.Tweener;

	import net.fpp.starling.StaticAssetManager;

	import starling.display.Image;
	import starling.display.Sprite;

	public class NotificationView extends Sprite
	{
		private var DISPLAY_TIME_IN_SEC:Number = 2;

		private var _image:Image;

		private var _onCompleteCallBack:Function;

		public function NotificationView( onCompleteCallBack:Function )
		{
			_onCompleteCallBack = onCompleteCallBack;
		}

		public function setImage( imageName:String ):void
		{
			_image = new Image( StaticAssetManager.instance.getTexture( imageName ) );

			addChild( _image );
		}

		public function show():void
		{
			_image.alpha = 0;
			_image.y = 10;

			Tweener.addTween( _image, {alpha: 1, y: 0, time: .5} );
			Tweener.addTween( _image, {
				alpha: 0,
				y: -10,
				delay: DISPLAY_TIME_IN_SEC,
				time: .5,
				onComplete: _onCompleteCallBack,
				onCompleteParams: [ this ]
			} );
		}

		override public function dispose():void
		{
			Tweener.removeTweens( _image );

			_image.removeFromParent( true );
			_image = null;

			super.dispose();
		}
	}
}
