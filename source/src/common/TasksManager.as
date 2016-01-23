/**
 * Created by newkrok on 23/01/16.
 */
package src.common
{
	import src.assets.*;

	import net.fpp.achievement.AchievementManager;
	import net.fpp.achievement.AchievementVO;

	import src.data.DataManager;

	public class TasksManager
	{
		private static const MAX_TASK_COUNT_AT_THE_SAME_TIME:uint = 3;

		private static var _worldTaskManagers:Vector.<AchievementManager> = new <AchievementManager>[];
		private static var _taskLists:Vector.<ITaskList> = new <ITaskList>[ new TaskListWorld1, new TaskListWorld1, new TaskListWorld1 ];

		public static function init():void
		{
			for( var i:int = 0; i < 3; i++ )
			{
				var achievementManager:AchievementManager = new AchievementManager( MountainMonsterIOSMain.APP_ID + '_world_tasks_' + i );
				_worldTaskManagers.push( achievementManager );

				addMissingTasksToWorld( i );

				if( achievementManager.getAchievementVOs().length > 0 )
				{
					achievementManager.loadInformations();
				}
			}
		}

		private static function addMissingTasksToWorld( worldID:uint ):void
		{
			var completedTasks:Array = DataManager.getCompletedTaskListByWorld( worldID );
			var neededTaskCount:int = MAX_TASK_COUNT_AT_THE_SAME_TIME - _worldTaskManagers[ worldID ].getAchievementVOs().length;

			for( var i:int = 0; i < neededTaskCount; i++ )
			{
				var nextEnabledTaskID:int = 0;
				var isLookingForNextID:Boolean = true;
				var taskList:Vector.<AchievementVO> = _taskLists[ worldID ].getTasks();

				while( isLookingForNextID )
				{
					nextEnabledTaskID++;
					for( var j:int = 0; j < completedTasks.length; j++ )
					{
						if( nextEnabledTaskID == completedTasks[ j ] )
						{
							break;
						}
					}

					if( j == completedTasks.length )
					{
						var length:int = _worldTaskManagers[ worldID ].getAchievementVOs().length > MAX_TASK_COUNT_AT_THE_SAME_TIME ? MAX_TASK_COUNT_AT_THE_SAME_TIME : _worldTaskManagers[ worldID ].getAchievementVOs().length;
						for( j = 0; j < length; j++ )
						{
							if( nextEnabledTaskID == _worldTaskManagers[ worldID ].getAchievementVOs()[ j ].id )
							{
								break;
							}
						}

						if( j == length )
						{
							isLookingForNextID = false;
						}
					}

					if( nextEnabledTaskID >= taskList.length )
					{
						return;
					}
				}

				_worldTaskManagers[ worldID ].registerAchievement( taskList[ nextEnabledTaskID ] );
			}
		}

		public static function updateTaskListByWorldID( worldID:uint ):void
		{
			var needSave:Boolean = false;
			var activeAchievements:Vector.<AchievementVO> = _worldTaskManagers[ worldID ].getAchievementVOs().concat();

			var length:int = activeAchievements.length;
			for( var i:int = 0; i < length; i++ )
			{
				if( activeAchievements[ i ].isEarned )
				{
					var completedTaskList:Array = DataManager.getCompletedTaskListByWorld( worldID );
					completedTaskList.push( activeAchievements[ i ].id );
					DataManager.setCompletedTaskListInWorld( worldID, completedTaskList );

					_worldTaskManagers[ worldID ].unregisterAchievement( activeAchievements[ i ].id );

					needSave = true;
				}
			}

			if( needSave )
			{
				DataManager.saveCommonData();
			}

			addMissingTasksToWorld( worldID );
		}

		public static function getCompletedTasksByWorldID( worldID:uint ):uint
		{
			return DataManager.getCompletedTaskListByWorld( worldID ).length;
		}

		public static function hasNonViewedTaskByWorldID( worldID:uint ):Boolean
		{
			var achievementList:Vector.<AchievementVO> = _worldTaskManagers[ worldID ].getAchievementVOs();

			for( var i:int = 0; i < achievementList.length; i++ )
			{
				if( achievementList[ i ].isEarned )
				{
					return true;
				}
			}

			return false;
		}
	}
}