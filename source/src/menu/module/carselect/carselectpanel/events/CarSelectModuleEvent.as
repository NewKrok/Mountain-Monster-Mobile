/**
 * Created by newkrok on 29/10/15.
 */
package src.menu.module.carselect.carselectpanel.events
{
	import starling.events.Event;

	public class CarSelectModuleEvent extends Event
	{
		public static const SELECT_CAR:String = "CarSelectModuleEvent.SELECT_CAR";
		public static const BUY_CAR:String = "CarSelectModuleEvent.BUY_CAR";

		public function CarSelectModuleEvent( type:String, data:Object = null ):void
		{
			super( type, false, data );
		}
	}
}