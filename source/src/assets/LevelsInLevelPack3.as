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
							/*STAR VALUES*/         new <uint>[ 11500, 12500, 13500 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6833,"y":434},"bridgePoints":[{"bridgeAX":1310,"bridgeBX":1580,"bridgeAY":210,"bridgeBY":150},{"bridgeAX":1810,"bridgeBX":2160,"bridgeAY":100,"bridgeBY":140}],"libraryElements":[{"x":335,"className":"crate_2","scale":1,"y":300},{"x":260,"className":"crate_4","scale":-1,"y":300},{"x":620,"className":"crate_4","scale":-1,"y":340},{"x":725,"className":"crate_0","scale":1,"y":385},{"x":725,"className":"crate_0","scale":-1,"y":360},{"x":780,"className":"crate_1","scale":1,"y":380},{"x":725,"className":"crate_3","scale":1,"y":335},{"x":805,"className":"crate_3","scale":-1,"y":345},{"x":3110,"className":"crate_4","scale":-1,"y":260},{"x":3170,"className":"crate_1","scale":-1,"y":260},{"x":3185,"className":"crate_4","scale":-1,"y":220},{"x":3210,"className":"crate_1","scale":1,"y":260},{"x":3345,"className":"crate_2","scale":1,"y":300},{"x":3320,"className":"crate_2","scale":-1,"y":265},{"x":3345,"className":"crate_2","scale":1,"y":230},{"x":6070,"className":"crate_0","scale":1,"y":425},{"x":6065,"className":"crate_0","scale":-1,"y":400},{"x":6075,"className":"crate_0","scale":1,"y":375},{"x":6070,"className":"crate_0","scale":1,"y":350}],"groundPoints":[{"x":-120,"y":320},{"x":420,"y":320},{"x":560,"y":360},{"x":660,"y":360},{"x":700,"y":400},{"x":820,"y":400},{"x":820,"y":360},{"x":960,"y":360},{"x":1120,"y":320},{"x":1200,"y":220},{"x":1280,"y":200},{"x":1360,"y":240},{"x":1340,"y":360},{"x":1440,"y":440},{"x":1600,"y":440},{"x":1620,"y":340},{"x":1560,"y":300},{"x":1600,"y":220},{"x":1560,"y":180},{"x":1620,"y":100},{"x":1780,"y":80},{"x":1860,"y":140},{"x":1820,"y":260},{"x":1880,"y":320},{"x":1860,"y":400},{"x":2020,"y":480},{"x":2140,"y":420},{"x":2160,"y":240},{"x":2120,"y":180},{"x":2160,"y":140},{"x":2280,"y":140},{"x":2360,"y":180},{"x":2340,"y":240},{"x":2420,"y":280},{"x":2600,"y":320},{"x":2680,"y":300},{"x":2740,"y":320},{"x":2860,"y":300},{"x":2900,"y":260},{"x":2980,"y":260},{"x":3040,"y":280},{"x":3260,"y":280},{"x":3280,"y":320},{"x":3460,"y":320},{"x":3500,"y":380},{"x":3660,"y":420},{"x":3840,"y":400},{"x":3940,"y":340},{"x":4060,"y":340},{"x":4080,"y":400},{"x":4060,"y":480},{"x":4140,"y":560},{"x":4280,"y":560},{"x":4420,"y":540},{"x":4480,"y":500},{"x":4540,"y":480},{"x":4640,"y":520},{"x":4760,"y":500},{"x":4840,"y":400},{"x":4920,"y":400},{"x":5040,"y":360},{"x":5120,"y":300},{"x":5200,"y":280},{"x":5260,"y":300},{"x":5280,"y":360},{"x":5340,"y":440},{"x":5480,"y":500},{"x":5620,"y":500},{"x":5740,"y":480},{"x":5840,"y":420},{"x":5900,"y":320},{"x":5960,"y":320},{"x":6020,"y":340},{"x":6020,"y":400},{"x":6040,"y":440},{"x":6340,"y":440},{"x":6420,"y":420},{"x":6460,"y":380},{"x":6540,"y":360},{"x":6620,"y":400},{"x":6740,"y":440},{"x":7000,"y":420},{"x":7160,"y":380},{"x":7220,"y":440}],"startPoint":{"x":79,"y":287},"starPoints":[{"x":322,"y":255},{"x":358,"y":255},{"x":396,"y":258},{"x":683,"y":287},{"x":728,"y":278},{"x":2455,"y":266},{"x":2496,"y":277},{"x":2537,"y":285},{"x":4096,"y":309},{"x":4144,"y":315},{"x":4192,"y":335},{"x":5167,"y":262},{"x":5210,"y":251},{"x":5252,"y":266},{"x":5906,"y":253},{"x":5951,"y":214},{"x":6012,"y":216},{"x":779,"y":275},{"x":1654,"y":70},{"x":1738,"y":58},{"x":1695,"y":64},{"x":3337,"y":180},{"x":3382,"y":182},{"x":3425,"y":197}]}'
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            1,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        320,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6692,"y":202},"bridgePoints":[{"bridgeAX":1120,"bridgeBX":1390,"bridgeAY":510,"bridgeBY":390},{"bridgeAX":4260,"bridgeBX":4510,"bridgeAY":150,"bridgeBY":220},{"bridgeAX":6280,"bridgeBX":6510,"bridgeAY":270,"bridgeBY":250}],"libraryElements":[{"x":785,"className":"crate_0","scale":1,"y":585},{"x":745,"className":"crate_5","scale":-1,"y":585},{"x":2150,"className":"crate_4","scale":-1,"y":320},{"x":2225,"className":"crate_4","scale":1,"y":320},{"x":2840,"className":"crate_4","scale":-1,"y":440},{"x":3095,"className":"crate_4","scale":1,"y":440},{"x":5515,"className":"crate_1","scale":1,"y":480},{"x":5630,"className":"crate_1","scale":-1,"y":480},{"x":5525,"className":"crate_1","scale":-1,"y":445},{"x":5615,"className":"crate_1","scale":1,"y":445},{"x":5515,"className":"crate_1","scale":1,"y":410},{"x":5625,"className":"crate_1","scale":-1,"y":410},{"x":5570,"className":"crate_2","scale":-1,"y":410},{"x":4615,"className":"crate_4","scale":-1,"y":210},{"x":5100,"className":"crate_4","scale":-1,"y":380},{"x":5160,"className":"crate_1","scale":1,"y":380}],"groundPoints":[{"x":-80,"y":420},{"x":100,"y":420},{"x":160,"y":480},{"x":300,"y":480},{"x":360,"y":500},{"x":420,"y":540},{"x":480,"y":580},{"x":600,"y":600},{"x":840,"y":600},{"x":960,"y":580},{"x":1000,"y":560},{"x":1040,"y":520},{"x":1100,"y":500},{"x":1140,"y":520},{"x":1160,"y":580},{"x":1220,"y":600},{"x":1340,"y":600},{"x":1400,"y":500},{"x":1360,"y":460},{"x":1380,"y":420},{"x":1380,"y":400},{"x":1480,"y":300},{"x":1580,"y":320},{"x":1620,"y":400},{"x":1740,"y":420},{"x":1920,"y":420},{"x":1960,"y":380},{"x":2000,"y":380},{"x":2060,"y":340},{"x":2380,"y":340},{"x":2440,"y":360},{"x":2480,"y":400},{"x":2540,"y":440},{"x":2640,"y":460},{"x":2760,"y":460},{"x":2880,"y":460},{"x":2900,"y":480},{"x":2880,"y":520},{"x":2920,"y":600},{"x":3000,"y":620},{"x":3060,"y":520},{"x":3040,"y":480},{"x":3060,"y":460},{"x":3220,"y":460},{"x":3300,"y":500},{"x":3400,"y":500},{"x":3500,"y":460},{"x":3560,"y":400},{"x":3580,"y":340},{"x":3620,"y":300},{"x":3660,"y":300},{"x":3700,"y":260},{"x":3780,"y":260},{"x":3820,"y":280},{"x":3920,"y":280},{"x":4000,"y":240},{"x":4040,"y":160},{"x":4080,"y":160},{"x":4180,"y":100},{"x":4240,"y":120},{"x":4280,"y":180},{"x":4220,"y":260},{"x":4260,"y":320},{"x":4220,"y":400},{"x":4240,"y":480},{"x":4360,"y":520},{"x":4480,"y":460},{"x":4520,"y":360},{"x":4460,"y":300},{"x":4460,"y":260},{"x":4500,"y":220},{"x":4660,"y":240},{"x":4680,"y":300},{"x":4660,"y":340},{"x":4680,"y":420},{"x":4740,"y":460},{"x":4940,"y":460},{"x":5060,"y":400},{"x":5200,"y":400},{"x":5260,"y":360},{"x":5440,"y":360},{"x":5480,"y":380},{"x":5460,"y":500},{"x":5680,"y":500},{"x":5660,"y":380},{"x":5700,"y":360},{"x":5800,"y":360},{"x":5940,"y":300},{"x":5980,"y":260},{"x":6060,"y":240},{"x":6120,"y":260},{"x":6260,"y":260},{"x":6300,"y":300},{"x":6260,"y":380},{"x":6320,"y":460},{"x":6500,"y":500},{"x":6600,"y":460},{"x":6600,"y":380},{"x":6540,"y":360},{"x":6540,"y":300},{"x":6500,"y":260},{"x":6540,"y":220},{"x":6700,"y":200},{"x":6740,"y":240},{"x":6920,"y":280},{"x":7000,"y":260},{"x":7080,"y":220},{"x":7140,"y":260}],"startPoint":{"x":191,"y":447},"starPoints":[{"x":2899,"y":381},{"x":3032,"y":381},{"x":2965,"y":367},{"x":3851,"y":255},{"x":3902,"y":255},{"x":3948,"y":237},{"x":4765,"y":194},{"x":4824,"y":216},{"x":4703,"y":190},{"x":5521,"y":365},{"x":5570,"y":365},{"x":783,"y":544},{"x":876,"y":511},{"x":829,"y":528},{"x":1567,"y":220},{"x":1632,"y":207},{"x":1695,"y":222},{"x":5157,"y":326},{"x":5205,"y":303},{"x":5261,"y":293},{"x":2254,"y":261},{"x":2196,"y":272},{"x":2314,"y":269},{"x":5620,"y":364}]}'
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            2,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6700,"y":326},"bridgePoints":[{"bridgeAX":2840,"bridgeBX":3080,"bridgeAY":290,"bridgeBY":250},{"bridgeAX":4060,"bridgeBX":4300,"bridgeAY":390,"bridgeBY":370}],"libraryElements":[{"x":2050,"className":"crate_2","scale":-1,"y":180},{"x":2030,"className":"crate_1","scale":-1,"y":140},{"x":2090,"className":"crate_4","scale":1,"y":140},{"x":2110,"className":"crate_1","scale":1,"y":180},{"x":2170,"className":"crate_4","scale":1,"y":180},{"x":2475,"className":"crate_5","scale":-1,"y":225},{"x":2515,"className":"crate_0","scale":1,"y":225},{"x":2540,"className":"crate_0","scale":1,"y":225},{"x":2555,"className":"crate_5","scale":-1,"y":200},{"x":2565,"className":"crate_0","scale":1,"y":225}],"groundPoints":[{"x":-60,"y":380},{"x":100,"y":360},{"x":160,"y":280},{"x":320,"y":280},{"x":340,"y":300},{"x":400,"y":320},{"x":460,"y":320},{"x":520,"y":360},{"x":700,"y":400},{"x":820,"y":400},{"x":840,"y":380},{"x":900,"y":380},{"x":960,"y":360},{"x":1000,"y":300},{"x":1100,"y":300},{"x":1160,"y":320},{"x":1260,"y":300},{"x":1320,"y":240},{"x":1400,"y":200},{"x":1460,"y":160},{"x":1520,"y":100},{"x":1580,"y":100},{"x":1700,"y":40},{"x":1780,"y":60},{"x":1800,"y":80},{"x":1900,"y":100},{"x":2000,"y":100},{"x":2000,"y":200},{"x":2260,"y":200},{"x":2340,"y":240},{"x":2620,"y":240},{"x":2720,"y":280},{"x":2820,"y":280},{"x":2880,"y":300},{"x":2860,"y":380},{"x":2900,"y":440},{"x":2860,"y":560},{"x":2960,"y":600},{"x":3140,"y":540},{"x":3160,"y":440},{"x":3100,"y":400},{"x":3120,"y":320},{"x":3060,"y":260},{"x":3100,"y":240},{"x":3220,"y":220},{"x":3320,"y":220},{"x":3360,"y":260},{"x":3320,"y":360},{"x":3380,"y":400},{"x":3300,"y":560},{"x":3500,"y":640},{"x":3700,"y":600},{"x":3660,"y":500},{"x":3600,"y":480},{"x":3520,"y":420},{"x":3480,"y":380},{"x":3500,"y":340},{"x":3540,"y":360},{"x":3600,"y":380},{"x":3760,"y":380},{"x":3900,"y":420},{"x":4040,"y":380},{"x":4080,"y":400},{"x":4080,"y":440},{"x":4020,"y":500},{"x":4020,"y":560},{"x":4100,"y":620},{"x":4200,"y":580},{"x":4240,"y":460},{"x":4300,"y":440},{"x":4280,"y":380},{"x":4320,"y":360},{"x":4440,"y":340},{"x":4520,"y":380},{"x":4540,"y":460},{"x":4620,"y":520},{"x":4740,"y":480},{"x":4840,"y":480},{"x":4940,"y":460},{"x":5000,"y":420},{"x":5060,"y":380},{"x":5120,"y":380},{"x":5180,"y":360},{"x":5220,"y":320},{"x":5320,"y":320},{"x":5360,"y":280},{"x":5460,"y":280},{"x":5520,"y":300},{"x":5540,"y":340},{"x":5560,"y":400},{"x":5600,"y":440},{"x":5700,"y":460},{"x":5820,"y":420},{"x":5860,"y":360},{"x":5940,"y":340},{"x":5960,"y":360},{"x":6040,"y":380},{"x":6080,"y":440},{"x":6100,"y":500},{"x":6240,"y":520},{"x":6320,"y":500},{"x":6400,"y":420},{"x":6460,"y":340},{"x":6540,"y":320},{"x":6580,"y":340},{"x":6740,"y":320},{"x":6800,"y":240},{"x":7000,"y":180},{"x":7120,"y":180},{"x":7200,"y":260}],"startPoint":{"x":172,"y":247},"starPoints":[{"x":325,"y":253},{"x":378,"y":252},{"x":428,"y":261},{"x":1123,"y":276},{"x":1169,"y":290},{"x":1221,"y":277},{"x":2023,"y":72},{"x":2082,"y":73},{"x":2146,"y":83},{"x":3401,"y":187},{"x":3338,"y":185},{"x":3470,"y":205},{"x":4779,"y":457},{"x":4825,"y":456},{"x":4875,"y":447},{"x":5571,"y":337},{"x":5585,"y":375},{"x":5610,"y":411},{"x":5855,"y":324},{"x":5887,"y":276},{"x":5941,"y":246}]}'
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            3,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6783,"y":329},"bridgePoints":[{"bridgeAX":5200,"bridgeBX":5520,"bridgeAY":330,"bridgeBY":330}],"libraryElements":[{"x":1330,"className":"crate_0","scale":1,"y":345},{"x":1975,"className":"crate_4","scale":-1,"y":200},{"x":2055,"className":"crate_2","scale":1,"y":200},{"x":2120,"className":"crate_3","scale":1,"y":205},{"x":4645,"className":"crate_2","scale":1,"y":360},{"x":4665,"className":"crate_1","scale":1,"y":325},{"x":4660,"className":"crate_2","scale":1,"y":290},{"x":4645,"className":"crate_2","scale":-1,"y":255}],"groundPoints":[{"x":-160,"y":220},{"x":80,"y":260},{"x":180,"y":300},{"x":380,"y":320},{"x":460,"y":340},{"x":600,"y":400},{"x":780,"y":440},{"x":980,"y":440},{"x":1180,"y":420},{"x":1300,"y":360},{"x":1360,"y":360},{"x":1380,"y":400},{"x":1480,"y":440},{"x":1580,"y":380},{"x":1600,"y":340},{"x":1660,"y":340},{"x":1720,"y":280},{"x":1820,"y":280},{"x":1860,"y":240},{"x":1940,"y":220},{"x":2120,"y":220},{"x":2160,"y":260},{"x":2140,"y":340},{"x":2080,"y":380},{"x":2100,"y":440},{"x":2180,"y":460},{"x":2220,"y":480},{"x":2280,"y":300},{"x":2480,"y":320},{"x":2680,"y":380},{"x":2820,"y":340},{"x":2880,"y":260},{"x":2960,"y":220},{"x":3080,"y":200},{"x":3160,"y":140},{"x":3260,"y":160},{"x":3320,"y":220},{"x":3300,"y":280},{"x":3480,"y":320},{"x":3580,"y":300},{"x":3640,"y":320},{"x":3660,"y":380},{"x":3620,"y":460},{"x":3700,"y":500},{"x":3820,"y":480},{"x":3920,"y":420},{"x":4020,"y":320},{"x":4200,"y":240},{"x":4280,"y":160},{"x":4420,"y":160},{"x":4460,"y":200},{"x":4560,"y":220},{"x":4540,"y":300},{"x":4580,"y":380},{"x":4680,"y":380},{"x":4820,"y":420},{"x":4920,"y":360},{"x":5020,"y":360},{"x":5080,"y":320},{"x":5180,"y":320},{"x":5220,"y":340},{"x":5240,"y":400},{"x":5200,"y":460},{"x":5280,"y":540},{"x":5400,"y":540},{"x":5520,"y":500},{"x":5500,"y":420},{"x":5520,"y":380},{"x":5500,"y":340},{"x":5540,"y":320},{"x":5700,"y":320},{"x":5720,"y":340},{"x":5760,"y":420},{"x":5880,"y":460},{"x":6000,"y":400},{"x":6080,"y":300},{"x":6260,"y":280},{"x":6380,"y":200},{"x":6480,"y":220},{"x":6580,"y":300},{"x":7000,"y":360},{"x":7100,"y":340},{"x":7160,"y":380}],"startPoint":{"x":211,"y":271},"starPoints":[{"x":1293,"y":333},{"x":1208,"y":375},{"x":1251,"y":353},{"x":2180,"y":141},{"x":2242,"y":143},{"x":2304,"y":156},{"x":3402,"y":276},{"x":3453,"y":286},{"x":3509,"y":279},{"x":3855,"y":430},{"x":3896,"y":400},{"x":3808,"y":451},{"x":6172,"y":265},{"x":6225,"y":256},{"x":6115,"y":271},{"x":4644,"y":206},{"x":4699,"y":207},{"x":4765,"y":216}]}'
					)
			);
			_levels.push(
					new Level(
							/*LEVEL ID*/            4,
							/*LEVEL PACK ID*/       LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/     MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        300,
							/*STAR VALUES*/         new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/   '{"finishPoint":{"x":6807,"y":201},"bridgePoints":[{"bridgeAX":2920,"bridgeBX":3460,"bridgeAY":210,"bridgeBY":210},{"bridgeAX":4580,"bridgeBX":4900,"bridgeAY":220,"bridgeBY":140}],"libraryElements":[{"x":900,"className":"crate_5","scale":-1,"y":425},{"x":1950,"className":"crate_1","scale":1,"y":380},{"x":1950,"className":"crate_1","scale":1,"y":345},{"x":1950,"className":"crate_1","scale":1,"y":310},{"x":1940,"className":"crate_2","scale":1,"y":275},{"x":2165,"className":"crate_1","scale":1,"y":340},{"x":2165,"className":"crate_1","scale":1,"y":305},{"x":2165,"className":"crate_1","scale":1,"y":270},{"x":2105,"className":"crate_4","scale":-1,"y":260},{"x":2135,"className":"crate_0","scale":1,"y":345},{"x":2135,"className":"crate_0","scale":1,"y":320},{"x":2135,"className":"crate_0","scale":1,"y":295},{"x":5960,"className":"crate_2","scale":-1,"y":260},{"x":5960,"className":"crate_2","scale":1,"y":225},{"x":5665,"className":"crate_4","scale":-1,"y":260},{"x":5740,"className":"crate_2","scale":1,"y":260},{"x":5775,"className":"crate_4","scale":-1,"y":225},{"x":5795,"className":"crate_1","scale":1,"y":260},{"x":5870,"className":"crate_0","scale":1,"y":265},{"x":5870,"className":"crate_0","scale":1,"y":240},{"x":5870,"className":"crate_2","scale":1,"y":210},{"x":5040,"className":"crate_4","scale":-1,"y":100},{"x":160,"className":"crate_0","scale":1,"y":305},{"x":95,"className":"crate_0","scale":-1,"y":305},{"x":130,"className":"crate_2","scale":1,"y":275},{"x":55,"className":"crate_2","scale":-1,"y":275},{"x":30,"className":"crate_0","scale":1,"y":305},{"x":55,"className":"crate_4","scale":1,"y":240}],"groundPoints":[{"x":-40,"y":320},{"x":180,"y":320},{"x":280,"y":360},{"x":360,"y":360},{"x":460,"y":380},{"x":500,"y":420},{"x":640,"y":460},{"x":700,"y":460},{"x":860,"y":440},{"x":920,"y":440},{"x":960,"y":660},{"x":1020,"y":640},{"x":1060,"y":640},{"x":1000,"y":440},{"x":1060,"y":440},{"x":1100,"y":420},{"x":1200,"y":460},{"x":1300,"y":460},{"x":1360,"y":420},{"x":1460,"y":400},{"x":1540,"y":320},{"x":1600,"y":300},{"x":1640,"y":280},{"x":1680,"y":220},{"x":1760,"y":220},{"x":1860,"y":240},{"x":1900,"y":260},{"x":1860,"y":400},{"x":1980,"y":400},{"x":2040,"y":360},{"x":2020,"y":300},{"x":2040,"y":280},{"x":2080,"y":280},{"x":2120,"y":360},{"x":2140,"y":360},{"x":2200,"y":360},{"x":2220,"y":320},{"x":2200,"y":260},{"x":2220,"y":240},{"x":2360,"y":220},{"x":2420,"y":220},{"x":2460,"y":260},{"x":2660,"y":280},{"x":2680,"y":260},{"x":2780,"y":240},{"x":2820,"y":200},{"x":2900,"y":200},{"x":2940,"y":220},{"x":2920,"y":300},{"x":2980,"y":360},{"x":2900,"y":480},{"x":2960,"y":560},{"x":3340,"y":560},{"x":3380,"y":420},{"x":3460,"y":360},{"x":3420,"y":320},{"x":3440,"y":280},{"x":3420,"y":240},{"x":3440,"y":220},{"x":3480,"y":200},{"x":3580,"y":180},{"x":3620,"y":220},{"x":3620,"y":300},{"x":3660,"y":360},{"x":3660,"y":440},{"x":3740,"y":480},{"x":3820,"y":440},{"x":3920,"y":440},{"x":4020,"y":400},{"x":4140,"y":440},{"x":4200,"y":420},{"x":4300,"y":360},{"x":4360,"y":280},{"x":4480,"y":200},{"x":4560,"y":200},{"x":4600,"y":240},{"x":4580,"y":320},{"x":4620,"y":380},{"x":4580,"y":440},{"x":4640,"y":540},{"x":4720,"y":540},{"x":4840,"y":520},{"x":4920,"y":380},{"x":4860,"y":280},{"x":4880,"y":220},{"x":4880,"y":160},{"x":4920,"y":120},{"x":5080,"y":120},{"x":5100,"y":180},{"x":5080,"y":280},{"x":5140,"y":400},{"x":5220,"y":360},{"x":5260,"y":280},{"x":5160,"y":240},{"x":5160,"y":220},{"x":5180,"y":200},{"x":5260,"y":200},{"x":5380,"y":240},{"x":5500,"y":240},{"x":5620,"y":280},{"x":6000,"y":280},{"x":6080,"y":380},{"x":6040,"y":480},{"x":6140,"y":500},{"x":6200,"y":460},{"x":6160,"y":380},{"x":6100,"y":340},{"x":6140,"y":320},{"x":6220,"y":340},{"x":6400,"y":320},{"x":6580,"y":220},{"x":6680,"y":240},{"x":7000,"y":140},{"x":7060,"y":160},{"x":7160,"y":200}],"startPoint":{"x":98,"y":224},"starPoints":[{"x":201,"y":237},{"x":240,"y":260},{"x":274,"y":291},{"x":916,"y":391},{"x":957,"y":369},{"x":1013,"y":350},{"x":2117,"y":223},{"x":2166,"y":202},{"x":2229,"y":194},{"x":2722,"y":228},{"x":2767,"y":216},{"x":2797,"y":179},{"x":3607,"y":156},{"x":3663,"y":160},{"x":3710,"y":182},{"x":5247,"y":172},{"x":5297,"y":187},{"x":5199,"y":173},{"x":5871,"y":164},{"x":5925,"y":164},{"x":5991,"y":176}]}'
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