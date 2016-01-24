/**
 * Created by newkrok on 24/01/16.
 */
package src.menu.module.task
{
	import net.fpp.starling.module.AModel;

	public class TaskModel extends AModel
	{
		private var _worldID:uint;

		public function setWorldID( value:uint ):void
		{
			this._worldID = value;
		}

		public function getWorldID():uint
		{
			return this._worldID;
		}
	}
}