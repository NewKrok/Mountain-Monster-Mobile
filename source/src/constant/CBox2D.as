/**
 * Created by newkrok on 29/12/15.
 */
package src.constant
{
	public class CBox2D
	{
		public static const PIXELS_TO_METRE:uint = 30;
		public static const GRAVITY:uint = 5;
		public static const BOX2D_TIMESTEP:Number = 1 / 30;
		public static const BOX2D_VELOCITY_ITERATIONS:int = 10;
		public static const BOX2D_POSITION_ITERATIONS:int = 10;

		public static const CAR_FILTER_CATEGORY:uint = 2;
		public static const CAR_FILTER_MASK:uint = 1;
		public static const GROUND_FILTER_CATEGORY:uint = 1;
		public static const GROUND_FILTER_MASK:uint = 2;
		public static const BRIDGE_FILTER_CATEGORY:uint = 1;
		public static const BRIDGE_FILTER_MASK:uint = 2;
	}
}