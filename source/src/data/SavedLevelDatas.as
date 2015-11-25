package src.data
{
	import flash.net.SharedObject;

	public class SavedLevelDatas
	{
		private var _levelResultVOs:Vector.<LevelResultVO> = new Vector.<LevelResultVO>;

		private var _savedObject:SharedObject;

		public function SavedLevelDatas( namespace:String ):void
		{
			_savedObject = SharedObject.getLocal( namespace + '_FPP_LEVEL_DATA___' );
			if( _savedObject.data.content == undefined )
			{
				// LEVEL_PACK_ID | LEVEL_ID | ENABLED | COMPLETED | SCORE | STARS | IS_LAST_PLAYED | TIME
				_savedObject.data.content = [ [ 0, 0, true, false, 0, 0, true, 0 ] ];
				_savedObject.flush();
			}

			var length:uint = _savedObject.data.content.length;
			var index:uint = 0;
			for( var i:uint = 0; i < length; i++ )
			{
				var tmpData:Array = _savedObject.data.content[ i ];
				if( tmpData != null )
				{
					_levelResultVOs.push( new LevelResultVO( tmpData[ 0 ], tmpData[ 1 ] ) );
					_levelResultVOs[ index ].isEnabled = tmpData[ 2 ];
					_levelResultVOs[ index ].isCompleted = tmpData[ 3 ];
					_levelResultVOs[ index ].score = tmpData[ 4 ];
					_levelResultVOs[ index ].starCount = tmpData[ 5 ];
					_levelResultVOs[ index ].isLastPlayed = tmpData[ 6 ];
					_levelResultVOs[ index ].gameTime = tmpData[ 7 ];
					index++;
				}
			}
		}

		public function save():void
		{
			_savedObject.data.content = [];
			var length:uint = _levelResultVOs.length;
			for( var i:uint = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].isEnabled )
				{
					_savedObject.data.content[ i ] = [
						_levelResultVOs[ i ].levelPackID,
						_levelResultVOs[ i ].id,
						_levelResultVOs[ i ].isEnabled,
						_levelResultVOs[ i ].isCompleted,
						_levelResultVOs[ i ].score,
						_levelResultVOs[ i ].starCount,
						_levelResultVOs[ i ].isLastPlayed,
						_levelResultVOs[ i ].gameTime
					];
				}
			}
			_savedObject.flush();
		}

		public function setLastPlayedGame( $levelPackID:uint, $level:uint ):void
		{
			var length:uint = _levelResultVOs.length;
			for( var i:uint = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].isEnabled && _levelResultVOs[ i ].levelPackID == $levelPackID )
				{
					if( _levelResultVOs[ i ].id == $level )
					{
						_levelResultVOs[ i ].isLastPlayed = true;
					}
					else
					{
						_levelResultVOs[ i ].isLastPlayed = false;
					}
				}

			}
		}

		public function getLevelResultVO( $levelPackID:uint, $levelID:uint ):LevelResultVO
		{
			var length:uint = _levelResultVOs.length;
			for( var i:uint = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].levelPackID == $levelPackID && _levelResultVOs[ i ].id == $levelID )
				{
					return _levelResultVOs[ i ];
				}
			}

			_levelResultVOs.push( new LevelResultVO( $levelPackID, $levelID ) );

			return _levelResultVOs[ i ];
		}

		public function getCountOfCompletedLevelsInLeveLPack( $levelPackID:uint ):uint
		{
			var counter:uint = 0;
			var length:uint = _levelResultVOs.length;
			for( var i:uint = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].levelPackID == $levelPackID && _levelResultVOs[ i ].isCompleted )
				{
					counter++;
				}
			}

			return counter;
		}

		public function getAllEarnedStarCount():int
		{
			var counter:int = 0;
			var length:int = _levelResultVOs.length;
			for( var i:int = 0; i < length; i++ )
			{
				counter += _levelResultVOs[ i ].starCount;
			}

			return counter;
		}

		public function getEarnedStarCountByWorld( worldID:int ):int
		{
			var counter:int = 0;
			var length:int = _levelResultVOs.length;
			for( var i:int = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].levelPackID == worldID )
				{
					counter += _levelResultVOs[ i ].starCount;
				}
			}

			return counter;
		}

		public function getScoreByWorldID( worldID:uint ):uint
		{
			var result:int = 0;
			var length:int = _levelResultVOs.length;

			for( var i:int = 0; i < length; i++ )
			{
				if( _levelResultVOs[ i ].levelPackID == worldID )
				{
					result += _levelResultVOs[ i ].score;
				}
			}

			return result;
		}

		public function getScoreByAllWorld():uint
		{
			var result:int = 0;
			var length:int = _levelResultVOs.length;

			for( var i:int = 0; i < length; i++ )
			{
				result += _levelResultVOs[ i ].score;
			}

			return result;
		}
	}
}