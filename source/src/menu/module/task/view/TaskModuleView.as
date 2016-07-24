/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task.view
{
	import net.fpp.common.starling.module.AModel;
	import net.fpp.common.starling.module.AModuleView;
	import net.fpp.common.starling.module.events.ModuleEvent;

	import src.constant.CTask;

	import src.menu.module.task.TaskModel;
	import src.menu.module.task.events.TaskModuleEvent;

	public class TaskModuleView extends AModuleView
	{
		private var _taskModel:TaskModel;

		private var _tasksCompleteView:TasksCompleteView;
		private var _tasksInProgress:TasksInProgressView;

		public function TaskModuleView()
		{
		}

		override public function setModel( model:AModel ):void
		{
			this._taskModel = model as TaskModel;

			super.setModel( model );
		}

		public function update():void
		{
			if( this._taskModel.getCompletedTasksCount() == CTask.MAXIMUM_TASK_PER_WORLD )
			{
				if ( this._tasksInProgress )
				{
					this.disposeTasksInProgressView();
				}

				this.setViewToCompleted();
			}
			else
			{
				this.setViewToInProgress();
			}
		}

		private function setViewToCompleted():void
		{
			if( !this._tasksCompleteView )
			{
				this.createTasksCompletedView();
			}
		}

		private function createTasksCompletedView():void
		{
			this._tasksCompleteView = new TasksCompleteView();
			this.addChild( this._tasksCompleteView );

			_tasksCompleteView.setRewardCarGraphicId( this._taskModel.getRewardCarGraphicId() );
			this._tasksCompleteView.addEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
		}

		private function setViewToInProgress():void
		{
			if ( !this._tasksInProgress )
			{
				this.createTasksInProgressView();
			}
			else
			{
				this.updateTasksInProgressView();
			}

			this._tasksInProgress.setCompletedTasksCount( this._taskModel.getCompletedTasksCount() );
		}

		private function createTasksInProgressView():void
		{
			this._tasksInProgress = new TasksInProgressView();
			this.addChild( this._tasksInProgress );

			this._tasksInProgress.setTasks( this._taskModel.getTasks() );

			this._tasksInProgress.addEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
			this._tasksInProgress.addEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, onRemoveTaskRequest );
		}

		private function updateTasksInProgressView():void
		{
			this._tasksInProgress.setTasks( this._taskModel.getTasks() );
		}

		private function backToMapRequest( event:ModuleEvent ):void
		{
			this.dispatchEvent( event );
		}

		private function onRemoveTaskRequest( e:TaskModuleEvent ):void
		{
			this.dispatchEvent( e );
		}

		private function disposeTasksInProgressView():void
		{
			if( this._tasksInProgress )
			{
				this._tasksInProgress.removeEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
				this._tasksInProgress.removeEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, onRemoveTaskRequest );
				this._tasksInProgress.removeFromParent( true );
				this._tasksInProgress = null;
			}
		}

		override public function dispose():void
		{
			if( this._tasksCompleteView )
			{
				this._tasksCompleteView.removeEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
				this._tasksCompleteView.removeFromParent( true );
				this._tasksCompleteView = null;
			}

			this.disposeTasksInProgressView();

			super.dispose();
		}
	}
}