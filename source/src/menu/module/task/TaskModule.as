/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task
{
	import net.fpp.starling.module.AModule;

	import src.menu.module.task.view.TaskModuleView;

	public class TaskModule extends AModule
	{
		public function TaskModule()
		{
			this._view = new TaskModuleView();
		}

		override protected function disposeRequest():void
		{
			super.disposeRequest();
		}

		override public function dispose():void
		{
			super.dispose();
		}
	}
}