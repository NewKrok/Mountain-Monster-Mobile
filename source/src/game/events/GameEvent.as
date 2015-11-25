/**
 * Created by newkrok on 22/11/15.
 */
package src.game.events
{
	import starling.events.Event;

	public class GameEvent extends Event
	{
		public static const RESOURCE_LIMIT_ERROR:String = "GameEvent.RESOURCE_LIMIT_ERROR";

		public function GameEvent( type:String, data:Object = null ):void
		{
			super( type, false, data );
		}
	}
}