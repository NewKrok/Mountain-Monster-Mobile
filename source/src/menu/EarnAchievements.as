package src.menu {
	
	import caurina.transitions.Tweener;
	
	import flash.geom.Point;
	
	CONFIG::IS_MOBILE_VERSION {
		import flash.text.AutoCapitalize;
	}
	
	import flashx.textLayout.formats.TextAlign;
	
	import src.Static;
	import src.User;
	import src.assets.Fonts;
	import src.events.MenuEvent;
	import src.utils.ComponentCheckbox;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import src.common.DataManager;
	import src.assets.Achievements;
	import src.assets.AchievementInfo;
	import src.utils.BaseButton;
	import src.SheepMazeMain;
	import rv2.sound.SoundHandler;
	import src.AbstractPanel;
	
	public class EarnAchievements extends AbstractPanel {
		
		private var _tmpData:			AchievementInfo;
		
		private var _onClose:			Function;
		private var _onCloseParams:		Array;
		
		private var _container:			Sprite;
		
		private var _text:				TextField;
		
		private var _okButton:			BaseButton;
		
		private var _back:				Image;
		private var _icon:				Image;
		
		private var _tmpIndex:			uint = 0;
		
		public function EarnAchievements ( $onClose:Function, $onCloseParams:Array = null ) :void {
			SoundHandler.play ( "SND_ACHIEVEMENT" );
			_onClose = $onClose;
			_onCloseParams = $onCloseParams;
			addChild ( _container = new Sprite );
			_container.addChild ( _back = new Image ( Static.assetManager.getTexture ( "achievement_earned_back" ) ) );
			_container.touchable = false;
			_back.touchable = false;
			_tmpData = Achievements.getAchievementData ( DataManager.dirtyEnabledAchievements[_tmpIndex] );
			_container.addChild ( _icon = new Image ( Static.assetManager.getTexture ( _tmpData.imageID ) ) );
			_icon.touchable = false;
			_icon.x = 28;
			_icon.y = 80;
			_container.addChild ( _text = new TextField ( 190, 120, _tmpData.description ) );
			_text.touchable = false;
			_text.fontSize = 16;
			_text.color = 0x000000;
			_text.alpha = .75;
			_text.fontName = Fonts.getAachenLightFont ().name;
			_text.hAlign = HAlign.LEFT;
			_text.vAlign = VAlign.TOP;
			_text.x = 90;
			_text.y = 80;
			_container.x = Starling.current.stage.stageWidth;
			_container.y = 120;
			Tweener.addTween ( _container, { delay: Math.random () * .5, time: .5, x: Starling.current.stage.stageWidth / 2 - _container.width / 2 } );
			addChild ( _okButton = new BaseButton ( "Ok" ) );
			_okButton.x = -_okButton.width;
			_okButton.y = _container.y + _container.height + 10;
			_okButton.name = "ok";
			Tweener.addTween ( _okButton, { delay: Math.random () * .5, time: .5, x: Starling.current.stage.stageWidth / 2 - _okButton.width / 2, onComplete: resume } );
		}
		
		private function showNext () :void {
			pause ();
			_tmpIndex++;
			if ( _tmpIndex >= DataManager.dirtyEnabledAchievements.length ) {
				DataManager.saveAchievementData ();
				_onClose.apply ( this, _onCloseParams );
				return;
			}
			SoundHandler.play ( "SND_ACHIEVEMENT" );
			Tweener.addTween ( _container, { time: .5, x: -_container.width, onComplete: reset } );
			_tmpData = Achievements.getAchievementData ( DataManager.dirtyEnabledAchievements[_tmpIndex] );
			Tweener.addTween ( _container, { delay: .6, time: .5, x: Starling.current.stage.stageWidth / 2 - _container.width / 2, onComplete: resume } );
		}
		
		private function reset () :void {
			_container.x = Starling.current.stage.stageWidth;
			removeChild ( _icon, true );
			_icon = null;
			_container.addChild ( _icon = new Image ( Static.assetManager.getTexture ( _tmpData.imageID ) ) );
			_icon.touchable = false;
			_icon.x = 28;
			_icon.y = 80;
			_text.text = _tmpData.description;
		}
		
		private function onButtonTriggered ( event:Event ) :void {
			var button:BaseButton = event.target as BaseButton;
			if ( button.name == "ok" )
				showNext ();
		}
		
		public function pause () :void {
			removeEventListener ( Event.TRIGGERED, onButtonTriggered );
			_okButton.enabled = false;
		}

		public function resume () :void {
			addEventListener ( Event.TRIGGERED, onButtonTriggered );
			_okButton.enabled = true;
		}
		
		override public function dispose () :void {
			_tmpData = null;
			_onClose = null;
			_onCloseParams = null;
			pause ();
			removeChild ( _back, true );
			_back = null;
			removeChild ( _icon, true );
			_icon = null;
			removeChild ( _text, true );
			_text = null;
			removeChild ( _container, true );
			_container = null;
			removeChild ( _okButton, true );
			_okButton = null;
			super.dispose ();
		}
		
	}
	
}