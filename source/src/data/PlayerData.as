package src.data
{
	import src.events.PlayerDataEvent;

	import starling.events.EventDispatcher;

	public class PlayerData
	{
		private static var _instance:EventDispatcher = new EventDispatcher;

		private static var _carID:uint = 0;
		public static var wheelID:uint = 0;

		public static function get carID():uint
		{
			return _carID;
		}

		public static function set carID( $value:uint ):void
		{
			_carID = $value;
			wheelID = _carID;
			dispatchEvent( new PlayerDataEvent( PlayerDataEvent.CAR_ID_CHANGED ) );

			DataManager.setLastSelectedCarId( _carID );
		}

		private static function dispatchEvent( event:PlayerDataEvent ):void
		{
			_instance.dispatchEvent( event );
		}

		public static function addEventListener( $type:String, $listener:Function ):void
		{
			_instance.addEventListener( $type, $listener );
		}

		public static function removeEventListener( $type:String, $listener:Function ):void
		{
			_instance.removeEventListener( $type, $listener );
		}
	}
}