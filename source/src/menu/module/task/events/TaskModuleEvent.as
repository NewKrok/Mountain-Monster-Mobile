/**
 * Created by newkrok on 07/02/16.
 */
package src.menu.module.task.events
{
	import starling.events.Event;

	public class TaskModuleEvent extends Event
	{
		public static const REMOVE_TASK_REQUEST:String = "TaskModuleEvent.REMOVE_TASK_REQUEST";

		public function TaskModuleEvent( type:String, data:Object = null ):void
		{
			super( type, false, data );
		}
	}
}
