/**
 * Created by newkrok on 23/01/16.
 */
package src.assets
{
	import net.fpp.achievement.AchievementVO;

	public class TaskListWorld1 implements ITaskList
	{
		private const _tasks:Vector.<AchievementVO> = new <AchievementVO>[
			new AchievementVO( 0, 3, 'Task', 'Do $value/3 Backflip in total in any level' ), // OK
			new AchievementVO( 1, 3, 'Task', 'Do $value/3 Frontflip in total in any level.' ), // OK
			new AchievementVO( 2, 50, 'Task', 'Pick up $value/50 coins in total.' ), // OK
			new AchievementVO( 3, 1, 'Task', 'Earn 3 star in any level.' ), // OK
			new AchievementVO( 4, 1, 'Task', 'Beat your Highscore in any level.' ), // OK
			new AchievementVO( 5, 1, 'Task', 'Do 3 Backflip in one level.' ), // OK
			new AchievementVO( 6, 100, 'Task', 'Pick up 100 coins in total.' ), // OK
			new AchievementVO( 7, 3, 'Task', 'Do 3 Nice Air Time in total in any level.' ), // OK
			new AchievementVO( 8, 12, 'Task', 'Earn 3 star in 12 level.' ),
			new AchievementVO( 9, 3, 'Task', 'Do 3 Nice Wheelie in total in any level.' ), // OK
			new AchievementVO( 10, 1, 'Task', 'Complete level 1 less than 25 sec.' ), // OK
			new AchievementVO( 11, 1, 'Task', 'Do 2 Backflip and 2 Frontflip in one level.' ), // OK
			new AchievementVO( 12, 1, 'Task', 'Collect all coin in one level.' ),
			new AchievementVO( 13, 12, 'Task', 'Do 12 Nice Air Time in total in any level.' ), // OK
			new AchievementVO( 14, 1, 'Task', 'Complete level 12 less than 25 sec.' ), // OK
			new AchievementVO( 15, 20, 'Task', 'Do 20 Backflip in total in any level.' ), // OK
			new AchievementVO( 16, 1, 'Task', 'Do 5 Nice Wheelie in one level.' ), // OK
			new AchievementVO( 17, 12, 'Task', 'Earn 3 star in 12 level.' ),
			new AchievementVO( 18, 1, 'Task', 'Do 1 Backflip, 1 Frontflip, 1 Nice Air Time and 1 Nice Wheelie in any level.' ),
			new AchievementVO( 19, 1, 'Task', 'Complete level 24 less than 25 sec.' )
		]

		public function getTasks():Vector.<AchievementVO>
		{
			return this._tasks;
		}
	}
}