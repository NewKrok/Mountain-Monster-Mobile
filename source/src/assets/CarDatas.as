package src.assets
{
	import src.constant.CStarRequireds;
	import src.data.CarData;

	public class CarDatas
	{
		public static var MAX_SPEED:Number = 14;
		public static var MIN_SPEED:Number = 9;
		public static var MAX_ROTATION:Number = 9;
		public static var MIN_ROTATION:Number = 5;
		public static var MAX_DAMPING:Number = .9;
		public static var MIN_DAMPING:Number = .4;

		public static var CAR_DATAS:Vector.<CarData> = new <CarData>[
			// LEVEL PACK CARS =========================================
			new CarData(
					/*ID*/              0,
					/*GRAPHIC ID*/      0,
					/*NAME*/            "RED MONSTER",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           10,
					/*ROTATION*/        6,
					/*DAMPING*/         .8,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   -1
			),
			new CarData(
					/*ID*/              3,
					/*GRAPHIC ID*/      6,
					/*NAME*/            "SANTA ROCK",
					/*STAR_REQUIRED*/	CStarRequireds.UNLOCK_CAR_TYPE_3,
					/*SPEED*/           10,
					/*ROTATION*/        6,
					/*DAMPING*/         .8,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			),
			new CarData(
					/*ID*/              1,
					/*GRAPHIC ID*/      1,
					/*NAME*/            "SNOWY",
					/*STAR_REQUIRED*/	CStarRequireds.UNLOCK_CAR_TYPE_1,
					/*SPEED*/           11,
					/*ROTATION*/        6,
					/*DAMPING*/         .8,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   -1
			),
			new CarData(
					/*ID*/              2,
					/*GRAPHIC ID*/      5,
					/*NAME*/            "GHOST",
					/*STAR_REQUIRED*/	CStarRequireds.UNLOCK_CAR_TYPE_2,
					/*SPEED*/           11,
					/*ROTATION*/        6,
					/*DAMPING*/         .65,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			),
			new CarData(
					/*ID*/              4,
					/*GRAPHIC ID*/      8,
					/*NAME*/            "TURTLE",
					/*STAR_REQUIRED*/	CStarRequireds.UNLOCK_CAR_TYPE_4,
					/*SPEED*/           12,
					/*ROTATION*/        7,
					/*DAMPING*/         .65,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			),

			// CUSTOM CARS =============================================
			new CarData(
					/*ID*/              1000,
					/*GRAPHIC ID*/      2,
					/*NAME*/            "BLUE HOOK",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           11,
					/*ROTATION*/        7,
					/*DAMPING*/         .75,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   -2
			),
			new CarData(
					/*ID*/              1001,
					/*GRAPHIC ID*/      3,
					/*NAME*/            "MOUNTAIN HUNTER",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           11,
					/*ROTATION*/        7,
					/*DAMPING*/         .75,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   -1
			),
			new CarData(
					/*ID*/              1002,
					/*GRAPHIC ID*/      4,
					/*NAME*/            "LIGHTNING",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           12,
					/*ROTATION*/        7.5,
					/*DAMPING*/         .65,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			),
			new CarData(
					/*ID*/              1003,
					/*GRAPHIC ID*/      7,
					/*NAME*/            "JUDGE",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           13,
					/*ROTATION*/        7,
					/*DAMPING*/         .6,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			),
			new CarData(
					/*ID*/              1004,
					/*GRAPHIC ID*/      9,
					/*NAME*/            "HAWK",
					/*STAR_REQUIRED*/	0,
					/*SPEED*/           14,
					/*ROTATION*/        8,
					/*DAMPING*/         .5,
					/*BODY_X_OFFSET*/   0,
					/*BODY_Y_OFFSET*/   0
			)
		];

		public static function getData( carType:uint ):CarData
		{
			for( var i:uint = 0; i < CAR_DATAS.length; i++ )
			{
				if( CAR_DATAS[ i ].id == carType )
				{
					return CAR_DATAS[ i ];
				}
			}
			return null;
		}
	}
}