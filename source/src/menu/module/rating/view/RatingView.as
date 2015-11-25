/**
 * Created by newkrok on 23/09/15.
 */
package src.menu.module.rating.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	import net.fpp.starling.StaticAssetManager;

	import src.assets.Fonts;
	import src.assets.RuntimeTextures;
	import src.menu.module.rating.events.RatingModuleEvent;

	import starling.display.Button;

	import starling.display.Image;

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class RatingView extends Sprite
	{
		private var _elementContainer:Sprite;

		private var _background:Image;
		private var _darkBackground:Image;
		private var _title:TextField;

		private var _rateButton:Button;
		private var _notNowButton:Button;
		private var _neverButton:Button;

		public function RatingView()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );

			createElements();
			setElementContainerPosition();
		}

		private function createElements():void
		{
			_darkBackground = new Image ( RuntimeTextures.DARK_RECTANGLE );
			_darkBackground.width = stage.stageWidth;
			_darkBackground.height = stage.stageHeight;
			_darkBackground.alpha = .5;
			addChild( _darkBackground );

			_elementContainer = new Sprite();
			addChild( _elementContainer );

			_background = new Image( StaticAssetManager.instance.getTexture( 'panel_background' ) );
			_elementContainer.addChild( _background );

			_title = new TextField( _background.width, 50, "DO YOU LIKE THIS GAME?\nDON'T FORGET RATE FOR IT!", Fonts.getAachenLightFont().name, 18, 0xFFFFFF );
			_title.autoSize = 'center';
			_title.x = _background.width / 2 - _title.width / 2;
			_title.y = 10;
			_elementContainer.addChild( _title );

			_elementContainer.addChild( _rateButton = new Button( StaticAssetManager.instance.getTexture ( "base_button" ), "RATE!" ) );
			_rateButton.fontSize = 18;
			_rateButton.fontColor = 0xFFFFFF;
			_rateButton.fontName = Fonts.getAachenLightFont ().name;
			_rateButton.x = _elementContainer.width / 2 - _rateButton.width / 2;
			_rateButton.y = 50;
			_rateButton.addEventListener( Event.TRIGGERED, rateRequest );

			_elementContainer.addChild( _notNowButton = new Button( StaticAssetManager.instance.getTexture ( "base_button" ), "NOT NOW" ) );
			_notNowButton.fontSize = 18;
			_notNowButton.fontColor = 0xFFFFFF;
			_notNowButton.fontName = Fonts.getAachenLightFont ().name;
			_notNowButton.x = _elementContainer.width / 2 - _rateButton.width / 2;
			_notNowButton.y = _rateButton.y + _rateButton.height;
			_notNowButton.addEventListener( Event.TRIGGERED, rateLaterRequest );

			_elementContainer.addChild( _neverButton = new Button( StaticAssetManager.instance.getTexture ( "base_button" ), "NEVER!" ) );
			_neverButton.fontSize = 18;
			_neverButton.fontColor = 0xFFFFFF;
			_neverButton.fontName = Fonts.getAachenLightFont ().name;
			_neverButton.x = _elementContainer.width / 2 - _neverButton.width / 2;
			_neverButton.y = _notNowButton.y + _notNowButton.height;
			_neverButton.addEventListener( Event.TRIGGERED, rateNeverRequest );
		}

		private function rateRequest():void
		{
			dispatchEvent( new RatingModuleEvent( RatingModuleEvent.RATE_REQUEST ) );
		}

		private function rateLaterRequest():void
		{
			dispatchEvent( new RatingModuleEvent( RatingModuleEvent.RATE_LATER_REQUEST ) );
		}

		private function rateNeverRequest():void
		{
			dispatchEvent( new RatingModuleEvent( RatingModuleEvent.RATE_NEVER_REQUEST ) );
		}

		private function setElementContainerPosition():void
		{
			_elementContainer.x = stage.stageWidth / 2 - _elementContainer.width / 2;
			_elementContainer.y = stage.stageHeight / 2 - _elementContainer.height / 2;
		}

		override public function dispose():void
		{
			_elementContainer.removeFromParent( true );
			_elementContainer = null;

			_darkBackground.removeFromParent( true );
			_darkBackground = null;

			_background.removeFromParent( true );
			_background = null;

			_title.removeFromParent( true );
			_title = null;

			_rateButton.removeFromParent( true );
			_rateButton = null;

			_notNowButton.removeFromParent( true );
			_notNowButton = null;

			_neverButton.removeFromParent( true );
			_neverButton = null;

			super.dispose();
		}
	}
}