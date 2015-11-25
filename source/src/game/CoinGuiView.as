package src.game{
	import caurina.transitions.Tweener;
	
	import net.fpp.starling.StaticAssetManager;
	
	import rv2.string.StringConverter;
	
	import src.assets.Fonts;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	    public class CoinGuiView extends Sprite	{				private var _back:		Image;				private var _text:		TextField;				private var _value:		uint = 0;				public function CoinGuiView( ):void		{			addEventListener( Event.ADDED_TO_STAGE, loaded );		}				private function loaded( event:Event ):void		{			removeEventListener ( Event.ADDED_TO_STAGE, loaded );						addChild ( _back = new Image ( StaticAssetManager.instance.getTexture ( "gui_coin_back" ) ) );						addChild( _text = new TextField( 40, _back.height, '0' ) );			_text.touchable = false;			_text.fontSize = 15;			_text.color = 0xFFFF00;			_text.fontName = Fonts.getAachenLightFont( ).name;			_text.hAlign = HAlign.CENTER;			_text.vAlign = VAlign.CENTER;			_text.pivotX = _text.width / 2;			_text.pivotY = _text.height / 2;			_text.x = _back.width - _text.width - 3 + _text.pivotX;			_text.y = 4 + _text.pivotY;		}				public function updateValue( value:uint, isUpdateEffectEnabled:Boolean = true ):void		{			if ( value != _value )			{				_value = value;								if ( _value != 0 && isUpdateEffectEnabled )				{					Tweener.removeTweens( _text );					Tweener.addTween( _text, { time: .2, scaleX: 1.2, scaleY: 1.2 } );					Tweener.addTween( _text, { delay: .2, time: .2, scaleX: 1, scaleY: 1 } );				}								_text.text = _value.toString( );			}		}						override public function dispose( ):void		{			_back.removeFromParent( true );			_back = null;						Tweener.removeTweens( _text );			_text.removeFromParent( true );			_text = null;						super.dispose( );		}			}	}