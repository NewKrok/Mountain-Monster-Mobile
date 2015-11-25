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
	    public class StartGamePanelStarView extends Sprite	{		private var _graphic:			Image;				private var _description:		TextField;				private var _value:				uint;		private var _descriptionScore:	uint;				public function StartGamePanelStarView( value:uint, descriptionScore:uint ):void		{			_value = value;			_descriptionScore = descriptionScore;						addEventListener( Event.ADDED_TO_STAGE, loaded );		}				private function loaded( event:Event ):void		{			removeEventListener ( Event.ADDED_TO_STAGE, loaded );						addChild( _graphic = new Image( StaticAssetManager.instance.getTexture( "large_star_" + _value ) ) );						addChild( _description = new TextField( 150, _graphic.height, 'EARN ' + StringConverter.numberToFString( _descriptionScore ) + ' SCORE' ) );			_description.touchable = false;			_description.fontSize = 13;			_description.color = 0xFFFFFF;			_description.fontName = Fonts.getAachenLightFont( ).name;			_description.hAlign = HAlign.LEFT;			_description.vAlign = VAlign.CENTER;			_description.x = _graphic.width + 10;			_description.y = 5;		}				override public function dispose( ):void		{			_graphic.removeFromParent( true );			_graphic = null;			_description.removeFromParent( true );			_description = null;						super.dispose( );		}	}}