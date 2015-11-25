package src.data
{	
	public class LevelResultVO
	{
		public var gameTime:		Number = Number.MAX_VALUE;
		
		private var _id:			uint = 0;
		private var _levelPackID:	uint = 0;
		public var starCount:		uint = 0;
		public var score:			uint = 0;
		
		public var isEnabled:		Boolean = false;
		public var isCompleted:		Boolean = false;
		public var isLastPlayed:	Boolean = false;
		
		public function LevelResultVO( $levelPackID:uint, $id:uint ):void
		{
			_levelPackID = $levelPackID;			
			_id = $id;
		}
		
		public function get id( ):uint
		{
			return _id;
		}

		public function get levelPackID( ):uint
		{
			return _levelPackID;
		}
	}
}