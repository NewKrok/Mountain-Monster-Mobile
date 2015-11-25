package src.game.module.snow
{
	import flash.geom.Point;

	import net.fpp.starling.StaticAssetManager;

	import starling.display.Image;

	import starling.display.Sprite;
	import starling.events.Event;

	public class Snowflake extends Sprite
	{
		private var _speedVector:Point = new Point;

		private var _graphic:Image;

		private var _isInited:Boolean;

		public function Snowflake()
		{
			addEventListener( Event.ADDED_TO_STAGE, init );
		}

		private function init( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, init );

			addChild( _graphic = new Image( StaticAssetManager.instance.getTexture( 'snowflake' ) ) );
			_graphic.pivotX = _graphic.width / 2;
			_graphic.pivotY = _graphic.height / 2;

			x = stage.stageWidth * Math.random() - 100;
			y = stage.stageHeight * Math.random();

			setSpeed();
			setSize();
			setAlpha();

			_isInited = true;
		}

		private function setSpeed():void
		{
			_speedVector = new Point( Math.random() * 8, Math.random() * 8 + 4 );
		}

		private function setSize():void
		{
			scaleX = scaleY = 2 * Math.random() + .2;
		}

		private function setAlpha():void
		{
			alpha = Math.random() + .3 - scaleX / 5;
		}

		public function update():void
		{
			if( _isInited )
			{
				x += _speedVector.x;
				y += _speedVector.y;

				if( x > stage.stageWidth || y > stage.stageHeight )
				{
					reInit();
				}
			}
		}

		private function reInit():void
		{
			x = stage.stageWidth * Math.random() - 100;
			y = -50 * Math.random() - 100;

			setSpeed();
			setSize();
			setAlpha();
		}

		override public function dispose():void
		{
			if( _graphic )
			{
				_graphic.removeFromParent( true );
				_graphic = null;
			}

			super.dispose();
		}
	}
}