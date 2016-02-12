/**
 * Created by newkrok on 31/01/16.
 */
package src.menu.module.task.view
{
	import caurina.transitions.Tweener;

	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.module.AView;

	import src.assets.Fonts;

	import starling.display.Image;

	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class RewardView extends AView
	{
		private var _title:TextField;

		private var _car:Image;
		private var _back:Image;

		override protected function onInit():void
		{
			this.createTitle();
			this.createAnimatedBackground();

			this.startBackgroundAnimation();
		}

		private function createTitle():void
		{
			this._title = new TextField( 200, 25, 'YOUR REWARD:' );

			this._title.touchable = false;
			this._title.fontSize = 15;
			this._title.color = 0xFFFF00;
			this._title.fontName = Fonts.getAachenLightFont( ).name;
			this._title.hAlign = HAlign.CENTER;
			this._title.vAlign = VAlign.CENTER;

			this._title.x = -this._title.width / 2;
			this._title.y = -40;

			this.addChild( this._title );
		}

		private function createAnimatedBackground():void
		{
			this._back = new Image( StaticAssetManager.instance.getTexture( "reward_back" ) );

			this.addChildAt( this._back, 0 );

			this._back.pivotX = this._back.width / 2;
			this._back.pivotY = this._back.height / 2;

			this._back.x = 0;
			this._back.y = 0;
		}

		private function startBackgroundAnimation():void
		{
			Tweener.addTween( this._back, { time: 20, rotation: Math.PI * 2, onComplete: this.startBackgroundAnimation, transition: 'linear' } );
		}

		public function setCarGraphicId( id:uint ):void
		{
			this._car = new Image( StaticAssetManager.instance.getTexture( "car_info_car_" + id ) );

			this.addChild( this._car );

			this._car.x = -this._car.width / 2;
			this._car.y = -this._car.height / 2;
		}

		override public function dispose():void
		{
			Tweener.removeTweens( this._back );
			this._back.removeFromParent( true );
			this._back = null;

			this._title.removeFromParent( true );
			this._title = null;

			this._car.removeFromParent( true );
			this._car = null;

			super.dispose();
		}
	}
}