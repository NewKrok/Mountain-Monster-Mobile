package src.menu
{
	import caurina.transitions.Tweener;

	import net.fpp.services.store.StaticStoreManager;

	import net.fpp.starling.StaticAssetManager;

	import rv2.sound.SoundHandler;

	import src.assets.Fonts;
	import src.constant.CPurchaseItem;
	import src.data.DataManager;
	import src.menu.events.MenuEvent;
	import src.utils.ComponentCheckbox;

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	import src.AbstractPanel;

	public class Options extends AbstractPanel
	{
		private var _muteCheckbox:ComponentCheckbox;
		private var _soundText:TextField;
		private var _soundContainer:Sprite;

		private var _soundCredit:TextField;

		private var _removeADButton:Button;
		private var _restoreButton:Button;
		private var _backButton:Button;

		public function Options():void
		{
		}

		override public function init():void
		{
			var margin:Number = 10;

			addChild( _soundContainer = new Sprite );
			_soundContainer.addChild( _muteCheckbox = new ComponentCheckbox( !DataManager.getIsMutedState ) );
			_muteCheckbox.addEventListener( Event.CHANGE, setVolume );
			_soundContainer.addChild( _soundText = new TextField( 125, _muteCheckbox.height, "SOUND" ) );
			_soundText.touchable = false;
			_soundText.fontSize = 18;
			_soundText.color = 0xFFFFFF;
			_soundText.fontName = Fonts.getAachenLightFont().name;
			_soundText.x = _muteCheckbox.width + 10;
			_soundText.hAlign = HAlign.LEFT;
			_soundText.vAlign = VAlign.CENTER;
			_soundContainer.x = stage.stageWidth;
			_soundContainer.y = margin;
			Tweener.addTween( _soundContainer, {
				delay: Math.random() * .5,
				time: .5,
				x: stage.stageWidth / 2 - ( _soundContainer.width - _soundText.width - 10 ) / 2
			} );

			addChild( _soundCredit = new TextField( 300, _muteCheckbox.height, "Music by Eric Matyas - http://soundimage.org" ) );
			_soundCredit.addEventListener( TouchEvent.TOUCH, onSoundCreditTouch );
			_soundCredit.fontSize = 12;
			_soundCredit.useHandCursor = true;
			_soundCredit.color = 0xFFFF00;
			_soundCredit.fontName = Fonts.getAachenLightFont().name;
			_soundCredit.x = stage.stageWidth / 2 - _soundCredit.width / 2;
			_soundCredit.y = _soundContainer.y + _soundContainer.height;
			_soundCredit.hAlign = HAlign.CENTER;
			_soundCredit.vAlign = VAlign.CENTER;

			addChild( _restoreButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "RESTORE" ) );
			_restoreButton.fontSize = 18;
			_restoreButton.fontColor = 0xFFFFFF;
			_restoreButton.fontName = Fonts.getAachenLightFont().name;
			_restoreButton.name = "restore";
			_restoreButton.x = -_restoreButton.width;
			_restoreButton.y = _soundCredit.y + _soundCredit.height + 5;
			Tweener.addTween( _restoreButton, {
				delay: Math.random() * .5,
				time: .5,
				x: stage.stageWidth / 2 - _restoreButton.width / 2
			} );

			addChild( _removeADButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "REMOVE AD" ) );
			_removeADButton.fontSize = 18;
			_removeADButton.fontColor = 0xFFFFFF;
			_removeADButton.fontName = Fonts.getAachenLightFont().name;
			_removeADButton.name = "remove_ad";
			_removeADButton.x = stage.stageWidth;
			_removeADButton.y = _restoreButton.y + _restoreButton.height + 10;
			_removeADButton.visible = !MountainMonsterIOSMain.AD_BLOCKED;
			Tweener.addTween( _removeADButton, {
				delay: Math.random() * .5,
				time: .5,
				x: stage.stageWidth / 2 - _removeADButton.width / 2
			} );

			addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "BACK" ) );
			_backButton.fontSize = 18;
			_backButton.fontColor = 0xFFFFFF;
			_backButton.fontName = Fonts.getAachenLightFont().name;
			_backButton.name = "back";
			_backButton.x = -_backButton.width;
			_backButton.y = stage.stageHeight - _backButton.height - margin;
			Tweener.addTween( _backButton, {
				delay: Math.random() * .5,
				time: .5,
				x: stage.stageWidth / 2 - _backButton.width / 2
			} );

			Tweener.addTween( this, {time: 1, onComplete: inited} );
		}

		private function onSoundCreditTouch( e:TouchEvent ):void
		{
			if( e.touches[ 0 ].phase == TouchPhase.BEGAN )
			{
				MountainMonsterIOSMain.goToMusicSource();
			}
		}

		private function inited():void
		{
			resume();
		}

		private function setVolume( event:Event ):void
		{
			SoundHandler.setBaseGroupVolume( "music", _muteCheckbox.state ? 1 : 0 );
			SoundHandler.setGroupVolume( "music", _muteCheckbox.state ? 1 : 0 );
			SoundHandler.setBaseGroupVolume( "fx", _muteCheckbox.state ? 1 : 0 );
			SoundHandler.setGroupVolume( "fx", _muteCheckbox.state ? 1 : 0 );
		}

		private function onButtonTriggered( event:Event ):void
		{
			SoundHandler.play( 'SND_BUTTON' );

			var button:Button = event.target as Button;

			switch( button.name )
			{
				case "back":
					DataManager.setIsMutedState( !_muteCheckbox.state );
					DataManager.saveCommonData();

					SoundHandler.setBaseGroupVolume( "music", _muteCheckbox.state ? 1 : 0 );
					SoundHandler.setGroupVolume( "music", _muteCheckbox.state ? 1 : 0 );
					SoundHandler.setBaseGroupVolume( "fx", _muteCheckbox.state ? 1 : 0 );
					SoundHandler.setGroupVolume( "fx", _muteCheckbox.state ? 1 : 0 );

					dispatchEvent( new MenuEvent( MenuEvent.MAIN_MENU_REQUEST ) );
					pause();
					break;
				case "remove_ad":
					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItem.PURCHASE_ITEM_REMOVE_AD );
					break;
				case "restore":
					StaticStoreManager.restoreTransactions();
					break;
			}
		}

		public function hideRemoveADButton():void
		{
			_removeADButton.visible = false;
		}

		public function pause():void
		{
			removeEventListener( Event.TRIGGERED, onButtonTriggered );
			touchable = false;
		}

		public function resume():void
		{
			addEventListener( Event.TRIGGERED, onButtonTriggered );
			touchable = true;
		}

		override public function dispose():void
		{
			pause();

			_soundCredit.removeEventListener( TouchEvent.TOUCH, onSoundCreditTouch );
			removeChild( _soundCredit, true );
			_soundCredit = null;

			Tweener.removeTweens( _muteCheckbox );
			_muteCheckbox.removeEventListener( Event.CHANGE, setVolume );
			removeChild( _muteCheckbox, true );
			_muteCheckbox = null;

			Tweener.removeTweens( _soundText );
			removeChild( _soundText, true );
			_soundText = null;

			Tweener.removeTweens( _soundContainer );
			removeChild( _soundContainer, true );
			_soundContainer = null;

			Tweener.removeTweens( _backButton );
			removeChild( _backButton, true );
			_backButton = null;

			super.dispose();
		}
	}
}