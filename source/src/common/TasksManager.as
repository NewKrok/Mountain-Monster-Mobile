/**
 * Created by newkrok on 23/01/16.
 */
package src.common
{
	import net.fpp.common.achievement.AchievementManager;
	import net.fpp.common.achievement.AchievementVO;

	import src.assets.ITaskList;
	import src.assets.TaskListWorld1;
	import src.assets.TaskListWorld2;
	import src.assets.TaskListWorld3;
	import src.assets.TaskListWorld4;
	import src.constant.CTask;

	public class TasksManager
	{
		private static var _worldTaskManagers:Vector.<AchievementManager> = new <AchievementManager>[];
		private static var _taskLists:Vector.<ITaskList> = new <ITaskList>[ new TaskListWorld1, new TaskListWorld2, new TaskListWorld3, new TaskListWorld4 ];
		private static var _rewardsCarID:Vector.<uint> = new <uint>[ 2000, 2001, 2002, 2003 ];

		public static function init():void
		{
			for( var i:int = 0; i < _taskLists.length; i++ )
			{
				var achievementManager:AchievementManager = new AchievementManager( MountainMonsterIOSMain.APP_ID + '_tasks_world' + i );
				_worldTaskManagers.push( achievementManager );

				addMissingTasksToWorld( i );

				achievementManager.loadInformations();
			}
		}

		private static function addMissingTasksToWorld( worldID:uint ):void
		{
			var completedTasks:Array = DataManager.getCompletedTaskListByWorld( worldID );
			var neededTaskCount:int = CTask.MAX_TASK_COUNT_AT_THE_SAME_TIME - _worldTaskManagers[ worldID ].getAchievementVOs().length;

			if( completedTasks.length == CTask.MAXIMUM_TASK_PER_WORLD )
			{
				return;
			}

			for( var i:int = 0; i < neededTaskCount; i++ )
			{
				var nextEnabledTaskID:int = -1;
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
						var length:int = _worldTaskManagers[ worldID ].getAchievementVOs().length > CTask.MAX_TASK_COUNT_AT_THE_SAME_TIME ? CTask.MAX_TASK_COUNT_AT_THE_SAME_TIME : _worldTaskManagers[ worldID ].getAchievementVOs().length;
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

		public static function removeTaskByTaskAndWorldID( taskID:uint, worldID:uint ):void
		{
			var completedTaskList:Array = DataManager.getCompletedTaskListByWorld( worldID );
			completedTaskList.push( taskID );
			DataManager.setCompletedTaskListInWorld( worldID, completedTaskList );

			_worldTaskManagers[ worldID ].unregisterAchievement( taskID );

			DataManager.saveCommonData();

			addMissingTasksToWorld( worldID );
		}

		public static function getTasksByWorldID( worldID:uint ):Vector.<AchievementVO>
		{
			return _worldTaskManagers[ worldID ].getAchievementVOs();
		}

		public static function getCompletedTasksByWorldID( worldID:uint ):uint
		{
			return DataManager.getCompletedTaskListByWorld( worldID ).length;
		}

		public static function getRewardCarIdByWorld( worldID:uint ):uint
		{
			return _rewardsCarID[ worldID ];
		}

		public static function getAchievementManagerByWorld( worldID:uint ):AchievementManager
		{
			return _worldTaskManagers[ worldID ];
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

		public static function save():void
		{
			for( var i:int = 0; i < _worldTaskManagers.length; i++ )
			{
				_worldTaskManagers[ i ].save();
			}
		}
	}
}