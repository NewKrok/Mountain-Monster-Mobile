/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task.view
{
	import net.fpp.achievement.AchievementVO;
	import net.fpp.starling.module.AModuleView;
	import net.fpp.starling.module.events.ModuleEvent;

	import src.assets.CarDatas;

	import src.common.TasksManager;
	import src.menu.module.task.TaskModel;

	public class TaskModuleView extends AModuleView
	{
		private var _tasksCompleteView:TasksCompleteView;
		private var _tasksInProgress:TasksInProgressView;

		public function TaskModuleView()
		{
		}

		override protected function onInit():void
		{
			var worldID:int = ( this._model as TaskModel ).getWorldID();

			var tasks:Vector.<AchievementVO> = TasksManager.getTasksByWorldID( worldID );

			var completedTasksCount:int = TasksManager.getCompletedTasksByWorldID( worldID );

			if ( completedTasksCount == tasks.length )
			{
				var rewardCarId:int = TasksManager.getRewardCarIdByWorld( worldID );

				var rewardCarGraphicId:int = CarDatas.getData( rewardCarId ).graphicID;

				this.createTasksCompletedView( rewardCarGraphicId );
			}
			else
			{
				this.createTasksInProgressView( completedTasksCount, tasks );
			}
		}

		private function createTasksCompletedView( rewardCarGraphicId:int ):void
		{
			_tasksCompleteView = new TasksCompleteView();
			this.addChild( this._tasksCompleteView );

			_tasksCompleteView.setRewardCarGraphicId( rewardCarGraphicId );
			this._tasksCompleteView.addEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
		}

		private function createTasksInProgressView( completedTasksCount:uint, tasks:Vector.<AchievementVO> ):void
		{
			this._tasksInProgress = new TasksInProgressView();
			this.addChild( this._tasksInProgress );

			this._tasksInProgress.setCompletedTasksCount( completedTasksCount );
			this._tasksInProgress.setTasks( tasks );
			this._tasksInProgress.addEventListener( ModuleEvent.DISPOSE_REQUEST, backToMapRequest );
		}

		private function backToMapRequest( event:ModuleEvent ):void
		{
			this.dispatchEvent( event );
		}

		override public function dispose():void
		{
			if ( this._tasksCompleteView )
			{
				this._tasksCompleteView.removeFromParent( true );
				this._tasksCompleteView = null;
			}

			if ( this._tasksInProgress )
			{
				this._tasksInProgress.removeFromParent( true );
				this._tasksInProgress = null;
			}

			super.dispose();
		}
	}
}