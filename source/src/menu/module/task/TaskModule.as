/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task
{
	import net.fpp.common.starling.module.AModule;
	import net.fpp.common.starling.module.events.ModuleEvent;

	import src.assets.CarDatas;
	import src.common.TasksManager;
	import src.menu.module.task.events.TaskModuleEvent;
	import src.menu.module.task.view.TaskModuleView;

	public class TaskModule extends AModule
	{
		private var _taskModel:TaskModel;
		private var _taskModuleView:TaskModuleView;

		public function TaskModule( worldID:uint )
		{
			this._taskModel = this.createModel( TaskModel ) as TaskModel;
			this._taskModel.setWorldID( worldID );

			this._taskModuleView = this.createModuleView( TaskModuleView ) as TaskModuleView;
			this._taskModuleView.addEventListener( ModuleEvent.MODULE_VIEW_INITED, this.onModuleViewInited );
			this._taskModuleView.addEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );
			this._taskModuleView.addEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, this.onUpdateTaskListRequest );
		}

		private function onModuleViewInited( e:ModuleEvent ):void
		{
			this.update();
		}

		private function backToMapRequest( e:ModuleEvent ):void
		{
			this.disposeRequest();
		}

		private function onUpdateTaskListRequest( e:TaskModuleEvent ):void
		{
			TasksManager.removeTaskByTaskAndWorldID( e.data as uint, this._taskModel.getWorldID() );

			this.update();

			this.dispatchEvent( e );
		}

		private function update():void
		{
			var worldID:uint = this._taskModel.getWorldID();
			var rewardCarId:uint = TasksManager.getRewardCarIdByWorld( worldID );

			this._taskModel.setTasks( TasksManager.getTasksByWorldID( worldID ) );
			this._taskModel.setCompletedTasksCount( TasksManager.getCompletedTasksByWorldID( worldID ) );
			this._taskModel.setRewardCarGraphicId( CarDatas.getData( rewardCarId ).graphicID );

			this._taskModuleView.update();
		}

		override public function dispose():void
		{
			this._taskModuleView.removeEventListener( ModuleEvent.MODULE_VIEW_INITED, this.onModuleViewInited );
			this._taskModuleView.removeEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );
			this._taskModuleView.removeEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, this.onUpdateTaskListRequest );
			this._taskModuleView.removeFromParent( true );
			this._taskModuleView = null;

			super.dispose();
		}
	}
}