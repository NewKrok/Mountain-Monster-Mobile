﻿package src.game{		import caurina.transitions.Tweener;
	
	import net.fpp.starling.StaticAssetManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	    public class BridgeElement extends Sprite	{				private var _graphic:		Image;				public function BridgeElement( ):void		{			addEventListener( Event.ADDED_TO_STAGE, loaded );		}				private function loaded( event:Event ):void		{			removeEventListener ( Event.ADDED_TO_STAGE, loaded );			addChild ( _graphic = new Image ( StaticAssetManager.instance.getTexture ( "bridge" ) ) );						pivotX = _graphic.width / 2;			pivotY = _graphic.height / 2;		}				override public function dispose( ):void		{			Tweener.removeTweens( this );						_graphic.removeFromParent( true );			_graphic = null;						super.dispose( );		}			}	}