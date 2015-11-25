/**
 * Created by newkrok on 14/08/15.
 */
package src.menu
{
	import net.fpp.starling.StaticAssetManager;

	import src.assets.Fonts;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class StarGuiView extends Sprite
	{
		private var _back:		Image;

		private var _text:		TextField;

		private var _value:		uint = 0;

		public function StarGuiView( ):void
		{
			addEventListener( Event.ADDED_TO_STAGE, loaded );
		}

		private function loaded( event:Event ):void
		{
			removeEventListener ( Event.ADDED_TO_STAGE, loaded );

			addChild ( _back = new Image ( StaticAssetManager.instance.getTexture ( "star_counter_back" ) ) );

			addChild( _text = new TextField( 50, _back.height, '0' ) );
			_text.touchable = false;
			_text.fontSize = 15;
			_text.color = 0xFFFF00;
			_text.fontName = Fonts.getAachenLightFont( ).name;
			_text.hAlign = HAlign.RIGHT;
			_text.vAlign = VAlign.CENTER;
			_text.pivotX = _text.width / 2;
			_text.pivotY = _text.height / 2;
			_text.x = _back.width - _text.width - 10 + _text.pivotX;
			_text.y = 4 + _text.pivotY;
		}

		public function updateValue( value:uint ):void
		{
			if ( value != _value )
			{
				_value = value;
				_text.text = _value.toString( );
			}
		}

		override public function dispose( ):void
		{
			_back.removeFromParent( true );
			_back = null;

			_text.removeFromParent( true );
			_text = null;

			super.dispose( );
		}

	}

}