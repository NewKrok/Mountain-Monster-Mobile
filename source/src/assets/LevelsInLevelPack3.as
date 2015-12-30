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
							/*LEVEL PACK ID*/        LEVEL_PACK_ID,
							/*MAX LEVEL WIDTH*/        MAX_LEVEL_WIDTH,
							/*MAX CAMERA Y*/        200,
							/*STAR VALUES*/            new <uint>[ 7000, 9000, 11000 ],
							/*LEVEL EDITOR DATA*/    '{"finishPoint":{"x":6800,"y":400},"bridgePoints":[{"bridgeAX":620,"bridgeBX":910,"bridgeAY":340,"bridgeBY":220}],"libraryElements":[{"x":335,"className":"crate_2","scale":1,"y":300},{"x":435,"className":"crate_2","scale":1,"y":265},{"x":410,"className":"crate_2","scale":-1,"y":300},{"x":260,"className":"crate_4","scale":-1,"y":300},{"x":360,"className":"crate_4","scale":-1,"y":265},{"x":415,"className":"crate_0","scale":1,"y":235},{"x":440,"className":"crate_0","scale":1,"y":235},{"x":425,"className":"crate_5","scale":-1,"y":210},{"x":545,"className":"crate_4","scale":1,"y":300},{"x":490,"className":"crate_1","scale":1,"y":300},{"x":485,"className":"crate_0","scale":1,"y":270}],"groundPoints":[{"x":-80,"y":320},{"x":420,"y":320},{"x":580,"y":320},{"x":660,"y":360},{"x":640,"y":480},{"x":760,"y":500},{"x":860,"y":480},{"x":900,"y":380},{"x":860,"y":280},{"x":920,"y":200},{"x":1080,"y":300}],"startPoint":{"x":79,"y":287},"starPoints":[]}'
					)
			);
		}

		public function get levels():Vector.<Level>
		{
			return _levels;
		}
	}
}