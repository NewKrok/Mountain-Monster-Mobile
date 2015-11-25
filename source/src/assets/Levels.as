package src.assets
{
	import src.data.Level;

	public class Levels
	{
		private static var _levels:Vector.<Vector.<Level>> = new Vector.<Vector.<Level>>;

		private static var _inited:Boolean;

		public static function init():void
		{
			if( _inited )
			{
				return;
			}
			_inited = true;

			_levels.push( new LevelsInLevelPack1().levels );
			_levels.push( new LevelsInLevelPack2().levels );
			_levels.push( new LevelsInLevelPack3().levels );
			_levels.push( new LevelsInLevelPack4().levels );
		}

		public static function get levels():Vector.<Vector.<Level>>
		{
			return _levels;
		}

		public static function get length():uint
		{
			return _levels.length;
		}
	}
}