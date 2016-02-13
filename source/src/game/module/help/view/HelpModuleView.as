/**
 * Created by newkrok on 09/01/16.
 */
package src.game.module.help.view
{
	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.module.AModuleView;

	import rv2.sound.SoundHandler;

	import src.assets.Fonts;
	import src.common.DataManager;
	import src.game.module.help.events.HelpModuleEvent;

	import starling.display.Button;

	import starling.display.Image;

	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class HelpModuleView extends AModuleView
	{
		private var _helpTexts:Vector.<String>;

		private var _back:Quad;

		private var _content:Sprite;
		private var _contentBack:Image;
		private var _contentIcon:Image;
		private var _contentText:TextField;

		private var _nextButton:Button;
		private var _backButton:Button;

		private var _currentIndex:int = 0;
		private var _worldId:int = 0;

		override protected function onInit():void
		{
			this._back = new Quad( stage.stageWidth, stage.stageHeight, 0x000000, true );
			this._back.alpha = .8;
			this.addChild( this._back );

			addChild( _content = new Sprite );
			_content.addChild( _contentBack = new Image( StaticAssetManager.instance.getTexture( "help_back" ) ) );

			_content.addChild( _contentText = new TextField( 233, 100, '' ) );
			_contentText.touchable = false;
			_contentText.fontSize = 15;
			_contentText.color = 0xFFFFFF;
			_contentText.fontName = Fonts.getAachenLightFont().name;
			_contentText.hAlign = HAlign.CENTER;
			_contentText.vAlign = VAlign.CENTER;
			_contentText.x = 122;
			_contentText.y = 5.5;

			_content.addChild( _nextButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "NEXT" ) );
			_nextButton.fontSize = 18;
			_nextButton.fontColor = 0xFFFFFF;
			_nextButton.fontName = Fonts.getAachenLightFont().name;
			_nextButton.name = "next";
			_nextButton.x = _content.width / 2 + 5;
			_nextButton.y = _contentBack.height + 10;
			_nextButton.addEventListener( Event.TRIGGERED, onButtonTriggered );

			_content.addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "BACK" ) );
			_backButton.fontSize = 18;
			_backButton.fontColor = 0xFFFFFF;
			_backButton.fontName = Fonts.getAachenLightFont().name;
			_backButton.name = "back";
			_backButton.x = _content.width / 2 - _nextButton.width - 5;
			_backButton.y = _contentBack.height + 10;
			_backButton.addEventListener( Event.TRIGGERED, onButtonTriggered );

			_content.x = _back.width / 2 - _content.width / 2;
			_content.y = stage.stageHeight / 2 - _content.height / 2;

			this.updateText();
			this.updateButtonView();
			this.updateIcon();
		}

		public function setHelpText( texts:Vector.<String> ):void
		{
			this._helpTexts = texts;
		}

		public function setWorldId( worldId:uint ):void
		{
			this._worldId = worldId;
		}

		private function onButtonTriggered( event:Event ):void
		{
			SoundHandler.play( 'SND_BUTTON' );

			if( Button( event.currentTarget ).name == "next" )
			{
				this._currentIndex++;
				if( this._currentIndex == this._helpTexts.length )
				{
					var helpDatas:Array = DataManager.getHelpDatas();
					helpDatas[ this._worldId ] = true;
					DataManager.setHelpDatas( helpDatas );
					DataManager.save();

					this.dispatchEvent( new HelpModuleEvent( HelpModuleEvent.CLOSE_REQUEST ) );
					return;
				}
				else
				{
					this.updateText();
				}
			}
			else
			{
				this._currentIndex--;
				this.updateText();
			}

			this.updateButtonView();
			this.updateIcon();
		}

		private function updateText():void
		{
			this._contentText.text = this._helpTexts[ this._currentIndex ];
		}

		private function updateIcon():void
		{
			if( this._contentIcon )
			{
				this._contentIcon.removeFromParent( true );
				this._contentIcon = null;
			}

			this._content.addChild( this._contentIcon = new Image( StaticAssetManager.instance.getTexture( "help_icon_" + this._worldId + "_" + this._currentIndex ) ) );
			this._contentIcon.x = 3;
			this._contentIcon.y = 3;
		}

		private function updateButtonView():void
		{
			this._backButton.enabled = this._currentIndex != 0;

			if( this._currentIndex == this._helpTexts.length - 1 )
			{
				this._nextButton.text = "CLOSE";
			}
			else
			{
				this._nextButton.text = "NEXT";
			}
		}

		override public function dispose():void
		{
			this.removeChild( this._back, true );
			this._back = null;

			this._content.removeChild( this._contentBack, true );
			this._contentBack = null;

			this._content.removeChild( this._contentIcon, true );
			this._contentIcon = null;

			this._content.removeChild( this._contentText, true );
			this._contentText = null;

			this._content.removeChild( _nextButton, true );
			this._nextButton = null;

			this._content.removeChild( this._backButton, true );
			this._backButton = null;

			this.removeChild( this._content, true );
			this._content = null;

			super.dispose();
		}
	}
}