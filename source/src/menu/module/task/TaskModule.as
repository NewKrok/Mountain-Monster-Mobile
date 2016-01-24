/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task
{
	import net.fpp.starling.module.AModule;
	import net.fpp.starling.module.events.ModuleEvent;

	import src.menu.module.task.view.TaskModuleView;

	import starling.events.Event;

	public class TaskModule extends AModule
	{
		public function TaskModule( worldID:uint )
		{
			this._model = new TaskModel();
			( this._model as TaskModel ).setWorldID( worldID );

			this._view = new TaskModuleView();
			this._view.addEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );

			super();
		}

		private function backToMapRequest( event:Event ):void
		{
			this.disposeRequest();
		}

		override public function dispose():void
		{
			this._view.removeEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );
			this._view.removeFromParent( true );
			this._view = null;

			super.dispose();
		}
	}
}