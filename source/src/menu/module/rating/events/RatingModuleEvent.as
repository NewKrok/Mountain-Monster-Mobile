/**
 * Created by newkrok on 23/09/15.
 */
package src.menu.module.rating.events
{
	import starling.events.Event;

	public class RatingModuleEvent extends Event
	{
		public static const RATE_REQUEST:String = "RatingModuleEvent.RATE_REQUEST";
		public static const RATE_LATER_REQUEST:String = "RatingModuleEvent.RATE_LATER_REQUEST";
		public static const RATE_NEVER_REQUEST:String = "RatingModuleEvent.RATE_NEVER_REQUEST";

		public function RatingModuleEvent( type:String, data:Object = null ):void
		{
			super( type, false, data );
		}
	}
}