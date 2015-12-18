package src.game.module.help
{
	import net.fpp.starling.StaticAssetManager;

	import rv2.sound.SoundHandler;

	import src.assets.Fonts;
	import src.assets.RuntimeTextures;
	import src.data.DataManager;

	import starling.display.Button;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class HelpModule extends Sprite
	{
		private const HELP_TEXTS:Vector.<Vector.<String>> = new <Vector.<String>> [
			new <String> [
				"Touch right arrows to accelerate or to brake.".toUpperCase(),
				"Touch left arrows to lean back or to lean front with the car.".toUpperCase(),
				"Collect Coins to earn more score.".toUpperCase(),
				"Do back flip, front flip, wheelie or nice air time to earn more score.".toUpperCase(),
				"Good luck, have a nice ride!".toUpperCase(),
			],
			new <String> [
				'It is hard to drive on places covered with snow.'.toUpperCase(),
				'Be careful in the blizzard!'.toUpperCase(),
			],
			new <String> [
				'description...!'.toUpperCase()
			],
			new <String> [
				'description...'.toUpperCase()
			]
		];

		private var _onComplete:Function;

		private var _back:Image;

		private var _content:Sprite;
		private var _contentBack:Image;
		private var _contentIcon:Image;
		private var _contentText:TextField;

		private var _nextButton:Button;
		private var _backButton:Button;

		private var _worldId:int = 0;

		private var _currentIndex:uint;

		public function HelpModule( worldId:int, onComplete:Function ):void
		{
			_worldId = worldId;
			_onComplete = onComplete;
			addEventListener( Event.ADDED_TO_STAGE, build );
		}

		public function build():void
		{
			removeEventListener( Event.ADDED_TO_STAGE, build );

			this._back = new Image ( RuntimeTextures.DARK_RECTANGLE );
			this._back.width = this.stage.stageWidth;
			this._back.height = this.stage.stageHeight;
			this._back.alpha = .8;
			this.addChild( this._back );

			addChild( _content = new Sprite );
			_content.addChild( _contentBack = new Image( StaticAssetManager.instance.getTexture( "help_back" ) ) );

			_content.addChild( _contentText = new TextField( 237, 100, HELP_TEXTS[ _worldId ][ _currentIndex ] ) );
			_contentText.touchable = false;
			_contentText.fontSize = 15;
			_contentText.color = 0xFFFFFF;
			_contentText.fontName = Fonts.getAachenLightFont().name;
			_contentText.hAlign = HAlign.CENTER;
			_contentText.vAlign = VAlign.CENTER;
			_contentText.x = 120;
			_contentText.y = 5.5;

			_content.addChild( _nextButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "NEXT" ) );
			_nextButton.fontSize = 18;
			_nextButton.fontColor = 0xFFFFFF;
			_nextButton.fontName = Fonts.getAachenLightFont ().name;
			_nextButton.name = "next";
			_nextButton.x = _content.width / 2 + 5;
			_nextButton.y = _contentBack.height + 10;
			_nextButton.addEventListener( Event.TRIGGERED, onButtonTriggered );

			_content.addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "BACK" ) );
			_backButton.fontSize = 18;
			_backButton.fontColor = 0xFFFFFF;
			_backButton.fontName = Fonts.getAachenLightFont ().name;
			_backButton.name = "back";
			_backButton.x = _content.width / 2 - _nextButton.width - 5;
			_backButton.y = _contentBack.height + 10;
			_backButton.addEventListener( Event.TRIGGERED, onButtonTriggered );

			_content.x = _back.width / 2 - _content.width / 2;
			_content.y = stage.stageHeight / 2 - _content.height / 2;

			updateButtonView();
			updateIcon();
		}

		private function onButtonTriggered( event:Event ):void
		{
			SoundHandler.play( 'SND_BUTTON' );

			if( Button( event.currentTarget ).name == "next" )
			{
				_currentIndex++;
				if( _currentIndex == HELP_TEXTS[ _worldId ].length )
				{
					var helpDatas:Array = DataManager.getHelpDatas();
					helpDatas[_worldId] = true;
					DataManager.setHelpDatas( helpDatas );
					DataManager.save();

					_onComplete.call( this, event );
					return;
				}
				else
				{
					_contentText.text = HELP_TEXTS[ _worldId ][ _currentIndex ];
				}
			}
			else
			{
				_currentIndex--;
				_contentText.text = HELP_TEXTS[ _worldId ][ _currentIndex ];
			}

			updateButtonView();
			updateIcon();
		}

		private function updateIcon():void
		{
			if( _contentIcon )
			{
				removeChild( _contentIcon, true );
				_contentIcon = null;
			}

			_content.addChild( _contentIcon = new Image( StaticAssetManager.instance.getTexture( "help_icon_" + _worldId + "_" + _currentIndex ) ) );
			_contentIcon.x = 3;
			_contentIcon.y = 3;
		}

		private function updateButtonView():void
		{
			_backButton.enabled = _currentIndex != 0;

			if( _currentIndex == HELP_TEXTS[ _worldId ].length - 1 )
			{
				_nextButton.text = "CLOSE";
			}
			else
			{
				_nextButton.text = "NEXT";
			}
		}

		override public function dispose():void
		{
			removeChild( _back, true );
			_back = null;

			_content.removeChild( _contentBack, true );
			_contentBack = null;

			_content.removeChild( _contentIcon, true );
			_contentIcon = null;

			_content.removeChild( _contentText, true );
			_contentText = null;

			_content.removeChild( _nextButton, true );
			_nextButton = null;

			_content.removeChild( _backButton, true );
			_backButton = null;

			removeChild( _content, true );
			_content = null;

			super.dispose();
		}
	}
}