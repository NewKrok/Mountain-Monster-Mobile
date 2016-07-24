/**
 * Created by newkrok on 14/08/15.
 */
package src.menu
{
	import net.fpp.common.starling.StaticAssetManager;

	import src.assets.Fonts;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.utils.Align;

	public class StarGuiView extends Sprite
	{
		private var _back:Image;

		private var _text:TextField;

		private var _value:uint = 0;

		public function StarGuiView():void
		{
			addEventListener( Event.ADDED_TO_STAGE, loaded );
		}

		private function loaded( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, loaded );

			addChild( _back = new Image( StaticAssetManager.instance.getTexture( "star_counter_back" ) ) );

			var textFormat:TextFormat = new TextFormat();
			textFormat.font = Fonts.getAachenLightFont().name;
			textFormat.size = 15;
			textFormat.color = 0xFFFF00;
			textFormat.horizontalAlign = Align.RIGHT;
			textFormat.verticalAlign = Align.CENTER;

			addChild( _text = new TextField( 50, _back.height, '0', textFormat ) );
			_text.touchable = false;
			_text.pivotX = _text.width / 2;
			_text.pivotY = _text.height / 2;
			_text.x = _back.width - _text.width - 10 + _text.pivotX;
			_text.y = 4 + _text.pivotY;
		}

		public function updateValue( value:uint ):void
		{
			if( value != _value )
			{
				_value = value;
				_text.text = _value.toString();
			}
		}

		override public function dispose():void
		{
			_back.removeFromParent( true );
			_back = null;

			_text.removeFromParent( true );
			_text = null;

			super.dispose();
		}
	}
}