package src.common
{
	import src.data.*;
	import flash.net.SharedObject;

	public class DataManager
	{
		private static var _dirtyLevels:Vector.<Object> = new Vector.<Object>;

		private static var _savedLevelDatas:SavedLevelDatas;

		private static var _unlockedLevelPacks:Vector.<uint> = new Vector.<uint>;

		private static var _commonDatas:Object;
		private static var _savedCommonDatas:SharedObject;

		private static var _levelDataIsDirty:Boolean;

		public static function init( namespace:String ):void
		{
			_savedLevelDatas = new SavedLevelDatas( namespace );

			_savedCommonDatas = SharedObject.getLocal( namespace + '_FPP_COMMON_DATA_' );

			if( _savedCommonDatas.data.content == undefined )
			{
				/*
				 Saved data pattern
				 SHOW_HELPS
				 HELP_DATA
				 IS_MUTED
				 RATING_DATA
				 UNLOCKED_CAR_DATAS
				 LAST_PLAYED_LEVEL_PACK_ID
				 LAST_SELECTED_CAR_ID
				 COMPLETED_TASKS
				 */
				_savedCommonDatas.data.content = [ true, [], false, true, [], [], 0, 0, [] ];
				_savedCommonDatas.flush();
			}

			if( _savedCommonDatas.data.content[ 4 ] == undefined )
			{
				_savedCommonDatas.data.content[ 4 ] = [];
			}

			if( _savedCommonDatas.data.content[ 5 ] == undefined )
			{
				_savedCommonDatas.data.content[ 5 ] = [];
			}

			if( _savedCommonDatas.data.content[ 6 ] == undefined )
			{
				_savedCommonDatas.data.content[ 6 ] = 0;
			}

			if( _savedCommonDatas.data.content[ 7 ] == undefined )
			{
				_savedCommonDatas.data.content[ 7 ] = 0;
			}

			if( _savedCommonDatas.data.content[ 8 ] == undefined )
			{
				_savedCommonDatas.data.content[ 8 ] = [];
			}

			_commonDatas = {
				showHelps: _savedCommonDatas.data.content[ 0 ],
				helpDatas: _savedCommonDatas.data.content[ 1 ],
				isMuted: _savedCommonDatas.data.content[ 2 ],
				ratingData: _savedCommonDatas.data.content[ 3 ],
				playedGameCounters: _savedCommonDatas.data.content[ 4 ],
				unlockedCarDatas: _savedCommonDatas.data.content[ 5 ],
				lastPlayedLevelPackId: _savedCommonDatas.data.content[ 6 ],
				lastSelectedCarId: _savedCommonDatas.data.content[ 7 ],
				completedTasks: _savedCommonDatas.data.content[ 8 ]
			};

			DataManager.unlockLevelPack( 0 );
			DataManager.unlockCar( 0 );
		}

		public static function save():void
		{
			trace( "Save game data..." );
			saveNormalLevelData();
			saveCommonData();
			TasksManager.save();
			trace( "Game data saved" );
		}

		public static function saveCommonData():void
		{
			_savedCommonDatas.data.content = [
				_commonDatas.showHelps,
				_commonDatas.helpDatas,
				_commonDatas.isMuted,
				_commonDatas.ratingData,
				_commonDatas.playedGameCounters,
				_commonDatas.unlockedCarDatas,
				_commonDatas.lastPlayedLevelPackId,
				_commonDatas.lastSelectedCarId,
				_commonDatas.completedTasks
			];
			_savedCommonDatas.flush();
		}

		public static function setShowHelpState( value:Boolean ):void
		{
			if( value )
			{
				_commonDatas.helpDatas = [];
			}
			_commonDatas.showHelps = value;
		}

		public static function setHelpDatas( value:Array ):void
		{
			_commonDatas.helpDatas = value;
		}

		public static function get getIsMutedState():Boolean
		{
			return _commonDatas.isMuted;
		}

		public static function setIsMutedState( value:Boolean ):void
		{
			_commonDatas.isMuted = value;
		}

		public static function get getPlayedGameCounters():Array
		{
			return _commonDatas.playedGameCounters;
		}

		public static function setPlayedGameCounters( value:Array ):void
		{
			_commonDatas.playedGameCounters = value;
		}

		public static function get getRatingData():Boolean
		{
			return _commonDatas.ratingData;
		}

		public static function setRatingData( value:Boolean ):void
		{
			_commonDatas.ratingData = value;
		}

		public static function getShowHelpState():Boolean
		{
			return _commonDatas.showHelps;
		}

		public static function getHelpDatas():Array
		{
			return _commonDatas.helpDatas;
		}

		public static function getLastPlayedLevelPackId():int
		{
			return _commonDatas.lastPlayedLevelPackId;
		}

		public static function getLastSelectedCarId():int
		{
			return _commonDatas.lastSelectedCarId;
		}

		public static function setLastSelectedCarId( value:uint ):void
		{
			_commonDatas.lastSelectedCarId = value;
		}

		public static function getCompletedTaskListByWorld( worldID:uint ):Array
		{
			if ( _commonDatas.completedTasks[worldID] == undefined )
			{
				_commonDatas.completedTasks[worldID] = [];
			}

			return _commonDatas.completedTasks[worldID];
		}

		public static function setCompletedTaskListInWorld( worldID:uint, value:Array ):void
		{
			_commonDatas[worldID] = value;
		}

		public static function getLevelData( levelPackID:uint, levelID:uint ):LevelResultVO
		{
			return _savedLevelDatas.getLevelResultVO( levelPackID, levelID );
		}

		public static function setLevelData( levelPackID:uint, levelID:uint, isEnabled:Boolean, isCompleted:Boolean, score:uint = 0, starCount:uint = 0, gameTime:Number = 0 ):void
		{
			var normalLevelData:LevelResultVO = _savedLevelDatas.getLevelResultVO( levelPackID, levelID );
			var isDirty:Boolean = false;

			if( isEnabled && !normalLevelData.isEnabled )
			{
				isDirty = true;
				normalLevelData.isEnabled = isEnabled;
			}
			if( isCompleted && !normalLevelData.isCompleted )
			{
				isDirty = true;
				normalLevelData.isCompleted = isCompleted;
			}
			if( score > normalLevelData.score )
			{
				isDirty = true;
				normalLevelData.score = score;
			}
			if( starCount > normalLevelData.starCount )
			{
				isDirty = true;
				normalLevelData.starCount = starCount;
			}
			if( gameTime != 0 && ( gameTime < normalLevelData.gameTime || ( gameTime != 0 && normalLevelData.gameTime == 0 ) ) )
			{
				isDirty = true;
				normalLevelData.gameTime = gameTime;
			}
			if( isDirty )
			{
				_levelDataIsDirty = true;
				_dirtyLevels.push( {levelPackID: levelPackID, levelID: levelID} );
			}
		}

		public static function getCompletedNormalLevelDataCount( levelPackID:uint ):uint
		{
			return _savedLevelDatas.getCountOfCompletedLevelsInLeveLPack( levelPackID );
		}

		public static function setLastPlayedGame( levelPackID:uint, levelID:uint ):void
		{
			_savedLevelDatas.setLastPlayedGame( levelPackID, levelID );
			_commonDatas.lastPlayedLevelPackId = levelPackID;
		}

		public static function saveNormalLevelData():void
		{
			if( !_levelDataIsDirty )
			{
				return;
			}
			_savedLevelDatas.save();
			_levelDataIsDirty = false;
			_dirtyLevels.length = 0;
		}

		public static function get normalLevelDataIsDirty():Boolean
		{
			return _levelDataIsDirty;
		}

		public static function unlockLevelPack( levelPackID:uint ):void
		{
			if( !getIsLevelPackUnlocked( levelPackID ) )
			{
				_unlockedLevelPacks.push( levelPackID );
				setLevelData( levelPackID, 0, true, false );
			}
		}

		public static function getIsLevelPackUnlocked( levelPackID:uint ):Boolean
		{
			var length:uint = _unlockedLevelPacks.length;
			for( var i:uint = 0; i < length; i++ )
			{
				if( _unlockedLevelPacks[ i ] == levelPackID )
				{
					return true;
				}
			}
			return false;
		}

		public static function getIsCarUnlocked( carId:uint ):Boolean
		{
			var length:int = _commonDatas.unlockedCarDatas.length;
			for( var i:int = 0; i < length; i++ )
			{
				if( _commonDatas.unlockedCarDatas[ i ] == carId )
				{
					return true;
				}
			}

			return false;
		}

		public static function unlockCar( carId:uint ):void
		{
			var length:int = _commonDatas.unlockedCarDatas.length;

			for( var i:int = 0; i < length; i++ )
			{
				if( _commonDatas.unlockedCarDatas[ i ] == carId )
				{
					return;
				}
			}

			_commonDatas.unlockedCarDatas.push( carId );
		}

		public static function getAllEarnedStarCount():int
		{
			return _savedLevelDatas.getAllEarnedStarCount();
		}

		public static function getEarnedStarCountByWorld( worldId:int ):int
		{
			return _savedLevelDatas.getEarnedStarCountByWorld( worldId );
		}

		public static function getTotalCountOf3StarsLevelByWorld( worldId:int ):int
		{
			return _savedLevelDatas.getTotalCountOf3StarsLevelByWorld( worldId );
		}

		public static function getTotalPlayedGameCount():int
		{
			var result:Number = 0;

			for( var i:int = 0; i < _commonDatas.playedGameCounters.length; i++ )
			{
				if( _commonDatas.playedGameCounters[ i ] )
				{
					for( var j:int = 0; j < _commonDatas.playedGameCounters[ i ].length; j++ )
					{
						if ( _commonDatas.playedGameCounters[ i ][ j ] != undefined )
						{
							result += _commonDatas.playedGameCounters[ i ][ j ];
						}
					}
				}
			}

			return result;
		}

		public static function getScoreByWorldID( worldID:uint ):int
		{
			return _savedLevelDatas.getScoreByWorldID( worldID );
		}

		public static function getScoreByAllWorld():int
		{
			return _savedLevelDatas.getScoreByAllWorld();
		}
	}
}