/**
 * Created by newkrok on 11/02/16.
 */
package src.assets
{
	import net.fpp.common.achievement.AchievementVO;

	public class TaskListWorld3 implements ITaskList
	{
		private const _tasks:Vector.<AchievementVO> = new <AchievementVO>[
			new AchievementVO( 0, 6, 'Task', 'Do $value/6 Frontflip in total in any level' ),
			new AchievementVO( 1, 1, 'Task', 'Do 3 Frontflip in one level.' ),
			new AchievementVO( 2, 1, 'Task', 'Earn 3 star in any level.' ),
			new AchievementVO( 3, 1, 'Task', 'Do 3 Backflip in one level.' ),
			new AchievementVO( 4, 100, 'Task', 'Pick up $value/100 coins in total.' ),
			new AchievementVO( 5, 12, 'Task', 'Do $value/12 Nice Wheelie in total in any level.' ),
			new AchievementVO( 6, 1, 'Task', 'Beat your Highscore in any level.' ),
			new AchievementVO( 7, 1, 'Task', 'Do 7 Nice Wheelie in one level.' ),
			new AchievementVO( 8, 12, 'Task', 'Do $value/12 Nice Air Time in total in any level.' ),
			new AchievementVO( 9, 25, 'Task', 'Do $value/25 Backflip in total in any level.' ),
			new AchievementVO( 10, 1, 'Task', 'Do 2 Backflip and 2 Frontflip in one level.' ),
			new AchievementVO( 11, 1, 'Task', 'Complete level 12 less than 25 sec.' ),
			new AchievementVO( 12, 1, 'Task', 'Collect all coin in one level.' ),
			new AchievementVO( 13, 18, 'Task', 'Earn 3 star in $value/18 level.' ),
			new AchievementVO( 14, 12, 'Task', 'Do $value/12 Nice Wheelie in total in any level.' ),
			new AchievementVO( 15, 12, 'Task', 'Do $value/12 Frontflip in total in any level.' ),
			new AchievementVO( 16, 1, 'Task', 'Do 2 Backflip, 2 Frontflip, 2 Nice Air Time and 2 Nice Wheelie in any level.' ),
			new AchievementVO( 17, 200, 'Task', 'Pick up $value/200 coins in total.' ),
			new AchievementVO( 18, 1, 'Task', 'Complete level 24 less than 25 sec.' ),
			new AchievementVO( 19, 1, 'Task', 'Do 3 Backflip in one level.' )
		]

		public function getTasks():Vector.<AchievementVO>
		{
			return this._tasks;
		}
	}
}