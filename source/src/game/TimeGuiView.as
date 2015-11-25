﻿package src.game{
	import net.fpp.starling.StaticAssetManager;
	
	import rv2.string.StringConverter;
	
	import src.assets.Fonts;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	    public class TimeGuiView extends Sprite	{				private var _back:		Image;				private var _text:		TextField;				public function TimeGuiView( ):void		{			addEventListener( Event.ADDED_TO_STAGE, loaded );		}				private function loaded( event:Event ):void		{			removeEventListener ( Event.ADDED_TO_STAGE, loaded );						addChild ( _back = new Image ( StaticAssetManager.instance.getTexture ( "gui_time_back" ) ) );						addChild( _text = new TextField( 40, _back.height, '0' ) );			_text.touchable = false;			_text.fontSize = 15;			_text.color = 0x26FF92;			_text.fontName = Fonts.getAachenLightFont( ).name;			_text.hAlign = HAlign.LEFT;			_text.vAlign = VAlign.CENTER;			_text.x = _back.width - _text.width - 3;			_text.y = 4;		}				public function updateValue( value:uint, isLowValueColoringEnabled:Boolean = true ):void		{			if ( value <= 1000 * 10 && isLowValueColoringEnabled )			{				_text.color = 0xFFB399;			}			else			{				_text.color = 0x26FF92;			}						_text.text = StringConverter.timeStampToTime( value, { hour: false } );		}						override public function dispose( ):void		{			_back.removeFromParent( true );			_back = null;						_text.removeFromParent( true );			_text = null;						super.dispose( );		}			}	}