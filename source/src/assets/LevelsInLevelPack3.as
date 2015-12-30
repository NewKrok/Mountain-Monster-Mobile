/**
 * Created by newkrok on 17/08/15.
 */
package src.assets
{
	import src.data.Level;

	public class LevelsInLevelPack3
	{
		private const MAX_LEVEL_WIDTH:Number = 7000;

		private const LEVEL_PACK_ID:uint = 2;

		private var _levels:Vector.<Level> = new Vector.<Level>;

		public function LevelsInLevelPack3()
		{
			_levels.push(
					new Level(
							/*LEVEL ID*/            0,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6833,"y":434},"bridgePoints":[{"bridgeAX":1310,"bridgeBX":1580,"bridgeAY":210,"bridgeBY":150},{"bridgeAX":1810,"bridgeBX":2160,"bridgeAY":100,"bridgeBY":140}],"libraryElements":[{"x":335,"className":"crate_2","scale":1,"y":300},{"x":260,"className":"crate_4","scale":-1,"y":300},{"x":620,"className":"crate_4","scale":-1,"y":340},{"x":725,"className":"crate_0","scale":1,"y":385},{"x":725,"className":"crate_0","scale":-1,"y":360},{"x":780,"className":"crate_1","scale":1,"y":380},{"x":725,"className":"crate_3","scale":1,"y":335},{"x":805,"className":"crate_3","scale":-1,"y":345},{"x":3110,"className":"crate_4","scale":-1,"y":260},{"x":3170,"className":"crate_1","scale":-1,"y":260},{"x":3185,"className":"crate_4","scale":-1,"y":220},{"x":3210,"className":"crate_1","scale":1,"y":260},{"x":3345,"className":"crate_2","scale":1,"y":300},{"x":3320,"className":"crate_2","scale":-1,"y":265},{"x":3345,"className":"crate_2","scale":1,"y":230},{"x":6070,"className":"crate_0","scale":1,"y":425},{"x":6065,"className":"crate_0","scale":-1,"y":400},{"x":6075,"className":"crate_0","scale":1,"y":375},{"x":6070,"className":"crate_0","scale":1,"y":350}],"groundPoints":[{"x":-120,"y":320},{"x":420,"y":320},{"x":560,"y":360},{"x":660,"y":360},{"x":700,"y":400},{"x":820,"y":400},{"x":820,"y":360},{"x":960,"y":360},{"x":1120,"y":320},{"x":1200,"y":220},{"x":1280,"y":200},{"x":1360,"y":240},{"x":1340,"y":360},{"x":1440,"y":440},{"x":1600,"y":440},{"x":1620,"y":340},{"x":1560,"y":300},{"x":1600,"y":220},{"x":1560,"y":180},{"x":1620,"y":100},{"x":1780,"y":80},{"x":1860,"y":140},{"x":1820,"y":260},{"x":1880,"y":320},{"x":1860,"y":400},{"x":2020,"y":480},{"x":2140,"y":420},{"x":2160,"y":240},{"x":2120,"y":180},{"x":2160,"y":140},{"x":2280,"y":140},{"x":2360,"y":180},{"x":2340,"y":240},{"x":2420,"y":280},{"x":2600,"y":320},{"x":2680,"y":300},{"x":2740,"y":320},{"x":2860,"y":300},{"x":2900,"y":260},{"x":2980,"y":260},{"x":3040,"y":280},{"x":3260,"y":280},{"x":3280,"y":320},{"x":3460,"y":320},{"x":3500,"y":380},{"x":3660,"y":420},{"x":3840,"y":400},{"x":3940,"y":340},{"x":4060,"y":340},{"x":4080,"y":400},{"x":4060,"y":480},{"x":4140,"y":560},{"x":4280,"y":560},{"x":4420,"y":540},{"x":4480,"y":500},{"x":4540,"y":480},{"x":4640,"y":520},{"x":4760,"y":500},{"x":4840,"y":400},{"x":4920,"y":400},{"x":5040,"y":360},{"x":5120,"y":300},{"x":5200,"y":280},{"x":5260,"y":300},{"x":5280,"y":360},{"x":5340,"y":440},{"x":5480,"y":500},{"x":5620,"y":500},{"x":5740,"y":480},{"x":5840,"y":420},{"x":5900,"y":320},{"x":5960,"y":320},{"x":6020,"y":340},{"x":6020,"y":400},{"x":6040,"y":440},{"x":6340,"y":440},{"x":6420,"y":420},{"x":6460,"y":380},{"x":6540,"y":360},{"x":6620,"y":400},{"x":6740,"y":440},{"x":7000,"y":420},{"x":7160,"y":380},{"x":7220,"y":440}],"startPoint":{"x":79,"y":287},"starPoints":[{"x":322,"y":255},{"x":358,"y":255},{"x":396,"y":258},{"x":683,"y":287},{"x":728,"y":278},{"x":2455,"y":266},{"x":2496,"y":277},{"x":2537,"y":285},{"x":4096,"y":309},{"x":4144,"y":315},{"x":4192,"y":335},{"x":5167,"y":262},{"x":5210,"y":251},{"x":5252,"y":266},{"x":5906,"y":253},{"x":5951,"y":214},{"x":6012,"y":216},{"x":779,"y":275},{"x":1654,"y":70},{"x":1738,"y":58},{"x":1695,"y":64},{"x":3337,"y":180},{"x":3382,"y":182},{"x":3425,"y":197}]}'
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            1,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            2,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            3,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            4,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            5,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            6,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            7,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            8,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            9,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            10,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            11,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            12,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            13,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            14,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            15,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            16,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            17,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            18,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            19,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            20,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            21,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            22,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            23,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   ''
					)
			);
		}

		public function get levels():Vector.<Level>
		{
			return _levels;
		}
	}
}