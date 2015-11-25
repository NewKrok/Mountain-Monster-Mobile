/**
 * Created by newkrok on 17/08/15.
 */
package src.assets
{
	import src.data.Level;

	public class LevelsInLevelPack4
	{
		private const MAX_LEVEL_WIDTH:Number = 7000;

		private const LEVEL_PACK_ID:uint = 3;

		private var _levels:Vector.<Level> = new Vector.<Level>;

		public function LevelsInLevelPack4()
		{
			_levels.push(
					new Level(
							/*LEVEL ID*/            0,
							/*LEVEL PACK ID*/        LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/        MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        200,
							/*STAR VALUES*/            new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/    '{"startPoint":{"x":228,"y":226},"groundPoints":[{"x":-140,"y":220},{"x":0,"y":240},{"x":120,"y":260},{"x":260,"y":260},{"x":420,"y":260},{"x":520,"y":240},{"x":640,"y":200},{"x":700,"y":200},{"x":740,"y":200},{"x":800,"y":220},{"x":860,"y":240},{"x":880,"y":260},{"x":900,"y":300},{"x":900,"y":340},{"x":880,"y":680},{"x":1160,"y":700},{"x":1180,"y":340},{"x":1200,"y":300},{"x":1300,"y":280},{"x":1340,"y":260},{"x":1400,"y":260},{"x":1440,"y":280},{"x":1500,"y":260},{"x":1520,"y":240},{"x":1560,"y":220},{"x":1580,"y":200},{"x":1640,"y":160},{"x":1700,"y":140},{"x":1740,"y":120},{"x":1760,"y":100},{"x":1780,"y":100},{"x":1820,"y":160},{"x":1900,"y":220},{"x":1960,"y":260},{"x":2020,"y":280},{"x":2080,"y":300},{"x":2160,"y":300},{"x":2220,"y":300},{"x":2260,"y":280},{"x":2280,"y":260},{"x":2320,"y":220},{"x":2340,"y":180},{"x":2380,"y":160},{"x":2420,"y":140},{"x":2460,"y":160},{"x":2500,"y":180},{"x":2560,"y":260},{"x":2640,"y":300},{"x":2700,"y":320},{"x":2760,"y":340},{"x":2820,"y":360},{"x":2900,"y":360},{"x":2980,"y":360},{"x":3020,"y":380},{"x":3080,"y":400},{"x":3140,"y":460},{"x":3160,"y":500},{"x":3160,"y":540},{"x":3200,"y":620},{"x":3340,"y":620},{"x":3400,"y":500},{"x":3400,"y":440},{"x":3400,"y":400},{"x":3440,"y":360},{"x":3460,"y":340},{"x":3500,"y":320},{"x":3540,"y":340},{"x":3620,"y":400},{"x":3700,"y":420},{"x":3780,"y":420},{"x":3880,"y":400},{"x":3940,"y":380},{"x":3980,"y":340},{"x":4040,"y":300},{"x":4080,"y":280},{"x":4120,"y":240},{"x":4220,"y":260},{"x":4260,"y":260},{"x":4300,"y":280},{"x":4340,"y":320},{"x":4380,"y":340},{"x":4400,"y":340},{"x":4460,"y":300},{"x":4500,"y":260},{"x":4520,"y":200},{"x":4540,"y":180},{"x":4560,"y":140},{"x":4620,"y":100},{"x":4700,"y":60},{"x":4740,"y":60},{"x":4820,"y":80},{"x":4900,"y":120},{"x":4920,"y":180},{"x":4960,"y":240},{"x":5020,"y":260},{"x":5100,"y":260},{"x":5180,"y":240},{"x":5280,"y":220},{"x":5360,"y":200},{"x":5420,"y":220},{"x":5460,"y":260},{"x":5600,"y":240},{"x":5800,"y":240},{"x":6020,"y":200},{"x":6140,"y":260},{"x":6300,"y":280},{"x":6420,"y":360},{"x":6620,"y":400},{"x":6820,"y":380},{"x":7220,"y":400}],"bridgePoints":[{"bridgeBX":1210,"bridgeAY":240,"bridgeBY":300,"bridgeAX":850},{"bridgeBX":3440,"bridgeAY":400,"bridgeBY":360,"bridgeAX":3080},{"bridgeBX":4550,"bridgeAY":260,"bridgeBY":150,"bridgeAX":4220}],"finishPoint":{"x":6705,"y":392},"starPoints":[{"x":650,"y":170},{"x":680,"y":170},{"x":710,"y":170},{"x":1340,"y":230},{"x":1370,"y":230},{"x":1400,"y":230},{"x":2330,"y":140},{"x":2350,"y":110},{"x":2360,"y":80},{"x":5460,"y":170},{"x":6050,"y":170},{"x":6080,"y":170},{"x":6110,"y":170},{"x":6350,"y":280},{"x":6380,"y":300},{"x":6410,"y":320},{"x":1924,"y":203},{"x":5493,"y":164},{"x":5528,"y":163},{"x":4971,"y":176},{"x":4986,"y":203},{"x":5014,"y":223},{"x":1950,"y":225},{"x":1981,"y":241},{"x":2847,"y":335},{"x":2884,"y":335},{"x":2921,"y":336},{"x":4108,"y":215},{"x":4143,"y":199},{"x":4181,"y":208}]}'
					)
			);
		}

		public function get levels():Vector.<Level>
		{
			return _levels;
		}
	}
}