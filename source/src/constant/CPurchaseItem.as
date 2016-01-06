/**
 * Created by newkrok on 29/10/15.
 */
package src.constant
{
	public class CPurchaseItem
	{
		public static const PURCHASE_ITEM_REMOVE_AD:String = "mm_remove_ad";
		public static const PURCHASE_ITEM_LEVEL_PACK_1:String = "mm_unlock_level_pack_2";
		public static const PURCHASE_ITEM_LEVEL_PACK_2:String = "mm_unlock_level_pack_3";

		public static const PURCHASE_ITEM_CAR_1:String = "mm_unlock_car_1";
		public static const PURCHASE_ITEM_CAR_2:String = "mm_unlock_car_2";
		public static const PURCHASE_ITEM_CAR_3:String = "mm_unlock_car_3";
		public static const PURCHASE_ITEM_CAR_4:String = "mm_unlock_car_4";
		public static const PURCHASE_ITEM_CAR_5:String = "mm_unlock_car_5";

		public static const ITEM_LIST:Vector.<String> = new <String>[
			CPurchaseItem.PURCHASE_ITEM_REMOVE_AD,
			CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_1,
			CPurchaseItem.PURCHASE_ITEM_LEVEL_PACK_2,
			CPurchaseItem.PURCHASE_ITEM_CAR_1,
			CPurchaseItem.PURCHASE_ITEM_CAR_2,
			CPurchaseItem.PURCHASE_ITEM_CAR_3,
			CPurchaseItem.PURCHASE_ITEM_CAR_4,
			CPurchaseItem.PURCHASE_ITEM_CAR_5
		];
	}
}