/**
 * Created by newkrok on 11/02/16.
 */
package src.assets
{
	import net.fpp.common.achievement.AchievementVO;

	public class TaskListWorld2 implements ITaskList
	{
		private const _tasks:Vector.<AchievementVO> = new <AchievementVO>[
			new AchievementVO( 0, 2, 'Task', 'Do $value/2 Backflip in total in any level' ),
			new AchievementVO( 1, 1, 'Task', 'Earn 3 star in any level.' ),
			new AchievementVO( 2, 1, 'Task', 'Do 2 Frontflip in one level.' ),
			new AchievementVO( 3, 3, 'Task', 'Do $value/3 Nice Air Time in total in any level.' ),
			new AchievementVO( 4, 1, 'Task', 'Collect all coin in one level.' ),
			new AchievementVO( 5, 1, 'Task', 'Do 5 Nice Wheelie in one level.' ),
			new AchievementVO( 6, 50, 'Task', 'Pick up $value/50 coins in total.' ),
			new AchievementVO( 7, 3, 'Task', 'Do $value/3 Frontflip in total in any level.' ),
			new AchievementVO( 8, 12, 'Task', 'Earn 3 star in $value/12 level.' ),
			new AchievementVO( 9, 9, 'Task', 'Do $value/9 Nice Air Time in total in any level.' ),
			new AchievementVO( 10, 1, 'Task', 'Complete level 1 less than 25 sec.' ),
			new AchievementVO( 11, 1, 'Task', 'Do 2 Nice Air Time in one level.' ),
			new AchievementVO( 12, 1, 'Task', 'Do 2 Backflip and 2 Frontflip in one level.' ),
			new AchievementVO( 13, 100, 'Task', 'Pick up $value/100 coins in total.' ),
			new AchievementVO( 14, 1, 'Task', 'Complete level 12 less than 25 sec.' ),
			new AchievementVO( 15, 9, 'Task', 'Do $value/9 Nice Wheelie in total in any level.' ),
			new AchievementVO( 16, 1, 'Task', 'Do 2 Backflip in one level.' ),
			new AchievementVO( 17, 1, 'Task', 'Beat your Highscore in any level.' ),
			new AchievementVO( 18, 20, 'Task', 'Do $value/20 Backflip in total in any level.' ),
			new AchievementVO( 19, 1, 'Task', 'Do 1 Backflip, 1 Frontflip, 1 Nice Air Time and 2 Nice Wheelie in any level.' )
		]

		public function getTasks():Vector.<AchievementVO>
		{
			return this._tasks;
		}
	}
}