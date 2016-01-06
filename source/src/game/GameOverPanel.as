﻿package src.game{	import net.fpp.starling.StaticAssetManager;	import rv2.sound.SoundHandler;	import rv2.string.StringConverter;	import src.assets.Fonts;	import src.assets.Levels;	import src.constant.CLeaderBoard;	import src.data.DataManager;	import src.data.LevelEndVO;	import src.data.LevelResultVO;	import src.game.events.GameGuiEvent;	import starling.display.Button;	import starling.display.Image;	import starling.display.Quad;	import starling.display.Sprite;	import starling.events.Event;	import starling.text.TextField;	import starling.utils.HAlign;	import starling.utils.VAlign;	public class GameOverPanel extends Sprite	{		private var _coinGuiView:CoinGuiView;		private var _timeGuiView:TimeGuiView;		private var _back:Quad;		private var _panelBack:Image;		private var _starView:Image;		private var _panelContainer:Sprite;		private var _restartGameButton:Button;		private var _exitButton:Button;		private var _nextLevelButton:Button;		private var _titleText:TextField;		private var _subTitleText:TextField;		private var _scoreText:TextField;		private var _bestScoreText:TextField;		private var _bestScoreValueText:TextField;		private var _bestTimeText:TextField;		private var _bestTimeValueText:TextField;		private var _newHighscoreText:TextField;		private var _levelEndVO:LevelEndVO;		public function GameOverPanel( leveResultVO:LevelEndVO ):void		{			_levelEndVO = leveResultVO;			addEventListener( Event.ADDED_TO_STAGE, loaded );		}		private function loaded( event:Event ):void		{			removeEventListener( Event.ADDED_TO_STAGE, loaded );			this._back = new Quad( stage.stageWidth, stage.stageHeight, 0x000000, true );			this._back.width = this.stage.stageWidth;			this._back.height = this.stage.stageHeight;			this._back.alpha = .5;			this.addChild( this._back );			addChild( _panelContainer = new Sprite );			_panelContainer.addChild( _panelBack = new Image( StaticAssetManager.instance.getTexture( "panel_background" ) ) );			_panelContainer.addChild( _titleText = new TextField( _panelBack.width, 46, _levelEndVO.isWon ? 'LEVEL COMPLETED' : 'LEVEL FAILED' ) );			_titleText.fontSize = 20;			_titleText.fontName = Fonts.getAachenLightFont().name;			_titleText.color = 0xFFFFFF;			_titleText.y = 5;			_panelContainer.addChild( _subTitleText = new TextField( _panelBack.width, 25, 'LEVEL PACK ' + ( _levelEndVO.levelPackID + 1 ) + ' - LEVEL ' + ( _levelEndVO.id + 1 ) ) );			_subTitleText.fontSize = 10;			_subTitleText.fontName = Fonts.getAachenLightFont().name;			_subTitleText.color = 0xFFFFFF;			_subTitleText.y = 30;			addChild( _starView = new Image( StaticAssetManager.instance.getTexture( "large_star_" + _levelEndVO.starCount ) ) );			_panelContainer.addChild( _starView );			_starView.x = _panelBack.width / 2 - _starView.width / 2;			_starView.y = 50;			_panelContainer.addChild( _scoreText = new TextField( _panelBack.width, 30, 'SCORE: ' + StringConverter.numberToFString( _levelEndVO.score ) ) );			_scoreText.fontSize = 16;			_scoreText.autoSize = 'center';			_scoreText.fontName = Fonts.getAachenLightFont().name;			_scoreText.color = 0xFFFF00;			_scoreText.y = 80;			_panelContainer.addChild( _newHighscoreText = new TextField( 120, 30, 'NEW HIGHSCORE!' ) );			_newHighscoreText.fontSize = 10;			_newHighscoreText.hAlign = HAlign.RIGHT;			_newHighscoreText.vAlign = VAlign.CENTER;			_newHighscoreText.autoSize = 'right';			_newHighscoreText.fontName = Fonts.getAachenLightFont().name;			_newHighscoreText.color = 0xFFFF00;			_newHighscoreText.x = _panelBack.width - _newHighscoreText.width - 10;			_newHighscoreText.y = 79;			_newHighscoreText.visible = false;			_panelContainer.addChild( _coinGuiView = new CoinGuiView );			_coinGuiView.updateValue( _levelEndVO.collectedCoin, false );			_coinGuiView.x = _panelBack.width / 2 - _coinGuiView.width - 15;			_coinGuiView.y = 110;			_panelContainer.addChild( _timeGuiView = new TimeGuiView );			_timeGuiView.updateValue( _levelEndVO.gameTime, false );			_timeGuiView.x = _panelBack.width / 2 + 15;			_timeGuiView.y = 110;			_panelContainer.addChild( _bestScoreText = new TextField( 62, 25, "BEST SCORE:" ) );			_bestScoreText.hAlign = HAlign.LEFT;			_bestScoreText.fontSize = 10;			_bestScoreText.fontName = Fonts.getAachenLightFont().name;			_bestScoreText.color = 0xFFFFFF;			_bestScoreText.x = 15;			_bestScoreText.y = _panelBack.height - _bestScoreText.height - 10;			var levelResult:LevelResultVO = DataManager.getLevelData( _levelEndVO.levelPackID, _levelEndVO.id );			var bestScore:String = levelResult.isCompleted ? StringConverter.numberToFString( levelResult.score ) : 'N/A';			_panelContainer.addChild( _bestScoreValueText = new TextField( 40, 25, bestScore ) );			_bestScoreValueText.hAlign = HAlign.CENTER;			_bestScoreValueText.fontSize = 10;			_bestScoreValueText.fontName = Fonts.getAachenLightFont().name;			_bestScoreValueText.color = 0xFFFF00;			_bestScoreValueText.x = _bestScoreText.x + _bestScoreText.width;			_bestScoreValueText.y = _bestScoreText.y;			var bestTime:String = levelResult.isCompleted ? StringConverter.timeStampToTime( levelResult.gameTime, {				hour: false,				millisecond: true			} ) : 'N/A';			_panelContainer.addChild( _bestTimeValueText = new TextField( 50, 25, bestTime ) );			_bestTimeValueText.hAlign = HAlign.CENTER;			_bestTimeValueText.fontSize = 10;			_bestTimeValueText.fontName = Fonts.getAachenLightFont().name;			_bestTimeValueText.color = 0xFFFF00;			_bestTimeValueText.x = _panelContainer.width - _bestTimeValueText.width - 15;			_bestTimeValueText.y = _bestScoreText.y;			_panelContainer.addChild( _bestTimeText = new TextField( 60, 25, "BEST TIME:" ) );			_bestTimeText.hAlign = HAlign.RIGHT;			_bestTimeText.fontSize = 10;			_bestTimeText.fontName = Fonts.getAachenLightFont().name;			_bestTimeText.color = 0xFFFFFF;			_bestTimeText.x = _bestTimeValueText.x - _bestTimeText.width - 5;			_bestTimeText.y = _bestScoreText.y;			_panelContainer.x = stage.stageWidth / 2 - _panelContainer.width / 2;			_panelContainer.y = stage.stageHeight / 2 - _panelContainer.height / 2 - 40;			addChild( _exitButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "EXIT" ) );			_exitButton.fontSize = 18;			_exitButton.fontColor = 0xFFFFFF;			_exitButton.fontName = Fonts.getAachenLightFont().name;			_exitButton.x = stage.stageWidth / 2 - _exitButton.width - 5;			_exitButton.y = _panelContainer.y + _panelContainer.height + 10;			_exitButton.addEventListener( Event.TRIGGERED, exitRequest );			addChild( _restartGameButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "RESTART GAME" ) );			_restartGameButton.fontSize = 18;			_restartGameButton.fontColor = 0xFFFFFF;			_restartGameButton.fontName = Fonts.getAachenLightFont().name;			_restartGameButton.x = stage.stageWidth / 2 + 5;			_restartGameButton.y = _exitButton.y;			_restartGameButton.addEventListener( Event.TRIGGERED, restartRequest );			var hasNextLevelInLevelPack:Boolean = _levelEndVO.id + 1 < Levels.levels[ _levelEndVO.levelPackID ].length;			if( _levelEndVO.isWon )			{				var previousTotalScoreInCurrentLevelPack:Number = DataManager.getScoreByWorldID( _levelEndVO.levelPackID );				DataManager.setLevelData( _levelEndVO.levelPackID, _levelEndVO.id, true, true, _levelEndVO.score, _levelEndVO.starCount, _levelEndVO.gameTime );				if( hasNextLevelInLevelPack )				{					DataManager.setLevelData( _levelEndVO.levelPackID, _levelEndVO.id + 1, true, false );				}				var currentTotalScoreInAllLevelPack:Number = DataManager.getScoreByAllWorld();				var currentTotalScoreInCurrentLevelPack:Number = DataManager.getScoreByWorldID( _levelEndVO.levelPackID );				if( previousTotalScoreInCurrentLevelPack < currentTotalScoreInCurrentLevelPack )				{					_newHighscoreText.visible = true;				}				CONFIG::IS_MOBILE_VERSION {					MountainMonsterIOSMain.gcManager.reportScoreForLeaderboard ( CLeaderBoard.LEADERBOARD_NAME, currentTotalScoreInAllLevelPack );						if ( _levelEndVO.levelPackID == 0 )					{						MountainMonsterIOSMain.gcManager.reportScoreForLeaderboard ( CLeaderBoard.LEADERBOARD_NAME_LEVEL_PACK_1, currentTotalScoreInCurrentLevelPack );					}					else if ( _levelEndVO.levelPackID == 1 )					{						MountainMonsterIOSMain.gcManager.reportScoreForLeaderboard ( CLeaderBoard.LEADERBOARD_NAME_LEVEL_PACK_2, currentTotalScoreInCurrentLevelPack );					}					else if ( _levelEndVO.levelPackID == 2 )					{						MountainMonsterIOSMain.gcManager.reportScoreForLeaderboard ( CLeaderBoard.LEADERBOARD_NAME_LEVEL_PACK_3, currentTotalScoreInCurrentLevelPack );					}				}			}			if( levelResult.isCompleted && hasNextLevelInLevelPack )			{				addChild( _nextLevelButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), "NEXT LEVEL" ) );				_nextLevelButton.fontSize = 18;				_nextLevelButton.fontColor = 0xFFFFFF;				_nextLevelButton.fontName = Fonts.getAachenLightFont().name;				_nextLevelButton.x = stage.stageWidth / 2 - _nextLevelButton.width / 2;				_nextLevelButton.y = _exitButton.y + _exitButton.height + 5;				_nextLevelButton.addEventListener( Event.TRIGGERED, nextLevelRequest );				_panelContainer.y -= 10;			}			checkAdState();		}		private function checkAdState():void		{			if ( DataManager.getTotalPlayedGameCount() % 2 == 0 )			{				CONFIG::IS_MOBILE_VERSION {					if ( !MountainMonsterIOSMain.AD_BLOCKED )					{						MountainMonsterIOSMain.adManager.addAdMobFullScreenView( "ca-app-pub-7267616582116110/4209530384" );					}				}				trace( 'check ad state...' );			}		}		private function restartRequest( event:Event ):void		{			SoundHandler.play( 'SND_BUTTON' );			disableButtons();			dispatchEvent( new GameGuiEvent( GameGuiEvent.INGAME_RESTART_REQUEST ) );		}		private function exitRequest( event:Event ):void		{			SoundHandler.play( 'SND_BUTTON' );			disableButtons();			dispatchEvent( new GameGuiEvent( GameGuiEvent.GAME_END_REQUEST ) );		}		private function nextLevelRequest( event:Event ):void		{			SoundHandler.play( 'SND_BUTTON' );			disableButtons();			dispatchEvent( new GameGuiEvent( GameGuiEvent.NEXT_LEVEL_REQUEST ) );		}		private function disableButtons():void		{			_restartGameButton.removeEventListener( Event.TRIGGERED, restartRequest );			_exitButton.removeEventListener( Event.TRIGGERED, exitRequest );			if( _nextLevelButton )			{				_nextLevelButton.removeEventListener( Event.TRIGGERED, nextLevelRequest );			}		}		override public function dispose():void		{			_back.removeFromParent( true );			_back = null;			_titleText.removeFromParent( true );			_titleText = null;			_subTitleText.removeFromParent( true );			_subTitleText = null;			_scoreText.removeFromParent( true );			_scoreText = null;			_newHighscoreText.removeFromParent( true );			_newHighscoreText = null;			_starView.removeFromParent( true );			_starView = null;			_coinGuiView.removeFromParent( true );			_coinGuiView = null;			_timeGuiView.removeFromParent( true );			_timeGuiView = null;			disableButtons();			_restartGameButton.removeFromParent( true );			_restartGameButton = null;			_exitButton.removeFromParent( true );			_exitButton = null;			if( _nextLevelButton )			{				_nextLevelButton.removeFromParent( true );				_nextLevelButton = null;			}			_panelContainer.removeFromParent( true );			_panelContainer = null;			super.dispose();		}	}}