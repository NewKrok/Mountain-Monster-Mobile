/**
 * Created by newkrok on 23/01/16.
 */
package src.assets
{
	import net.fpp.common.achievement.AchievementVO;

	public class TaskListWorld1 implements ITaskList
	{
		private const _tasks:Vector.<AchievementVO> = new <AchievementVO>[
			new AchievementVO( 0, 3, 'Task', 'Do $value/3 Backflip in total in any level' ),
			new AchievementVO( 1, 3, 'Task', 'Do $value/3 Frontflip in total in any level.' ),
			new AchievementVO( 2, 50, 'Task', 'Pick up $value/50 coins in total.' ),
			new AchievementVO( 3, 1, 'Task', 'Earn 3 star in any level.' ),
			new AchievementVO( 4, 1, 'Task', 'Beat your Highscore in any level.' ),
			new AchievementVO( 5, 1, 'Task', 'Do 3 Backflip in one level.' ),
			new AchievementVO( 6, 100, 'Task', 'Pick up $value/100 coins in total.' ),
			new AchievementVO( 7, 3, 'Task', 'Do $value/3 Nice Air Time in total in any level.' ),
			new AchievementVO( 8, 6, 'Task', 'Earn 3 star in $value/6 level.' ),
			new AchievementVO( 9, 3, 'Task', 'Do $value/3 Nice Wheelie in total in any level.' ),
			new AchievementVO( 10, 1, 'Task', 'Complete level 1 less than 25 sec.' ),
			new AchievementVO( 11, 1, 'Task', 'Do 2 Backflip and 2 Frontflip in one level.' ),
			new AchievementVO( 12, 1, 'Task', 'Collect all coin in one level.' ),
			new AchievementVO( 13, 12, 'Task', 'Do $value/12 Nice Air Time in total in any level.' ),
			new AchievementVO( 14, 1, 'Task', 'Complete level 12 less than 25 sec.' ),
			new AchievementVO( 15, 20, 'Task', 'Do $value/20 Backflip in total in any level.' ),
			new AchievementVO( 16, 1, 'Task', 'Do 5 Nice Wheelie in one level.' ),
			new AchievementVO( 17, 12, 'Task', 'Earn 3 star in $value/12 level.' ),
			new AchievementVO( 18, 1, 'Task', 'Do 1 Backflip, 1 Frontflip, 1 Nice Air Time and 1 Nice Wheelie in any level.' ),
			new AchievementVO( 19, 1, 'Task', 'Complete level 24 less than 25 sec.' )
		]

		public function getTasks():Vector.<AchievementVO>
		{
			return this._tasks;
		}
	}
}