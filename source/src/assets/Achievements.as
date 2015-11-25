package src.assets {
	
	import net.fpp.achievement.AchievementVO;
	import net.fpp.achievement.AchievementManager;
	
	public class Achievements {
		
		private static var _achievementHandler:AchievementManager;
		
		private static var _namespace:String;
		
		private static var _isInited:Boolean = false;
		
		public function Achievements( )
		{
			throw new Error( 'This is a Singleton class!' );
		}
		
		public static function init( namespace:String ):void
		{
			_namespace = namespace;
			_isInited = true;
			
			instance.registerAchievement( 
				new AchievementVO( 0, 100, 'TestAchievement', 'Long description for the achievement' )
			);
			instance.registerAchievement( 
				new AchievementVO( 1, 200, 'TestAchievement 2', 'Long description for the achievement 2' )
			);
			instance.registerAchievement( 
				new AchievementVO( 2, 123, 'TestAchievement 3', 'Long description for the achievement 3' )
			);
		}
		
		public static function get instance( ):AchievementManager
		{
			if ( !_isInited )
			{
				throw new Error( 'First you need call the init.' );
			}
			
			if ( !_achievementHandler )
			{
				_achievementHandler = new AchievementManager( _namespace );
			}
			
			return _achievementHandler;
		}
		
	}
	
}