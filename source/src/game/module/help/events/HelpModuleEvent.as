/**
 * Created by newkrok on 09/01/16.
 */
package src.game.module.help.events
{
	import starling.events.Event;

	public class HelpModuleEvent extends Event
	{
		public static const CLOSE_REQUEST:String = "HelpModuleEvent.CLOSE_REQUEST";

		public function HelpModuleEvent( type:String ):void
		{
			super( type );
		}
	}
}